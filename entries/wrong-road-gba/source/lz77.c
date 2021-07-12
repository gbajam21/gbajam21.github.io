/*
 * File: lz77.c
 * Date: 2021-06-24
 * Program: BIOS LZ77 uncompressor functions
 * Author: Jenswa
 * Copyright (c) 2021, Johan Jansen
 * License: New BSD License
 */

// general declarations that need to be included from the main project file
/*
#include "gba.h"  //GBA register definitions
*/

// function prototypes
void LZ77UnCompWRAM(u32 source, u32 dest);
void LZ77UnCompVRAM(u32 source, u32 dest);

// uncompress to WRAM
void LZ77UnCompWRAM(u32 source, u32 dest) {
  // param 0 should already be in r0 just like param 1 should be in r1 according to the arm procedure call standard
  asm volatile("swi 0x110000");
}

// uncompress to VRAM
void LZ77UnCompVRAM(u32 source, u32 dest) {
  // param 0 should already be in r0 just like param 1 should be in r1 according to the arm procedure call standard
  asm volatile("swi 0x120000");
}
