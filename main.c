/***************************************************************************//**
 * @file
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

/* Board headers */
#include "init_mcu.h"
#include "init_board.h"
#include "init_app.h"
#include "ble-configuration.h"
#include "board_features.h"

/* Bluetooth stack headers */
#include "bg_types.h"
#include "native_gecko.h"
#include "gatt_db.h"

/* Libraries containing default Gecko configuration values */
#include "em_emu.h"
#include "em_cmu.h"

/* Device initialization header */
#include "hal-config.h"

#if defined(HAL_CONFIG)
#include "bsphalconfig.h"
#else
#include "bspconfig.h"
#endif

/* Application header */
#include "app.h"
#include "user_pheri.h"

/***********************************************************************************************//**
 * @addtogroup Application
 * @{
 **************************************************************************************************/

/***********************************************************************************************//**
 * @addtogroup app
 * @{
 **************************************************************************************************/

#ifndef MAX_ADVERTISERS
#define MAX_ADVERTISERS 1
#endif

#ifndef MAX_CONNECTIONS
#define MAX_CONNECTIONS 4
#endif

uint8_t bluetooth_stack_heap[DEFAULT_BLUETOOTH_HEAP(MAX_CONNECTIONS)];

/* Bluetooth stack configuration parameters (see "UG136: Silicon Labs Bluetooth C Application Developer's Guide" for details on each parameter) */
static gecko_configuration_t config = {
  .config_flags = 0,                                   /* Check flag options from UG136 */
#if defined(FEATURE_LFXO)
  .sleep.flags = SLEEP_FLAGS_DEEP_SLEEP_ENABLE,        /* Sleep is enabled */
#else
  .sleep.flags = 0,
#endif // LFXO
  .bluetooth.max_connections = MAX_CONNECTIONS,        /* Maximum number of simultaneous connections */
  .bluetooth.max_advertisers = MAX_ADVERTISERS,        /* Maximum number of advertisement sets */
  .bluetooth.heap = bluetooth_stack_heap,              /* Bluetooth stack memory for connection management */
  .bluetooth.heap_size = sizeof(bluetooth_stack_heap), /* Bluetooth stack memory for connection management */
  .bluetooth.sleep_clock_accuracy = 100,               /* Accuracy of the Low Frequency Crystal Oscillator in ppm. *
                                                       * Do not modify if you are using a module                  */
  .gattdb = &bg_gattdb_data,                           /* Pointer to GATT database */
  .ota.flags = 0,                                      /* Check flag options from UG136 */
  .ota.device_name_len = 3,                            /* Length of the device name in OTA DFU mode */
  .ota.device_name_ptr = "OTA",                        /* Device name in OTA DFU mode */
#if (HAL_PA_ENABLE)
  .pa.config_enable = 1,                               /* Set this to be a valid PA config */
#if defined(FEATURE_PA_INPUT_FROM_VBAT)
  .pa.input = GECKO_RADIO_PA_INPUT_VBAT,               /* Configure PA input to VBAT */
#else
  .pa.input = GECKO_RADIO_PA_INPUT_DCDC,               /* Configure PA input to DCDC */
#endif // defined(FEATURE_PA_INPUT_FROM_VBAT)
#endif // (HAL_PA_ENABLE)
};

/**
 * @brief  Main function
 */
int main(void)
{
  /* Initialize device */
  initMcu();
  /* Initialize board */
  initBoard();

  // User Init
  //init_vcom();
  RETARGET_SerialInit();
  RETARGET_SerialCrLf(true);
  printf("hello1\n");
  /* Initialize application */
  initApp();
  printf("hello2\n");

  /* Start application */
  appMain(&config);
  printf("hello3\n");




  while (1) {
      /* Event pointer for handling events */
      struct gecko_cmd_packet* evt;

      /* Check for stack event. */
      evt = gecko_wait_event();

      /* Handle events */
      switch (BGLIB_MSG_ID(evt->header)) {
        /* This boot event is generated when the system boots up after reset.
         * Do not call any stack commands before receiving the boot event.
         * Here the system is set to start advertising immediately after boot procedure. */
        case gecko_evt_system_boot_id:
          /* Set advertising parameters. 100ms advertisement interval.
           * The first two parameters are minimum and maximum advertising interval, both in
           * units of (milliseconds * 1.6). */
          gecko_cmd_le_gap_set_advertise_timing(0, 160, 160, 0, 0);

          /* Start general advertising and enable connections. */
          gecko_cmd_le_gap_start_advertising(0, le_gap_general_discoverable, le_gap_connectable_scannable);
          break;

        /* This event is generated when a connected client has either
         * 1) changed a Characteristic Client Configuration, meaning that they have enabled
         * or disabled Notifications or Indications, or
         * 2) sent a confirmation upon a successful reception of the indication. */
        case gecko_evt_gatt_server_characteristic_status_id:
          /* Check that the characteristic in question is temperature - its ID is defined
           * in gatt.xml as "temperature_measurement". Also check that status_flags = 1, meaning that
           * the characteristic client configuration was changed (notifications or indications
           * enabled or disabled). */
#if 0
          if ((evt->data.evt_gatt_server_characteristic_status.characteristic == gattdb_temperature_measurement)
              && (evt->data.evt_gatt_server_characteristic_status.status_flags == 0x01)) {
            if (evt->data.evt_gatt_server_characteristic_status.client_config_flags == 0x02) {
              /* Indications have been turned ON - start the repeating timer. The 1st parameter '32768'
               * tells the timer to run for 1 second (32.768 kHz oscillator), the 2nd parameter is
               * the timer handle and the 3rd parameter '0' tells the timer to repeat continuously until
               * stopped manually.*/
            } else if (evt->data.evt_gatt_server_characteristic_status.client_config_flags == 0x00) {
              /* Indications have been turned OFF - stop the timer. */
              gecko_cmd_hardware_set_soft_timer(0, 0, 0);
            }
          }
          break;
#endif

        /* This event is generated when the software timer has ticked. In this example the temperature
         * is read after every 1 second and then the indication of that is sent to the listening client. */
        case gecko_evt_hardware_soft_timer_id:
          /* Measure the temperature as defined in the function temperatureMeasure() */
          //temperatureMeasure();
        	printf("Hello\n");
          break;

        case gecko_evt_le_connection_closed_id:
            /* Stop timer in case client disconnected before indications were turned off */
            gecko_cmd_hardware_set_soft_timer(0, 0, 0);
            /* Restart advertising after client has disconnected */
            gecko_cmd_le_gap_start_advertising(0, le_gap_general_discoverable, le_gap_connectable_scannable);
          break;

        /* Events related to OTA upgrading
           ----------------------------------------------------------------------------- */

        /* Checks if the user-type OTA Control Characteristic was written.
         * If written, boots the device into Device Firmware Upgrade (DFU) mode. */
        case gecko_evt_gatt_server_user_write_request_id:

          break;

        default:
          break;
      }
    }
}

/** @} (end addtogroup app) */
/** @} (end addtogroup Application) */
