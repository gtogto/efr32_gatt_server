################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../platform/emdrv/sleep/src/sleep.c 

OBJS += \
./platform/emdrv/sleep/src/sleep.o 

C_DEPS += \
./platform/emdrv/sleep/src/sleep.d 


# Each subdirectory must supply rules for building sources it contributes
platform/emdrv/sleep/src/sleep.o: ../platform/emdrv/sleep/src/sleep.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emdrv/sleep/src/sleep.d" -MT"platform/emdrv/sleep/src/sleep.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


