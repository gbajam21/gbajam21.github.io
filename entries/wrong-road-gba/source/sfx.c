///////////////////////////////////////////////////////////////////////////////
// sfx.c (edit to match my old gba defines)
///////////////////////////////////////////////////////////////////////////////

#include "gba.h"
#include "sfx.h"

extern void SetSampleLength(int length);

// init_sfx_system - sets the registers for enabling the sound hardware and
//                   Direct Sound
// PARAMETERS:  none
// RETURNS:     none
void init_sfx_system(void)
{
    // turn on the sound chip
    REG_SOUNDCNT_X = SND_ENABLED;

    // make sure sound channels 1-4 are turned off
    REG_SOUNDCNT_L = 0;

    // set the direct sound output control register
    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | // 100% sound output
                     DSA_OUTPUT_RATIO_100 | // 100% direct sound A output
                     DSA_OUTPUT_TO_BOTH |   // output Direct Sound A to both right and left speakers
                     DSA_TIMER0 |           // use timer 0 to determine the playback frequency of Direct Sound A
                     DSA_FIFO_RESET;        // reset the FIFO for Direct Sound A
}

// play_sfx - starts the DMA of a sample and waits for it to complete
// PARAMETERS:  pSample - a pointer to the sample we want to play
// RETURNS:     none
void play_sfx(const SAMPLE *pSample)
{
    // make sure Timer 0 is off
    REG_TM0CNT = 0;

    // make sure DMA channel 1 is turned off
    REG_DM1CNT = 0;

    // make sure the FIFO is reset
    REG_SOUNDCNT_H |= DSA_FIFO_RESET;   // just set the reset bit and leave the other ones alone

    // start the timer using the appropriate frequency
    REG_TM0D   = TIMER_INTERVAL_22050;
    //REG_TM0D   = TIMER_INTERVAL_44100;
    REG_TM0CNT = TIMER_ENABLED;

    // start the DMA transfer on channel 1
    REG_DM1SAD = (u32)(pSample->pData);
    REG_DM1DAD = (u32)REG_FIFO_A;
    REG_DM1CNT = DMA_ENABLE | DMA_TIMING_DSOUND | DMA_32 | DMA_REPEAT;

    // start sampleLength counting on vblank or playback length
    SetSampleLength( pSample->length );
}
