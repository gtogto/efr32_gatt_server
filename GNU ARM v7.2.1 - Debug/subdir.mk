################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../app.c \
../application_properties.c \
../gatt_db.c \
../init_app.c \
../init_board_efr32xg1.c \
../init_mcu_efr32xg1.c \
../main.c \
../pti.c \
../user_pheri.c 

OBJS += \
./app.o \
./application_properties.o \
./gatt_db.o \
./init_app.o \
./init_board_efr32xg1.o \
./init_mcu_efr32xg1.o \
./main.o \
./pti.o \
./user_pheri.o 

C_DEPS += \
./app.d \
./application_properties.d \
./gatt_db.d \
./init_app.d \
./init_board_efr32xg1.d \
./init_mcu_efr32xg1.d \
./main.d \
./pti.d \
./user_pheri.d 


# Each subdirectory must supply rules for building sources it contributes
app.o: ../app.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"app.d" -MT"app.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

application_properties.o: ../application_properties.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"application_properties.d" -MT"application_properties.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gatt_db.o: ../gatt_db.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"gatt_db.d" -MT"gatt_db.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_app.o: ../init_app.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_app.d" -MT"init_app.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_board_efr32xg1.o: ../init_board_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_board_efr32xg1.d" -MT"init_board_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_mcu_efr32xg1.o: ../init_mcu_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_mcu_efr32xg1.d" -MT"init_mcu_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"main.d" -MT"main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

pti.o: ../pti.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"pti.d" -MT"pti.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

user_pheri.o: ../user_pheri.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' '-DBGM121A256V2=1' -I"C:\work\EFM32\hid_basic" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\common" -I"C:\work\EFM32\hid_basic\platform\emlib\src" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Include" -I"C:\work\EFM32\hid_basic\platform\emlib\inc" -I"C:\work\EFM32\hid_basic\hardware\module\config" -I"C:\work\EFM32\hid_basic\hardware\kit\common\halconfig" -I"C:\work\EFM32\hid_basic\hardware\kit\common\drivers" -I"C:\work\EFM32\hid_basic\hardware\kit\common\bsp" -I"C:\work\EFM32\hid_basic\platform\CMSIS\Include" -I"C:\work\EFM32\hid_basic\protocol\bluetooth\ble_stack\inc\soc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\common" -I"C:\work\EFM32\hid_basic\platform\halconfig\inc\hal-config" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\inc" -I"C:\work\EFM32\hid_basic\hardware\kit\BGM11_BRD4302A\config" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ieee802154" -I"C:\work\EFM32\hid_basic\app\bluetooth\common\util" -I"C:\work\EFM32\hid_basic\platform\emdrv\gpiointerrupt\inc" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source\GCC" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\work\EFM32\hid_basic\platform\Device\SiliconLabs\BGM1\Source" -I"C:\work\EFM32\hid_basic\platform\emdrv\tempdrv\src" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\inc" -I"C:\work\EFM32\hid_basic\platform\radio\rail_lib\protocol\ble" -I"C:\work\EFM32\hid_basic\platform\emdrv\uartdrv\inc" -I"C:\work\EFM32\hid_basic\platform\emdrv\common\inc" -I"C:\work\EFM32\hid_basic\platform\bootloader\api" -I"C:\work\EFM32\hid_basic\platform\emdrv\sleep\src" -I"C:\work\EFM32\hid_basic\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"user_pheri.d" -MT"user_pheri.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


