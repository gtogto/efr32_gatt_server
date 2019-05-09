################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../driver/DataConverter.c \
../driver/ErrorHelper.c \
../driver/Icm20602Ctrl.c \
../driver/Icm20602SelfTest.c \
../driver/Icm20602Setup.c \
../driver/Icm20602Transport.c 

OBJS += \
./driver/DataConverter.o \
./driver/ErrorHelper.o \
./driver/Icm20602Ctrl.o \
./driver/Icm20602SelfTest.o \
./driver/Icm20602Setup.o \
./driver/Icm20602Transport.o 

C_DEPS += \
./driver/DataConverter.d \
./driver/ErrorHelper.d \
./driver/Icm20602Ctrl.d \
./driver/Icm20602SelfTest.d \
./driver/Icm20602Setup.d \
./driver/Icm20602Transport.d 


# Each subdirectory must supply rules for building sources it contributes
driver/DataConverter.o: ../driver/DataConverter.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"driver/DataConverter.d" -MT"driver/DataConverter.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/ErrorHelper.o: ../driver/ErrorHelper.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"driver/ErrorHelper.d" -MT"driver/ErrorHelper.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/Icm20602Ctrl.o: ../driver/Icm20602Ctrl.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"driver/Icm20602Ctrl.d" -MT"driver/Icm20602Ctrl.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/Icm20602SelfTest.o: ../driver/Icm20602SelfTest.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"driver/Icm20602SelfTest.d" -MT"driver/Icm20602SelfTest.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/Icm20602Setup.o: ../driver/Icm20602Setup.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"driver/Icm20602Setup.d" -MT"driver/Icm20602Setup.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/Icm20602Transport.o: ../driver/Icm20602Transport.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\driver" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"driver/Icm20602Transport.d" -MT"driver/Icm20602Transport.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


