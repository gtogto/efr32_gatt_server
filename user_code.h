/*
 * user_code.h
 *
 *  Created on: 2019. 5. 8.
 *      Author: netbugger
 */

#ifndef USER_CODE_H_
#define USER_CODE_H_

#define TIMER_TICK_TO_MS(x)		(32768*x/1000)

typedef enum {
	KEYBOARD_NONE	= 0x00,
	KEYBOARD_RETURN	= 0x28,
	KEYBOARD_ESC	= 0x29,
	KEYBOARD_RIGHT	= 0x4f,
	KEYBOARD_LEFT	= 0x50,
	KEYBOARD_DOWN	= 0x51,
	KEYBOARD_UP		= 0x52,
}keycode_t;

typedef enum {
	TIMER_TICK		= 0,
	TIMER_SENSOR	= 1,
	TIMER_KEY_INPUT	= 2,
}timer_id_t;

/** HID report mode. */
#define HID_REPORT_MODE                      1
/** HID boot mode. */
#define HID_BOOT_MODE                        0

#endif /* USER_CODE_H_ */
