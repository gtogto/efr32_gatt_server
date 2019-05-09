/*
 * ________________________________________________________________________________________________________
 * Copyright (c) 2015-2015 InvenSense Inc. All rights reserved.
 *
 * This software, related documentation and any modifications thereto (collectively �쏶oftware��) is subject
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

#include "Icm20602Setup.h"
#include "Icm20602Defs.h"
#include "Icm20602.h"

#include "DataConverter.h"

static int serif_write(struct inv_icm20602 * s, uint16_t reg, uint32_t length, const uint8_t *data)
{
	return inv_icm20602_write_reg(s, (uint8_t)reg, data, length);
}

static int serif_read(struct inv_icm20602 * s, uint16_t reg, uint32_t length, uint8_t *data)
{
	return inv_icm20602_read_reg(s, (uint8_t)reg, data, length);
}

int inv_icm20602_get_whoami(struct inv_icm20602 * s, uint8_t * whoami)
{
	return inv_icm20602_read_reg_one(s, REG_WHO_AM_I, whoami);
}

int inv_icm20602_get_chip_info(struct inv_icm20602 * s, uint8_t chip_info[3])
{
	int result = inv_icm20602_read_reg_one(s, REG_WHO_AM_I, &chip_info[0]);

#if ((MEMS_CHIP == HW_ICM20602)||(MEMS_CHIP == HW_ICM20603))
	result |= inv_icm20602_read_reg_one(s, MPUREG_MANUFACTURER_ID, &chip_info[1]);
	result |= inv_icm20602_read_reg_one(s, MPUREG_CHIP_ID, &chip_info[2]);
#else
	chip_info[1] = 0;
	chip_info[2] = 0;
#endif

	return result;
}

int inv_icm20602_initialize(struct inv_icm20602 * s)
{
	int result = 0;
	uint8_t data = 0;
	unsigned i;

	// Set varialbes to default values
	memset(&s->base_state, 0, sizeof(s->base_state));

	s->base_state.lp_en_support = 1;
	s->base_state.pwr_mgmt_2 = BIT_PWR_ACCEL_STBY | BIT_PWR_GYRO_STBY;
	s->power_state = PowerStateSleepState;
	s->wom_enabled = 0;

	for(i = 0; i < sizeof(s->requested_odr)/sizeof(s->requested_odr[0]); ++i) {
		s->requested_odr[i] = ODR_MIN_DELAY;
	}

	result |= inv_icm20602_soft_reset(s);

	s->base_state.pwr_mgmt_1 = CLK_SEL;
	result |= serif_write(s, MPUREG_PWR_MGMT_1, 1, &s->base_state.pwr_mgmt_1);

#if ((MEMS_CHIP == HW_ICM6800)||(MEMS_CHIP == HW_ICM20789)||(MEMS_CHIP == HW_ICM20609))
	if(s->serif.is_spi) {
		s->base_state.user_ctrl |= BIT_I2C_IF_DIS;
	}
	result |= inv_icm20602_mems_write_reg(s, REG_USER_CTRL, 1, &s->base_state.user_ctrl);
#endif

	result |= serif_write(s, MPUREG_PWR_MGMT_2, 1, &s->base_state.pwr_mgmt_2);

	result |= inv_icm20602_mems_read_reg(s, REG_WHO_AM_I, 1, &data);

	// Setup MEMs properties.
	s->base_state.accel_averaging = 1; //Change this value if higher sensor sample avergaing is required.
	s->base_state.gyro_averaging = 1;  //Change this value if higher sensor sample avergaing is required.
	inv_icm20602_set_divider(s, FIFO_DIVIDER);       //Initial sampling rate BASE_SAMPLE_RATE/(9+1) = 100Hz for 1000Hz
	result |= inv_icm20602_set_gyro_fullscale(s, MPU_FS_2000dps);
	result |= inv_icm20602_set_accel_fullscale(s, MPU_FS_4G);
#if (MEMS_CHIP == HW_ICM20690)
	result |= inv_icm20602_set_gyro_ois_fullscale(s, MPU_FS_250dps);
	result |= inv_icm20602_set_accel_ois_fullscale(s, MPU_OIS_FS_4G);
#endif
	// set acc bw at 420 to be inline with A_DPLPF_CFG startup value
	result |= inv_icm20602_set_accel_bandwidth(s, MPU_ABW_420);
	// set gyr bw at 176 to be inline with first config
	result |= inv_icm20602_set_gyro_bandwidth(s, MPU_GBW_176);

#if ((MEMS_CHIP == HW_ICM20602)||(MEMS_CHIP == HW_ICM20690)||(MEMS_CHIP == HW_ICM20603)||(MEMS_CHIP == HW_ICM20789)||(MEMS_CHIP == HW_ICM20609))
	/* make sure FIFO is disabled */
	result |= inv_icm20602_disable_fifo(s);

	// For ICM20602, FIFO size is fixed 1kB
#if ((MEMS_CHIP == HW_ICM20690)||(MEMS_CHIP == HW_ICM20789)||(MEMS_CHIP == HW_ICM20609))
	data = BITS_FIFO_SIZE; // 1kB FIFO for 20690, 4kB for 20789 and 20609
	result |= inv_icm20602_mems_write_reg(s, MPUREG_ACCEL_CONFIG_2, 1, &data);
#endif

	/* Configure:
	  - FIFO record mode i.e FIFO count unit is packet 
	  - FIFO snapshot mode i.e drop the data when the FIFO overflows */
	data = BIT_FIFO_RECORD_MODE | BIT_FIFO_SNAPSHOT_MODE; 
	result |= inv_icm20602_mems_write_reg(s, MPUREG_CONFIG, 1, &data);
	
	/* initialize aux i2c and compass */
	if(s->secondary_state.compass_id != 0) {
		inv_icm20602_set_slave_compass_id(s);
	}
#endif

	// Enable Interrupts.
	data = BIT_DATA_RDY_INT_EN;
	result |= inv_icm20602_mems_write_reg(s, MPUREG_INT_ENABLE, 1, &data); // Enable DRDY Interrupt

	return result;
}

int inv_icm20602_soft_reset(struct inv_icm20602 * s)
{
	int result = 0;
	int timeout = 1000; /* 1s */

	// Reset the internal registers and restores the default settings.
	// The bit automatically clears to 0 once the reset is done.
	s->base_state.pwr_mgmt_1 = BIT_DEVICE_RESET;
	result |= serif_write(s, MPUREG_PWR_MGMT_1, 1, &s->base_state.pwr_mgmt_1);
	if(result)
		return result;

	inv_icm20602_sleep(50); // wait for 50ms after soft reset

	do {
		result = serif_read(s, MPUREG_PWR_MGMT_1, 1, &s->base_state.pwr_mgmt_1);
		if(result)
			return result;

		inv_icm20602_sleep(1);
		timeout -= 1;

		if(timeout < 0)
			return INV_ERROR_TIMEOUT;
	} while (s->base_state.pwr_mgmt_1 != RST_VAL_PWR_MGMT_1); // this is the default expected value

	return 0;
}

int inv_icm20602_set_divider(struct inv_icm20602 * s, uint8_t idiv)
{
	int result = 0;

	s->base_state.gyro_div = idiv;
	s->base_state.accel_div = idiv;
	s->base_state.compass_div = idiv;

	result |= inv_icm20602_mems_write_reg(s, MPUREG_SMPLRT_DIV, 1, &idiv);
	return result;
}

int inv_icm20602_set_i2c_mst_dly(struct inv_icm20602 * s, uint16_t minDly, uint16_t minDly_compass)
{
	int result = 0;
	unsigned char delay_ctrl = 0;
	unsigned char mst_delay = 0;

	(void)s, (void)mst_delay, (void)delay_ctrl, (void)minDly, (void)minDly_compass;

	return result;
}

/** @brief     This function sets the power state of the Scorption+ chip loop
 *  @param[in] func   CHIP_AWAKE, CHIP_LP_ENABLE
 *  @param[in] on_off The functions are enabled if previously disabled and
 *                    disabled if previously enabled based on the value of On/Off.
 */
int inv_icm20602_set_chip_power_state(struct inv_icm20602 * s, uint8_t func, uint8_t on_off)
{
	int status = 0;

	switch(func) {
	case CHIP_AWAKE:
	{
		if(on_off) {
			if((s->base_state.wake_state & CHIP_AWAKE) == 0) {
				s->base_state.pwr_mgmt_1 &= ~BIT_SLEEP; // clear sleep bit
				status = serif_write(s, MPUREG_PWR_MGMT_1, 1, &s->base_state.pwr_mgmt_1);
				s->base_state.wake_state |= CHIP_AWAKE;
				inv_icm20602_sleep_us(100); // after writting the bit wait 100 Micro Seconds
			}
		}
		else {
			if(s->base_state.wake_state & CHIP_AWAKE) {
				s->base_state.pwr_mgmt_1 |= BIT_SLEEP; // set sleep bit
				status = serif_write(s, MPUREG_PWR_MGMT_1, 1, &s->base_state.pwr_mgmt_1);
				s->base_state.wake_state &= ~CHIP_AWAKE;
				inv_icm20602_sleep_us(100); // after writting the bit wait 100 Micro Seconds
			}
		}
	}
	break;

	default:
		break;
	} // end switch

	return status;
}

uint8_t inv_icm20602_get_chip_power_state(struct inv_icm20602 * s)
{
	return s->base_state.wake_state;
}

uint16_t inv_icm20602_get_chip_base_sample_rate(struct inv_icm20602 * s)
{
	(void)s;

	return BASE_SAMPLE_RATE; // base_state.sample_rate;
}

int inv_icm20602_accel_fsr_2_reg(int32_t fsr)
{
	switch(fsr) {
	case 2000:  return MPU_FS_2G;
	case 4000:  return MPU_FS_4G;
	case 8000:  return MPU_FS_8G;
	case 16000: return MPU_FS_16G;
	default:    return NUM_MPU_AFS;
	}
}

int inv_icm20602_reg_2_accel_fsr(uint8_t reg)
{
	switch(reg) {
	case MPU_FS_2G:   return 2000;
	case MPU_FS_4G:   return 4000;
	case MPU_FS_8G:   return 8000;
	case MPU_FS_16G:  return 16000;
	default:          return -1;
	}
}

int inv_icm20602_set_accel_fullscale(struct inv_icm20602 * s, int level)
{
	if(level >= NUM_MPU_AFS)
		return INV_ERROR_BAD_ARG;

	s->base_state.accel_fullscale = level;
	return 0;
}

int inv_icm20602_set_accel_ois_fullscale(struct inv_icm20602 * s, int level)
{
	if(level >= NUM_MPU_AFS)
		return INV_ERROR_BAD_ARG;

	s->base_state.accel_ois_fullscale = level;
	return 0;
}

int inv_icm20602_set_accel_bandwidth(struct inv_icm20602 * s, int level)
{
	if(level >= NUM_MPU_ABW)
		return INV_ERROR_BAD_ARG;

	s->base_state.accel_bw = level;
	return 0;
}

uint8_t inv_icm20602_get_accel_fullscale(struct inv_icm20602 * s)
{
	return s->base_state.accel_fullscale;
}

uint8_t inv_icm20602_get_accel_ois_fullscale(struct inv_icm20602 * s)
{
	return s->base_state.accel_ois_fullscale;
}

uint16_t inv_icm20602_get_accel_bandwidth(struct inv_icm20602 * s)
{
	return s->base_state.accel_bw;
}

int inv_icm20602_gyro_fsr_2_reg(int32_t fsr)
{
	switch(fsr) {
	case 250:  return MPU_FS_250dps;
	case 500:  return MPU_FS_500dps;
	case 1000: return MPU_FS_1000dps;
	case 2000: return MPU_FS_2000dps;
	default:   return NUM_MPU_GFS;
	}
}

int inv_icm20602_reg_2_gyro_fsr(uint8_t reg)
{
	switch(reg) {
	case MPU_FS_250dps:  return 250;
	case MPU_FS_500dps:  return 500;
	case MPU_FS_1000dps: return 1000;
	case MPU_FS_2000dps: return 2000;
	default:             return -1;
	}
}

int inv_icm20602_set_gyro_fullscale(struct inv_icm20602 * s, int level)
{
	if(level >= NUM_MPU_GFS)
		return INV_ERROR_BAD_ARG;

	s->base_state.gyro_fullscale = level;
	return 0;
}

int inv_icm20602_set_gyro_ois_fullscale(struct inv_icm20602 * s, int level)
{
	if(level >= NUM_MPU_GFS)
		return INV_ERROR_BAD_ARG;

	s->base_state.gyro_ois_fullscale = level;
	return 0;
}

int inv_icm20602_set_gyro_bandwidth(struct inv_icm20602 * s, int level)
{
	if(level >= NUM_MPU_GBW)
		return INV_ERROR_BAD_ARG;

	s->base_state.gyro_bw = level;

	return 0;
}

uint8_t inv_icm20602_get_gyro_fullscale(struct inv_icm20602 * s)
{
	return s->base_state.gyro_fullscale;
}

uint8_t inv_icm20602_get_gyro_ois_fullscale(struct inv_icm20602 * s)
{
	return s->base_state.gyro_ois_fullscale;
}

uint16_t inv_icm20602_get_gyro_bandwidth(struct inv_icm20602 * s)
{
	return s->base_state.gyro_bw;
}

int inv_icm20602_is_advanced_features_supported(void)
{
	return 0;
}

int inv_icm20602_set_fsync_bit_location(struct inv_icm20602 * s, int bit_location)
{
	int result = 0;
	(void)s, (void)bit_location;

	return result;
}
