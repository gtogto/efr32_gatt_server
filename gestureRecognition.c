#include "em_device.h"
#include "em_chip.h"
#include "em_usart.h"
#include "em_cmu.h"
#include "em_gpio.h"
#include "em_i2c.h"
#include "user_code.h"
#include <bg_types.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define WMA_FACTOR	3
//#undef WMA_FACTOR
#define WEIGHT	0.8
#undef WEIGHT
#define NORMALIZATION_FACTOR 32767

int16_t SENSOR [AXIS_NUM][SAMPLE_NUM];
#ifdef WMA_FACTOR
	#define WMA_SAMPLE_NUM	SAMPLE_NUM - WMA_FACTOR + 1
	int16_t WMA_SENSOR [AXIS_NUM][WMA_SAMPLE_NUM];
	int16_t WMA_temp [AXIS_NUM][WMA_SAMPLE_NUM];

#endif
#define CROSS_FACTOR	3
int8_t WEIGHTED_AXIS [AXIS_NUM];
#define NUM_OF_DB	16
#define ELE_OF_DB	2

enum sensors_	{
	ACC_X,
	ACC_Y,
	ACC_Z,

};
int biggestValue [NUM_OF_DB];

int corr_int [AXIS_NUM][AXIS_NUM];


///////////////////////////////////////////////////////////////////////
void deriveCorrelation ()	{
///////////////////////////////////////////////////////////////////////
// A factor: The array of sensor data
// Return: NULL
//////////////////////////////////////////////////////////////////////

	float cov [AXIS_NUM][AXIS_NUM];
	float corr [AXIS_NUM][AXIS_NUM];
	float average [] = {0,0,0};
	int nLoop, nLoop2, nLoop3;

	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		for (nLoop2 = 0; nLoop2 < SAMPLE_NUM; nLoop2 ++)	{
			average [nLoop] += SENSOR [nLoop][nLoop2];
		} //for nLoop2
		average [nLoop] /= SAMPLE_NUM;
	} //for nLoop



	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		for (nLoop2 = 0; nLoop2 < AXIS_NUM; nLoop2 ++)	{
			cov [nLoop][nLoop2] = corr [nLoop][nLoop2] = corr_int[nLoop][nLoop2] = 0;
			for (nLoop3 = 0; nLoop3 < SAMPLE_NUM; nLoop3 ++)	{
				cov [nLoop][nLoop2] += (SENSOR [nLoop][nLoop3] - average [nLoop]) * (SENSOR [nLoop2][nLoop3] - average [nLoop2]);
			} // for nLoop3
			cov [nLoop][nLoop2] /= SAMPLE_NUM;

		} // for nLoop2
	} //for nLoop


	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		for (nLoop2 = nLoop+1; nLoop2 < AXIS_NUM; nLoop2 ++)	{

			if (cov [nLoop][nLoop] * cov [nLoop2][nLoop2])
				corr [nLoop][nLoop2] = cov [nLoop][nLoop2] / sqrt (cov [nLoop][nLoop] * cov [nLoop2][nLoop2]);
			else
				corr [nLoop][nLoop2] = 0;

			if ((corr [nLoop][nLoop2] < 0.5) && (corr [nLoop][nLoop2] > -0.5))	{	//filtering
				corr [nLoop][nLoop2] = 0;
			} //if
			else	{
				corr_int [nLoop][nLoop2] = (int)(corr [nLoop][nLoop2] *100);
			}
		} //for nLoop2
	} //for nLoop

/*
	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		for (nLoop2 = 0; nLoop2 < AXIS_NUM; nLoop2 ++)	{
			printf ("%d\t", corr_int [nLoop][nLoop2] );
		}
		printf ("\n");
	}
	printf ("\n");

*/
} //function calculatCorrelation

//////////////////////////////////////////////////////////////////////
int compareSelfCorrleation (int db_id)	{
///////////////////////////////////////////////////////////////////////
// A factor: A DB id among 2, 3, 4, 5, 6, 7, 8, 9, 14, 15
// Return: detected DB id
//////////////////////////////////////////////////////////////////////

	int avg_gap [2] = {0,0};
	int result_ = 0;
	int nLoop, nLoop2, nLoop3;
	int filter_count = 0;
	float MIN = 10000.0;


	int total_db_count [2] = {22, 27};

	int db_corr [2][AXIS_NUM][AXIS_NUM] = {
			{		//for sensor1, CLOCK
					{0, 61, 00 },
					{00, 00, 04 },
					{00, 00, 00 },

				},

				{		//for sensor1, ANTI-CLOCK
					{00, 81, 59,  },
					{00, 00, -31,  },
					{00, 00, 00, },

				}
		};
	int db_count [2][AXIS_NUM][AXIS_NUM]= {
			{		//for sensor1, CLOCK
				{0, 3, 0, },
				{0, 0, 4, },
				{0, 0, 0, } ,

			},

			{		//for sensor1, ANTI-CLOCK
				{0, 18, 5 },
				{0, 0, 12 },
				{0, 0, 0 },

			},

	};

	for (nLoop = 0; nLoop < 2; nLoop ++)	{

		for (nLoop2 = 0; nLoop2 < AXIS_NUM; nLoop2 ++)	{
			for (nLoop3 = nLoop2 + 1; nLoop3 < AXIS_NUM; nLoop3 ++)	{

				if ((db_count [nLoop][nLoop2][nLoop3] * 5) >  total_db_count [nLoop])	{
					avg_gap [nLoop] += abs (corr_int [nLoop2][nLoop3] - db_corr [nLoop][nLoop2][nLoop3]);
					filter_count ++;
				}


			} //for nLoop3
		} //for nLoop2

		if (filter_count == 0)
			filter_count ++;


		avg_gap [nLoop] /= filter_count;

		filter_count = 0;

		if ((avg_gap [nLoop] != 0) && (MIN > avg_gap [nLoop]))	{
			MIN = avg_gap [nLoop];
		}

	} //for nLoop


	if (avg_gap [0] < avg_gap [1])	{
		result_ = (db_id % 2 == 1) ? (db_id - 1) : (db_id);		//CLOCK
	}
	else	{
		result_ = (db_id % 2 == 1) ? (db_id) : (db_id + 1);		//ANTI-CLOCK
	}

	printf ("<%d vs. %d> corr result is %d \n",  avg_gap[0],avg_gap[1], result_);

	return result_;
}


#ifdef WMA_FACTOR
void weightedMovingAverage (int16_t sensor [AXIS_NUM][SAMPLE_NUM])	{
	int nLoop, nLoop2, nLoop3;
	int16_t temp_avr;

	memset (WMA_SENSOR, '\0', sizeof(WMA_SENSOR));

	//printf ("<< WMA\n");
	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		for (nLoop2 = 0; nLoop2 < (SAMPLE_NUM - WMA_FACTOR + 1); nLoop2 ++)	{
			temp_avr = 0;
#ifndef WEIGHT
			for (nLoop3 = 0; nLoop3 < WMA_FACTOR; nLoop3 ++)	{
				temp_avr +=  SENSOR [nLoop][nLoop2 + nLoop3];
			}
			WMA_SENSOR [nLoop][nLoop2] = temp_avr / WMA_FACTOR;

#else
			for (nLoop3 = 0; nLoop3 < WMA_FACTOR-1; nLoop3 ++)	{
				temp_avr +=  SENSOR [nLoop][nLoop2 + nLoop3];
			}
			temp_avr *= (1-WEIGHT);
			temp_avr += (WEIGHT * SENSOR [nLoop][nLoop2 + nLoop3]);
			WMA_SENSOR [nLoop][nLoop2] = temp_avr;
#endif
		}
	}
}
#endif



void compareOtherCorrelation (int arrayLen, int flag_, float db_sample[ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM], float db_average[ELE_OF_DB][AXIS_NUM], float db_cov[ELE_OF_DB][AXIS_NUM])	{

	int16_t WMA_SENSOR_local [AXIS_NUM][WMA_SAMPLE_NUM];
	int nLoopLen = 0, nLoopStart = 0;//, db_start = 0, db_end = 0;
	float average [AXIS_NUM];
	int nLoop, nLoop2, nLoop3;
	float cov [ELE_OF_DB][AXIS_NUM];
	float cov_self [AXIS_NUM];
	float corr [ELE_OF_DB][AXIS_NUM];
	float corr_int_local [ELE_OF_DB][AXIS_NUM];

	memset (cov, '\0', sizeof(cov));
	memset (average, '\0', sizeof(average));
	memset (cov_self, '\0', sizeof(cov_self));
	memset (corr, '\0', sizeof(corr));
	memset (corr_int_local, '\0', sizeof (corr_int_local));


	memset (WMA_SENSOR_local, '\0', sizeof(WMA_SENSOR_local));
	if (flag_ < 1)	{
		nLoopLen = arrayLen;
		nLoopStart = 0;
		memcpy (WMA_SENSOR_local, WMA_temp, sizeof(WMA_SENSOR_local));
	}
	else	{
		nLoopLen = WMA_SAMPLE_NUM;
		nLoopStart = flag_;
		memcpy (WMA_SENSOR_local, WMA_SENSOR, sizeof(WMA_SENSOR_local));
	}


	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{	//average of incoming sensor value
		for (nLoop2 = 0; nLoop2 < nLoopLen ; nLoop2 ++)	{
			average [nLoop] += WMA_SENSOR_local [nLoop][nLoop2];
		} //for nLoop2

		average [nLoop] /= nLoopLen;

	} //for nLoop

	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		float temp_float=0;
		for (nLoop2 = nLoopStart; nLoop2 < nLoopLen; nLoop2 ++)	{ //covariance //분자계산
			temp_float = WMA_SENSOR_local [nLoop][nLoop2 - nLoopStart] - average [nLoop];

			for (nLoop3 = 0; nLoop3 < ELE_OF_DB; nLoop3 ++)
				cov [nLoop3][nLoop] += (temp_float * (db_sample [nLoop3][nLoop][nLoop2] - db_average [nLoop3][nLoop]));


			cov_self [nLoop] += (temp_float * temp_float);

		} //for nLoop2

		for (nLoop3 = 0; nLoop3 < ELE_OF_DB; nLoop3 ++)
			cov [nLoop3][nLoop] /= (nLoopLen - nLoopStart);

		cov_self [nLoop] /= (nLoopLen - nLoopStart);
	} // for nLoop

	int tempSUM [ELE_OF_DB];
	memset (tempSUM, 0, sizeof(tempSUM));

		for (nLoop = 0; nLoop <= 1; nLoop ++)	{	//correlation. //분모 계산


		for (nLoop2 = 0; nLoop2 < AXIS_NUM; nLoop2 ++)	{
			if (cov_self [nLoop2] * db_cov [nLoop][nLoop2])
				corr [nLoop][nLoop2] = cov [nLoop][nLoop2] / sqrt (cov_self [nLoop2] * db_cov [nLoop][nLoop2]);
			else
				corr [nLoop][nLoop2] = 0;

			corr_int_local [nLoop][nLoop2] = (int)(corr [nLoop][nLoop2] *100);

			tempSUM [nLoop] += ((int)(corr_int_local [nLoop][nLoop2] * WEIGHTED_AXIS [nLoop2]) / 100);

		} //for nLoop2

		if (tempSUM[nLoop] < 20)
			 tempSUM[nLoop] = 0;
		else
			tempSUM[nLoop] *= tempSUM[nLoop];
	} //for nLoop

	//------------------------------------------------ deviation --------------
		int gap_mean [NUM_OF_DB][AXIS_NUM];
		int gap_deviation [NUM_OF_DB][AXIS_NUM];
		memset (gap_mean, 0x0, sizeof(gap_mean));
		memset (gap_deviation, 0x0, sizeof(gap_deviation));


		int tempSUM_dev [NUM_OF_DB];
		memset (tempSUM_dev, 0, sizeof(tempSUM_dev));


		for (nLoop = 0; nLoop <= 1; nLoop ++)	{
			for (nLoop2 = 0; nLoop2 < AXIS_NUM; nLoop2 ++){
				for (nLoop3 = nLoopStart; nLoop3 < nLoopLen; nLoop3 ++){
					gap_mean [nLoop][nLoop2] += abs( (int)(db_sample [nLoop][nLoop2][nLoop3] * 1000) - (int) WMA_SENSOR_local[nLoop2][nLoop3]);
				}
				gap_mean [nLoop][nLoop2] /= nLoopLen;

				for (nLoop3 = nLoopStart; nLoop3 < nLoopLen; nLoop3 ++){
					gap_deviation [nLoop][nLoop2] += abs( (int)(db_sample [nLoop][nLoop2][nLoop3] * 1000) - (int)WMA_SENSOR_local[nLoop2][nLoop3] - (int)gap_mean [nLoop][nLoop2] );
				}

				gap_deviation [nLoop][nLoop2] /= nLoopLen;

				tempSUM_dev [nLoop] +=  gap_deviation [nLoop][nLoop2];
			}

		}


		int temp_int;
		for (nLoop = 0; nLoop <= 1; nLoop ++)	{
			if (tempSUM [nLoop] > 0)	{
				temp_int = (int)((tempSUM [nLoop] * 1000) / tempSUM_dev [nLoop]);

			}
			else	{
				temp_int = 0;
			}

			if (biggestValue [nLoop] < temp_int)
				biggestValue [nLoop] = temp_int;
		}

}


void normalizingFunction (int16_t sensor [AXIS_NUM][SAMPLE_NUM]){
	int nLoop, nLoop2;

	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		for (nLoop2 = 0; nLoop2 < SAMPLE_NUM; nLoop2 ++)	{
			SENSOR [nLoop][nLoop2] = (int)(((float)sensor [nLoop][nLoop2] / NORMALIZATION_FACTOR) * 1000);
		}
	}

}




int crossCorrelation (float db_sample[ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM], float db_average[ELE_OF_DB][AXIS_NUM], float db_cov[ELE_OF_DB][AXIS_NUM])	{

	int nLoop, nLoop2, max_ = 0, db_num = 0, result_ = 0;
	memset (WMA_temp, '\0', sizeof(WMA_SAMPLE_NUM));
	biggestValue [0] = biggestValue [1] = 0;


	for (nLoop = -CROSS_FACTOR; nLoop < 1; nLoop ++)	{
		for (nLoop2 = 0; nLoop2 < WMA_SAMPLE_NUM + nLoop ; nLoop2 ++)	{
			WMA_temp [0][nLoop2] = WMA_SENSOR [0][-nLoop+ nLoop2];
			WMA_temp [1][nLoop2] = WMA_SENSOR [1][-nLoop+ nLoop2];
			WMA_temp [2][nLoop2] = WMA_SENSOR [2][-nLoop+ nLoop2];
			WMA_temp [3][nLoop2] = WMA_SENSOR [3][-nLoop+ nLoop2];
			WMA_temp [4][nLoop2] = WMA_SENSOR [4][-nLoop+ nLoop2];
			WMA_temp [5][nLoop2] = WMA_SENSOR [5][-nLoop+ nLoop2];
		}
		compareOtherCorrelation (WMA_SAMPLE_NUM + nLoop, nLoop, db_sample, db_average, db_cov);
	}
	for (nLoop = 1; nLoop < CROSS_FACTOR; nLoop ++)	{
		compareOtherCorrelation (WMA_SAMPLE_NUM, nLoop, db_sample, db_average, db_cov);
	}

	for (nLoop = 0; nLoop < ELE_OF_DB; nLoop ++)	{
		printf ("%d ",  biggestValue [nLoop]);
		if (biggestValue [nLoop] > max_)	{
			max_ = biggestValue [nLoop];
			db_num = nLoop;
		}
	}


	result_ = biggestValue [0] > biggestValue [1] ? 0 : 1;
	return result_;

}



int assignDB_FRONT (void)	{
	int result_;
	printf ("\nassign DB Front\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{ //front
			{-0.0120 ,-0.0290 ,-0.0990 ,-0.0850 ,-0.0360 ,0.1230 ,0.1430 ,0.0860 ,0.0450 ,0.0780 ,0.1370 ,0.1210 ,0.0620 ,0.0290 ,0.0170 ,0.0140 ,0.0080 ,-0.0230 },
			{0.0300 ,0.0890 ,0.2420 ,0.3830 ,0.4060 ,0.2090 ,-0.1160 ,-0.3530 ,-0.3880 ,-0.2590 ,-0.1710 ,-0.1680 ,-0.1700 ,-0.0820 ,0.0090 ,0.0750 ,0.1080 ,0.1060},
			{0.5030 ,0.5110 ,0.4470 ,0.5130 ,0.4920 ,0.5650 ,0.4880 ,0.4540 ,0.4350 ,0.4370 ,0.4890 ,0.5240 ,0.4930 ,0.4720 ,0.4580 ,0.5010 ,0.5190 ,0.5060 }

		},
		{// back
			{0.0380 ,0.0650 ,0.0630 ,0.0790 ,0.0650 ,0.0470 ,0.0120 ,-0.0310 ,-0.0500 ,-0.0710 ,-0.0510 ,-0.0230 ,0.0050 ,0.0160 ,0.0200 ,0.0160 ,0.0130 ,0.0120},
			{-0.0240 ,-0.1110 ,-0.2300 ,-0.2890 ,-0.2000 ,0.0650 ,0.3430 ,0.4490 ,0.3320 ,0.1480 ,0.0450 ,0.0240 ,0.0220 ,0.0100 ,0.0020 ,0.0060 ,0.0140 ,0.0220 },
			{0.5120 ,0.5280 ,0.5080 ,0.5090 ,0.4570 ,0.4840 ,0.4780 ,0.4930 ,0.5150 ,0.5610 ,0.5720 ,0.5320 ,0.4950 ,0.5140 ,0.5220 ,0.5170 ,0.5090 ,0.5080 }

		}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
			{0.0322,-0.0028,0.4893},	//front
			{0.0125,0.0349,0.5119}	//back
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
			{0.00534, 0.05293, 0.00114},	//front
			{0.00191, 0.03687, 0.00073}	//back
	};


	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = BACK;
	else
		result_ = FRONT;

	return result_;
}

int assignDB_RIGHT (void)	{
	int result_;
	printf ("\nassign DB Right\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{ //right
			{0.0540 , 0.1750 , 0.3180 , 0.3830 , 0.2940 , 0.0710 , -0.1720 , -0.3040 , -0.2730 , -0.1470 , -0.0280 , 0.0250 , 0.0360 , 0.0400 , 0.0510 , 0.0640 , 0.0740 , 0.0780 },
			{-0.0150 , 0.0130 , 0.0270 , 0.0420 , -0.0120 , -0.0760 , -0.1430 , -0.1340 , -0.0760 , -0.0120 , 0.0320 , 0.0430 , 0.0330 , 0.0200 , 0.0220 , 0.0280 , 0.0380 , 0.0380 },
			{0.5100 , 0.5400 , 0.5730 , 0.5340 , 0.4940 , 0.4110 , 0.4790 , 0.5210 , 0.5850 , 0.5470 , 0.5180 , 0.4950 , 0.4940 , 0.5050 , 0.5150 , 0.5140 , 0.5060 , 0.5010}

		},
		{ //left
			{0.009000 , -0.090000 , -0.243000 , -0.299000 , -0.184000 , 0.047000 , 0.253000 , 0.367000 , 0.361000 , 0.250000 , 0.112000 , 0.031000 , 0.014000 , 0.012000 , 0.016000 , 0.021000 , 0.032000 , 0.037000},
			{0.002000 , 0.016000 , -0.046000 , -0.080000 , -0.091000 , -0.036000 , 0.022000 , 0.050000 , 0.056000 , 0.027000 , -0.024000 , -0.043000 , -0.040000 , -0.039000 , -0.032000 , -0.024000 , -0.022000 , -0.024000 },
			{0.510000 , 0.521000 , 0.567000 , 0.559000 , 0.526000 , 0.471000 , 0.436000 , 0.464000 , 0.486000 , 0.496000 , 0.505000 , 0.506000 , 0.535000 , 0.519000 , 0.500000 , 0.507000 , 0.515000 , 0.524000 }
		}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
			{0.0411, -0.0073, 0.5134},	//right
			{0.04144, -0.0182, 0.5082} 	//left
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
			{0.0343, 0.0036, 0.0014}, 	//right
			{0.03354, 0.0016, 0.0010} //left
	};


	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ =LEFT ;
	else
		result_ = RIGHT;
	return result_;
}

int assignDB_UP (void)	{
	int result_;
	printf ("\nassign DB UP\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
			{	//UP
				{0.0040 , 0.0110 , 0.0220 , 0.0280 , 0.0180 , -0.0080 , -0.0260 , -0.0310 , -0.0200 , -0.0100 , -0.0060 , -0.0080 , -0.0120 , -0.0140 , -0.0080 , 0.0010 , 0.0100 , 0.0140},
				{-0.0430 , -0.0610 , -0.0090 , -0.0230 , -0.0010 , -0.0740 , -0.0390 , 0.0110 , 0.0630 , 0.0740 , 0.0750 , 0.0720 , 0.0650 , 0.0580 , 0.0590 , 0.0620 , 0.0680 , 0.0700},
				{0.5120 , 0.5790 , 0.7410 , 0.8000 , 0.6800 , 0.3420 , 0.1240 , 0.0810 , 0.2040 , 0.3460 , 0.4540 , 0.5140 , 0.5540 , 0.5490 , 0.5430 , 0.5190 , 0.5150 , 0.5050},

			},
			{	//down
				{-0.0240 , -0.0470 , -0.0970 , -0.0870 , 0.0180 , 0.1270 , 0.1350 , 0.0690 , 0.0280 , 0.0160 , 0.0100 , 0.0000 , -0.0060 , 0.0000 , 0.0110 , 0.0200 , 0.0180 , 0.0120 },
				{0.0500 , 0.0210 , 0.0260 , -0.0430 , 0.0090 , 0.0010 , 0.0250 , -0.0260 , -0.0530 , -0.0290 , -0.0390 , -0.0400 , -0.0420 , -0.0420 , -0.0430 , -0.0430 , -0.0500 , -0.0420},
				{0.4500 , 0.2100 , -0.0560 , -0.0340 , 0.3720 , 0.8250 , 0.8800 , 0.7350 , 0.5840 , 0.5360 , 0.5120 , 0.4930 , 0.4930 , 0.4970 , 0.5140 , 0.5230 , 0.5180 , 0.4990}

			}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
			{-0.0019, 0.0237, 0.4757},	//up
			{0.0113, -0.0200, 0.4751} 	//down
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
			{0.0003, 0.0028, 0.0376}, 	//up
			{0.0035, 0.0011, 0.0589}	//down
	};


	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = DOWN;
	else
		result_ = UP;
	return result_;

}

int assignDB_CLOCK (void)	{
	int result_;
	printf ("\nassign DB Clk\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{ //CLOCK
			{0.0955 , 0.2635 , 0.3904 , 0.4570 , 0.4397 , 0.2961 , 0.0711 , -0.2096 , -0.4202 , -0.5015 , -0.3693 , -0.1749 , 0.0070 , 0.0755 , 0.0992 , 0.0825 , 0.0641 , 0.0245 },
			{-0.0409 , -0.0365 , -0.0492 , -0.0303 , -0.0183 , -0.0530 , -0.0996 , -0.1998 , -0.2290 , -0.2101 , -0.1068 , -0.0007 , 0.0223 , 0.0035 , -0.0563 , -0.0780 , -0.0772 , -0.0604 },
			{0.9343 , 0.8526 , 0.6681 , 0.3260 , 0.1101 , -0.0960 , -0.1095 , -0.0322 , 0.2818 , 0.5574 , 0.7934 , 0.8148 , 0.8499 , 0.7628 , 0.7038 , 0.6051 , 0.5729 , 0.5071 }

		},
		{ //ANTI-CLOCK
			{0.1536 , -0.2041 , -0.3660 , -0.3371 , -0.2394 , -0.1310 , -0.0166 , 0.0971 , 0.1728 , 0.2668 , 0.3068 , 0.2842 , 0.1848 , 0.0856 , 0.0062 , -0.0730 , -0.1335 , -0.1470 },
			{-0.1114 , -0.3936 , -0.4661 , -0.4337 , -0.2992 , -0.1715 , -0.0327 , 0.0819 , 0.1073 , 0.0832 , 0.0411 , 0.0020 , -0.0990 , -0.1627 , -0.1772 , -0.1342 , -0.1240 , -0.1206 },
			{0.8617 , 0.9261 , 0.8838 , 0.6318 , 0.3124 , 0.0442 , -0.0956 , -0.1198 , 0.0114 , 0.2855 , 0.5566 , 0.7435 , 0.7857 , 0.7948 , 0.7607 , 0.6815 , 0.5950 , 0.5346 }

		},
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
			{0.0384, -0.0733, 0.5057}, //clock
			{-0.0050, -0.1339, 0.5108} //ANTI-clock
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
			{0.0759, 0.0050, 0.1121},	//CLOCK
			{0.0421, 0.0285, 0.1158}	//ANTI-CLOCK
	};


	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = ANTI_CLOCK;
	else
		result_ = CLOCK;
	return result_;

}

int assignDB_LOW (void)	{
	int result_;
	printf ("\nassign DB Low\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{ //LOW CLOCK
			{0.3006 , 0.3424 , 0.3616 , 0.3218 , 0.2365 , 0.1268 , 0.0348 , -0.0595 , -0.1366 , -0.2006 , -0.2176 , -0.1927 , -0.1407 , -0.0507 , 0.0183 , 0.0903 , 0.0999 , 0.0949 },
			{0.1700 , 0.1202 , -0.0088 , -0.1808 , -0.2990 , -0.3368 , -0.2961 , -0.2510 , -0.1992 , -0.1522 , -0.0834 , -0.0190 , 0.0253 , 0.0719 , 0.0642 , 0.0596 , 0.0109 , -0.0116},
			{0.5936 , 0.5105 , 0.4762 , 0.4848 , 0.4739 , 0.4619 , 0.4485 , 0.4307 , 0.4674 , 0.5326 , 0.6218 , 0.6579 , 0.6215 , 0.5714 , 0.5328 , 0.5451 , 0.5481 , 0.5459}

		},
		{ //LOW ANTI
			{0.1573 , 0.0709 , -0.0684 , -0.1793 , -0.2324 , -0.2304 , -0.1262 , 0.0454 , 0.2397 , 0.3674 , 0.4178 , 0.4139 , 0.3993 , 0.3387 , 0.2261 , 0.0797 , -0.0449 , -0.0944 },
			{0.1311 , 0.1593 , 0.0867 , -0.0606 , -0.2740 , -0.4536 , -0.5189 , -0.4771 , -0.3686 , -0.2549 , -0.1614 , -0.0310 , 0.0442 , 0.1334 , 0.1017 , 0.0703 , -0.0309 , -0.0758},
			{0.5781 , 0.6344 , 0.6500 , 0.7000 , 0.5991 , 0.5298 , 0.3672 , 0.3612 , 0.3605 , 0.3965 , 0.4605 , 0.5343 , 0.5890 , 0.6164 , 0.6203 , 0.6092 , 0.5857 , 0.5742 }

		},
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
			{0.0572, -0.0731, 0.5291}, //LOW CLOCK
			{0.0989, -0.1100, 0.5426} //LOW ANTI
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
			{0.0363, 0.0232, 0.0041},	//LOW CLOCK
			{0.0498, 0.0491, 0.0108}	//LOW ANTI
	};


	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = LOW_ANTI;
	else
		result_ = LOW_CLOCK;
	return result_;


}

int assignDB_SIDE ()	{

	int result_;
	printf ("\nassign DB Side\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{	//SIDE-CLK
			{0.0110 , 0.0720 , 0.1490 , 0.1750 , 0.1200 , 0.0560 , 0.0450 , 0.1130 , 0.1660 , 0.1770 , 0.1330 , 0.1240 , 0.1910 , 0.2280 , 0.2730 , 0.2270 , 0.1580 , 0.0660 },
			{0.0520 , 0.0350 , -0.1210 , -0.3610 , -0.5450 , -0.5440 , -0.3260 , 0.0290 , 0.3610 , 0.5520 , 0.4910 , 0.3100 , 0.1120 , -0.0080 , -0.0760 , -0.2050 , -0.3110 , -0.3360 },
			{0.4590 , 0.6430 , 0.8420 , 0.9320 , 0.6840 , 0.3330 , -0.0450 , -0.1830 , -0.2640 , -0.1010 , 0.1440 , 0.5300 , 0.8140 , 0.9220 , 0.8160 , 0.6400 , 0.4800 , 0.4310 }

		},
		{	//SIDE-ANTI
			{0.0110 , 0.0100 , 0.0210 , 0.0520 , 0.1120 , 0.1620 , 0.1790 , 0.1020 , -0.0460 , -0.1480 , -0.1840 , -0.1070 , -0.0430 , 0.0100 , 0.0450 , 0.0860 , 0.1370 , 0.1500 },
			{-0.0190 , -0.0400 , -0.1110 , -0.2290 , -0.3390 , -0.3480 , -0.2930 , -0.1610 , -0.0380 , 0.2160 , 0.4010 , 0.5070 , 0.3370 , 0.0480 , -0.2390 , -0.4040 , -0.4230 , -0.3330 },
			{0.4810 , 0.4110 , 0.3430 , 0.3240 , 0.4810 , 0.6930 , 0.9020 , 0.8350 , 0.7220 , 0.4140 , 0.3500 , 0.1240 , 0.0780 , -0.0810 , 0.0350 , 0.1930 , 0.4090 , 0.5430 }
		}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
			{0.1380, -0.0495, 0.4487},	//side-clk
			{0.0305, -0.0816, 0.4032} 	//side-anti
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
			{0.00490, 0.10865, 0.1516},	//side-clk
			{0.01116, 0.08157, 0.07431}	//side-anti

	};

	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = SIDE_ANTI;
	else
		result_ = SIDE_CLOCK;

	return result_;
}




int assignDB_FRONT_RL ()	{

	int result_;
	printf ("\nassign DB FRONT-RightLeft\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{	//FRONT-RIGHT
			{-0.001, -0.03, -0.016, 0.01, 0.112, 0.035, 0.061, 0.154, 0.463, 0.606, 0.414, -0.044, -0.423, -0.468, -0.259, -0.072, 0.023, 0.05},
			{-0.023, 0.055, 0.218, 0.259, -0.019, -0.376, -0.498, -0.302, -0.029, 0.087, -0.035, -0.27, -0.352, -0.231, -0.02, 0.03, 0.057, 0.019},
			{0.461, 0.499, 0.531, 0.529, 0.504, 0.479, 0.499, 0.506, 0.536, 0.51, 0.461, 0.499, 0.531, 0.529, 0.504, 0.479, 0.499, 0.506}
		},
		{	//FRONT-LEFT
			{-0.033, -0.049, -0.047, 0.008, 0.131, 0.073, 0.03, -0.119, -0.245, -0.437, -0.29, 0.123, 0.467, 0.438, 0.24, 0.092, 0.021, -0.004},
			{-0.024, 0.053, 0.224, 0.398, 0.255, -0.211, -0.475, -0.431, -0.236, -0.28, -0.208, -0.081, 0.077, 0.011, -0.03, -0.079, -0.085, -0.074},
			{0.509, 0.534, 0.698, 0.721, 0.621, 0.359, 0.365, 0.439, 0.583, 0.553, 0.494, 0.41, 0.425, 0.479, 0.52, 0.532, 0.547, 0.548}

		}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
			{0.0342, -0.0794, 0.5034},	//FRONT-RIGHT
			{0.0222, -0.0664, 0.5187}  	//FRONT-LEFT
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
			{0.073508, 0.04413, 0.00051},	//FRONT-RIGHT
			{0.050656, 0.05078, 0.00996}	//FRONT-LEFT
	};

	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = SIDE_ANTI;
	else
		result_ = SIDE_CLOCK;

	return result_;
}





int assignDB_BACK_RL ()	{

	int result_;
	printf ("\nassign DB BACK-RightLeft\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{	//BACK-RIGHT
			{-0.016, 0.029, 0.065, 0.011, 0.048, 0.112, 0.277, 0.349, 0.441, 0.403, 0.087, -0.275, -0.428, -0.244, 0.008, 0.11, 0.11, 0.075},
			{0.008, -0.233, -0.462, -0.389, -0.115, 0.236, 0.291, 0.238, 0.06, -0.052, -0.163, -0.267, -0.216, -0.1, 0.037, 0, -0.011, -0.037},
			{0.477, 0.513, 0.574, 0.518, 0.618, 0.632, 0.661, 0.389, 0.37, 0.358, 0.529, 0.537, 0.654, 0.628, 0.563, 0.502, 0.486, 0.5}

		},
		{	//BACK-LEFT
			{0.064, 0.07, 0.057, 0.052, 0.061, 0.076, 0.059, 0.025, -0.086, -0.265, -0.379, -0.238, 0.034, 0.271, 0.312, 0.266, 0.164, 0.077},
			{-0.081, -0.164, -0.272, -0.369, -0.344, -0.136, 0.14, 0.388, 0.413, 0.296, -0.026, -0.202, -0.231, -0.117, -0.088, -0.086, -0.078, -0.069},
			{0.509, 0.506, 0.482, 0.5, 0.478, 0.522, 0.497, 0.556, 0.523, 0.517, 0.5, 0.569, 0.48, 0.494, 0.412, 0.509, 0.47, 0.493}

		}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
		{0.0646, -0.0653, 0.5283}, //BACK-RIGHT
		{0.0344, -0.0570, 0.5009},  //BACK-LEFT
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
		{0.050382, 0.042138, 0.008543},	//BACK-RIGHT
		{0.032978, 0.052047, 0.001137}//BACK-LEFT
	};

	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = SIDE_ANTI;
	else
		result_ = SIDE_CLOCK;

	return result_;
}




int assignDB_RIGHT_FB ()	{

	int result_;
	printf ("\nassign DB RIGHT-frontBack\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{
			{0.035, 0.244, 0.425, 0.387, 0.016, -0.348, -0.447, -0.312, -0.133, 0.012, 0.102, 0.11, 0.083, 0.051, 0.068, 0.057, 0.041, 0.019},
			{-0.071, -0.023, 0.003, 0.002, -0.098, -0.158, -0.067, 0.121, 0.285, 0.254, 0.014, -0.286, -0.398, -0.324, -0.162, -0.098, -0.07, -0.07},
			{0.53, 0.541, 0.515, 0.508, 0.487, 0.551, 0.638, 0.687, 0.616, 0.54, 0.416, 0.36, 0.38, 0.432, 0.507, 0.493, 0.515, 0.528}

		},
		{
			{0.053, 0.168, 0.353, 0.446, 0.245, -0.164, -0.457, -0.397, -0.147, 0.046, 0.112, 0.107, 0.122, 0.097, 0.069, 0.009, -0.001, 0.007},
			{-0.005, -0.022, 0.024, 0.085, 0.025, -0.108, -0.259, -0.326, -0.396, -0.389, -0.177, 0.115, 0.384, 0.373, 0.233, 0.02, -0.052, -0.064},
			{0.523, 0.525, 0.546, 0.539, 0.546, 0.471, 0.442, 0.411, 0.457, 0.456, 0.523, 0.521, 0.568, 0.544, 0.574, 0.551, 0.519, 0.503}

		}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
		{0.0228, -0.0637, 0.5136}, //RIGHT-front
		{0.0371, -0.0299, 0.5122} 	//RIGHT-back
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
		{0.050592418, 0.030769412, 0.006952261},	//RIGHT-front
		{0.050591163, 0.051681232, 0.002125324}	//RIGHT-back
	};

	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = RIGHT_F;
	else
		result_ = RIGHT_B;

	return result_;
}





int assignDB_LEFT_FB ()	{

	int result_;
	printf ("\nassign DB RIGHT-frontBack\n");

	float db_sample [ELE_OF_DB][AXIS_NUM][WMA_SAMPLE_NUM] = {
		{
			{-0.042, -0.232, -0.463, -0.451, -0.108, 0.362, 0.532, 0.359, 0.136, 0.074, 0.123, 0.027, 0.011, 0, 0.083, 0.034, 0.033, 0.031},
			{0.021, 0.005, -0.092, -0.234, -0.229, -0.115, 0.013, 0.121, 0.235, 0.193, -0.064, -0.393, -0.36, -0.254, -0.084, -0.129, -0.083, -0.081},
			{0.511, 0.457, 0.39, 0.456, 0.467, 0.62, 0.579, 0.67, 0.692, 0.665, 0.493, 0.315, 0.435, 0.479, 0.521, 0.4, 0.49, 0.519}

		},
		{
			{-0.032, -0.108, -0.303, -0.415, -0.231, 0.111, 0.384, 0.338, 0.212, 0.097, 0.037, 0.003, -0.047, -0.034, -0.023, -0.016, -0.049, -0.048},
			{-0.022, 0.01, -0.043, -0.14, -0.128, -0.061, 0.049, -0.016, -0.114, -0.234, -0.325, -0.223, -0.029, 0.228, 0.291, 0.211, 0.062, -0.014},
			{0.512, 0.502, 0.521, 0.568, 0.571, 0.515, 0.502, 0.488, 0.535, 0.514, 0.521, 0.485, 0.509, 0.455, 0.49, 0.477, 0.549, 0.55}

		}
	};
	float db_average [ELE_OF_DB][AXIS_NUM] = {
		{0.0283, -0.0850, 0.5088},
		{-0.0069, -0.0277, 0.5147}
	};

	float db_cov [ELE_OF_DB][AXIS_NUM] = {
		{0.062566, 0.029200, 0.010539},
		{0.039284, 0.025894, 0.000969}
	};

	if (result_ = crossCorrelation(db_sample, db_average, db_cov))
		result_ = LEFT_F;
	else
		result_ = LEFT_B;

	return result_;
}










unsigned char gestureRecognition (int16_t sensor [AXIS_NUM][SAMPLE_NUM])	{


	int min_ [AXIS_NUM] = {10000,10000,30000};
	int max_ [AXIS_NUM] = {-10000, -10000,-1000};

	int gaps [AXIS_NUM] = {0,0,0};
	int maxFlag [AXIS_NUM] = {0,0,0};	//# of sample upto 32
	int minFlag [AXIS_NUM] = {0,0,0};	//# of sample upto 32
	uint8_t Motionflag_ = 0;
	int nLoop, nLoop2;
	int result_ = 0 ;

	memset (biggestValue, 0, sizeof (biggestValue));
	memset (WEIGHTED_AXIS, 2, sizeof (WEIGHTED_AXIS));

	normalizingFunction (sensor);


#ifdef WMA_FACTOR
	weightedMovingAverage (sensor);
#endif

/*
	//	printf ("<INPUT>\n");
	for (nLoop = 0; nLoop < AXIS_NUM; nLoop ++)	{
		for (nLoop2 = 0; nLoop2 < WMA_SAMPLE_NUM; nLoop2 ++)	{
			printf ("%d\t", WMA_SENSOR [nLoop][nLoop2] );
		}
		printf ("\n");
	}
	printf ("\n");

*/

	char temp_flag = 0;
	for (nLoop = ACC_X; nLoop <= ACC_Z; nLoop++ )	{

		for (nLoop2 = 0; nLoop2 < WMA_SAMPLE_NUM; nLoop2 ++)	{

			if (min_[nLoop] > WMA_SENSOR [nLoop][nLoop2])	{
				min_[nLoop] = WMA_SENSOR [nLoop][nLoop2];
				minFlag [nLoop] |= 0x1;
			} else if (max_[nLoop] < WMA_SENSOR [nLoop][nLoop2])	{
				max_[nLoop] = WMA_SENSOR [nLoop][nLoop2];
				maxFlag [nLoop] |= 0x1;
			}
			minFlag[nLoop] = minFlag[nLoop] << 1;
			maxFlag[nLoop] = maxFlag[nLoop] << 1;

		}

		gaps [nLoop] = max_ [nLoop] - min_ [nLoop];

		if (gaps [nLoop] > 100)	{
			Motionflag_ |= 0x1;
			temp_flag ++;
			WEIGHTED_AXIS [nLoop] = 90;
		}
		Motionflag_ = Motionflag_ << 1;

	} //for


	for (nLoop = ACC_X; nLoop <= ACC_Z; nLoop++ )	{
		WEIGHTED_AXIS [nLoop] /= temp_flag;
	}


	if (!Motionflag_ )	{
		result_ = NONE;
	}
	else {
		int temp_result [NUM_OF_DB], max=0;
		memset (temp_result, 0, sizeof(temp_result));

		switch (Motionflag_ & 0x0E)	{
		case 0x4:	//FRONT
			result_ = FRONT;
			result_ = assignDB_FRONT ();
			break;
		case 0x8:		//SIDE
			result_ = RIGHT;
			result_ = assignDB_RIGHT ();
			break;
		case 0x2:	//UP
			result_ = UP;
			result_ = assignDB_UP ();
			break;
/*		case 0xA:
			result_ = CLOCK;
			deriveCorrelation ();
			result_ = compareSelfCorrleation (CLOCK);
//			result_ = assignDB_CLOCK ();
			break;
		case 0xC:
			result_ = LOW_CLOCK;
			deriveCorrelation ();
			result_ = compareSelfCorrleation (LOW_CLOCK);
			break;
		case 0x60:
			result_ = SIDE_CLOCK;
			deriveCorrelation ();
			result_ = compareSelfCorrleation (SIDE_CLOCK);
//			result_ = assignDB_SIDE ();

			break;
	*/	default:
/*
			temp_result [0] = assignDB_CLOCK ();
			biggestValue [CLOCK] = biggestValue [0];
			biggestValue [ANTI_CLOCK] = biggestValue [1];

			temp_result [1] = assignDB_LOW ();
			biggestValue [LOW_CLOCK] = biggestValue [0];
			biggestValue [LOW_ANTI] = biggestValue [1];

			temp_result [2] = assignDB_SIDE ();
			biggestValue [SIDE_CLOCK] = biggestValue [0];
			biggestValue [SIDE_ANTI] = biggestValue [1];


			for (nLoop = 0; nLoop < 3; nLoop ++)	{
				if (max < biggestValue [temp_result[nLoop]])	{
					max = biggestValue [temp_result[nLoop]];
					result_ = temp_result[nLoop];
				}
			}
*/
			result_ = CLOCK;
			deriveCorrelation ();
			result_ = compareSelfCorrleation (CLOCK);

			break;

		} //switch
	}	//else




	printf ("WEIGHTED: <");
	for (nLoop = ACC_X; nLoop <= ACC_Z; nLoop++ )	{
		printf ("%d,", WEIGHTED_AXIS [nLoop]);
	}
	printf (">\n");




	return result_;

}



