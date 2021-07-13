include prelude
import natu/[tte, posprintf]
import fonts, visuals, sprites

import audio

import board as board_m

proc backToTitle()

# Game Scene
# ----------

type Game = ref object
  board: Board
  visibleScore: Fixed
  visibleLevel: int

var game: Game

var levelSelect* = 0

template board: Board = game.board
template cursor: Cursor = game.board.cursor

var textOrigin: Vec2i

proc initScoreText =
  discard initMainText(
    firstTid = 100,
    tiles = cast[ptr UncheckedArray[Tile]](bgFrame.imgDataPtr),
    entries = cast[ptr UncheckedArray[ScrEntry]](bgFrame.mapDataPtr),
    bounds = rectBounds(61, 16, 135, 23),
    seDest = cast[ptr UncheckedArray[ScrEntry]](addr seMem[31]),
  )
  textOrigin = tte.getPos()

proc setScoreText(score: int) =
  var buf: array[16, char]
  posprintf(addr buf, "%08l", score)
  refreshMainTextTiles()
  tte.setContext(addr tcMain)
  tte.setPos(textOrigin.x, textOrigin.y)
  tte.write(addr buf)

proc setLevelText(level: range[1..9]) =
  const Region = rectBounds(21, 12, 26, 16)
  const TilesPerNumber = (Region.width * Region.height)
  let bg = (ord(bgBigDigit0) + level).Background
  let entries = cast[ptr UncheckedArray[ScrEntry]](bg.mapDataPtr)
  bg.loadTiles(cbb=0)
  for srcY in 0..<Region.height:
    for srcX in 0..<Region.width:
      let dstX = Region.x + srcX
      let dstY = Region.y + srcY
      seMem[31][dstX + dstY * 32] = entries[srcX + srcY * Region.width]

var win1: Rect
var win0: Rect
var lowTimePulser: Fixed
var lowTimePulseIntensity: Fixed
var timeIsLow = false

const BarRect = rectBounds(61, 39, 88, 132)
const LowRect = rectBounds(67, 132, 88, 136)

proc hblank() {.codegenDecl: IWRAM_CODE.} =
  # Used to clip the timer bar vertically
  let v = vcount.int
  if v < win0.top:
    bgofs[bgnr].y = (-v).int16  # draw emptiness
  else:
    bgofs[bgnr].y = 0

proc onShow =
  
  audio.playSong(modDAndB)
  
  new(game)
  
  # Init BGs
  bgcnt[0].init(cbb = 0, sbb = 30)
  bgcnt[1].init(cbb = 0, sbb = 31)
  
  # Copy the tiles, map and palettes
  bgcnt[0].load(bgTimeBar)
  bgcnt[1].load(bgFrame)
  
  initScoreText()
  setScoreText(0)
  setLevelText(1)
  
  board.init(6, 6, 3, level = levelSelect)
  board.pos.x = ScreenWidth div 2 - (board.w * CellWidth) div 2
  board.pos.y = ScreenHeight div 2 - (board.h * CellHeight) div 2
  
  display.layers = { lBg0, lBg1, lObj }  # enable BG0, BG1 and sprites
  display.obj1d = true
  
  display.win1 = true
  display.win0 = true
  
  # Reset scroll
  for p in bgofs.mitems: p = initBgPoint()
  
  # Set background color
  bgColorBuf[0] = clrWhite
  
  visuals.open(vkFactory)
  
  # Add interrupt handler to mask off the timer vertically
  irq.enable(iiHBlank)
  irq.put(iiHBlank, hblank)
  
  timeIsLow = false

proc onHide =
  game = nil
  irq.disable(iiHBlank)
  visuals.close()

proc onUpdate =
  if board.inputAllowed:
    cursor.isGrabbing = keyIsDown(kiA)
    if keyIsDown(kiLeft):    board.move(vec2i(-1, 0))
    elif keyIsDown(kiRight): board.move(vec2i(1, 0))
    elif keyIsDown(kiUp):    board.move(vec2i(0, -1))
    elif keyIsDown(kiDown):  board.move(vec2i(0, 1))
  
  board.update()
  
  if board.level != game.visibleLevel:
    game.visibleLevel = board.level
    setLevelText(game.visibleLevel + 1)
  
  let diff = fp(board.score) - game.visibleScore
  game.visibleScore.approach(fp(board.score), diff / 16 + fp(0.05))
  setScoreText(game.visibleScore.toInt())
  
  const Threshold = 0.125  # at this point the time bar switches from vertical to horizontal
  
  let timeFullness = board.timer / MaxTime
  
  let upperTime = (timeFullness - fp(Threshold)) * fp(1 / (1-Threshold))
  let lowerTime = timeFullness * (fp(1/Threshold))
  
  if timeFullness > fp(Threshold):
    timeIsLow = false
    win0 = BarRect
    win0.top += (fp(BarRect.height) * (fp(1) - upperTime)).toInt()
    win0.top = min(win0.top, LowRect.y-1)
  else:
    timeIsLow = true
    win0 = LowRect
    win0.left += (fp(LowRect.width) * (fp(1) - lowerTime)).toInt()
  
  # hide sprites outside of the board while wrapping
  win1 = rectAt(0, 0, ScreenWidth, ScreenHeight)
  case board.wrapDir:
  of wdNone:
    discard
  of wdUp, wdDown:
    win1.top = board.pos.y - 1
    win1.bottom = board.pos.y + (board.h * CellHeight) + 1
  of wdLeft, wdRight:
    win1.left = board.pos.x - 1
    win1.right = board.pos.x + (board.w * CellWidth) + 1
  
  # tint frame red when low on time
  block:
    if timeFullness > fp(0.4):
      lowTimePulser = fp(0)
      lowTimePulseIntensity = fp(0)
    else:
      lowTimePulser -= fp(1/64)
      if lowTimePulser < fp(0):
        if timeFullness == fp(0):
          lowTimePulser = fp(0)
        else:
          lowTimePulser = fp(1)
      lowTimePulseIntensity.approach(fp(1), fp(1/256))
    
    let amount = lowTimePulser * lowTimePulseIntensity
    
    let colors = cast[ptr UncheckedArray[Color]](bgFrame.palDataPtr)
    template doTint(i: int) =
      bgPalBuf[0][i] = colors[i]
      bgPalBuf[0][i].r = min(31, bgPalBuf[0][i].r + (amount * 8).toInt())
      bgPalBuf[0][i].g = max(0, bgPalBuf[0][i].g - (amount * 20).toInt())
      bgPalBuf[0][i].b = max(0, bgPalBuf[0][i].b - (amount * 16).toInt())
    doTint(3)
    doTint(4)
    doTint(10)
  
  visuals.update()
  
  if board.done:
    backToTitle()

proc onDraw =
  board.draw()
  
  if timeIsLow:
    display.win0 = true
    win1cnt =   {        wlBg1, wlBg2, wlBg3, wlObj, wlBlend }
    win0cnt =   { wlBg0, wlBg1, wlBg2, wlBg3,        wlBlend }
    winoutcnt = {        wlBg1, wlBg2, wlBg3,        wlBlend }
  else:
    # when the time bar isn't going horizontally, we just use the win0 rectangle as
    # a guideline for the hblank effect, rather than using it as an actual window.
    display.win0 = false
    win1cnt =   { wlBg0, wlBg1, wlBg2, wlBg3, wlObj, wlBlend }
    winoutcnt = { wlBg0, wlBg1, wlBg2, wlBg3,        wlBlend }
  
  win1h.left = win1.left.uint8
  win1h.right = win1.right.uint8
  win1v.top = win1.top.uint8
  win1v.bottom = win1.bottom.uint8
  win0h.left = win0.left.uint8
  win0h.right = win0.right.uint8
  win0v.top = win0.top.uint8
  win0v.bottom = win0.bottom.uint8
  visuals.draw()

const GameScene* = Scene(
  show: onShow,
  hide: onHide,
  update: onUpdate,
  draw: onDraw,
)

import title

proc backToTitle() =
  setScene(TitleScene)