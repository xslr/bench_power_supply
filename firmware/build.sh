#!/usr/bin/env sh

SRC_ROOT_DFL="$(dirname $(realpath "$0"))"
TOOLCHAIN_DFL=$HOME/toolchain/gcc-arm-none-eabi-9-2019-q4-major


if [ -z "${PSU_SRC_DIR}" ]; then
  SRC_ROOT="${SRC_ROOT_DFL}"
else
  SRC_ROOT="${PSU_SRC_DIR}"
fi

if [ -z "${ARM_CM3_TOOLCHAIN_DIR}" ]; then
  TOOLCHAIN="${TOOLCHAIN_DFL}"
else
  TOOLCHAIN="${ARM_CM3_TOOLCHAIN_DIR}"
fi

echo "Source root=${SRC_ROOT}"

if [ ${SRC_ROOT} = ${PWD} ]; then
  echo "Build must be performed out of source."
  echo "Create a directory where build output will be stored and run build.sh from there."
  exit 1
fi

if [ "$#" -eq "1" ]; then
  if [ "$1" = "-c" ]; then
    echo "cleaning build dir"
    rm -rvf *
  fi
else
  echo "Run cmake"
  cmake \
      -G Ninja \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
      -DCMAKE_MODULE_PATH=${SRC_ROOT}/third_party/stm32-cmake/cmake \
      -DCHIBIOS_ROOT=${SRC_ROOT}/third_party/chibi/ChibiOS_20.3.0 \
      -DCHIBIOS_HALCONF_FILE=${SRC_ROOT}/cfg/halconf.h \
      -DCHIBIOS_CHCONF_FILE=${SRC_ROOT}/cfg/chconf.h \
      -DSTM32_CHIP=STM32F103C8T6 \
      -DCMAKE_TOOLCHAIN_FILE=${SRC_ROOT}/third_party/stm32-cmake/cmake/gcc_stm32.cmake \
      -DTOOLCHAIN_PREFIX=${TOOLCHAIN} \
      -DCMAKE_BUILD_TYPE=Debug \
      "${SRC_ROOT}"
fi
