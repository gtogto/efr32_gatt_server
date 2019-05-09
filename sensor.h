/*
 * sensor.h
 *
 *  Created on: 2017. 3. 28.
 *      Author: netbugger
 */

#ifndef SRC_SENSOR_H_
#define SRC_SENSOR_H_

#include "em_i2c.h"

#define LOG_NOR	printf



/*
 * Select communication between STNucleo and ICM20602 by setting 0/1 to one of the following defines
 */
#define SERIF_TYPE_SPI 0
#define SERIF_TYPE_I2C 1

/* FSR configurations */
static int32_t cfg_acc_fsr = 4000; /* +/- 4g */
static int32_t cfg_gyr_fsr = 2000; /* +/- 2000dps */

/* Sensitivity configurations */
#define ACC_SENSITIVITY (int32_t) ( ((cfg_acc_fsr/1000) * (1 << 16)) / INT16_MAX)
#define GYR_SENSITIVITY (int32_t) ( (cfg_gyr_fsr * (1 << 16) / INT16_MAX) )

#define ICM_I2C_ADDR     (0x68 << 1) /* I2C slave address for ICM20602 */
static const uint8_t EXPECTED_WHOAMI[] = { 0x12, 0x11 };  /* WHOAMI value for ICM20602 or derivative */
#define DATA_ACCURACY_MASK  ((uint32_t)0x7)

/* factor to convert degree to radian expressed in q30 */
#define FACTOR_DPS_TO_RPS       (int32_t) 18740330 // ((PI / 180) * (1 << 30))

/* sensor ODR limit */
#define MIN_ODR_US        1000
#define MAX_ODR_US       20000
#define DEFAULT_ODR_US   20000

/*
 * Sanity checks
 */

#if (SERIF_TYPE_SPI && SERIF_TYPE_I2C) || !SERIF_TYPE_SPI && !SERIF_TYPE_I2C
	#error "You must choose between I2C or SPI for icm20602 device control"
#endif




/*
 * Flag set from icm20602 device irq handler
 */
static volatile int irq_from_device;

/*
 * Mask to keep track of enabled sensors
 */
static uint32_t enabled_sensor_mask = 0;

/*
 * Variable to keep track of the expected period common for all sensors
 */
static uint32_t period_us = DEFAULT_ODR_US /* 50Hz by default */;

/*
 * Variable to drop the first timestamp(s) after a sensor start catched by the interrupt line.
 * This is needed to be inline with the driver. The first data polled from the FIFO is always discard.
 */
static uint8_t timestamp_to_drop = 0;

/*
 * Variable keeping track of chip information
 */
static uint8_t chip_info[3];

/*
 * Variable keeping track of gyro-assisted calibration support
 */
static uint8_t hmd_features_supported = 0;

/*
 * Sensor identifier for control function
 */
enum sensor {
	SENSOR_RAW_ACC,
	SENSOR_RAW_GYR,
	SENSOR_ACC,
	SENSOR_GYR,
	SENSOR_UGYR,
	SENSOR_GRV,
	SENSOR_PREDQUAT,
	SENSOR_GRA,
	SENSOR_LINACC,
	SENSOR_MAX
};

/*
 * Data Structures
 */
static int32_t sRacc_data[3];
static int32_t sRgyro_data[3];

/*
 * Mounting matrix configuration applied for both Accel and Gyro
 * The coefficient values are coded in integer q30
 */
static int32_t cfg_mounting_matrix[9]= { 1.f*(1<<30), 0,           0,
                                         0,           1.f*(1<<30), 0,
                                         0,           0,           1.f*(1<<30) };



/******************************************************************************/

/* Forward declaration */

int icm20602_sensor_setup(void);
static int icm20602_sensor_configuration(void);

static int icm20602_run_selftest(void);
static void apply_mouting_matrix(const int32_t mounting_matrix[9], const int16_t raw[3], int32_t out[3]);
static int sensor_control(int enable);
static int sensor_configure_odr(int odr_us);
void do_sensing(int16_t *pAx, int16_t *pAy, int16_t *pAz, int16_t *pGx, int16_t *pGy, int16_t *pGz  );
void init_icm20602();

static int idd_io_hal_init(void);
static void check_rc(int rc, const char * context_str);

int hal_efm_i2c_read(void * context, uint8_t reg, uint8_t * buf, uint32_t len);
int hal_efm_i2c_write(void * context, uint8_t reg, const uint8_t * buf, uint32_t len);
I2C_TransferReturn_TypeDef i2c_write_reg8(uint8_t dev_addr, uint8_t reg_addr, const uint8_t *data, int len);
I2C_TransferReturn_TypeDef i2c_read_reg8(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data, int len);


#endif /* SRC_SENSOR_H_ */
