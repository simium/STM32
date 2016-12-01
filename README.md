# My STM32 playground

I've summarized in **update-HAL.sh** the HAL update that Carmine Noviello recommends in [Build STM32 applications with Eclipse, GCC and STM32Cube](http://www.carminenoviello.com/2015/06/04/stm32-applications-eclipse-gcc-stcube/). I run it as sudo but your mileage may vary. His post is my starting point for my STM32 development so kudos to him!

At the moment the following source files are problematic and I don't have time to fix them anytime soon, so I just deleted them:
* ./system/src/stm32f4xx/stm32f4xx_hal_timebase_rtc_alarm_template.c
* ./system/src/stm32f4xx/stm32f4xx_hal_timebase_rtc_wakeup_template.c
* ./system/src/stm32f4xx/stm32f4xx_hal_timebase_tim_template.c
