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

#include "em_device.h"
#include "em_cmu.h"
#include "em_gpio.h"
#include "em_usart.h"
#include "em_system.h"
#include "em_chip.h"    // required for CHIP_Init() function
#include "em_adc.h"

#define passive 0

#ifndef MAX_CONNECTIONS
#define MAX_CONNECTIONS 8
#endif

static uint16_t notifyEnabled = 0;
static uint8_t connHandle = 0xFF;
static uint8_t notifyBuf[20] = {
		0 };

uint8_t 	activeConnectionId = 0xFF; /* Connection Handle ID */
uint8_t 	key_buffer[8] = { 0, };
char 		ble_buffer[20];
uint8_t		gto_buffer[8] = { 0, };
uint16_t	hid_attribute = gattdb_hid_keyboard_in;
uint16_t	ble_send_data = gattdb_ble_send_data;
uint16_t	hex_type = gattdb_hex_type;
uint16_t	spp_type = gattdb_gatt_spp_data;
uint16_t 	wCharHandle;

/* connection handling variables for multiple slaves */
uint8  connection_handle_table[MAX_CONNECTIONS];
uint32 service_handle_table[MAX_CONNECTIONS];
uint16 characteristic_handle_table[MAX_CONNECTIONS];
uint8  active_connections_num;
uint8  write_rsps_needed,writes_completed;

const uint8 thermo_service[2] = { 0x09, 0x18 };
const uint8 thermo_char[2]    = { 0x1c, 0x2a };

#define COM_PORT gpioPortD // USART location #1: PD0 and PD1

#define NO_HANDLE											0xFFFF


#define buffLen 244
#define charHandle 0x0016

/* Print boot message */
static void bootMessage(struct gecko_msg_system_boot_evt_t *bootevt);

/* Flag for indicating DFU Reset must be performed */
static uint8_t boot_to_dfu = 0;

/***************************************************************************************************
 Local Macros and Definitions
 **************************************************************************************************/
#define PRINT_ADV_INFO								0

#define NO_CONNECTION									0xFF
#define NO_HANDLE											0xFFFF

#define DISCONNECTED									0
#define SCANNING											1
#define CONNECTED											2
#define SERVICE_FOUND									3
#define CHARACTERISTICS_DISCOVERING 	4
#define CHARACTERISTICS_FOUND					5
#define CHARACTERISTICS_FOUND_1					10
#define ENABLING_NOTIFY   						6
#define ENABLING_NOTIFY_1                      12
#define NOTIFY_ENABLED								7

#define NOTIFY_CHAR_ITEM							1
#define NOTIFY_CHAR_ITEM2							3
#define RW_CHAR_ITEM									2
#define ALL_CHARS											(NOTIFY_CHAR_ITEM | RW_CHAR_ITEM)
#define PB0_PRESS_SIGNAL							0x01
#define PB1_PRESS_SIGNAL							0x02

#define BUTTON0_PIN         				(6)
#define BUTTON0_PORT        				(gpioPortF)

#define BUTTON1_PIN         				(7)
#define BUTTON1_PORT        				(gpioPortF)

#define BUFFER_SIZE 80
char buffer[BUFFER_SIZE];

static uint16 _char_handle;

char rx_stack[BUFFERSIZE];
int rx_i=0;
char test_string[] = "\n\rTransmit UART Data!\n\r";
char rx_char = 0;

uint8_t id = 0;
uint8_t data = 0;

int rxBufferSize;
volatile int rxBufferIndex;
volatile uint32 MaintenanceTimer = 0;

uint8_t i;


int flag=0;
// SPP UUID 326d606d-fe02-4f6d-bf6a-17395639c549
// 7d2ebcfa-4e91-45bf-aac4-2c877bbcdde7
//8d20cb45-20fc-4d4e-bd3b-16a0be0e16f6
const uint8 charUUID[16] = {0xf6, 0x16, 0x0e, 0xbe, 0xa0, 0x16, 0x3b, 0xbd, 0x4e, 0x4d, 0xfc, 0x20, 0x45, 0xcb, 0x20, 0x8d};

uint8 myData[] ={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};


/* find the index of a given connection in the connection handle table */
uint8 find_connection_handle(uint8 connection)
{
	uint8 c;
	for (c = 0; c < active_connections_num; c++)
	{
		if (connection_handle_table[c] == connection)
		{
			return c;
		}
	}

	return 0xFF;
}

static void send_spp_data()
{
	uint8 len = 0;
	uint8 data[256];
	uint16 result;


	int c;

	// read up to 20 characters from local buffer
	while(len < 20)
	{
		//printf("send spp Function 0\n");
		  c = RETARGET_ReadChar();

		  if(c < 0)
		  {
			  break;
		  }
		  else
		  {
			  data[len++] = (uint8)c;
		  }
	}

	if(len > 0)
	{
		printf("Receive Gravity Liquid Sensor value: 0\n");

		// stack may return "out-of-memory" error if the local buffer is full -> in that case, just keep trying until the command succeeds
		//result = gecko_cmd_gatt_server_send_characteristic_notification(activeConnectionId, spp_type, len, data)->result;

		do
		{
			result = gecko_cmd_gatt_server_send_characteristic_notification(activeConnectionId, spp_type, len, data)->result;

		}
		while(result == bg_err_out_of_memory);

	}
	else printf("Receive Gravity Liquid Sensor value: 1\n");
}


/* Main application */
void appMain(gecko_configuration_t *pconfig)
{
	uint8	 conn_handle;
    uint8	 table_index;
    uint8	 i;

	//extern char ch;
	//char uart_buffer[256];
	char ble_buf[128];
	//char send_buf[128];

	int temp = 0;

#if DISABLE_SLEEP > 0
	pconfig->sleep.flags = 0;
#endif

	/* Initialize debug prints. Note: debug prints are off by default. See DEBUG_LEVEL in app.h */
	initLog();

	/* Initialize stack */
	gecko_init(pconfig);

	while (1) {
		struct gecko_cmd_packet* evt;
		uint8_t keyVal = KEYBOARD_NONE;
		uint8_t gtoVal = TERMINATION_CHAR;


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
	      	conn_handle = evt->data.evt_le_connection_opened.connection;

			printLog("connection opened\r\n");
			/* Store the connection ID */
			activeConnectionId = evt->data.evt_le_connection_opened.connection;
			/* Set Timers */
			gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(20), TIMER_SENSOR, 0);
			gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(1000), TIMER_KEY_INPUT, 0);
			gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(1000), TIMER_KEY_UART, 0);
			gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(1000), TIMER_BLE, 0);
			break;

		case gecko_evt_gatt_mtu_exchanged_id:

			printf("Discovering services...\n\r");
			/* discover thermometer service on the slave device */

			gecko_cmd_gatt_discover_primary_services_by_uuid(evt->data.evt_gatt_mtu_exchanged.connection,2,
					(const uint8*)thermo_service);

			break;


		case gecko_evt_le_connection_closed_id:
			printLog("connection closed, reason: 0x%2.2x\r\n",
					evt->data.evt_le_connection_closed.reason);

			/* Check if need to boot to OTA DFU mode */
			if (boot_to_dfu) {
				/* Enter to OTA DFU mode */
				gecko_cmd_system_reset(2);
			} else {
				//gecko_cmd_hardware_set_soft_timer(TIMER_TICK_TO_MS(10), TIMER_TICK, 0);
				gecko_cmd_hardware_set_soft_timer(0, TIMER_SENSOR, 0);
				gecko_cmd_hardware_set_soft_timer(0, TIMER_KEY_INPUT, 0);
				gecko_cmd_hardware_set_soft_timer(0, TIMER_KEY_UART, 0);
				gecko_cmd_hardware_set_soft_timer(0, TIMER_BLE, 0);

				activeConnectionId = 0xFF; /* delete the connection ID */
			}
			break;

		case gecko_evt_gatt_service_id:
			/* compare UUID to the UUID of our thermometer service */
			if(memcmp(evt->data.evt_gatt_service.uuid.data,(const uint8*)thermo_service, 2) == 0)
			{
				printf("thermometer service discovered\n\r");
				table_index = find_connection_handle(evt->data.evt_gatt_characteristic.connection);
				if (table_index != 0xFF)
				{
					/* put characteristic handle into the characteristic handle table      *
					 * 			      		   * to the same index where the connection handle of this connection is */
					service_handle_table[table_index] = evt->data.evt_gatt_service.service;
				}
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
		{
	    	 memcpy(ble_buf, evt->data.evt_gatt_server_attribute_value.value.data,
	    			 evt->data.evt_gatt_server_attribute_value.value.len);
	    	 ble_buf[evt->data.evt_gatt_server_attribute_value.value.len] = 0;
	    	 printf("OK --- >Received read data --> ");
	    	 printf(ble_buf);
	    	 printf("\r\n");


	    	 //const char* data = "Hello";

	    	 //uint16_t mydata;
	    	 /*
	    	 printf("send data --> ");
	    	 gecko_cmd_gatt_server_send_characteristic_notification(0xFF, spp_type,
	    			 evt->data.evt_gatt_server_attribute_value.value.len, evt->data.evt_gatt_server_attribute_value.value.data);
	    	 printf("\r\n");*/


	    	 //const char* data = 0x31;
	    	 //gecko_cmd_gatt_write_characteristic_value(activeConnectionId, hex_type, strlen(myData), myData);

		}

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

			//gecko_cmd_msg->data.cmd_gatt_read_characteristic_value.characteristic=characteristic;
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

    	case gecko_evt_gatt_characteristic_id:
			gecko_cmd_gatt_server_send_characteristic_notification(conn_handle, spp_type, 20, myData);
			gecko_cmd_gatt_write_characteristic_value_without_response(conn_handle, spp_type, 20, myData);


    		if(evt->data.evt_gatt_characteristic.uuid.len == 16)
    		{
    			if(memcmp(charUUID, evt->data.evt_gatt_characteristic.uuid.data,16) == 0)
    			{
    				printf("char discovered");
    				_char_handle = evt->data.evt_gatt_characteristic.characteristic;
    			}
    		}
    		break;


		case gecko_evt_gatt_characteristic_value_id:
			gecko_cmd_gatt_server_send_characteristic_notification(0xFF, gattdb_device_name, 20, myData);
			gecko_cmd_gatt_write_characteristic_value_without_response(0xFF, gattdb_device_name, 20, myData);

			printf("Gatt Notification Received: ");
			printf("%s", evt->data.evt_gatt_characteristic_value.value.data);
			printf("\r\n");

			printf("gecko_evt_gatt_characteristic_value Function");
			if(evt->data.evt_gatt_characteristic_value.characteristic == _char_handle)
			{
				gecko_cmd_gatt_server_send_characteristic_notification(0xFF, gattdb_device_name, 20, myData);
				gecko_cmd_gatt_write_characteristic_value_without_response(0xFF, gattdb_device_name, 20, myData);

				memcpy(ble_buf, evt->data.evt_gatt_characteristic_value.value.data ,
								evt->data.evt_gatt_characteristic_value.value.len);
				ble_buf[evt->data.evt_gatt_characteristic_value.value.len] = '\0';
				printf(ble_buf);
				printf("\r\n");
			}

			break;


		case gecko_evt_hardware_soft_timer_id:
			switch (evt->data.evt_hardware_soft_timer.handle) {
			case TIMER_KEY_INPUT:
				//printf("KeyInput\n");
				if(temp) {
					keyVal = KEYBOARD_LEFT;
					//printf("Left Key\n");
					temp = 0;
					/*
					for(i=0; i<strlen(ble_buf); i++) {
					    while( !(USART0->STATUS & (1 << 6)) ); // wait for TX buffer to empty
					    printf("Send from BLE to UART data : ");
					    USART0->TXDATA = ble_buf[i];       // print each character of the test string
					    printf("\n");
					}*/

				}

				else {
					keyVal = KEYBOARD_RIGHT;
					//printf("Right Key\n");
					temp = 1;
				}
				key_buffer[2] = keyVal;
				gecko_cmd_gatt_server_send_characteristic_notification(
						activeConnectionId, hid_attribute, 8, key_buffer);
				/* Key Release Event */
				key_buffer[2] = KEYBOARD_NONE;
				gecko_cmd_gatt_server_send_characteristic_notification(
						activeConnectionId, hid_attribute, 8, key_buffer);
				break;

			case TIMER_KEY_UART:
				//USART1_RX_IRQHandler();
				/*
				if(USART0->STATUS & (1 << 7)) {   		// if RX buffer contains valid data
					rx_char = USART0->RXDATA;       	// store the data
					printf("IRQHandler data : %c\n", rx_char);
				}*/
				//send_spp_data();

				ADC_Start(ADC0, adcStartScan);
				data = ADC_DataIdScanGet(ADC0, &id);

				printf("ADC Pin ID = %d, Pressure value = %d\n", id, data);

				printf("send data --> ");
				gecko_cmd_gatt_server_send_characteristic_notification(activeConnectionId, ble_send_data, 8, data);
				printf("\r\n");

				break;

			case TIMER_SENSOR:
				/*
				if(temp == 1)
					GPIO_PinOutToggle(UIF_LED0_PORT, UIF_LED0_PIN);		//RIGHT LED0
				 */
				break;

			case TIMER_TICK:
				//if(temp == 0)
					//GPIO_PinOutToggle(UIF_LED1_PORT, UIF_LED1_PIN);		//LEFT LED1
				//break;
#if 0
				keyVal = get_key_value();
				if (keyVal != KEYBOARD_NONE) {
					key_buffer[2] = keyVal;
					gecko_cmd_gatt_server_send_characteristic_notification(
							activeConnectionId, hid_attribute, 8, key_buffer);
					/* Key Release Event */
					key_buffer[2] = KEYBOARD_NONE;
					gecko_cmd_gatt_server_send_characteristic_notification(
							activeConnectionId, hid_attribute, 8, key_buffer);
					printLog(
							"gatt_server_send_characteristic_notification, result = %04x, keyValue=%02x\n",
							evt->data.rsp_gatt_server_send_characteristic_notification.result,
							keyVal);

				}
#endif
				break;

			default:
				break;
			}
			break;
		}
	}
}

int TxBuf(uint8_t *buffer, int nbytes)
{
	int i;

	for (i = 0; i < nbytes; i++)
	{
		RETARGET_WriteChar(*buffer++);
	}
	return nbytes;
}

void USART1_RX_IRQHandler(void) {

	//printf("IRQHandler Function\n");
	if(USART0->STATUS & (1 << 7)) {   		// if RX buffer contains valid data
		rx_char = USART0->RXDATA;       	// store the data
		//printf("IRQHandler data : %c\n", rx_char);
	}
	if(rx_char) {                     		// if we have a valid character
		if(USART0->STATUS & (1 << 6)) { 	// check if TX buffer is empty
			USART0->TXDATA = rx_char;     	// echo received char
			rx_char = 0;                  	// reset temp variable
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
