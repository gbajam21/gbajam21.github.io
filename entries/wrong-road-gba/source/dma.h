//dma.h
#ifndef __DMA__
#define __DMA__

#define DMA_ENABLE                  0x80000000
#define DMA_INTERUPT_ENABLE         0x40000000
#define DMA_TIMING_IMMEDIATE        0x00000000
#define DMA_TIMING_VBLANK           0x10000000
#define DMA_TIMING_HBLANK           0x20000000
#define DMA_TIMING_SYNC_TO_DISPLAY  0x30000000
#define DMA_TIMING_DSOUND           0x30000000
#define DMA_16                      0x00000000
#define DMA_32                      0x04000000
#define DMA_REPEAT                  0x02000000
#define DMA_SOURCE_INCREMENT        0x00000000
#define DMA_SOURCE_DECREMENT        0x00800000
#define DMA_SOURCE_FIXED            0x01000000
#define DMA_DEST_INCREMENT          0x00000000
#define DMA_DEST_DECREMENT          0x00200000
#define DMA_DEST_FIXED              0x00400000
#define DMA_DEST_RELOAD             0x00600000

#define DMA_32NOW  (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_32) 
#define DMA_16NOW  (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_16) 

// multiline macro for a transfer using dma3
#define DMA3_COPY(source, dest, wordcount, mode) \
  REG_DM3SAD = (u32)source; \
  REG_DM3DAD = (u32)dest; \
  REG_DM3CNT = wordcount | mode  // type the last semicolon after calling this macro, so it will return an error if forgotten

#endif
