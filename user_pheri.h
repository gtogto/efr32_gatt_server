/*
 * user_pheri.h
 *
 *  Created on: 2019. 5. 3.
 *      Author: netbugger
 */

#ifndef USER_PHERI_H_
#define USER_PHERI_H_

#define UIF_PB0_PORT	gpioPortF
#define UIF_PB0_PIN		6
#define UIF_PB1_PORT	gpioPortF
#define UIF_PB1_PIN		7
#define UIF_LED0_PORT	goioPortF
#define UIF_LED0_PIN	4
#define UIF_LED1_PORT	goioPortF
#define UIF_PB0_PIN		5

#define VCOM_TX_PORT	gpioPortA
#define VCOM_TX_PIN		0
#define VCOM_RX_PORT	gpioPortA
#define VCOM_RX_PIN		1
#define VCOM_EN_PORT	gpioPortA
#define VCOM_EN_PIN		5

int _write(int file, char *ptr, int len);
void init_vcom(void);
#endif /* USER_PHERI_H_ */
