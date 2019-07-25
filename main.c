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
#include "em_adc.h"

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
static gecko_configuration_t config =
{
	.config_flags = 0, /* Check flag options from UG136 */
#if defined(FEATURE_LFXO)
	.sleep.flags = SLEEP_FLAGS_DEEP_SLEEP_ENABLE, /* Sleep is enabled */
#else
	.sleep.flags = 0,
#endif // LFXO
	.bluetooth.max_connections = MAX_CONNECTIONS, /* Maximum number of simultaneous connections */
	.bluetooth.max_advertisers = MAX_ADVERTISERS, /* Maximum number of advertisement sets */
	.bluetooth.heap = bluetooth_stack_heap, /* Bluetooth stack memory for connection management */
	.bluetooth.heap_size = sizeof(bluetooth_stack_heap), /* Bluetooth stack memory for connection management */
	.bluetooth.sleep_clock_accuracy = 100, /* Accuracy of the Low Frequency Crystal Oscillator in ppm. *
	 * Do not modify if you are using a module                  */
	.gattdb = &bg_gattdb_data, /* Pointer to GATT database */
	.ota.flags = 0, /* Check flag options from UG136 */
	.ota.device_name_len = 3, /* Length of the device name in OTA DFU mode */
	.ota.device_name_ptr = "OTA", /* Device name in OTA DFU mode */
#if (HAL_PA_ENABLE)
	.pa.config_enable = 1, /* Set this to be a valid PA config */
#if defined(FEATURE_PA_INPUT_FROM_VBAT)
	.pa.input = GECKO_RADIO_PA_INPUT_VBAT, /* Configure PA input to VBAT */
#else
	.pa.input = GECKO_RADIO_PA_INPUT_DCDC, /* Configure PA input to DCDC */
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

	/* Initialize chip - handle erratas */
	//CHIP_Init();

	// User Init
	init_vcom();

	RETARGET_SerialInit();
	RETARGET_SerialCrLf(true);
	/* Initialize application */
	initApp();
	init_pb();
	//USART1_RX_IRQHandler();
	/* Start application */

	initADC();

	appMain(&config);
}

void initADC (void)
{
  // Enable ADC0 clock
  CMU_ClockEnable(cmuClock_ADC0, true);

  // Declare init structs
  ADC_Init_TypeDef init = ADC_INIT_DEFAULT;
  ADC_InitScan_TypeDef initScan = ADC_INITSCAN_DEFAULT;

  // Modify init structs
  init.prescale   = ADC_PrescaleCalc(CMU_ClockFreqGet(cmuClock_ADC0), 0);

  initScan.diff       = 0;            // single ended
  initScan.reference  = adcRefVDD;
  initScan.resolution = adcRes12Bit;  // 12-bit resolution
  initScan.acqTime    = adcAcqTime1;  // set acquisition time to meet minimum requirement
  initScan.fifoOverwrite = true;      // FIFO overflow overwrites old data

  // Select ADC input. See README for corresponding EXP header pin.
  // Add VDD to scan for demonstration purposes
  ////////////////////////////////////////////////////////////////////////////////////
  // adcPosSelAPORT3XCH10
  ////////////////////////////////////////////////////////////////////////////////////
  ADC_ScanSingleEndedInputAdd(&initScan, adcScanInputGroup0, adcPosSelAPORT3XCH10);
  //ADC_ScanSingleEndedInputAdd(&initScan, adcScanInputGroup0, adcPosSelAPORT4XCH13);
  //ADC_ScanSingleEndedInputAdd(&initScan, adcScanInputGroup0, adcPosSelAPORT4YCH14);
  //ADC_ScanSingleEndedInputAdd(&initScan, adcScanInputGroup0, adcPosSelAPORT4XCH15);

  // Set scan data valid level (DVL) to 2
  ADC0->SCANCTRLX |= (1 - 1) << _ADC_SCANCTRLX_DVL_SHIFT;

  // Clear ADC Scan fifo
  ADC0->SCANFIFOCLEAR = ADC_SCANFIFOCLEAR_SCANFIFOCLEAR;

  // Initialize ADC and Scan
  ADC_Init(ADC0, &init);
  ADC_InitScan(ADC0, &initScan);

#if 0
  // Enable Scan interrupts
  ADC_IntEnable(ADC0, ADC_IEN_SCAN);

  // Enable ADC interrupts
  NVIC_ClearPendingIRQ(ADC0_IRQn);
  NVIC_EnableIRQ(ADC0_IRQn);
#endif
}



/** @} (end addtogroup app) */
/** @} (end addtogroup Application) */
