////////////////////////////////////////////////////////////////////////
// File:		interrupt.h
// Description:		interrupt header file
// Author:		Jenswa
// Date:		17th January 2004
////////////////////////////////////////////////////////////////////////

#ifndef INTERRUPT_HEADER
#define INTERRUPT_HEADER

#define INT_VBLANK 0x0001
#define INT_HBLANK 0x0002
#define INT_VCOUNT 0x0004
#define INT_TIMER0 0x0008
#define INT_TIMER1 0x0010
#define INT_TIMER2 0x0020
#define INT_TIMER3 0x0040
#define INT_COM    0x0080
#define INT_DMA0   0x0100
#define INT_DMA1   0x0200
#define INT_DMA2   0x0400
#define INT_DMA3   0x0800
#define INT_BUTTON 0x1000
#define INT_CART   0x2000

#endif
