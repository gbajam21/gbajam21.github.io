# Magic string for emulators and flashcards to auto-detect save type.
asm """
.balign 4
.string "SRAM_V100"
.balign 4
"""

include prelude
import audio
import natu/legacy
import scenes/[title, game]
import utils
import savedata
import fader

system.unhandledExceptionHook = proc(e: ref Exception) =
  mgba.printf(logFatal, "%s", e.msg)
  while true: discard

var canRedraw = false

proc onVBlank =
  audio.vblank()
  if canRedraw:
    canRedraw = false
    flushPalsWithFade()
    drawScene()
    oamUpdate()  # clear unused entries, reset allocation counters
  audio.frame()

proc main =
  
  # Recommended waitstate configuration
  # (To ensure access to cart memory takes the correct number of CPU cycles)
  REG_WAITCNT = WS_STANDARD
  
  savedata.load()
  
  audio.init()
  
  irq.init()
  irq.enable(iiVBlank)
  irq.add(iiVBlank, onVBlank)
  
  setScene(TitleScene)
  #setScene(GameScene)
  
  while true:
    discard qran()  # introduce some nondeterminism to the RNG
    keyPoll()
    updateScene()
    canRedraw = true
    VBlankIntrWait()

main()
