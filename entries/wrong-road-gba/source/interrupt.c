/*
 * File: interrupt.c
 * Date: 2012-08-09
 * Program: sleep functions for the GBA
 * Author: Jenswa
 * Copyright (c) 2003-2012, Johan Jansen
 * License: New BSD License
 */

// general declarations that need to be included from the main project file
/*
#include "gba.h"  //GBA register definitions
#include "dispcnt.h"  //REG_DISPCNT register defines
#include "dstat.h"  // REG_DISPSTAT register defines
#include "keypad.h"  //keypad defines
#include "interrupt.h"  // interrupts defines
*/

// define the video mode for this program and use it when waking up from the sleep function
#define VIDEOMODE  MODE_4 | BG2_ENABLE | OBJ_ENABLE | OBJ_MAP_1D

// function prototypes
void Sleep(u16 keys);
void ISR_Sleep(void);
void VBlankIntrWait(void);
void ISR_VBlankIntrWait(void);

// put the gba to sleep, keys are the keys to wake up from sleep
void Sleep(u16 keys) {
  //disable interrupts
  REG_IME = 0x00;
  //point interrupt handler to custom function
  REG_INTERRUPT = (u32)ISR_Sleep;
  //enable button interrupt
  REG_IE |= INT_BUTTON;
  //enable button status
  REG_P1CNT = keys | 16384 | 32768;
  //enable interrupts
  REG_IME = 0x01;
  //Turn the screen of, force blank
  SetMode(FORCE_BLANK);
  while((volatile u16)REG_VCOUNT != 160){}  // WaitForVsync();
  // Stop the GBA and all processes 
  asm volatile("swi 0x030000");  // ARM code
  //asm volatile("swi 0x03");  // THUMB code
}

// Interrupt Service Routine for sleeping
void ISR_Sleep(void) {
  u16 IntFlag;
  //disable interrupts
  REG_IME = 0x00;
  //backup the interrupt flags
  IntFlag = REG_IF;
  //wait until a key is pressed
  if( (REG_IF & INT_BUTTON) == INT_BUTTON){
    //wake up the gba, initialize screen
    SetMode(VIDEOMODE);  // set matching video mode
  }
  //restore interrupts flags
  REG_IF = IntFlag;
  //enable interrupts
  REG_IME = 0x01;
}

// use VBlankIntrWait instead of WaitForVSync
void VBlankIntrWait(void) {
  //disable interrupts
  REG_IME = 0x00;
  //point interrupt handler to custom function
  REG_INTERRUPT = (u32)ISR_VBlankIntrWait;
  //enable button interrupt
  REG_DISPSTAT |= DSTAT_USE_VBLANK;
  REG_IE |= INT_VBLANK;
  //enable interrupts
  REG_IME = 0x01;
  // halt the cpu
  asm volatile("swi 0x050000");  // ARM code
  //asm volatile("swi 0x05");  // THUMB code
}

// Interrupt Service Routine for VBlankIntrWait
void ISR_VBlankIntrWait(void) {
  u16 IntFlag;
  //disable interrupts
  REG_IME = 0x00;
  //backup the interrupt flags
  IntFlag = REG_IF;
  // look/wait for vertical refresh
  if( (REG_IF & INT_VBLANK) == INT_VBLANK){
    // how to continu to normal mode?
    REG_IFBIOS |= INT_VBLANK;  // signal bios that the VBLANK has occured
  }
  //restore interrupts flags
  REG_IF = IntFlag;
  //enable interrupts
  REG_IME = 0x01;
}
