################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include protocol/bluetooth/lib/EFR32BG1B/GCC/subdir.mk
-include platform/emlib/src/subdir.mk
-include platform/emdrv/tempdrv/src/subdir.mk
-include platform/emdrv/sleep/src/subdir.mk
-include platform/emdrv/gpiointerrupt/subdir.mk
-include platform/Device/SiliconLabs/BGM1/Source/GCC/subdir.mk
-include platform/Device/SiliconLabs/BGM1/Source/subdir.mk
-include hardware/kit/common/drivers/subdir.mk
-include hardware/kit/common/bsp/subdir.mk
-include driver/subdir.mk
-include app/bluetooth/common/util/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: soc-empty_0529.axf

# Tool invocations
soc-empty_0529.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -T "C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\bgm121a256v2.ld" -Xlinker --gc-sections -Xlinker -Map="soc-empty_0529.map" -mfpu=fpv4-sp-d16 -mfloat-abi=softfp --specs=nano.specs -o soc-empty_0529.axf -Wl,--start-group "./app/bluetooth/common/util/infrastructure.o" "./app.o" "./application_properties.o" "./gatt_db.o" "./gestureRecognition.o" "./hid.o" "./init_app.o" "./init_board_efr32xg1.o" "./init_mcu_efr32xg1.o" "./main.o" "./pti.o" "./sensor.o" "./user_code.o" "./user_pheri.o" "./driver/DataConverter.o" "./driver/ErrorHelper.o" "./driver/Icm20602Ctrl.o" "./driver/Icm20602SelfTest.o" "./driver/Icm20602Setup.o" "./driver/Icm20602Transport.o" "./hardware/kit/common/bsp/bsp_stk.o" "./hardware/kit/common/drivers/mx25flash_spi.o" "./hardware/kit/common/drivers/retargetio.o" "./hardware/kit/common/drivers/retargetserial.o" "./platform/Device/SiliconLabs/BGM1/Source/GCC/startup_bgm1.o" "./platform/Device/SiliconLabs/BGM1/Source/system_bgm1.o" "./platform/emdrv/gpiointerrupt/gpiointerrupt.o" "./platform/emdrv/sleep/src/sleep.o" "./platform/emdrv/tempdrv/src/tempdrv.o" "./platform/emlib/src/em_adc.o" "./platform/emlib/src/em_assert.o" "./platform/emlib/src/em_burtc.o" "./platform/emlib/src/em_cmu.o" "./platform/emlib/src/em_core.o" "./platform/emlib/src/em_cryotimer.o" "./platform/emlib/src/em_crypto.o" "./platform/emlib/src/em_emu.o" "./platform/emlib/src/em_gpio.o" "./platform/emlib/src/em_i2c.o" "./platform/emlib/src/em_msc.o" "./platform/emlib/src/em_rmu.o" "./platform/emlib/src/em_rtcc.o" "./platform/emlib/src/em_se.o" "./platform/emlib/src/em_system.o" "./platform/emlib/src/em_timer.o" "./platform/emlib/src/em_usart.o" "C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\protocol\bluetooth\lib\EFR32BG1B\GCC\libbluetooth.a" "C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\radio\rail_lib\autogen\librail_release\librail_module_efr32xg1_gcc_release.a" "C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\protocol\bluetooth\lib\EFR32BG1B\GCC\libpsstore.a" "C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\protocol\bluetooth\lib\EFR32BG1B\GCC\libmbedtls.a" "C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\protocol\bluetooth\lib\EFR32BG1B\GCC\binapploader.o" "C:\Users\calic\SimplicityStudio\v4_workspace\soc-empty_0529\platform\radio\rail_lib\autogen\librail_release\librail_config_bgm121a256v2_gcc.a" -lm -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: soc-empty_0529.hex'
	arm-none-eabi-objcopy -O ihex "soc-empty_0529.axf" "soc-empty_0529.hex"
	@echo ' '

	@echo 'Building bin file: soc-empty_0529.bin'
	arm-none-eabi-objcopy -O binary "soc-empty_0529.axf" "soc-empty_0529.bin"
	@echo ' '

	@echo 'Building s37 file: soc-empty_0529.s37'
	arm-none-eabi-objcopy -O srec "soc-empty_0529.axf" "soc-empty_0529.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "soc-empty_0529.axf"
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) soc-empty_0529.axf
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
