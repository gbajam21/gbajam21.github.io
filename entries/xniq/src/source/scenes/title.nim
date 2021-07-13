include prelude
import levels
import audio
import fader

proc goToGameScene()
proc incLevel
proc decLevel
proc getLevel: int

var slide: Vec2f
var slideX: Fixed

var levelCounter: ObjAttr
var levelCounterTid: int

proc onShow =
  
  audio.stopSong()
  
  bgcnt[3].init(cbb = 1, sbb = 29)
  bgcnt[3].load(bgFactory)
  
  bgcnt[2].init(cbb = 1, sbb = 28)
  bgcnt[2].load(bgPressStart)
  
  bldcnt.init()
  display.init(
    layers = display.layers + { lBg3, lBg2 , lObj },
    obj1d = true,
  )
  # Reset scroll
  for p in bgofs.mitems: p = initBgPoint()
  
  levelCounterTid = allocObjTiles(gfxBigNumbers.allTiles)
  copyAllFrames(addr objTileMem[levelCounterTid], gfxBigNumbers)
  
  levelCounter.init(
    tid = levelCounterTid,
    pal = acquireObjPal(gfxBigNumbers),
    size = gfxBigNumbers.size,
    pos = vec2i(0,126)
  )
  
  

proc onHide =
  display.layers = display.layers - { lBg3, lBg2 , lObj }
  
  freeObjTiles(levelCounterTid)
  releaseObjPal(gfxBigNumbers)

proc onUpdate =
  slide += vec2f(fp(2), fp(0))
  
  if fadeAmount > 0:
    dec fadeAmount
  
  if keyIsDown(kiStart):
    goToGameScene()
  if keyHit(kiLeft):
    decLevel()
    audio.playSound(sfxSlideLoud)
  if keyHit(kiRight):
    incLevel()
    audio.playSound(sfxSlideLoud)

proc onDraw =
  #bgofs[2] = slide.toBgPoint()
  
  withObj:
    obj = levelCounter
    obj.tid = levelCounterTid + getLevel()*16

const TitleScene* = Scene(
  show: onShow,
  hide: onHide,
  update: onUpdate,
  draw: onDraw,
)

import game

proc incLevel = levelSelect.approach(levelMax - 1, 1)
proc decLevel = levelSelect.approach(0, 1)
proc getLevel: int = levelSelect

import scenes/[game]

proc goToGameScene() =
  setScene(GameScene)
