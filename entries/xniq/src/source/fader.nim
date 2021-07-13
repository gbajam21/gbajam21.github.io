include prelude

var fadeAmount*: uint
var fadeColor: Color = clrWhite

proc flushPalsWithFade* {.inline.} =
  ## 
  ## Copy the palette buffers into PAL RAM.
  ## 
  ## This should be called every frame during VBlank.
  ## 
  # memcpy32(addr bgPalMem, addr palBuf, sizeof(palBuf) div sizeof(uint32))
  clrFadeFast(addr bgColorBuf[0], fadeColor, addr bgColorMem[0], 16*32, fadeAmount.uint32)

