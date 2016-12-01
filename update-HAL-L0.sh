#!/bin/bash

PROJECT=$1
TOOLCHAIN='/opt/STM32Cube_FW_L0'

if [[ -d "$PROJECT" && -d "$TOOLCHAIN" ]]; then
    echo 'Updating workspace with STM32Cube HAL...'
    rm $PROJECT/src/main.c
    rm $PROJECT/src/Timer.c
    rm $PROJECT/include/Timer.h
    rm $PROJECT/system/include/cmsis/stm32l0xx.h
    rm $PROJECT/system/include/cmsis/system_stm32l0xx.h
    rm $PROJECT/system/src/cmsis/system_stm32l0xx.c
    rm $PROJECT/system/src/cmsis/vectors_stm32l0xx.c

    cp -r $TOOLCHAIN/Drivers/STM32L0xx_HAL_Driver/Src/* $PROJECT/system/src/stm32l0xx
    cp -r $TOOLCHAIN/Drivers/STM32L0xx_HAL_Driver/Inc/* $PROJECT/system/include/stm32l0xx

    cp -r $TOOLCHAIN/Drivers/CMSIS/Device/ST/STM32L0xx/Include/* $PROJECT/system/include/cmsis
    cp $TOOLCHAIN/Drivers/CMSIS/Device/ST/STM32L0xx/Source/Templates/gcc/startup_stm32l011xx.s $PROJECT/system/src/cmsis/startup_stm32l011xx.S
    cp $TOOLCHAIN/Drivers/CMSIS/Device/ST/STM32L0xx/Source/Templates/system_stm32l0xx.c $PROJECT/system/src/cmsis

    cp -r $TOOLCHAIN/Projects/STM32L011K4-Nucleo/Examples/GPIO/GPIO_IOToggle/Inc/* $PROJECT/include
    cp $TOOLCHAIN/Projects/STM32L011K4-Nucleo/Examples/GPIO/GPIO_IOToggle/Src/main.c $PROJECT/src
    cp $TOOLCHAIN/Projects/STM32L011K4-Nucleo/Examples/GPIO/GPIO_IOToggle/Src/stm32l0xx_it.c $PROJECT/src

    cp $TOOLCHAIN/Drivers/BSP/STM32L0xx_Nucleo_32/stm32l0xx_nucleo_32.c $PROJECT/src
    cp $TOOLCHAIN/Drivers/BSP/STM32L0xx_Nucleo_32/stm32l0xx_nucleo_32.h $PROJECT/include

    chown -R $SUDO_USER:$SUDO_USER $PROJECT
    echo 'Done.'
else
    echo 'Usage: '$0' project-folder'
    echo 'Also, remember to configure $TOOLCHAIN appropriately.'
fi
