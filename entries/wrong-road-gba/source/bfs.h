/*
 * File: bfs.h
 * Date: 2021-07-10
 * Program: binary filesystem defines
 * Author: Jenswa
 * Copyright (c) 2021, Johan Jansen
 * License: New BSD License
 */

// defines for the binary file system

#define BASE_ADDRESS  0x2000000  // base address (in hex) of multiboot image
#define BINARY_SIZE  19200  // binary size (in bytes)

#define TRACK_BIN_OFFSET  (BASE_ADDRESS + BINARY_SIZE)  // offset from end of binary
#define TRACK_BIN_SIZE  4544  // size of the compressed track binary image

#define TITLE_BIN_OFFSET  (TRACK_BIN_OFFSET + TRACK_BIN_SIZE)  // title screen compressed binary image location
#define TITLE_BIN_SIZE  4632  // title screen compressed binary image size

#define RACER_BIN_OFFSET  (TITLE_BIN_OFFSET + TITLE_BIN_SIZE)  // racer binary image location
#define RACER_BIN_SIZE  512  // size of the racer binary image

#define FONT_BIN_OFFSET  (RACER_BIN_OFFSET + RACER_BIN_SIZE)  // binary image location
#define FONT_BIN_SIZE  1728  // binary image size

#define NUMBERS_BIN_OFFSET  (FONT_BIN_OFFSET + FONT_BIN_SIZE)  // binary image location
#define NUMBERS_BIN_SIZE  640  // binary image size

#define PAUSEMENU_BIN_OFFSET  (NUMBERS_BIN_OFFSET + NUMBERS_BIN_SIZE)  // binary image location
#define PAUSEMENU_BIN_SIZE  4572  // binary image size

#define PAUSECURSOR_BIN_OFFSET  (PAUSEMENU_BIN_OFFSET + PAUSEMENU_BIN_SIZE)  // binary image location
#define PAUSECURSOR_BIN_SIZE  512  // binary image size

#define CRASH_BIN_OFFSET  (PAUSECURSOR_BIN_OFFSET + PAUSECURSOR_BIN_SIZE)  // binary wave location
#define CRASH_BIN_SIZE  20990  // binary wave size
#define CRASH_BIN_SAMPLES  20990  // number of samples in the audio file

#define HIGHBLEEP_BIN_OFFSET  (CRASH_BIN_OFFSET + CRASH_BIN_SIZE)  // binary wave location
#define HIGHBLEEP_BIN_SIZE  6568  // binary wave size
#define HIGHBLEEP_BIN_SAMPLES  6568  // number of samples in the audio file

#define LOWBLEEP_BIN_OFFSET  (HIGHBLEEP_BIN_OFFSET + HIGHBLEEP_BIN_SIZE)  // binary wave location
#define LOWBLEEP_BIN_SIZE  7658  // binary wave size
#define LOWBLEEP_BIN_SAMPLES  7658  // number of samples in the audio file
