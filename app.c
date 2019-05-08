/***************************************************************************//**
 * @file app.c
 * @brief Silicon Labs Empty Example Project
 *
 * This example demonstrates the bare minimum needed for a Blue Gecko C application
 * that allows Over-the-Air Device Firmware Upgrading (OTA DFU). The application
 * starts advertising after boot and restarts advertising after a connection is closed.
 *******************************************************************************
 * # License
 * <b>Copyright 2018 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

/* Bluetooth stack headers */
#include "bg_types.h"
#include "native_gecko.h"
#include "gatt_db.h"

#include "app.h"
#include "hid.h"
#include "user_pheri.h"
#include "user_code.h"

uint8_t activeConnectionId = 0xFF; /* Connection Handle ID */
uint8_t key_buffer[8] = { 0, };
uint8 ble_buffer[20];
uint16_t hid_attribute = gattdb_hid_keyboard_in;

/* Print boot message */
static void bootMessage(struct gecko_msg_system_boot_evt_t *bootevt);

/* Flag for indicating DFU Reset must be performed */
static uint8_t boot_to_dfu = 0;

/* Main application */
void appMain(gecko_configuration_t *pconfig)
{
#if DISABLE_SLEEP > 0
	pconfig->sleep.flags = 0;
#endif

	/* Initialize debug prints. Note: debug prints are off by default. See DEBUG_LEVEL in app.h */
	initLog();

	/* Initialize stack */
	gecko_init(pconfig);

	while (1) {
		struct gecko_cmd_packet* evt;

		/* if there are no events pending then the next call to gecko_wait_event() may cause
		 * device go to deep sleep. Make sure that debug prints are flushed before going to sleep */
		if (!gecko_event_pending()) {
			flushLog();
		}

		/* Check for stack event. This is a blocking event listener. If you want non-blocking please see UG136. */
		evt = gecko_wait_event();

		/* Handle events */
		switch (BGLIB_MSG_ID(evt->header)) {
		/* This boot event is generated when the system boots up after reset.
		 * Do not call any stack commands before receiving the boot event.
		 * Here the system is set to start advertising immediately after boot procedure. */
		case gecko_evt_system_boot_id:

			bootMessage(&(evt->data.evt_system_boot));
			printLog("boot event - starting advertising\r\n");

			/* Delete Bondings */
			gecko_cmd_sm_delete_bondings();

			gecko_cmd_sm_set_debug_mode();

			gecko_cmd_sm_configure(0x00, sm_io_capability_displayyesno);
			gecko_cmd_sm_set_bondable_mode(true);

			/* Set advertising parameters. 100ms advertisement interval.
			 * The first parameter is advertising set handle
			 * The next two parameters are minimum and maximum advertising interval, both in
			 * units of (milliseconds * 1.6).
			 * The last two parameters are duration and maxevents left as default. */
			gecko_cmd_le_gap_set_advertise_timing(0, 160, 160, 0, 0);

			/* Start general advertising and enable connections. */
			gecko_cmd_le_gap_start_advertising(0, le_gap_general_discoverable,
					le_gap_undirected_connectable);

			/* Set Timers */
			gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(10), TIMER_TICK, 0);
			break;

		case gecko_evt_le_connection_opened_id:
			printLog("connection opened\r\n");
			/* Store the connection ID */
			activeConnectionId = evt->data.evt_le_connection_opened.connection;
			/* Set Timers */
			gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(20), TIMER_SENSOR, 0);
			gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(500), TIMER_KEY_INPUT, 0);
			break;


		case gecko_evt_le_connection_closed_id:
			printLog("connection closed, reason: 0x%2.2x\r\n",
					evt->data.evt_le_connection_closed.reason);

			/* Check if need to boot to OTA DFU mode */
			if (boot_to_dfu) {
				/* Enter to OTA DFU mode */
				gecko_cmd_system_reset(2);
			} else {
				gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(10), TIMER_TICK, 0);
				gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(20), TIMER_SENSOR, 0);
				gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(500), TIMER_KEY_INPUT, 0);
				activeConnectionId = 0xFF; /* delete the connection ID */
			}
			break;

		case gecko_evt_sm_passkey_display_id:
			printLog("gecko_evt_sm_passkey_display_id, passkey=%08x\n",
					evt->data.evt_sm_passkey_display.passkey);
			break;

		case gecko_evt_sm_confirm_passkey_id:
			printLog( "gecko_evt_sm_confirm_passkey_id, passkey=%08x\n",
					evt->data.evt_sm_confirm_passkey.passkey);
			gecko_cmd_sm_passkey_confirm(evt->data.evt_sm_confirm_passkey.connection, 1);

			break;

		case gecko_evt_sm_bonded_id:
			printLog("gecko_evt_sm_bonded_id, conn=%02x, bonding=%02x\n",
					evt->data.evt_sm_bonded.connection, evt->data.evt_sm_bonded.bonding);
			activeConnectionId = evt->data.evt_sm_bonded.connection;
			break;

		case gecko_evt_sm_bonding_failed_id:
			printLog("gecko_evt_sm_bonding_failed_id, reason=%04x\n",
					evt->data.evt_sm_bonding_failed.reason);
			break;

		case gecko_evt_sm_confirm_bonding_id:
			gecko_cmd_sm_bonding_confirm(evt->data.evt_sm_confirm_bonding.connection, 1);
			printLog("Confirm bonding\n");
			break;

		case gecko_evt_le_connection_parameters_id:
			printLog("connection_params, connection=%02x, interval=%04x, latency=%04x, timeout=%04x, sm=%02x\n",
					evt->data.evt_le_connection_parameters.connection,
					evt->data.evt_le_connection_parameters.interval,
					evt->data.evt_le_connection_parameters.latency,
					evt->data.evt_le_connection_parameters.timeout,
					evt->data.evt_le_connection_parameters.security_mode);
			break;

		case gecko_rsp_gatt_server_write_attribute_value_id:
			printLog("gatt_server_write_attribute_value, result=%04x\n",
					evt->data.rsp_gatt_server_write_attribute_value.result);
			break;

		case gecko_evt_gatt_server_attribute_value_id:
			/* Value of attribute changed from the local database by remote GATT client */
			switch (evt->data.evt_gatt_server_attribute_value.attribute) {
			case gattdb_hid_protocol_mode:
				hidProtocolModeWrite(
						&(evt->data.evt_gatt_server_attribute_value.value));
				break;

			default:
				break;
			}

			break;

		case gecko_evt_gatt_server_characteristic_status_id:
			printLog("gecko_evt_gatt_server_characteristic_status_id, char=%04x, flag=%02x\n",
					evt->data.evt_gatt_server_characteristic_status.characteristic,
					evt->data.evt_gatt_server_characteristic_status.status_flags);

			switch (evt->data.evt_gatt_server_attribute_value.attribute) {
			case gattdb_hid_keyboard_in:
				hidKeyInCharStatusChange(
						evt->data.evt_gatt_server_characteristic_status.connection,
						evt->data.evt_gatt_server_characteristic_status.characteristic);
				break;

			case gattdb_hid_boot_keyboard_in:
				hidBootKeyInCharStatusChange(
						evt->data.evt_gatt_server_characteristic_status.connection,
						evt->data.evt_gatt_server_characteristic_status.characteristic);
				break;

			case gattdb_battery_level:
#if 0
				battCharStatusChange(
						evt->data.evt_gatt_server_characteristic_status.connection,
						evt->data.evt_gatt_server_characteristic_status.characteristic);
#endif
				break;

			default:
				break;
			}
			break;



		case gecko_evt_sm_list_all_bondings_complete_id:
			printLog("gecko_evt_sm_list_all_bondings_complete_id\n");
			break;

		case gecko_evt_sm_list_bonding_entry_id:
			printLog("gecko_evt_sm_list_bonding_entry_id, bonding=%02x, address=%08x, addrtype=%02x\n",
					evt->data.evt_sm_list_bonding_entry.bonding,
					evt->data.evt_sm_list_bonding_entry.address.addr,
					evt->data.evt_sm_list_bonding_entry.address_type);
			break;

		case gecko_evt_sm_passkey_request_id:
			printLog("gecko_evt_sm_passkey_request_id, conn=%02x\n",
					evt->data.evt_sm_passkey_request.connection);
			break;

			/* Events related to OTA upgrading
			 ----------------------------------------------------------------------------- */

			/* Check if the user-type OTA Control Characteristic was written.
			 * If ota_control was written, boot the device into Device Firmware Upgrade (DFU) mode. */
		case gecko_evt_gatt_server_user_write_request_id:

			if (evt->data.evt_gatt_server_user_write_request.characteristic
					== gattdb_ota_control) {
				/* Set flag to enter to OTA mode */
				boot_to_dfu = 1;
				/* Send response to Write Request */
				gecko_cmd_gatt_server_send_user_write_response(
						evt->data.evt_gatt_server_user_write_request.connection,
						gattdb_ota_control, bg_err_success);

				/* Close connection to enter to DFU OTA mode */
				gecko_cmd_le_connection_close(
						evt->data.evt_gatt_server_user_write_request.connection);
			}
			break;

			/* Add additional event handlers as your application requires */
		case gecko_evt_hardware_soft_timer_id:
			switch (evt->data.evt_hardware_soft_timer.handle) {
			case TIMER_KEY_INPUT:
				printf("KeyInput\n");
				break;

			case TIMER_SENSOR :
				GPIO_PinOutToggle(UIF_LED0_PORT, UIF_LED0_PIN);
				break;

			case TIMER_TICK :
				GPIO_PinOutToggle(UIF_LED1_PORT, UIF_LED1_PIN);
				break;
#if 0
			uint8_t keyVal = KEYBOARD_NONE;
			keyVal = get_key_value();
			if (keyVal != KEYBOARD_NONE) {
				key_buffer[2] = keyVal;
				pRsp = gecko_cmd_gatt_server_send_characteristic_notification(
						hid_connection, hid_attribute, 8, key_buffer);
				/* Key Release Event */
				key_buffer[2] = KEYBOARD_NONE;
				pRsp = gecko_cmd_gatt_server_send_characteristic_notification(
						hid_connection, hid_attribute, 8, key_buffer);
				printLog(
						"gatt_server_send_characteristic_notification, result = %04x, keyValue=%02x\n",
						pRsp->result, keyVal);
			}
#endif
			}
			break;

		default:
			break;
		}
	}
}

/* Print stack version and local Bluetooth address as boot message */
static void bootMessage(struct gecko_msg_system_boot_evt_t *bootevt) {
#if DEBUG_LEVEL
	bd_addr local_addr;
	int i;

	printLog("stack version: %u.%u.%u\r\n", bootevt->major, bootevt->minor,
			bootevt->patch);
	local_addr = gecko_cmd_system_get_bt_address()->address;

	printLog("local BT device address: ");
	for (i = 0; i < 5; i++) {
		printLog("%2.2x:", local_addr.addr[5 - i]);
	}
	printLog("%2.2x\r\n", local_addr.addr[0]);
#endif
}
