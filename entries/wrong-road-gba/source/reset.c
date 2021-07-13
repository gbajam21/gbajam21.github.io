/*
 * File: reset.c
 * Date: 2019-12-08
 * Program: hard and soft reset functions for gba
 * Author: Jenswa
 * Copyright (c) 2003,2012,2019; Johan Jansen
 * License: New BSD License
 */

// general declarations that need to be included from the main project file
/*
#include "gba.h"  //GBA register definitions
*/

// function prototypes
void SoftReset(bool entry, int clear);
void RegisterRamReset(int clear);

// bios soft reset
void SoftReset(bool entry, int clear) {
  REG_IME = 0x00;  // disable interrupts
  REG_SOFTRESET = entry;  // set entry point for soft reset (0: ROM, 1: WRAM)
  SetMode(FORCE_BLANK);  // blanking the screen seems like a good idea before a soft reset
  RegisterRamReset(clear);  // 0xFC clears all ram and registers but IRAM and WRAM, 0xFE clears all but WRAM
  asm volatile("swi 0x000000");  // bios soft reset in ARM mode
  //asm volatile("swi 0x00");  // bios soft reset in THUMB mode
}

void RegisterRamReset(int clear) {
  // param 0 should already be in r0 by using a function for it ... (according to the arm procedure call standard)
  asm volatile("swi 0x010000");  // register ram reset in ARM mode
  //asm volatile("swi 0x01");  // register ram reset in THUMB mode
}
