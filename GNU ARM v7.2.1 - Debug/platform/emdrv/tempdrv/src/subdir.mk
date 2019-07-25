################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../platform/emdrv/tempdrv/src/tempdrv.c 

OBJS += \
./platform/emdrv/tempdrv/src/tempdrv.o 

C_DEPS += \
./platform/emdrv/tempdrv/src/tempdrv.d 


# Each subdirectory must supply rules for building sources it contributes
platform/emdrv/tempdrv/src/tempdrv.o: ../platform/emdrv/tempdrv/src/tempdrv.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\protocol\bluetooth\ble_stack\inc\common" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emlib\src" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\Device\SiliconLabs\BGM1\Include" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emlib\inc" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\hardware\module\config" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\hardware\kit\common\halconfig" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\hardware\kit\common\drivers" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\hardware\kit\common\bsp" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\CMSIS\Include" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\protocol\bluetooth\ble_stack\inc\soc" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\radio\rail_lib\common" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\halconfig\inc\hal-config" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emdrv\tempdrv\inc" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\hardware\kit\BGM11_BRD4302A\config" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\app\bluetooth\common\util" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\Device\SiliconLabs\BGM1\Source" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emdrv\tempdrv\src" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emdrv\sleep\inc" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\radio\rail_lib\protocol\ble" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emdrv\uartdrv\inc" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emdrv\common\inc" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\bootloader\api" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\emdrv\sleep\src" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\bootloader" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529" -I"C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emdrv/tempdrv/src/tempdrv.d" -MT"platform/emdrv/tempdrv/src/tempdrv.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


