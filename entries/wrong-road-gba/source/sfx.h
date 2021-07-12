///////////////////////////////////////////////////////////////////////////////
// sfx.h
///////////////////////////////////////////////////////////////////////////////

#ifndef SFX_H
#define SFX_H

// includes
#include "gba.h"

// some defines
#define SND_ENABLED           0x00000080
#define SND_OUTPUT_RATIO_25   0x0000
#define SND_OUTPUT_RATIO_50   0x0001
#define SND_OUTPUT_RATIO_100  0x0002
#define DSA_OUTPUT_RATIO_50   0x0000
#define DSA_OUTPUT_RATIO_100  0x0004
#define DSA_OUTPUT_TO_RIGHT   0x0100
#define DSA_OUTPUT_TO_LEFT    0x0200
#define DSA_OUTPUT_TO_BOTH    0x0300
#define DSA_TIMER0            0x0000
#define DSA_TIMER1            0x0400
#define DSA_FIFO_RESET        0x0800
#define DSB_OUTPUT_RATIO_50   0x0000
#define DSB_OUTPUT_RATIO_100  0x0008
#define DSB_OUTPUT_TO_RIGHT   0x1000
#define DSB_OUTPUT_TO_LEFT    0x2000
#define DSB_OUTPUT_TO_BOTH    0x3000
#define DSB_TIMER0            0x0000
#define DSB_TIMER1            0x4000
#define DSB_FIFO_RESET        0x8000
#define FREQUENCY             22050
#define TIMER_INTERVAL        0xFD07    // (65536-(round((2^24)/FREQUENCY)))
#define TIMER_INTERVAL_22050  0xFD07  // F = 22050 Hz
#define TIMER_INTERVAL_44100  0xFE83  // F = 44100 Hz
#define SAMPLES_PER_VBLANK    0x0170    // (FREQUENCY/60)
#define SAMPLES_PER_VBLANK_22050    0x0170    // F == 22050 Hz
#define SAMPLES_PER_VBLANK_44100    0x02DF    // F = 44100 Hz
#define TIMER_ENABLED   0x0080
#define TIMER_INT_ENABLE 0x0040
#define TIMER_OVERFLOW 0x4

// a typedef for a sample
typedef struct _sample
{
    s8  *pData;             // pointer to the raw sound data
    u32 length;             // the size of the sample (padded to 1/60th of a second)

} SAMPLE;

// function declarations
void init_sfx_system(void);
void play_sfx(const SAMPLE *pSample);

#endif
