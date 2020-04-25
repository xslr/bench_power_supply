#include "pwmcfg.h"
#include "hal.h"

static void vcbPwmDev(PWMDriver* pPwmp) {
  if (&PWMD1 == pPwmp) {
    palClearPad(GPIOC, GPIOC_LED);
  }
}

static void vcbPwmChan(PWMDriver* pPwmp) {
  if (&PWMD1 == pPwmp) {
    palSetPad(GPIOC, GPIOC_LED);
  }
}

/*
 * PWMD1 device configuration.
 */
const PWMConfig pwmCfg1 = {
  50000000,             // clock frequency in hz
  10000,             // pwm period in ticks
  vcbPwmDev,     // periodic callback pointer
  {                 // pwm channel configuration * PWM_CHANNELS
     { PWM_OUTPUT_ACTIVE_HIGH, NULL },   // { channel active logic level, channel callback pointer }
     { PWM_OUTPUT_ACTIVE_HIGH, NULL },
     { PWM_OUTPUT_ACTIVE_HIGH, NULL },
     { PWM_OUTPUT_ACTIVE_HIGH, NULL },
  },
  0
};

/*
 * PWMD3 device configuration.
 */
const PWMConfig pwmCfg3 = {
  50000000,             // clock frequency in hz
  10000,             // pwm period in ticks
  NULL,             // periodic callback pointer
  {                 // pwm channel configuration * PWM_CHANNELS
     { PWM_OUTPUT_ACTIVE_HIGH, NULL },   // { channel active logic level, channel callback pointer }
     { PWM_OUTPUT_ACTIVE_HIGH, NULL },
     { PWM_OUTPUT_DISABLED, NULL },
     { PWM_OUTPUT_ACTIVE_HIGH, NULL },
  },
  0
};
