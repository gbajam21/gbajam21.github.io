/*
 * File: keypad.c
 * Date: 2021-06-25
 * Program: put the keystates somewhere
 * Author: Jenswa
 * Copyright (c) 2003,2012,2019; Johan Jansen
 * License: New BSD License
 */

// general declarations that need to be included from the main project file
/*
#include "gba.h"  //GBA register definitions
#include "dispcnt.h"  //REG_DISPCNT register defines
#include "dstat.h"  // REG_DISPSTAT register defines
#include "keypad.h"  //keypad defines
*/

// define the virtual keys
#define VK_A       0
#define VK_B       1
#define VK_SELECT  2
#define VK_START   3
#define VK_RIGHT   4
#define VK_LEFT    5
#define VK_UP      6
#define VK_DOWN    7
#define VK_R       8
#define VK_L       9
#define MAX_KEYS   10

// structures
typedef struct tagVKey {
  bool keyDown;
  bool keyDownOnce;
} VKey;

VKey keyboard[10];

// function prototypes
void InitKeys(void);
void PollKeys(void);

// setup the boolean keystate array
void InitKeys() {
  int i = 0;
  for ( i = 0; i < MAX_KEYS; i++ ) {  // set the keystates to false on start
    keyboard[i].keyDown = false;
    keyboard[i].keyDownOnce = false;
  }
}

// polls the keystate
void PollKeys() {
  int n = 1;  // 2^n
  int i = 0;
  for ( i=0; i < MAX_KEYS; i++ ) {  // virtual keys in the array go by natural numbers (i)
    if ( KEY_DOWN( n ) ) {  // key bits in the register go by the powers of two (n)
      if ( keyboard[i].keyDown ) {  // was the key already down?
        keyboard[i].keyDownOnce = false;
      }
      else {
        keyboard[i].keyDownOnce = true;
      }
      keyboard[i].keyDown = true;
    }
    else {
      keyboard[i].keyDown = false;
      keyboard[i].keyDownOnce = false;
    }
    n *= 2;
  }
}
