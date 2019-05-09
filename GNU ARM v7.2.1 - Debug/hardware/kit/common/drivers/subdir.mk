################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hardware/kit/common/drivers/mx25flash_spi.c \
../hardware/kit/common/drivers/retargetio.c \
../hardware/kit/common/drivers/retargetserial.c 

OBJS += \
./hardware/kit/common/drivers/mx25flash_spi.o \
./hardware/kit/common/drivers/retargetio.o \
./hardware/kit/common/drivers/retargetserial.o 

C_DEPS += \
./hardware/kit/common/drivers/mx25flash_spi.d \
./hardware/kit/common/drivers/retargetio.d \
./hardware/kit/common/drivers/retargetserial.d 


# Each subdirectory must supply rules for building sources it contributes
hardware/kit/common/drivers/mx25flash_spi.o: ../hardware/kit/common/drivers/mx25flash_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/drivers/mx25flash_spi.d" -MT"hardware/kit/common/drivers/mx25flash_spi.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hardware/kit/common/drivers/retargetio.o: ../hardware/kit/common/drivers/retargetio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/drivers/retargetio.d" -MT"hardware/kit/common/drivers/retargetio.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hardware/kit/common/drivers/retargetserial.o: ../hardware/kit/common/drivers/retargetserial.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/drivers/retargetserial.d" -MT"hardware/kit/common/drivers/retargetserial.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


