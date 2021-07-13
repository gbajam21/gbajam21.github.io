/*
 * File: main.c
 * Date: 2021-06-24
 * Program: wrong road for gba
 * Author: Jenswa
 * Copyright (c) 2021, Johan Jansen, Hayo van Reek
 * License: New BSD License, expect for data files like graphics, sounds and maps
 */

// general declarations
#include <stdbool.h>  // to use booleans in c
#include "gba.h"  // GBA register definitions
#include "dispcnt.h"  // REG_DISPCNT register defines
#include "dstat.h"  // REG_DISPSTAT register defines
#include "bfs.h"  // binary filesystem defines
#include "dma.h"  // dma defines
#include "lz77.c"  // LZ77 uncompress functions
#include "keypad.h"  // keypad defines
#include "keypad.c"  // keyboard functions ...
#include "reset.c"  // soft reset function with register ram reset
#include "interrupt.h"  // interrupt defines
#include "interrupt.c"  // interrupt service rountines: Sleep, VBlankIntrWait en Timer1
#include "sprites.h"  // sprite definitions
#include "sprites.c"  // sprite functions
#include "random.c"  // pseudo random number generator
#include "sfx.c"  // sfx code
#include "sfx.h"  // sfx registers
#include "samples.h"  // sample structs with binary wave data??

#define MAX_BADCARS  10  // probably no more than ten opposing racers at the same time in play
#define BASE_SCORE  0  // starting score
#define BASE_LEVEL  0  // starting level
#define BASE_SPEED  120  // starting speed: spawn a badcar every 120 seconds

// variables
typedef struct tagGlobal {
  bool gameMode;  // false means titlescreen, true means gamescreen
  bool pause;  // has the game been paused?
  int pausecursorx;  // x coordinat of the pausecursor
  int pausecursory;  // y coordinate of the pausecursor
  int loops;  // the number of gameloops passed
  int speed;  // the number of gameloops at which the opposing racers are spawned
  int score;  // game score
  int hiscore;  // game hiscore
  int level;  // game level
  int racerx;  // x coordinate of the racer
  int racery;  // y coorindate of the racer (this shouldn't change)
  int badcarnum;  // number of badcar to add
  int badcarx[MAX_BADCARS];  // x coordinate of the opposing racers
  int badcary[MAX_BADCARS];  // x coordinate of the opposing racers
  int sampleLength;  // the length of a sample to decrease on vblank
} Global;

Global global;  // for global variables

// function prototypes
void GetInputTitle(void);  // title input handling
void GetInputGame(void);  // game input handling
void Move(void);  // move opposing racers
void SetScoreCounter(int counternum, int number);  // set the score of counternum 0, 1 or 2 to a number
void CheckForCollisions();  // check for a collision between the racer and the opposing racers
void ResetBadCars();  // set all badcars to their initial positions
void ResetPlayer();  // set the racer to its initial position
void SetSampleLength(int length);  // sets the length of a sample

// main starting point
int main() {
  global.gameMode = false;  // enable title screen
  global.pause = false;  // the game has not been paused
  global.loops = 0;  // start counting at zero
  global.speed = BASE_SPEED;
  global.score = BASE_SCORE;
  global.hiscore = 0;
  global.level = BASE_LEVEL;
  InitKeys();  // setup the keys from the keyboard (keypad actually)
  InitSprites();
  
  // load title palette
  BGPaletteMem[0] = 0x0000;
  BGPaletteMem[1] = 0x11A4;
  // load the compressed title picture
  LZ77UnCompVRAM( (u32) (TITLE_BIN_OFFSET), (u32) VideoBuffer);
  
  init_sfx_system();  // init the sound effects system
  global.sampleLength = 0;  // vlbank sample counter
  
  SetMode( VIDEOMODE );  // set display mode in interrupt.c because of the sleep function
  REG_BG2CNT = 0;  // clear all BG2 parameters
  
  // main loop
  while (1) {
    PollKeys();
    if ( global.gameMode == true ) {
      GetInputGame();
      if ( global.pause == false ) {
        Move();
        CheckForCollisions();
      }
    }
    else {
      GetInputTitle();
    }
    VBlankIntrWait();
    CopyOAM();
    if ( global.sampleLength > 0 ) {
      global.sampleLength--;
    }
    if (global.sampleLength == 0 ) {  // sfx stop
      REG_DM1CNT = 0;  // stop fifo filling
      REG_TM0CNT = 0;
      REG_TM1CNT = 0;
    }
  }
}

void GetInputTitle() {
  // START key loads the game assets
  if ( keyboard[VK_START].keyDownOnce ) {
    // load track palette
    BGPaletteMem[0] = 0x0000;
    BGPaletteMem[1] = 0x0902;
    BGPaletteMem[2] = 0x11A4;
    // load the compressed track picture
    LZ77UnCompVRAM( (u32) (TRACK_BIN_OFFSET), (u32) VideoBuffer);
    
    // actually only the title screen needs to be loaded at this moment, the sprite can be loaded on start and set offscreen or disabled in the video mode
    
    // load the racer palette
    OBJPaletteMem[0] = 0x0000;
    OBJPaletteMem[1] = 0x1625;
    // load the racer sprite
    DMA3_COPY( (u32) RACER_BIN_OFFSET, (u32) OAMData + 512*32, 16*32/4, DMA_32NOW );
    
    // set the racer position
    global.racerx = 120-16/2;
    global.racery = 160 - 32;
    // setup the sprite attributes for the racer
    sprites[0].attribute0 = COLOR_256 | TALL | global.racery;  // TALL is defined right in this sprites.h
    sprites[0].attribute1 = SIZE_32 | global.racerx;
    sprites[0].attribute2 = 512;  // the first 512 tiles aren't available in mode 4
    
    // set position and sprite attributes for opposing racers
    global.badcarnum = 0;
    int i = 0;
    for ( i = 0; i < MAX_BADCARS; i++ ) {
      // position
      global.badcarx[i] = 240;
      global.badcary[i] = 0;
      // sprite attributes
      sprites[i+1].attribute0 = COLOR_256 | TALL | global.badcary[i];  // TALL is defined right in this sprites.h
      sprites[i+1].attribute1 = SIZE_32 | VERTICAL_FLIP | global.badcarx[i];
      sprites[i+1].attribute2 = 512;  // the first 512 tiles aren't available in mode 4
    }
    
    // load the font tiles
    DMA3_COPY( (u32) FONT_BIN_OFFSET, (u32) OAMData + 512*32 + RACER_BIN_SIZE, 216*8/4, DMA_32NOW );
    // setup the S character sprite attributes
    sprites[11].attribute0 = COLOR_256 | SQUARE | 0;
    sprites[11].attribute1 = SIZE_8 | 0;
    sprites[11].attribute2 = 566;  // point to the S character, the first 512 tiles aren't available in mode 4
    // setup the H character sprite attributes
    sprites[12].attribute0 = COLOR_256 | SQUARE | 8;
    sprites[12].attribute1 = SIZE_8 | 0;
    sprites[12].attribute2 = 544;  // point to the S character, the first 512 tiles aren't available in mode 4
    // setup the L character sprite attributes
    sprites[13].attribute0 = COLOR_256 | SQUARE | 16;
    sprites[13].attribute1 = SIZE_8 | 0;
    sprites[13].attribute2 = 552;  // point to the S character, the first 512 tiles aren't available in mode 4
    
    // load the number tiles
    DMA3_COPY( (u32) NUMBERS_BIN_OFFSET, (u32) OAMData + 512*32 + RACER_BIN_SIZE + FONT_BIN_SIZE, 80*8/4, DMA_32NOW );
    // setup sprite attributes for the three score counters
    int j = 0;
    for ( j = 0; j < 3; j++ ) {
      for ( i = 0; i < 3; i++ ) {
      sprites[128-10+i+j*3].attribute0 = COLOR_256 | SQUARE | j*8;
      sprites[128-10+i+j*3].attribute1 = SIZE_8 | 36 + (i-3)*8;
      sprites[128-10+i+j*3].attribute2 = 582 + i*2;
      }
      SetScoreCounter(j,0);  // set score counter j to zero as default
    }
    
    // load the pausecursor tiles
    DMA3_COPY( (u32) PAUSECURSOR_BIN_OFFSET, (u32) OAMData + 512*32 + RACER_BIN_SIZE + FONT_BIN_SIZE + NUMBERS_BIN_SIZE, 32*16/4, DMA_32NOW );
    global.pausecursorx = 32;
    global.pausecursory = 48;
    // setup sprite attributes for the pausecursor
    sprites[127].attribute0 = COLOR_256 | WIDE | 160;  // WIDE is defined right in this sprites.h
    sprites[127].attribute1 = SIZE_32 | 240;
    sprites[127].attribute2 = 602;  // the first 512 tiles aren't available in mode 4
    
    global.gameMode = true;  // enable game mode
  }
}

// read the gba keypad
void GetInputGame() {
  // LEFT key moves left
  if ( keyboard[VK_LEFT].keyDownOnce && global.pause == false ) {
    if ( global.racerx > 120-16/2 - 2*32 ) {
      play_sfx( &highbleep );
      global.racerx -= 32;
      MoveSprite(&sprites[0], global.racerx, global.racery);  // set position
    }
  }
  // RIGHT key moves right
  if ( keyboard[VK_RIGHT].keyDownOnce && global.pause == false) {
    if ( global.racerx < 120-16/2 + 2*32 ) {
      play_sfx( &highbleep );
      global.racerx += 32;
      MoveSprite(&sprites[0], global.racerx, global.racery);  // set position
    }
  }
  
  // START pauses the game
  if ( keyboard[VK_START].keyDownOnce ) {
    if (global.pause == false ) {
      global.pause = true;
      
      // move car sprites out of sight
      int i;
      for ( i = 0; i < 11; i++ ) {
        MoveSprite(&sprites[i], 240, 160);
      }
      
      // load pausemenu palette
      BGPaletteMem[0] = 0x0000;
      BGPaletteMem[1] = 0x11A4;
      // load the compressed pausemenu picture
      LZ77UnCompVRAM( (u32) (PAUSEMENU_BIN_OFFSET), (u32) VideoBuffer);
      
      // move pausecurosr in sight
      MoveSprite(&sprites[127], global.pausecursorx, global.pausecursory);
    }
    else {
      global.pause = false;
      
      // move pausecursor out of sight
      MoveSprite(&sprites[127], 240, 160);
      
      // load track palette
      BGPaletteMem[0] = 0x0000;
      BGPaletteMem[1] = 0x0902;
      BGPaletteMem[2] = 0x11A4;
      // load the compressed track picture
      LZ77UnCompVRAM( (u32) (TRACK_BIN_OFFSET), (u32) VideoBuffer);
      
      // move car sprites in sight
      int i;
      for ( i = 0; i < 10; i++ ) {
        MoveSprite(&sprites[1+i], global.badcarx[i], global.badcary[i]);
      }
      MoveSprite(&sprites[0], global.racerx, global.racery);
    }
  }
  
  // UP key moves pausecursor up during pause
  if ( keyboard[VK_UP].keyDownOnce && global.pause == true ) {
    global.pausecursory-=16;
    if ( global.pausecursory < 48 ) {
      global.pausecursory = 96;
    }
    MoveSprite(&sprites[127], global.pausecursorx, global.pausecursory);
  }
  // DOWN key moves pausecursor down during pause
  if ( keyboard[VK_DOWN].keyDownOnce && global.pause == true ) {
    global.pausecursory+=16;
    if ( global.pausecursory > 96 ) {
      global.pausecursory = 48;
    }
    MoveSprite(&sprites[127], global.pausecursorx, global.pausecursory);
  }
  // A key selects the choosen option from the pausemenu
  if ( keyboard[VK_A].keyDownOnce && global.pause == true ) {
    // the option depends on the pausecursor's y position
    if ( global.pausecursory == 48 ) {  // resume game (same actions as start to unpause)
      global.pause = false;
      
      // move pausecursor out of sight
      MoveSprite(&sprites[127], 240, 160);
      
      // load track palette
      BGPaletteMem[0] = 0x0000;
      BGPaletteMem[1] = 0x0902;
      BGPaletteMem[2] = 0x11A4;
      // load the compressed track picture
      LZ77UnCompVRAM( (u32) (TRACK_BIN_OFFSET), (u32) VideoBuffer);
      
      // move car sprites in sight
      int i;
      for ( i = 0; i < 10; i++ ) {
        MoveSprite(&sprites[1+i], global.badcarx[i], global.badcary[i]);
      }
      MoveSprite(&sprites[0], global.racerx, global.racery);
    }
    else if ( global.pausecursory == 64 ) {  // restart game
      SoftReset(1, 0xFE);  // 1 reboots to EWRAM
    }
    else if ( global.pausecursory == 80 ) {  // sleep game
      Sleep( KEYSTART | KEYL | KEYR );  // put the gba to sleep and wakeup with START+L+R key interrupt
    }
    else {  // quit game
      SoftReset(0, 0xFE);  // 0 reboots to ROM
    }
  }
}

// move opposing racers
void Move() {
  // every two seconds do ...
  if ( global.loops == global.speed ) {
    global.loops = 0;  // reset the number of game loops
    // play sound lobleep
    global.score++; // update score
    if ( global.score > global.hiscore ) {
      global.hiscore = global.score;  // update hiscore
    }
    global.level = global.score/6;  // the current level, which also determines the speed of the racer creations
    if ( global.level > 1 && global.level < 120/5 ) {
      global.speed = 120 - global.level*5;  // adjust the spawning speed based on the current game level
    }
    // update the score counters
    SetScoreCounter(0, global.score);
    SetScoreCounter(1, global.hiscore);
    SetScoreCounter(2, global.level);
    
    play_sfx( &lowbleep );
    int i = 0;
    for ( i = 0; i < MAX_BADCARS; i++ ) {
      global.badcary[i] += 32;  // move all opposing racers 32 pixels down
      // outer lanes move twice as fast
      if ( global.badcarx[i] == 120 - 16/2 - 2*32 || global.badcarx[i] == 120 - 16/2 + 2*32 ) {
        global.badcary[i] += 32;
      }
      // move out of sight
      if ( global.badcary[i] > 160 ) {
        global.badcary[i] = 0;
        global.badcarx[i] = 240;
      }
      MoveSprite(&sprites[i+1], global.badcarx[i], global.badcary[i]);  // set position
    }
    // add one or two badcars
    int oneOrTwo = 1 + random(1);
    //int i;  // was already declared inside this big if statement
    for ( i = 0; i < oneOrTwo; i++ ) {
      global.badcarx[global.badcarnum] = 120 - 16/2 - 2*32 + 32*random(5);  // x coordinate
      global.badcary[global.badcarnum] = 0;  // y coordinate
      MoveSprite(&sprites[global.badcarnum+1], global.badcarx[global.badcarnum], global.badcary[global.badcarnum]);  // move immeadiately
      global.badcarnum++;  // increase for the next free opposing racer
      if ( global.badcarnum == MAX_BADCARS ) {
        global.badcarnum = 0;
      }
    }
  }
  global.loops++; // update the number of game loops
}

// set the score of counternum 0, 1 or 2 to a number
void SetScoreCounter(int counternum, int number) {
  // the score counters are made of 3 digits, so check the number input and just overflow to zero
  if ( number > 999  ) {
    number = 0;
  }
  
  int digits[3];  // there are three digits to set
  int i;
  for ( i = 0; i < 3; i++ ) {
    digits[i] = number%10;
    number = number - digits[i];  // will this help with the division?
    number = number/10;  // perhaps speed up with a bios call that gives the result and remainder
    //sprites[128-2-i].attribute2 = 582 + (digits[i])*2;
    //sprites[128-5-i].attribute2 = 582 + (digits[i])*2;
    //sprites[128-8-i].attribute2 = 582 + (digits[i])*2;
    sprites[128-8+counternum*3-i].attribute2 = 582 + (digits[i])*2;
  }
}

// check for a collision between the racer and the opposing racers
void CheckForCollisions() {
  int i = 0;
  for ( i = 0; i < MAX_BADCARS; i++ ) {
    if ( global.racery == global.badcary[i] && global.racerx == global.badcarx[i] ) {
      play_sfx( &crash );
      ResetBadCars();
      ResetPlayer();
      global.speed = BASE_SPEED;  // reset to base speed
      global.score = BASE_SCORE;  // reset to base score
      global.level = BASE_LEVEL;  // reset to base level
      // update the score counters
      SetScoreCounter(0, global.score);
      SetScoreCounter(2, global.level);
    }
  }
}

// set all badcars to their initial positions
void ResetBadCars() {
  global.badcarnum = 0;
  int i = 0;
  for ( i = 0; i < MAX_BADCARS; i++ ) {
    global.badcarx[i] = 240;
    global.badcary[i] = 0;
    MoveSprite(&sprites[1+i], global.badcarx[i], global.badcary[i]);  // move immeadiately
  }
}

// set the racer to its initial position
void ResetPlayer() {
  global.racerx = 120-16/2;
  global.racery = 160 - 32;
  MoveSprite(&sprites[0], global.racerx, global.racery);  // move immeadiately
}

void SetSampleLength(int length) {
  global.sampleLength = length*60/22050;
}
