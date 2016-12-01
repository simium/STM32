#!/bin/bash

rm ./src/main.c
rm ./src/Timer.c
rm ./include/Timer.h
rm ./system/include/cmsis/stm32f4xx.h
rm ./system/include/cmsis/system_stm32f4xx.h
rm ./system/src/cmsis/system_stm32f4xx.c
rm ./system/src/cmsis/vectors_stm32f4xx.c

cp -r /opt/STM32Cube_FW_F4/Drivers/STM32F4xx_HAL_Driver/Src/* ./system/src/stm32f4xx
cp -r /opt/STM32Cube_FW_F4/Drivers/STM32F4xx_HAL_Driver/Inc/* ./system/include/stm32f4xx

cp -r /opt/STM32Cube_FW_F4/Drivers/CMSIS/Device/ST/STM32F4xx/Include/* ./system/include/cmsis
cp -r /opt/STM32Cube_FW_F4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xe.s ./system/src/cmsis/startup_stm32f401xe.S
cp -r /opt/STM32Cube_FW_F4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c ./system/src/cmsis

cp -r /opt/STM32Cube_FW_F4/Projects/STM32F401RE-Nucleo/Examples/GPIO/GPIO_IOToggle/Inc/* ./include
cp -r /opt/STM32Cube_FW_F4/Projects/STM32F401RE-Nucleo/Examples/GPIO/GPIO_IOToggle/Src/main.c ./src
cp -r /opt/STM32Cube_FW_F4/Projects/STM32F401RE-Nucleo/Examples/GPIO/GPIO_IOToggle/Src/stm32f4xx_it.c ./src

cp -r /opt/STM32Cube_FW_F4/Drivers/BSP/STM32F4xx-Nucleo/stm32f4xx_nucleo.c ./src
cp -r /opt/STM32Cube_FW_F4/Drivers/BSP/STM32F4xx-Nucleo/stm32f4xx_nucleo.h ./include

chown -R jplopez:jplopez *

