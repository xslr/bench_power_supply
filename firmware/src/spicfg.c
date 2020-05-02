#include "spicfg.h"

const SPIConfig spiCfg2 = {
  false,    // circular buffer mode
  NULL,     // completion callback
  GPIOB,    // port
  MAX_DISP_LOAD_PAD,
  ((((1<<5) | (1<<4) | (1<<3)) & SPI_CR1_BR) | SPI_CR1_MSTR | SPI_CR1_SSM),
};
