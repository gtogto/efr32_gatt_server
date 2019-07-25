/*
 * user_pheri.c
 *
 *  Created on: 2019. 5. 3.
 *      Author: netbugger
 */
#include "em_cmu.h"
#include "em_usart.h"
#include "user_pheri.h"
#include "gpiointerrupt.h"
#include "user_code.h"
#include <stdio.h>
#include <stdlib.h>
#include "em_chip.h"    // required for CHIP_Init() function

/* Function prototypes */


keycode_t gKeyValue = KEYBOARD_NONE;
#if 0
int _write(int file, char *ptr, int len)
{
#define PRINTF_USART USART0
  /* Implement your write code here, this is used by puts and printf for example */
  int i=0;
  for(i=0 ; i<len ; i++) {
	  if(*ptr == '\n') {
		  USART_Tx(PRINTF_USART, '\r');
	  }

	  USART_Tx(PRINTF_USART, (*ptr++));
  }
  return len;
}
#endif


#if 0
void init_vcom(void)
{
	USART_InitAsync_TypeDef initasync = USART_INITASYNC_DEFAULT;
	USART_PrsTriggerInit_TypeDef initprs = USART_INITPRSTRIGGER_DEFAULT;

	/* VCOM Enable */
	GPIO_PinModeSet(VCOM_EN_PORT, VCOM_EN_PIN, gpioModePushPull, true);

	/* Clock Enable */
	//CMU_ClockEnable(cmuClock_GPIO, true);
	CMU_ClockEnable(cmuClock_USART0, true);
	//CMU_ClockEnable(cmuClock_USART1, true);



	initasync.baudrate = 115200;
	initasync.databits = usartDatabits8;
	initasync.parity = usartNoParity;
	initasync.stopbits = usartStopbits1;
	initasync.oversampling = usartOVS16;
#if defined( USART_INPUT_RXPRS ) && defined( USART_CTRL_MVDIS )
	initasync.mvdis = 0;
	initasync.prsRxEnable = 0;
	initasync.prsRxCh = 0;
#endif

	USART_InitAsync(USART1, &initasync);
	initprs.rxTriggerEnable = 0;
	initprs.txTriggerEnable = 0;
	initprs.prsTriggerChannel = usartPrsTriggerCh0;

	USART_InitPrsTrigger(USART1, &initprs);

	/* To avoid false start, configure output as high */
	GPIO_PinModeSet(VCOM_TX_PORT, VCOM_TX_PORT, gpioModePushPull, 1);
	GPIO_PinModeSet(VCOM_RX_PORT, VCOM_RX_PIN, gpioModeInput, 0);

	USART1->ROUTEPEN = USART_ROUTEPEN_RXPEN | USART_ROUTEPEN_TXPEN;
	USART1->ROUTELOC0 = (USART1->ROUTELOC0 &
				~(_USART_ROUTELOC0_TXLOC_MASK | _USART_ROUTELOC0_RXLOC_MASK) ) |
				(USART_ROUTELOC0_TXLOC_LOC18 << _USART_ROUTELOC0_TXLOC_SHIFT) |
				(USART_ROUTELOC0_RXLOC_LOC18 << _USART_ROUTELOC0_RXLOC_SHIFT);

	/* Clear previous RX interrupts */
	USART_IntClear(USART1, USART_IF_RXDATAV);
	NVIC_ClearPendingIRQ(USART1_RX_IRQn);
	//NVIC_ClearPendingIRQ(USART1_TX_IRQn);

	/* Enable RX interrupts */
	USART_IntEnable(USART1, USART_IF_RXDATAV);
	NVIC_EnableIRQ(USART1_RX_IRQn);
	//NVIC_EnableIRQ(USART1_TX_IRQn);

	/* Finally enable it */
	USART_Enable(USART1, usartEnable);


}
#endif

#if 1
void init_vcom(void)
{

	USART_InitAsync_TypeDef initasync = USART_INITASYNC_DEFAULT;
	USART_PrsTriggerInit_TypeDef initprs = USART_INITPRSTRIGGER_DEFAULT;


	/* VCOM Enable */
	GPIO_PinModeSet(VCOM_EN_PORT, VCOM_EN_PIN, gpioModePushPull, true);


	/* Clock Enable */
	CMU_ClockEnable(cmuClock_USART0, true);
	CMU_ClockEnable(cmuClock_GPIO, true);
	//CMU_ClockEnable(cmuClock_USART1, true);



	initasync.baudrate = 115200;
	initasync.databits = usartDatabits8;
	initasync.parity = usartNoParity;
	initasync.stopbits = usartStopbits1;
	initasync.oversampling = usartOVS16;
#if defined( USART_INPUT_RXPRS ) && defined( USART_CTRL_MVDIS )
	initasync.mvdis = 0;
	initasync.prsRxEnable = 0;
	initasync.prsRxCh = 0;
#endif
	USART_InitAsync(USART0, &initasync);
	initprs.rxTriggerEnable = 0;
	initprs.txTriggerEnable = 0;
	initprs.prsTriggerChannel = usartPrsTriggerCh0;

	USART_InitPrsTrigger(USART0, &initprs);

	/* To avoid false start, configure output as high */
	GPIO_PinModeSet(VCOM_TX_PORT, VCOM_TX_PIN, gpioModePushPull, 1);
	GPIO_PinModeSet(VCOM_RX_PORT, VCOM_RX_PORT, gpioModeInputPull, 1);

	USART0->ROUTEPEN = USART_ROUTEPEN_RXPEN | USART_ROUTEPEN_TXPEN;
	USART0->ROUTELOC0 = (USART0->ROUTELOC0 &
				~(_USART_ROUTELOC0_TXLOC_MASK | _USART_ROUTELOC0_RXLOC_MASK) ) |
				(USART_ROUTELOC0_TXLOC_LOC0 << _USART_ROUTELOC0_TXLOC_SHIFT) |
				(USART_ROUTELOC0_RXLOC_LOC0 << _USART_ROUTELOC0_RXLOC_SHIFT);

	/* Clear previous RX interrupts */
	USART_IntClear(USART0, USART_IF_RXDATAV);
	NVIC_ClearPendingIRQ(USART0_RX_IRQn);

	/* Enable RX interrupts */
	USART_IntEnable(USART0, USART_IF_RXDATAV);
	NVIC_EnableIRQ(USART0_RX_IRQn);
	NVIC_EnableIRQ(USART1_RX_IRQn);

	/* Finally enable it */
	USART_Enable(USART0, usartEnable);
	USART_Enable(USART1, usartEnable);

}
#endif



void init_pb(void)
{
	GPIO_PinModeSet(UIF_LED0_PORT, UIF_LED0_PIN, gpioModePushPull, 0);
	GPIO_PinModeSet(UIF_LED1_PORT, UIF_LED1_PIN, gpioModePushPull, 0);

	/* GPIO Driver Init */
	GPIOINT_Init();

	GPIO_PinModeSet(UIF_PB0_PORT, UIF_PB0_PIN, gpioModeInputPull, 1);
	/* Register Falling Edge */
	GPIOINT_CallbackRegister(UIF_PB0_PIN, isr_pb0);
	GPIO_IntConfig(UIF_PB0_PORT, UIF_PB0_PIN, false, true, true); //falling edge

	GPIO_PinModeSet(UIF_PB1_PORT, UIF_PB1_PIN, gpioModeInputPull, 1);
	/* Register Falling Edge */
	GPIOINT_CallbackRegister(UIF_PB1_PIN, isr_pb1);
	GPIO_IntConfig(UIF_PB1_PORT, UIF_PB1_PIN, false, true, true); //falling edge
}

void isr_pb0(uint8_t pin)
{
	//gKeyValue = KEYBOARD_RIGHT;
	GPIO_PinOutToggle(UIF_LED0_PORT, UIF_LED0_PIN);
}

void isr_pb1(uint8_t pin)
{
	//gKeyValue = KEYBOARD_LEFT;
	GPIO_PinOutToggle(UIF_LED1_PORT, UIF_LED1_PIN);
	printf("other function");
}

uint8_t get_key_value()
{
	uint8_t tmpKey = gKeyValue;
	gKeyValue = KEYBOARD_NONE;
	return tmpKey;
}
