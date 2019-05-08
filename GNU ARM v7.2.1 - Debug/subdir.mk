################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app.c \
../application_properties.c \
../gatt_db.c \
../hid.c \
../init_app.c \
../init_board_efr32xg1.c \
../init_mcu_efr32xg1.c \
../main.c \
../pti.c \
../user_code.c \
../user_pheri.c 

OBJS += \
./app.o \
./application_properties.o \
./gatt_db.o \
./hid.o \
./init_app.o \
./init_board_efr32xg1.o \
./init_mcu_efr32xg1.o \
./main.o \
./pti.o \
./user_code.o \
./user_pheri.o 

C_DEPS += \
./app.d \
./application_properties.d \
./gatt_db.d \
./hid.d \
./init_app.d \
./init_board_efr32xg1.d \
./init_mcu_efr32xg1.d \
./main.d \
./pti.d \
./user_code.d \
./user_pheri.d 


# Each subdirectory must supply rules for building sources it contributes
app.o: ../app.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"app.d" -MT"app.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

application_properties.o: ../application_properties.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"application_properties.d" -MT"application_properties.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gatt_db.o: ../gatt_db.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"gatt_db.d" -MT"gatt_db.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hid.o: ../hid.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hid.d" -MT"hid.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_app.o: ../init_app.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_app.d" -MT"init_app.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_board_efr32xg1.o: ../init_board_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_board_efr32xg1.d" -MT"init_board_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_mcu_efr32xg1.o: ../init_mcu_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_mcu_efr32xg1.d" -MT"init_mcu_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"main.d" -MT"main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

pti.o: ../pti.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"pti.d" -MT"pti.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

user_code.o: ../user_code.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"user_code.d" -MT"user_code.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

user_pheri.o: ../user_pheri.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\soc-empty" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\soc-empty\platform\emlib\src" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\soc-empty\platform\emlib\inc" -I"C:\work\EFM32\soc-empty\hardware\module\config" -I"C:\work\EFM32\soc-empty\hardware\kit\common\halconfig" -I"C:\work\EFM32\soc-empty\hardware\kit\common\drivers" -I"C:\work\EFM32\soc-empty\hardware\kit\common\bsp" -I"C:\work\EFM32\soc-empty\platform\CMSIS\Include" -I"C:\work\EFM32\soc-empty\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\common" -I"C:\work\EFM32\soc-empty\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\soc-empty\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\soc-empty\app\bluetooth\common\util" -I"C:\work\EFM32\soc-empty\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\soc-empty\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\soc-empty\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\inc" -I"C:\work\EFM32\soc-empty\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\soc-empty\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\soc-empty\platform\emdrv\common\inc" -I"C:\work\EFM32\soc-empty\platform\bootloader\api" -I"C:\work\EFM32\soc-empty\platform\emdrv\sleep\src" -I"C:\work\EFM32\soc-empty\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"user_pheri.d" -MT"user_pheri.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


