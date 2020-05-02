/*
 * max7219.cpp
 *
 *  Created on: May 1, 2020
 *      Author: Subrat Meher
 */

#include <cassert>
#include <cstddef>
#include <cstdint>

#include "hal.h"

#include "max7219.hpp"

void max_init(const Max7219NumericDisp& disp) {
  max_set_scan_limit(disp, 3u);
  max_set_decode_mode(disp, 0xff);
  max_set_intensity(disp, 1u);
  max_set_shutdown_mode(disp, 1u);
}


void max_set_scan_limit(const Max7219NumericDisp& disp, uint8_t scan_limit) {
  max_write(disp, Max7219Reg::Reg_Scan_Limit, scan_limit);
}


void max_set_shutdown_mode(const Max7219NumericDisp& disp, uint8_t mode) {
  max_write(disp, Max7219Reg::Reg_Shut_Down, mode);
}


void max_set_intensity(const Max7219NumericDisp& disp, uint8_t intensity) {
  max_write(disp, Max7219Reg::Reg_Intensity, intensity);
}


void max_set_decode_mode(const Max7219NumericDisp& disp, uint8_t mode) {
  max_write(disp, Max7219Reg::Reg_Decode_Mode, mode);
}


void max_start_display_test(const Max7219NumericDisp& disp) {
  max_write(disp, Max7219Reg::Reg_Disp_Test, 1u);
}


void max_stop_display_test(const Max7219NumericDisp& disp) {
  max_write(disp, Max7219Reg::Reg_Disp_Test, 0u);
}


void show_decimal(Max7219NumericDisp& disp, uint16_t val1, size_t lenVal1, uint16_t val2, LoadOnWrite load) {
  assert(lenVal1 <= 4);
}


void show_int(Max7219NumericDisp& disp, uint16_t val, LoadOnWrite load) {
  assert(val <= MAX7219_VAL_MAX);
  disp.value = val;

  if (LoadIt == load) {
    writeDisp(disp);
  }
}


Max7219Reg getDigitRegister(uint8_t regVal) {
  if (regVal > static_cast<uint8_t>(Max7219Reg::MaxValue)) {
    //chprintf(chp, "Invalid register\n");
    return Max7219Reg::Reg_NoOp;
  }

  return static_cast<Max7219Reg>(static_cast<uint8_t>(Max7219Reg::Reg_Digit_0) + regVal);
}


uint8_t getCharFont(uint8_t charVal) {
  if (charVal > static_cast<uint8_t>(Max7219Font::MaxValue)) {
    //chprintf(chp, "Invalid character value\n");
    return static_cast<uint8_t>(Max7219Font::Char_Blank);
  }

  return static_cast<uint8_t>(Max7219Font::Char_0) + charVal;
}


void max_write(const Max7219NumericDisp& disp, Max7219Reg reg, uint8_t val) {
  const uint16_t buf = (static_cast<uint8_t>(reg) & 0xf) | (static_cast<uint8_t>(val) << 8);
  spiSend(&disp.spid, sizeof(buf), &buf);

  do_load(disp);
}


void writeDisp(const Max7219NumericDisp& disp) {
  Max7219NumericValue v = disp.value;
  for (uint8_t i=0; i<disp.numDigits; i++) {
    const uint8_t digitVal = v % 10;
    max_write(disp, getDigitRegister(i), getCharFont(digitVal));
    v = v/10;
  }
}

void do_load(const Max7219NumericDisp& disp) {
  chThdSleepMicroseconds(5);
  palSetPad(PAL_PORT(disp.loadLine), PAL_PAD(disp.loadLine));
  chThdSleepMicroseconds(5);
  palClearPad(PAL_PORT(disp.loadLine), PAL_PAD(disp.loadLine));
}
