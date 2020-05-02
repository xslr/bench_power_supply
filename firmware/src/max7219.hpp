#ifndef MAX7219_HPP
#define MAX7219_HPP

#include <array>

#include "hal.h"


#define MAX7219_VAL_MAX 9999
using Max7219NumericValue = uint16_t;


struct Max7219NumericDisp {
  Max7219NumericDisp(SPIDriver& spid, ioline_t loadLine)
    : numDecimalDigits(0)
    , numDigits(4)
    , value(0)
    , spid(spid)
    , loadLine(loadLine) {
  }

  Max7219NumericDisp(const Max7219NumericDisp& disp) = delete;

  uint8_t numDecimalDigits;
  uint8_t numDigits;
  Max7219NumericValue value;
  SPIDriver& spid;
  ioline_t loadLine;
};


typedef enum {
  DontLoad,
  LoadIt
} LoadOnWrite;


enum class Max7219Font : uint8_t{
  Char_0,
  Char_1,
  Char_2,
  Char_3,
  Char_4,
  Char_5,
  Char_6,
  Char_7,
  Char_8,
  Char_9,
  Char_Hyphen,
  Char_E,
  Char_H,
  Char_L,
  Char_P,
  Char_Blank,
  MaxValue = Char_Blank,
};

enum class Max7219Reg : uint8_t {
  Reg_NoOp = 0x0,
  Reg_Digit_0 = 0x1,
  Reg_Digit_1,
  Reg_Digit_2,
  Reg_Digit_3,
  Reg_Digit_4,
  Reg_Digit_5,
  Reg_Digit_6,
  Reg_Digit_7,
  Reg_Decode_Mode,
  Reg_Intensity,
  Reg_Scan_Limit,
  Reg_Shut_Down,
  Reg_Disp_Test = 0xf,
  MaxValue = Reg_Disp_Test,
};

void max_init(const Max7219NumericDisp& disp);
void max_set_scan_limit(const Max7219NumericDisp& disp, uint8_t scan_limit);
void max_set_shutdown_mode(const Max7219NumericDisp& disp, uint8_t mode);
void max_set_intensity(const Max7219NumericDisp& disp, uint8_t intensity);
void max_set_decode_mode(const Max7219NumericDisp& disp, uint8_t mode);

void max_start_display_test(const Max7219NumericDisp& disp);
void max_stop_display_test(const Max7219NumericDisp& disp);
void show_decimal(Max7219NumericDisp& disp, uint16_t val1, size_t lenVal1, uint16_t val2, LoadOnWrite load);
void show_int(Max7219NumericDisp& disp, uint16_t val, LoadOnWrite load);

void max_write(const Max7219NumericDisp& disp, Max7219Reg reg, uint8_t val);
void writeDisp(const Max7219NumericDisp& disp);
void do_load(const Max7219NumericDisp& disp);

#endif  // MAX719_HPP
