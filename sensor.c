/*
 * ________________________________________________________________________________________________________
 * Copyright (c) 2016-2016 InvenSense Inc. All rights reserved.
 *
 * This software, related documentation and any modifications thereto (collectively 諛챣ftware占�) is subject
 * to InvenSense and its licensors' intellectual property rights under U.S. and international copyright
 * and other intellectual property rights laws.
 *
 * InvenSense and its licensors retain all intellectual property and proprietary rights in and to the Software
 * and any use, reproduction, disclosure or distribution of the Software without an express license agreement
 * from InvenSense is strictly prohibited.
 *
 * EXCEPT AS OTHERWISE PROVIDED IN A LICENSE AGREEMENT BETWEEN THE PARTIES, THE SOFTWARE IS
 * PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
 * EXCEPT AS OTHERWISE PROVIDED IN A LICENSE AGREEMENT BETWEEN THE PARTIES, IN NO EVENT SHALL
 * INVENSENSE BE LIABLE FOR ANY DIRECT, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, OR ANY
 * DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
 * NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THE SOFTWARE.
 * ________________________________________________________________________________________________________
 */

#include <stdint.h>

/* InvenSense drivers and utils */
#include "Icm20602.h"
#include "DataConverter.h"

/* board driver */
#include "em_gpio.h"
#include "em_i2c.h"
#include "udelay.h"

/* std */
#include <stdint.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

#include "ErrorHelper.h"
#include "sensor.h"

/*
 * Just a handy variable to handle the icm20602 object
 */
static inv_icm20602_t icm_device;


int icm20602_sensor_setup(void)
{
	int rc;
	uint8_t i, whoami = 0xff;

	/*
	 * Just get the whoami
	 */
	rc = inv_icm20602_get_whoami(&icm_device, &whoami);
	LOG_NOR("ICM20602 WHOAMI=0x%02x\n", whoami);
	check_rc(rc, "Error reading WHOAMI");

	/*
	 * Check if WHOAMI value corresponds to any value from EXPECTED_WHOAMI array
	 */
	for(i = 0; i < sizeof(EXPECTED_WHOAMI)/sizeof(EXPECTED_WHOAMI[0]); ++i) {
		if(whoami == EXPECTED_WHOAMI[i])
			break;
	}

	if(i == sizeof(EXPECTED_WHOAMI)/sizeof(EXPECTED_WHOAMI[0])) {
		LOG_ERR("Bad WHOAMI value. Got 0x%02x. Expected 0x12, 0x11.\n", whoami);
		check_rc(-1, "");
	}

	rc = inv_icm20602_get_chip_info(&icm_device, chip_info);
	check_rc(rc, "Could not obtain chip info");

	/*
	 * Configure and initialize the ICM20602 for normal use
	 */
	LOG_NOR("Booting up icm20602...\n");

	/* set default power mode */
	if (!inv_icm20602_is_sensor_enabled(&icm_device, INV_ICM20602_SENSOR_GYRO) &&
		!inv_icm20602_is_sensor_enabled(&icm_device, INV_ICM20602_SENSOR_ACCEL)) {
		LOG_NOR("Putting icm20602 in sleep mode...\n");
		rc = inv_icm20602_initialize(&icm_device);
		check_rc(rc, "Error %d while setting-up icm20602 device");
	}

	/* set default ODR = 50Hz */
	rc = inv_icm20602_set_sensor_period(&icm_device, INV_ICM20602_SENSOR_ACCEL, DEFAULT_ODR_US/400 /*ms*/);
	check_rc(rc, "Error %d while setting-up icm20602 device");

	rc = inv_icm20602_set_sensor_period(&icm_device, INV_ICM20602_SENSOR_GYRO, DEFAULT_ODR_US/400 /*ms*/);
	check_rc(rc, "Error %d while setting-up icm20602 device");

	period_us = DEFAULT_ODR_US;

	/* we should be good to go ! */
	LOG_NOR("We're good to go !\n");

	return 0;
}


void init_icm20602()
{
	/*
	 * Initialize icm20602 serif structure
	 */
	struct inv_icm20602_serif icm20602_serif;

	/*
	 * Init I2C communication
	 */
	icm20602_serif.max_read  = 64; /* maximum number of bytes allowed per serial read */
	icm20602_serif.max_write = 64; /* maximum number of bytes allowed per serial write */
	icm20602_serif.is_spi    = 0;
	icm20602_serif.context   = 0; /* no need */
	icm20602_serif.read_reg = hal_efm_i2c_read;
	icm20602_serif.write_reg = hal_efm_i2c_write;
	LOG_NOR("Openning serial interface through I2C\n");

	/*
	 * Reset icm20602 driver states
	 */
	inv_icm20602_reset_states(&icm_device, &icm20602_serif);

	icm20602_run_selftest();

	/*
	 *  Setup the icm20602 device
	 */
	//icm20602_sensor_setup();
	icm20602_sensor_configuration();

	/*
	 * Initializes the default sensor ODR in order to properly init the algorithms
	 */
		sensor_configure_odr(period_us);

	/*
	 * Configure the timer input capture mode connected to the external interrupt INT1(D6) dataready to get accurate timestamping
	 * INT1(D6) enabled for dataready interrupt from icm20602
	 */

	/*
	 * At boot time, all sensors are turned on.
	 */
	sensor_control(1);
}

void do_sensing(int16_t *pAx, int16_t *pAy, int16_t *pAz, int16_t *pGx, int16_t *pGy, int16_t *pGz  )
{
	int rc = 0;
	uint8_t ddry = 0;
	uint8_t int_status;
	int16_t raw_acc[3], raw_gyro[3], sRtemp_data;

	/*
	 * Poll devices for data
	 */

	// check INT
	/*
	 *  Ensure data ready status
	 */
	if ((rc = inv_icm20602_get_int_status(&icm_device, &int_status)) == i2cTransferDone) {
		ddry = inv_icm20602_check_drdy(&icm_device, int_status);
	}

	if (ddry) {
		struct inv_icm20602_fifo_states fifo_states;

		rc = inv_icm20602_poll_fifo_data_setup(&icm_device, &fifo_states,
				int_status);
		check_rc(rc, "Error %d while polling the icm20602 device");
		if (rc == 1) {
			/*
			 * Overflow detected
			 */
			LOG_ERR("FIFO overflow detected!\n");
			inv_icm20602_reset_fifo(&icm_device);
			//timer_clear_irq_timestamp(TO_MASK(GPIO_SENSOR_IRQ_D6));
		} else if (fifo_states.packet_count > 0
				&& fifo_states.packet_size > 0) {
			/*
			 * Read FIFO only when data is expected in FIFO
			 */
			rc = inv_icm20602_poll_fifo_data(&icm_device, &fifo_states, raw_acc, &sRtemp_data, raw_gyro, NULL);
			//LOG_NOR("acc [%d][%d][%d], gyro [%d][%d][%d]\n", raw_acc[0], raw_acc[1], raw_acc[2], raw_gyro[0], raw_gyro[1], raw_gyro[2]);
		}
	}
	*pAx = raw_acc[0];
	*pAy = raw_acc[1];
	*pAx = raw_acc[2];
	*pGx = raw_gyro[0];
	*pGy = raw_gyro[1];
	*pGz = raw_gyro[2];
}



int icm20602_sensor_configuration(void)
{
	int rc;

	LOG_NOR("Configuring accelerometer FSR\n");
	rc = inv_icm20602_set_accel_fullscale(&icm_device, inv_icm20602_accel_fsr_2_reg(cfg_acc_fsr));
	check_rc(rc, "Error configuring ACC sensor");

	LOG_NOR("Configuring gyroscope FSR\n");
	rc = inv_icm20602_set_gyro_fullscale(&icm_device, inv_icm20602_gyro_fsr_2_reg(cfg_gyr_fsr));
	check_rc(rc, "Error configuring GYR sensor");

	return rc;
}


#if 0
static void apply_mouting_matrix(const int32_t mounting_matrix[9], const int16_t raw[3], int32_t out[3])
{
	unsigned i;

	for(i = 0; i < 3; i++) {
		out[i]  = (int32_t)((int64_t)mounting_matrix[3*i+0]*raw[0] >> 30);
		out[i] += (int32_t)((int64_t)mounting_matrix[3*i+1]*raw[1] >> 30);
		out[i] += (int32_t)((int64_t)mounting_matrix[3*i+2]*raw[2] >> 30);
	}
}
#endif


int icm20602_run_selftest(void)
{
	int raw_bias[12];
	int rc = 0;

	if (icm_device.selftest_done == 1) {
		LOG_NOR("Self-test has already ran. Skipping.\n");
	}
	else {
		/* 
		 * Perform self-test
		 * For ICM20602 self-test is performed for both RAW_ACC/RAW_GYR
		 */
		LOG_NOR("Running self-test...\n");

		/* Run the self-test */
		rc = inv_icm20602_run_selftest(&icm_device);
		/* Check transport errors */
		check_rc(rc, "Self-test failure");
		if (rc != 0x3) {
			/*
			 * Check for GYR success (1 << 0) and ACC success (1 << 1),
			 * but don't block as these are 'usage' failures.
			 */
			LOG_ERR("Self-test failure\n");
			/* 0 would be considered OK, we want KO */
			return INV_ERROR;
		} else
			/* On success, offset will be kept until reset */
			icm_device.selftest_done = 1;

		/* It's advised to re-init the icm20602 device after self-test for normal use */
		rc = icm20602_sensor_setup();
	}

	/* 
	 * Get Low Noise / Low Power bias computed by self-tests scaled by 2^16
	 */
	LOG_NOR("Getting LP/LN bias\n");
	inv_icm20602_get_st_bias(&icm_device, raw_bias);
	LOG_NOR("GYR LN bias (FS=250dps) (dps): x=%f, y=%f, z=%f\n",
			(float)(raw_bias[0] / (float)(1 << 16)), (float)(raw_bias[1] / (float)(1 << 16)), (float)(raw_bias[2] / (float)(1 << 16)));
	LOG_NOR("GYR LP bias (FS=250dps) (dps): x=%f, y=%f, z=%f\n",
			(float)(raw_bias[3] / (float)(1 << 16)), (float)(raw_bias[4] / (float)(1 << 16)), (float)(raw_bias[5] / (float)(1 << 16)));
	LOG_NOR("ACC LN bias (FS=2g) (g): x=%f, y=%f, z=%f\n",
			(float)(raw_bias[0 + 6] / (float)(1 << 16)), (float)(raw_bias[1 + 6] / (float)(1 << 16)), (float)(raw_bias[2 + 6] / (float)(1 << 16)));
	LOG_NOR("ACC LP bias (FS=2g) (g): x=%f, y=%f, z=%f\n",
			(float)(raw_bias[3 + 6] / (float)(1 << 16)), (float)(raw_bias[4 + 6] / (float)(1 << 16)), (float)(raw_bias[5 + 6] / (float)(1 << 16)));

	return rc;
}

int sensor_control(int enable)
{
	int rc = 0;
	static uint8_t sensors_on = 0;

	/* Keep track of the sensors state */
	if(enable && sensors_on)
		return rc;

	if(enable)
		sensors_on = 1;
	else 
		sensors_on = 0;

	/*
	 *  Call driver APIs to start/stop sensors
	 */
	if (enable) {
		/* Clock is more accurate when gyro is enabled, so let's enable it first to prevent side effect at startup */
		if (!inv_icm20602_is_sensor_enabled(&icm_device, INV_ICM20602_SENSOR_GYRO))
			rc += inv_icm20602_enable_sensor(&icm_device, INV_ICM20602_SENSOR_GYRO, 1);
		if (!inv_icm20602_is_sensor_enabled(&icm_device, INV_ICM20602_SENSOR_ACCEL))
			rc += inv_icm20602_enable_sensor(&icm_device, INV_ICM20602_SENSOR_ACCEL, 1);
		//if (!inv_icm20602_is_sensor_enabled(&icm_device, INV_ICM20602_SENSOR_TEMPERATURE))
		//	rc += inv_icm20602_enable_sensor(&icm_device, INV_ICM20602_SENSOR_TEMPERATURE, 1);
		/*
		 * There is a situation where two samples need to be dropped: if
		 * accelerometer is enable before gyroscope first interrupt triggers,
		 * both interrupts are raised causing the odr to be wrong if only one
		 * sample is dropped.
		 * We are in this exact situation since both sensors are enabled one after
		 * the other.
		 */
		timestamp_to_drop = 2;
	} else {
		rc += inv_icm20602_enable_sensor(&icm_device, INV_ICM20602_SENSOR_GYRO, 0);
		rc += inv_icm20602_enable_sensor(&icm_device, INV_ICM20602_SENSOR_ACCEL, 0);
		//rc += inv_icm20602_enable_sensor(&icm_device, INV_ICM20602_SENSOR_TEMPERATURE, 0);
	}

	/* Clear the remaining items in the IRQ timestamp buffer when stopping all sensors */
	if(inv_icm20602_all_sensors_off(&icm_device))
		//rc += timer_clear_irq_timestamp(TO_MASK(GPIO_SENSOR_IRQ_D6));

	return rc;
}

int sensor_configure_odr(int odr_us)
{
	int rc = 0;

	/* All sensors running at the same rate */

	/* Do not reconfigure the rate if it's already applied */
	if(odr_us == period_us)
		return rc;

	/*
	 * Maximum supported rate is 1kHz
	 */
	if(odr_us < MIN_ODR_US)
		odr_us = MIN_ODR_US;

	/* 
	 * Minimum rate supported is 50Hz 
	 * - To compute a correct orientation with the GRV algorithm
	 * - For accelerometer sensor using gyro-assisted calibration.
	 * The basic accelerometer and gyroscope sensor could report at lower frequency, but we simplify the example with this condition.
	 */
	if(odr_us > MAX_ODR_US)
		odr_us = MAX_ODR_US;

	/*
	 *  Call driver APIs to start/stop sensors
	 */
	rc = inv_icm20602_set_sensor_period(&icm_device, INV_ICM20602_SENSOR_ACCEL, odr_us / 1000);
	rc += inv_icm20602_set_sensor_period(&icm_device, INV_ICM20602_SENSOR_GYRO, odr_us / 1000);
	/* FIFO has been reset by ODR change */

	/* Keep track in static variable of the odr value for further algorihtm use */
	period_us = odr_us;

	return rc;
}


/**********************************************************************************
 * ********************************************************************************
 ****************************WRAPPER Function**************************************
 ***********************************************************************************
 ***********************************************************************************
 */



/*
 * Sleep implementation for ICM20602
 */
void inv_icm20602_sleep(int ms)
{
	//Delay(ms);
	UDELAY_Delay(1000*ms);
}

void inv_icm20602_sleep_us(int us)
{
	//Delay(us/1000);
	UDELAY_Delay(us);
}

/*
 * Callback that will be executed at each MAIN_UART interrupt
 */


int hal_efm_i2c_read(void * context, uint8_t reg, uint8_t * buf, uint32_t len)
{
	return (int)(i2c_read_reg8(ICM_I2C_ADDR, reg, buf, len));
}
int hal_efm_i2c_write(void * context, uint8_t reg, const uint8_t * buf, uint32_t len)
{
	return (int)(i2c_write_reg8(ICM_I2C_ADDR, reg, buf, len));
}

I2C_TransferReturn_TypeDef i2c_write_reg8(uint8_t dev_addr, uint8_t reg_addr, const uint8_t *data, int len)
{
	I2C_TransferReturn_TypeDef ret;
	I2C_TransferSeq_TypeDef	i2cSeq;

	i2cSeq.addr = dev_addr;
	i2cSeq.flags = I2C_FLAG_WRITE_WRITE;
	i2cSeq.buf[0].data = &reg_addr;
	i2cSeq.buf[0].len = 1;
	i2cSeq.buf[1].data = (uint8_t *)(data);
	i2cSeq.buf[1].len = len;
	ret = I2C_TransferInit(I2C0, &i2cSeq);
	while (ret == i2cTransferInProgress)
	{
		ret = I2C_Transfer(I2C0);
	}

	return ret;
}

I2C_TransferReturn_TypeDef i2c_read_reg8(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data, int len)
{
	I2C_TransferReturn_TypeDef ret;
	I2C_TransferSeq_TypeDef	i2cSeq;

	i2cSeq.addr = dev_addr;
	i2cSeq.flags = I2C_FLAG_WRITE_READ;
	i2cSeq.buf[0].data = &reg_addr;
	i2cSeq.buf[0].len = 1;
	i2cSeq.buf[1].data = (uint8_t *)(data);
	i2cSeq.buf[1].len = len;
	ret = I2C_TransferInit(I2C0, &i2cSeq);
	while (ret == i2cTransferInProgress)
	{
		ret = I2C_Transfer(I2C0);
	}

	return ret;
}


/*
 * Helper function to check RC value and block programm exectution
 */
static void check_rc(int rc, const char * msg_context)
{
	if(rc < 0) {
		LOG_ERR("%s: error %d (%s)\n", msg_context, rc, inv_error_str(rc));
		while(1);
	}
}


