#!/bin/bash

PROJECT=$1
TOOLCHAIN='/opt/STM32Cube_FW_F4'

if [[ -d "$PROJECT" && -d "$TOOLCHAIN" ]]; then
    echo 'Updating workspace with STM32Cube HAL...'
    rm $PROJECT/src/main.c
    rm $PROJECT/src/Timer.c
    rm $PROJECT/include/Timer.h
    rm $PROJECT/system/include/cmsis/stm32f4xx.h
    rm $PROJECT/system/include/cmsis/system_stm32f4xx.h
    rm $PROJECT/system/src/cmsis/system_stm32f4xx.c
    rm $PROJECT/system/src/cmsis/vectors_stm32f4xx.c

    cp -r $TOOLCHAIN/Drivers/STM32F4xx_HAL_Driver/Src/* $PROJECT/system/src/stm32f4xx
    cp -r $TOOLCHAIN/Drivers/STM32F4xx_HAL_Driver/Inc/* $PROJECT/system/include/stm32f4xx

    cp -r $TOOLCHAIN/Drivers/CMSIS/Device/ST/STM32F4xx/Include/* $PROJECT/system/include/cmsis
    cp $TOOLCHAIN/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xe.s $PROJECT/system/src/cmsis/startup_stm32f401xe.S
    cp $TOOLCHAIN/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c $PROJECT/system/src/cmsis

    cp -r $TOOLCHAIN/Projects/STM32F401RE-Nucleo/Examples/GPIO/GPIO_IOToggle/Inc/* $PROJECT/include
    cp $TOOLCHAIN/Projects/STM32F401RE-Nucleo/Examples/GPIO/GPIO_IOToggle/Src/main.c $PROJECT/src
    cp $TOOLCHAIN/Projects/STM32F401RE-Nucleo/Examples/GPIO/GPIO_IOToggle/Src/stm32f4xx_it.c $PROJECT/src

    cp $TOOLCHAIN/Drivers/BSP/STM32F4xx-Nucleo/stm32f4xx_nucleo.c $PROJECT/src
    cp $TOOLCHAIN/Drivers/BSP/STM32F4xx-Nucleo/stm32f4xx_nucleo.h $PROJECT/include

    chown -R $SUDO_USER:$SUDO_USER $PROJECT
    echo 'Done.'
else
    echo 'Usage: '$0' project-folder'
    echo 'Also, remember to configure $TOOLCHAIN appropriately.'
fi
