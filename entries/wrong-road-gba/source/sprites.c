/*
 * File: sprites.c
 * Date: 2021-06-26
 * Program: sprite functions
 * Author: Jenswa
 * Copyright (c) 2021; Johan Jansen
 * License: New BSD License
 */

// general declarations that need to be included from the main project file
/*
#include "gba.h"  //GBA register definitions
*/

// variables
u16* OAM = (u16*)0x7000000;  // object attribute memory
OAMEntry sprites[128];  // array of 128 sprites

// function prototypes
void CopyOAM(void);
void InitializeSprites(void);
void MoveSprite(OAMEntry* sp, int x, int y);
void FlipSprite(s8 n, bool h, bool v);

//copy OAM with dma channel 3
void CopyOAM() {
  REG_DM3SAD = (u32)sprites;
  REG_DM3DAD = (u32)OAM;
  REG_DM3CNT = 128 * 4 | DMA_16NOW;
}

// Set sprites off screen
void InitSprites() {
  int i = 0;
  for ( i = 0; i < 128; i++ ) {
    sprites[i].attribute0 = 160;  //y > 159
    sprites[i].attribute1 = 240;  //x > 239
  }
}

//move a sprite
void MoveSprite(OAMEntry* sp, int x, int y) {
  if ( x < 0 ) {   //if it is off the left, correct
    x = 512 + x;
  }
  if ( y < 0 ) {  //if off the top, correct
    y = 256 + y;
  }
  sp->attribute1 = sp->attribute1 & 0xFE00;  //clear the old x value
  sp->attribute1 = sp->attribute1 | x;  // set the new x value
  sp->attribute0 = sp->attribute0 & 0xFF00;  //clear the old y value
  sp->attribute0 = sp->attribute0 | y;  // set the new y value
}

//flip sprite, n = sprite number, h = horizontal flip (0 or 1), v = vertical flip (0 or 1)
void FlipSprite(s8 n, bool h, bool v) {
  if ( v ) {  // flip the sprite vertically
    sprites[n].attribute1 |= VERTICAL_FLIP;
  }
  else{  // back to original unflipped sprite
    sprites[n].attribute1 &= ~VERTICAL_FLIP;
  }
  if ( h ) {  //flip the sprite horizontally
    sprites[n].attribute1 |= HORIZONTAL_FLIP;
  }
  else{  //back to original unflipped sprite
    sprites[n].attribute1 &= ~HORIZONTAL_FLIP;
 }
}
