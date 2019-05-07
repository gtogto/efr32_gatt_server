################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../platform/emlib/src/em_assert.c \
../platform/emlib/src/em_burtc.c \
../platform/emlib/src/em_cmu.c \
../platform/emlib/src/em_core.c \
../platform/emlib/src/em_cryotimer.c \
../platform/emlib/src/em_crypto.c \
../platform/emlib/src/em_emu.c \
../platform/emlib/src/em_gpio.c \
../platform/emlib/src/em_i2c.c \
../platform/emlib/src/em_msc.c \
../platform/emlib/src/em_rmu.c \
../platform/emlib/src/em_rtcc.c \
../platform/emlib/src/em_se.c \
../platform/emlib/src/em_system.c \
../platform/emlib/src/em_timer.c \
../platform/emlib/src/em_usart.c 

OBJS += \
./platform/emlib/src/em_assert.o \
./platform/emlib/src/em_burtc.o \
./platform/emlib/src/em_cmu.o \
./platform/emlib/src/em_core.o \
./platform/emlib/src/em_cryotimer.o \
./platform/emlib/src/em_crypto.o \
./platform/emlib/src/em_emu.o \
./platform/emlib/src/em_gpio.o \
./platform/emlib/src/em_i2c.o \
./platform/emlib/src/em_msc.o \
./platform/emlib/src/em_rmu.o \
./platform/emlib/src/em_rtcc.o \
./platform/emlib/src/em_se.o \
./platform/emlib/src/em_system.o \
./platform/emlib/src/em_timer.o \
./platform/emlib/src/em_usart.o 

C_DEPS += \
./platform/emlib/src/em_assert.d \
./platform/emlib/src/em_burtc.d \
./platform/emlib/src/em_cmu.d \
./platform/emlib/src/em_core.d \
./platform/emlib/src/em_cryotimer.d \
./platform/emlib/src/em_crypto.d \
./platform/emlib/src/em_emu.d \
./platform/emlib/src/em_gpio.d \
./platform/emlib/src/em_i2c.d \
./platform/emlib/src/em_msc.d \
./platform/emlib/src/em_rmu.d \
./platform/emlib/src/em_rtcc.d \
./platform/emlib/src/em_se.d \
./platform/emlib/src/em_system.d \
./platform/emlib/src/em_timer.d \
./platform/emlib/src/em_usart.d 


# Each subdirectory must supply rules for building sources it contributes
platform/emlib/src/em_assert.o: ../platform/emlib/src/em_assert.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_assert.d" -MT"platform/emlib/src/em_assert.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_burtc.o: ../platform/emlib/src/em_burtc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_burtc.d" -MT"platform/emlib/src/em_burtc.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_cmu.o: ../platform/emlib/src/em_cmu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_cmu.d" -MT"platform/emlib/src/em_cmu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_core.o: ../platform/emlib/src/em_core.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_core.d" -MT"platform/emlib/src/em_core.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_cryotimer.o: ../platform/emlib/src/em_cryotimer.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_cryotimer.d" -MT"platform/emlib/src/em_cryotimer.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_crypto.o: ../platform/emlib/src/em_crypto.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_crypto.d" -MT"platform/emlib/src/em_crypto.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_emu.o: ../platform/emlib/src/em_emu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_emu.d" -MT"platform/emlib/src/em_emu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_gpio.o: ../platform/emlib/src/em_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_gpio.d" -MT"platform/emlib/src/em_gpio.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_i2c.o: ../platform/emlib/src/em_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_i2c.d" -MT"platform/emlib/src/em_i2c.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_msc.o: ../platform/emlib/src/em_msc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_msc.d" -MT"platform/emlib/src/em_msc.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_rmu.o: ../platform/emlib/src/em_rmu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_rmu.d" -MT"platform/emlib/src/em_rmu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_rtcc.o: ../platform/emlib/src/em_rtcc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_rtcc.d" -MT"platform/emlib/src/em_rtcc.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_se.o: ../platform/emlib/src/em_se.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_se.d" -MT"platform/emlib/src/em_se.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_system.o: ../platform/emlib/src/em_system.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_system.d" -MT"platform/emlib/src/em_system.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_timer.o: ../platform/emlib/src/em_timer.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_timer.d" -MT"platform/emlib/src/em_timer.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emlib/src/em_usart.o: ../platform/emlib/src/em_usart.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emlib/src/em_usart.d" -MT"platform/emlib/src/em_usart.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


