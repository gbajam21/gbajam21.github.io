/*
 * File: samples.h
 * Date: 2021-07-11
 * Program: samples structs for binary wave files
 * Author: Jenswa
 * Copyright (c) 2021, Johan Jansen
 * License: New BSD License
 */

#include "gba.h"
#include "bfs.h"
#include "sfx.h"

const SAMPLE crash = {
  (s8*)CRASH_BIN_OFFSET,
  CRASH_BIN_SAMPLES,
};

const SAMPLE highbleep = {
  (s8*)HIGHBLEEP_BIN_OFFSET,
  HIGHBLEEP_BIN_SAMPLES,
};

const SAMPLE lowbleep = {
  (s8*)LOWBLEEP_BIN_OFFSET,
  LOWBLEEP_BIN_SAMPLES,
};
