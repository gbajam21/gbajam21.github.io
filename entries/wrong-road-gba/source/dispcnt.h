////////////////////////////////////////////////////////////////////////
// File: 	dispcnt.h                                             //
// Description: Contains all the relevant defines for the REG_DISPCNT //
//		register which can be found in gba.h                  //
// Author:	dovoto (modified by gbajunkie)                        //
// Date: 	9th January 2002                                      //
////////////////////////////////////////////////////////////////////////
#ifndef DISPCNT_H
#define DISPCNT_H

//define the bits that control the screen mode 0-5
#define MODE_0	0x0
#define MODE_1	0x1
#define MODE_2	0x2
#define MODE_3	0x3
#define MODE_4	0x4
#define MODE_5	0x5

//define the buffer which is used to set the active buffer
//when using double buffering
#define backbuffer 	0x10

//This bit, when set allows OAM(Object Attribute Memory) to
//be updated during a horizontal blank
#define H_BLANK_OAM 	0x20

//use these two defines to choose which mapping mode is used
//for sprite graphics 2D or 1D
#define OBJ_MAP_2D 	0x0
#define OBJ_MAP_1D 	0x40

//Causes the screen to go white by using a forced blank
#define FORCE_BLANK 	0x80

//define the flags for enabling backgrounds and objects(sprites)
#define BG0_ENABLE	0x100
#define BG1_ENABLE	0x200
#define BG2_ENABLE	0x400
#define BG3_ENABLE	0x800
#define OBJ_ENABLE	0x1000

//allows window displays (dont worry about these)
#define WIN1_ENABLE	0x2000
#define WIN2_ENABLE	0x4000
#define WINOBJ_ENABLE	0x8000


//Set the mode that you want to use, logical AND them together as below:
//e.g. SetMode(MODE_2 | OBJ_ENABLE | OBJ_MAP_1D);
#define SetMode(mode) REG_DISPCNT = (mode)

#endif
