/*
 * File: dstat.h
 * Date: 2019-04-25
 * Program: display interrupts header file
 * Author: Jenswa
 * Copyright (c) 2019, Johan Jansen
 * License: New BSD License
 */

#ifndef DSTAT_HEADER
#define DSTAT_HEADER

// REG_DISPSTAT
// Vblank,Hblank,Vcount
#define DSTAT_BIT_VBLANK  0x0001
#define DSTAT_BIT_HBLANK  0x0002
#define DSTAT_BIT_VCOUNT  0x0004

#define DSTAT_USE_VBLANK  0x0008
#define DSTAT_USE_HBLANK  0x0010
#define DSTAT_USE_VCOUNT  0x0020

#define DSTAT_VCOUNT_LINE(x)  ((x)<<8)

#endif
