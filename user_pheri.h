/*
 * user_pheri.h
 *
 *  Created on: 2019. 5. 3.
 *      Author: netbugger
 */

#ifndef USER_PHERI_H_
#define USER_PHERI_H_

#include "em_gpio.h"

#define UIF_PB0_PORT	gpioPortF
#define UIF_PB0_PIN		6
#define UIF_PB1_PORT	gpioPortF
#define UIF_PB1_PIN		7
#define UIF_LED0_PORT	gpioPortF
#define UIF_LED0_PIN	4
#define UIF_LED1_PORT	gpioPortF
#define UIF_LED1_PIN	5


#define VCOM_TX_PORT	gpioPortA
#define VCOM_TX_PIN		0
#define VCOM_RX_PORT	gpioPortA
#define VCOM_RX_PIN		1
#define VCOM_EN_PORT	gpioPortA
#define VCOM_EN_PIN		5

/*
#define COM_TX_PORT		gpioPortD
#define COM_TX_PIN		10
#define COM_RX_PORT		gpioPortD
#define COM_RX_PIN		11
#define COM_EN_PORT		gpioPortD
#define COM_EN_PIN		5
*/
#define BUFFERSIZE          256
#define TERMINATION_CHAR    'gto'



//int _write(int file, char *ptr, int len);
void init_vcom(void);

void USART1_RX_IRQHandler(void);
void USART0_RX_IRQHandler(void);

void init_pb(void);
void isr_pb0(uint8_t pin);
void isr_pb1(uint8_t pin);

void uartPutData(uint8_t * dataPtr, uint32_t dataLen);
void uartPutChar(uint8_t charPtr);


#endif /* USER_PHERI_H_ */
