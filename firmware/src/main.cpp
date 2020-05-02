/*
    ChibiOS - Copyright (C) 2006..2018 Giovanni Di Sirio

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

#include <stdio.h>
#include <string.h>

#include "ch.h"
#include "hal.h"
#include "max7219.hpp"

//#include "shell.h"
#include "chprintf.h"

#include "pwmcfg.h"
#include "spicfg.h"
#include "usbcfg.h"

/*===========================================================================*/
/* Command line related.                                                     */
/*===========================================================================*/

//#define SHELL_WA_SIZE   THD_WORKING_AREA_SIZE(2048)
//
///* Can be measured using dd if=/dev/xxxx of=/dev/null bs=512 count=10000.*/
//static void cmd_write(BaseSequentialStream *chp, int argc, char *argv[]) {
//  static uint8_t buf[] =
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
//      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
//
//  (void)argv;
//  if (argc > 0) {
//    chprintf(chp, "Usage: write\r\n");
//    return;
//  }
//
//  while (chnGetTimeout((BaseChannel *)chp, TIME_IMMEDIATE) == Q_TIMEOUT) {
//#if 1
//    /* Writing in channel mode.*/
//    chnWrite(&SDU1, buf, sizeof buf - 1);
//#else
//    /* Writing in buffer mode.*/
//    (void) obqGetEmptyBufferTimeout(&SDU1.obqueue, TIME_INFINITE);
//    memcpy(SDU1.obqueue.ptr, buf, SERIAL_USB_BUFFERS_SIZE);
//    obqPostFullBuffer(&SDU1.obqueue, SERIAL_USB_BUFFERS_SIZE);
//#endif
//  }
//  chprintf(chp, "\r\n\nstopped\r\n");
//}
//
//static const ShellCommand commands[] = {
//  {"write", cmd_write},
//  {NULL, NULL}
//};
//
//static const ShellConfig shell_cfg1 = {
//  (BaseSequentialStream *)&SDU1,
//  commands
//};

/*===========================================================================*/
/* Generic code.                                                             */
/*===========================================================================*/

/*
 * Blinker thread, times are in milliseconds.
 */
static THD_WORKING_AREA(waThread1, 128);
static __attribute__((noreturn)) THD_FUNCTION(Thread1, arg) {

  (void)arg;
  chRegSetThreadName("blinker");
  while (true) {
    systime_t time = serusbcfg.usbp->state == USB_ACTIVE ? 250 : 500;
    palClearPad(GPIOC, GPIOC_LED);
    chThdSleepMilliseconds(time);
    palSetPad(GPIOC, GPIOC_LED);
    chThdSleepMilliseconds(time);
  }
}


/*
 * Display update thread.
 */
static THD_WORKING_AREA(waThread2, 128);
static __attribute__((noreturn)) THD_FUNCTION(Thread2, arg) {
  (void)arg;

  chRegSetThreadName("dispUpdate");

  Max7219NumericDisp disp1(SPID2, PAL_LINE(GPIOB, 12));

  spiStart(&SPID2, &spiCfg2);
  palSetPadMode(MAX_DISP_PORT, MAX_DISP_SCK_PAD, PAL_MODE_STM32_ALTERNATE_PUSHPULL);
  palSetPadMode(MAX_DISP_PORT, MAX_DISP_MISO_PAD, PAL_MODE_INPUT_PULLUP);
  palSetPadMode(MAX_DISP_PORT, MAX_DISP_MOSI_PAD, PAL_MODE_STM32_ALTERNATE_PUSHPULL);
  palSetPadMode(MAX_DISP_PORT, MAX_DISP_LOAD_PAD, PAL_MODE_OUTPUT_PUSHPULL);

  do_load(disp1);

  max_start_display_test(disp1);
  chThdSleepMilliseconds(1000);
  max_stop_display_test(disp1);

  max_init(disp1);

  int count = 0;
  while (true) {
    show_int(disp1, count, LoadIt);
    chThdSleepMilliseconds(100);
    count++;
    count = count % 9999;
  }
}

/*
 * Application entry point.
 */
int main(void) {

  /*
   * System initializations.
   * - HAL initialization, this also initializes the configured device drivers
   *   and performs the board-specific initializations.
   * - Kernel initialization, the main() function becomes a thread and the
   *   RTOS is active.
   */
  halInit();

  pwmObjectInit(&PWMD1);
  chSysInit();

  // on stm32f1, TIM3's alternate function must be mapped to the desired port using AFIO_MAPR register
  AFIO->MAPR |= AFIO_MAPR_TIM3_REMAP_PARTIALREMAP;

  /*
   * Initializes a serial-over-USB CDC driver.
   */
  sduObjectInit(&SDU1);
  sduStart(&SDU1, &serusbcfg);

  /*
   * Activates the USB driver and then the USB bus pull-up on D+.
   * Note, a delay is inserted in order to not have to disconnect the cable
   * after a reset.
   */
  usbDisconnectBus(serusbcfg.usbp);
  chThdSleepMilliseconds(1500);
  usbStart(serusbcfg.usbp, &usbcfg);
  usbConnectBus(serusbcfg.usbp);

  pwmStart(&PWMD1, &pwmCfg1);
  palSetPadMode(GPIOA, 8, PAL_MODE_STM32_ALTERNATE_PUSHPULL);
  palSetPadMode(GPIOA, 9, PAL_MODE_STM32_ALTERNATE_PUSHPULL);
  palSetPadMode(GPIOA, 10, PAL_MODE_STM32_ALTERNATE_PUSHPULL);

  pwmEnableChannel(&PWMD1, 0, PWM_PERCENTAGE_TO_WIDTH(&PWMD1, 4750));
  pwmEnableChannel(&PWMD1, 1, PWM_PERCENTAGE_TO_WIDTH(&PWMD1, 4750));
  pwmEnableChannel(&PWMD1, 2, PWM_PERCENTAGE_TO_WIDTH(&PWMD1, 4750));

  pwmStart(&PWMD3, &pwmCfg3);
  palSetPadMode(GPIOB, 4, PAL_MODE_STM32_ALTERNATE_PUSHPULL);
  palSetPadMode(GPIOB, 5, PAL_MODE_STM32_ALTERNATE_PUSHPULL);
  palSetPadMode(GPIOB, 1, PAL_MODE_STM32_ALTERNATE_PUSHPULL);
  palSetPadMode(GPIOB, 0, PAL_MODE_STM32_ALTERNATE_PUSHPULL);

  pwmEnableChannel(&PWMD3, 0, PWM_PERCENTAGE_TO_WIDTH(&PWMD3, 4000));
  pwmEnableChannel(&PWMD3, 1, PWM_PERCENTAGE_TO_WIDTH(&PWMD3, 5000));
  pwmEnableChannel(&PWMD3, 2, PWM_PERCENTAGE_TO_WIDTH(&PWMD3, 6000));
  pwmEnableChannel(&PWMD3, 3, PWM_PERCENTAGE_TO_WIDTH(&PWMD3, 7000));

  /*
   * Creates the blinker thread.
   */
  chThdCreateStatic(waThread1, sizeof(waThread1), NORMALPRIO, Thread1, NULL);

  /*
   * Creates the display update thread.
   */
  chThdCreateStatic(waThread2, sizeof(waThread2), NORMALPRIO, Thread2, NULL);

  /*
   * Normal main() thread activity, spawning shells.
   */
  while (true) {
    if (SDU1.config->usbp->state == USB_ACTIVE) {
//      thread_t *shelltp = chThdCreateFromHeap(NULL, SHELL_WA_SIZE,
//                                              "shell", NORMALPRIO + 1,
//                                              shellThread, (void *)&shell_cfg1);
//      chThdWait(shelltp);               /* Waiting termination.             */
      while(true) {
      chnWrite(&SDU1, (uint8_t*)"Hello world\n", 12);
      chThdSleepMilliseconds(500);
      }
    }
    chThdSleepMilliseconds(1000);
  }
}
