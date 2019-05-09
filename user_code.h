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

enum GESTURES	{
	RIGHT,
	LEFT,
	FRONT,
	BACK,
	UP,
	DOWN,
	CLOCK,
	ANTI_CLOCK,
	LOW_CLOCK,
	LOW_ANTI,
	SIDE_CLOCK,
	SIDE_ANTI,
	FRONT_R,
	FRONT_L,
	BACK_R,
	BACK_L,
	RIGHT_F,
	RIGHT_B,
	LEFT_F,
	LEFT_B,
	NONE,
	SIDE,
};

#define SENSOR_VALUE_COUNTER	20	//# per 1 sec
#define SAMPLING_DELAY			5	//ms
#define AXIS_NUM				6
#define BACKUP_SAMPLE 5
#define SAMPLE_NUM SENSOR_VALUE_COUNTER

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
