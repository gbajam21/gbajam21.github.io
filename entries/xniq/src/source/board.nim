include prelude
import natu/posprintf
import sprites
import savedata
import fader

import levels
import audio

const
  MaxColors* = 5
  CellWidth* = 16
  CellHeight* = 16
  CellDimensions* = vec2i(CellWidth, CellHeight)
  MaxTime* = fp 4096

type
  Cursor* = object
    obj: ObjAttr
    pos*: Vec2i
    gridDest*: Vec2i
    gridPos*: Vec2i
    frame: int
    dirty: bool
    isGrabbing*: bool
    isMoving*: bool

proc init(self: var Cursor) =
  self.obj.init(
    tid = allocObjTiles(gfxCursor),
    pal = acquireObjPal(gfxCursor),
    size = gfxCursor.size,
  )
  copyFrame(addr objTileMem[self.obj.tid], gfxCursor, 0)

proc `=destroy`(self: var Cursor) =
  freeObjTiles(self.obj.tid)
  releaseObjPal(gfxCursor)

proc update(self: var Cursor) = 
  let target = self.gridDest * CellDimensions
  self.pos.x.approach(target.x, 2)
  self.pos.y.approach(target.y, 2)
  if self.pos == target:
    self.gridPos = self.gridDest
    self.isMoving = false
  else:
    self.isMoving = true 
  
  self.dirty = false
  if self.isGrabbing:
    if self.frame == 0:
      self.frame = 1
      self.dirty = true
  else:
    if self.frame == 1:
      self.frame = 0
      self.dirty = true

proc draw(self: Cursor, offset: Vec2i) = 
  if self.dirty:
    copyFrame(addr objTileMem[self.obj.tid], gfxCursor, self.frame)
  withObj:
    obj = self.obj.dup(pos = self.pos + offset + vec2i(-8, -8))


type
  CellColor = range[0..(MaxColors-1)]
  
  CellKind = enum
    ckNormal
    ckBonus
    ckLocked
    ckFrozen
  
  Cell = object
    obj: ObjAttr
    color: CellColor
    kind: CellKind
  
  BoardState = enum
    bsIdle      # Movement allowed
    bsMoving    # Cursor is moving and/or shifting a row/column
    bsPopping   # A match has been made, cells burst.
    bsSpawning  # Then we spawn in some new cells.
    bsDying     # Game over, all pieces fade away
    bsFadeOut
  
  WrapDir* = enum
    wdNone
    wdUp
    wdDown
    wdLeft
    wdRight
  
  Board* = object
    cells: seq[Cell]
    fakeCell: Cell     # Extra cell for the "wrapping" illusion
    wrapDir*: WrapDir  # Allow the game to check which direction a row/column or cursor sprite is wrapping.
    state: BoardState
    w*, h*: int
    pos*: Vec2i
    numColors: int
    fullRows: seq[int]
    fullCols: seq[int]
    animTimer: int
    animScale: Fixed   # popped cells will shrink, new cells will grow
    
    # rendering stuffs
    cellTileId: int
    tintPalId: int  # copy of cell palette with brightness/darkness applied.
    
    levelNumTileId: int
    
    cursor*: Cursor
    
    level*: int
    tilesToLevelUp: int
    
    score*: int
    timer*: Fixed
    deathTimer: int  # for ending animation
    
    gameOverMsg: GrowSprite
    highScoreMsg: GrowSprite
    continueMsg: GrowSprite
    bonusMsg: GrowSprite
    
    bestScore: uint
    done*: bool


const NumCellKinds = ord(CellKind.high) + 1

proc cellSpriteOffset(cell: Cell): int =
  (cell.color * NumCellKinds + ord(cell.kind)) * gfxCell.frameTiles

proc `[]`*(self: Board; x, y: int): Cell {.inline.} =
  self.cells[x + y * self.w]

proc `[]`*(self: var Board; x, y: int): var Cell {.inline.} =
  self.cells[x + y * self.w]

proc `[]=`*(self: var Board; x, y: int; v: Cell) {.inline.} =
  self.cells[x + y * self.w] = v

proc init*(self: var Board; w, h: int; numColors = 3, level = 0) =
  self.cells.setLen(w * h)
  self.w = w
  self.h = h
  self.fullRows.setLen(0)
  self.fullCols.setLen(0)
  self.numColors = numColors
  self.cursor.init()
  self.animTimer = 0
  self.animScale = fp(1.0)
  self.level = level
  self.score = 0
  self.timer = MaxTime
  self.tilesToLevelUp = levels[self.level].levelUpTileCount
  self.bestScore = savedata.getBestScore()
  
  # allocate tiles and palettes
  self.cellTileId = allocObjTiles(gfxCell.allTiles)
  copyAllFrames(addr objTileMem[self.cellTileId], gfxCell)
  
  self.levelNumTileId = allocObjTiles(gfxBigNumbers.allTiles)
  copyAllFrames(addr objTileMem[self.levelNumTileId], gfxBigNumbers)
  
  let cellPalId = acquireObjPal(gfxCell)
  self.tintPalId = allocObjPal()
  
  # prepare board
  for y in 0..<self.h:
    for x in 0..<self.w:
      let c = addr self[x, y]
      c.color = qranRange(0, self.numColors)
      c.kind = ckNormal
      c.obj.init(
        tid = self.cellTileId,
        pal = cellPalId,
        size = gfxCell.size,
      )

proc `=destroy`*(self: var Board) =
  # free tiles and palettes
  freeObjTiles(self.cellTileId)
  releaseObjPal(gfxCell)

var ckLockedCount = 0
var ckFrozenCount = 0
var ckBonusCount = 0

proc levelUp(self: var Board) =
  if self.level < levelMax - 1 :
    self.level += 1
    self.timer = MaxTime
    self.tilesToLevelUp = levels[self.level].levelUpTileCount
    audio.playSound(sfxSpecialLoud)

proc countTileTypes(self: Board) =
  ckLockedCount = 0
  ckFrozenCount = 0
  ckBonusCount = 0
  
  for y in 0..<self.h:
    for x in 0..<self.w:
      case self[x,y].kind
      of ckNormal:
        discard
      of ckLocked:
        ckLockedCount += 1
      of ckFrozen:
        ckFrozenCount += 1
      of ckBonus:
        ckBonusCount += 1

proc inputAllowed*(self: Board): bool =
  self.state == bsIdle

proc shiftRowLeft*(self: var Board, y: int) =
  let temp = self[0, y]
  for x in countup(0, self.w-2):
    self[x, y] = self[x+1, y]
  self[self.w-1, y] = temp

proc shiftRowRight*(self: var Board, y: int) =
  let temp = self[self.w-1, y]
  for x in countdown(self.w-1, 1):
    self[x, y] = self[x-1, y]
  self[0, y] = temp

proc shiftColUp*(self: var Board, x: int) =
  let temp = self[x, 0]
  for y in countup(0, self.h-2):
    self[x, y] = self[x, y+1]
  self[x, self.h-1] = temp

proc shiftColDown*(self: var Board, x: int) =
  let temp = self[x, self.h-1]
  for y in countdown(self.h-1, 1):
    self[x, y] = self[x, y-1]
  self[x, 0] = temp


proc checkMatch(self: var Board): bool =

  self.fullRows = @[]
  self.fullCols = @[]
  
  for y in 0..<self.h:
    let color = self[0, y].color
    var count = 1
    for x in 1..<self.w:
      if self[x, y].color == color:
        inc count
    if count == self.h:
      self.fullRows.add(y)
  
  for x in 0..<self.w:
    let color = self[x, 0].color
    var count = 1
    for y in 1..<self.h:
      if self[x, y].color == color:
        inc count
    if count == self.w:
      self.fullCols.add(x)
  
  result = (self.fullRows.len > 0 and self.fullCols.len > 0)

proc move*(self: var Board, dir: Vec2i) =
  
  #Am I allowed to make this move?
  let cursorX = self.cursor.gridDest.x
  let cursorY = self.cursor.gridDest.y
  
  var moveAllowed = true;
  
  if self.cursor.isGrabbing:
    if dir.x != 0:
      if (dir.x < 0 and self[0,cursorY].kind == ckLocked) or (dir.x > 0 and self[self.w-1,cursorY].kind == ckLocked):
        moveAllowed = false
      else:
        for x in 0..<self.w:
          if self[x,cursorY].kind == ckFrozen:
            moveAllowed = false
    if dir.y != 0 and moveAllowed:
      if (dir.y < 0 and self[cursorX,0].kind == ckLocked) or (dir.y > 0 and self[cursorX,self.h-1].kind == ckLocked):
        moveAllowed = false
      else:
        for y in 0..<self.h:
          if self[cursorX,y].kind == ckFrozen:
            moveAllowed = false
  
  if moveAllowed:
    if self.cursor.isGrabbing:
      audio.playSound(sfxClick)
    self.cursor.gridDest += dir
    self.state = bsMoving

# iterator fullColCells(self: var Board): tuple[x, y: int; cell: var Cell] =
#   for x in self.fullCols:
#     for y in 0..<self.h:
#       yield (x, y, self[x, y])

# iterator fullRowCells(self: var Board): tuple[x, y: int; cell: var Cell] =
#   # As above but ignore ones that were already matched by fullColCells
#   for y in self.fullRows:
#     for x in 0..<self.w:
#       if x notin self.fullCols:
#         yield (x, y, self[x, y])

iterator poppedCells(self: var Board): tuple[x, y: int; cell: var Cell] =
  for x in self.fullCols:
    for y in 0..<self.h:
      yield (x, y, self[x, y])
  for y in self.fullRows:
    for x in 0..<self.w:
      if x notin self.fullCols:
        yield (x, y, self[x, y])

proc checkGameOver(self: var Board) =
  if self.timer <= 0:
    audio.stopSong()
    self.state = bsDying
    self.gameOverMsg.init(gfxGameOver, vec2i(88, 60))
    self.continueMsg.init(gfxContinue, vec2i(88, 90))
    if self.score.uint > self.bestScore:
      saveBestScore(self.score.uint)
      self.highScoreMsg.init(gfxHighScore, vec2i(87, 30))

proc update*(self: var Board) =
  
  # if self.state != bsFadeOut:
  #   fadeAmount.approach(0, 1)
  if self.state != bsFadeOut and fadeAmount > 0:
    dec fadeAmount
  
  self.fakeCell.obj.mode = omHide
  self.wrapDir = wdNone
  
  for y in 0..<self.h:
    for x in 0..<self.w:
      self[x, y].obj.pos = self.pos + vec2i(x, y) * CellDimensions
  
  case self.state
  
  of bsIdle:
    if self.timer > 0:
      self.timer = self.timer - levels[self.level].timerScale
    self.cursor.update()
    
    self.checkGameOver()
  
  of bsMoving:
    
    if self.timer > 0:
      self.timer = self.timer - levels[self.level].timerScale
    
    let oldPos = self.cursor.gridPos
    self.cursor.update()
    let newPos = self.cursor.gridPos
    
    if self.cursor.isGrabbing:
      
      let gp = oldPos
      
      # offset all pieces by cursor movement amount
      let delta =
        if newPos != oldPos: (oldPos - newPos) * CellDimensions
        else: (newPos * CellDimensions) - self.cursor.pos
      
      if delta.x != 0:
        for x in 0..<self.w:
          let c = addr self[x, gp.y]
          c.obj.x = c.obj.x - delta.x
      else:
        for y in 0..<self.h:
          let c = addr self[gp.x, y]
          c.obj.y = c.obj.y - delta.y
      
      self.fakeCell = block:
        var fake: Cell
        if delta.x > 0:
          fake = self[0, gp.y]
          fake.obj.x = fake.obj.x + self.w * CellWidth
          self.wrapDir = wdRight
        elif delta.x < 0:
          fake = self[self.w-1, gp.y]
          fake.obj.x = fake.obj.x - self.w * CellWidth
          self.wrapDir = wdLeft
        elif delta.y > 0:
          fake = self[gp.x, 0]
          fake.obj.y = fake.obj.y + self.h * CellHeight
          self.wrapDir = wdDown
        elif delta.y < 0:
          fake = self[gp.x, self.h-1]
          fake.obj.y = fake.obj.y - self.h * CellHeight
          self.wrapDir = wdUp
        fake
    
    else:
      let dest = self.cursor.gridDest
      self.wrapDir =
        if dest.x < 0:          wdLeft
        elif dest.x > self.w-1: wdRight
        elif dest.y < 0:        wdUp
        elif dest.y > self.h-1: wdDown
        else: wdNone
    
    if not self.cursor.isMoving:
      
      # wrap the row/column
      if self.cursor.isGrabbing:
        if newPos.x < oldPos.x: self.shiftRowLeft(newPos.y)
        elif newPos.x > oldPos.x: self.shiftRowRight(newPos.y)
        elif newPos.y < oldPos.y: self.shiftColUp(newPos.x)
        elif newPos.y > oldPos.y: self.shiftColDown(newPos.x)
      
      # send the cursor to the other side of the screen if it wrapped
      var p = self.cursor.gridPos
      if p.x < 0:          p.x = self.w-1
      elif p.x > self.w-1: p.x = 0
      elif p.y < 0:        p.y = self.h-1
      elif p.y > self.h-1: p.y = 0
      
      self.cursor.gridPos = p
      self.cursor.gridDest = p
      self.cursor.pos = p * CellDimensions
      
      if self.checkMatch():
        
        audio.playSound(sfxNewpiecesLoud)
        
        self.state = bsPopping
        self.animTimer = 25
        
        var points = 0
        var typeBreak = 0
        var bonus = 0
        
        let poppedCellCount = (len(self.fullCols) * self.h) + (len(self.fullRows) * (self.w - len(self.fullCols)))
        
        self.tilesToLevelUp -= poppedCellCount
        
        if levels[self.level].levelUpTileCount > 0 and self.tilesToLevelUp <= 0:
          levelUp(self)
        
        for row in self.fullRows:
          for x in 0..<self.w:
            if self[x,row].kind == ckBonus: bonus += 1
            if not ((row-1) in self.fullRows) and row-1 >= 0 and self[x,row-1].kind != ckNormal: 
              self[x,row-1].kind = ckNormal
              inc typeBreak
            if not ((row+1) in self.fullRows) and row+1 < self.h and self[x,row+1].kind != ckNormal: 
              self[x,row+1].kind = ckNormal
              inc typeBreak
        for col in self.fullCols:
          for y in 0..<self.h:
            if self[col,y].kind == ckBonus: bonus += 1
            if not ((col-1) in self.fullCols) and col-1 >= 0 and self[col-1,y].kind != ckNormal: 
              self[col-1,y].kind = ckNormal
              inc typeBreak
            if not ((col+1) in self.fullCols) and col+1 < self.w and self[col+1,y].kind != ckNormal: 
              self[col+1,y].kind = ckNormal
              inc typeBreak
        
        points += bonus * 200
        points += typeBreak * 30
        
        if typeBreak > 0: audio.playSound(sfxWooshLoud)
        elif bonus > 0: audio.playSound(sfxAppearLoud)
        
        if self.timer > MaxTime - MasterSpeedThreshold:
          #Master speed (x2.5)
          log("Master Speed")
          points += poppedCellCount * 125
        elif self.timer > MaxTime - GreatSpeedThreshold:
          #Great speed (x2)
          log("Great Speed")
          points += poppedCellCount * 100
        elif self.timer > MaxTime - GoodSpeedThreshold:
          #Good speed (x1.5)
          log("Good Speed")
          points += poppedCellCount * 75
        else:
          #normal speed (x1)
          points += poppedCellCount * 50
        
        self.timer = MaxTime
        
        self.score += points
        
        # copy the matched palette into the popped palette
        objPalBuf[self.tintPalId] = objPalBuf[getPalId(gfxCell)]
        
        # set all popped cell sprites to use that palette, and make them scaleable
        for (x,y,c) in self.poppedCells:
          c.obj.pal = self.tintPalId
          c.obj.mode = omAff
      
      else:
        self.state = bsIdle
      
      self.checkGameOver()
  
  of bsPopping:
    
    # brighten the popped palette
    for color in mitems(objPalBuf[self.tintPalId]):
      color = rgb5(
        min(color.r + 3, 31),
        min(color.g + 3, 31),
        min(color.b + 3, 31),
      )
    
    dec self.animTimer
    
    if self.animTimer <= 18:
      self.animScale.approach(fp(0), fp(1/8))
    
    if self.animTimer <= 0:
      # time to spawn in some new cells
      self.state = bsSpawning
      self.animTimer = 8
      
      countTileTypes(self)
      
      let poppedCellCount = (len(self.fullCols) * self.h) + (len(self.fullRows) * (self.w - len(self.fullCols)))
      
      var spawnBonusTileAt = -1
      var spawnLockedTileAt = -1
      var spawnFrozenTileAt = -1
      
      #choose a spawn location for a bonus tile if there are less than the max bonus tiles on the board and a spawn chance check is passed.
      if(ckBonusCount < levels[self.level].bonusTileMax and qranRange(0,100) < levels[self.level].bonusTileChance):
        spawnBonusTileAt = qranRange(0,poppedCellCount - 1)
      
      #choose a spawn location for a Locked tile if there are less than the max bonus tiles on the board and a spawn chance check is passed.
      if(ckLockedCount < levels[self.level].lockedTileMax):
        while(spawnLockedTileAt == spawnBonusTileAt or spawnLockedTileAt < 0):
          spawnLockedTileAt = qranRange(0,poppedCellCount - 1)
      
      #choose a spawn location for a Locked tile if there are less than the max bonus tiles on the board and a spawn chance check is passed.
      if(ckFrozenCount < levels[self.level].frozenTileMax):
        while(spawnFrozenTileAt == spawnBonusTileAt or spawnFrozenTileAt == spawnLockedTileAt or spawnFrozenTileAt < 0):
          spawnFrozenTileAt = qranRange(0,poppedCellCount - 1)
      
      var tileSpawnCount = 0
      
      for (x,y,c) in self.poppedCells:
        c.color = qranRange(0, self.numColors)
        c.obj.pal = getPalId(gfxCell)
        
        if tileSpawnCount == spawnBonusTileAt: c.kind = ckBonus
        elif tileSpawnCount == spawnLockedTileAt: c.kind = ckLocked
        elif tileSpawnCount == spawnFrozenTileAt: c.kind = ckFrozen
        else: c.kind = ckNormal
        
        c.obj.tid = self.cellTileId + cellSpriteOffset(c)
        
        tileSpawnCount += 1
  
  of bsSpawning:
    
    self.animScale.approach(fp(1), fp(1/8))
    
    dec self.animTimer
    if self.animTimer <= 0:
      # give control back to the player
      self.state = bsIdle
      
      # stop scaling the sprites
      for (x,y,c) in self.poppedCells:
        c.obj.mode = omReg
  
  of bsDying:
    
    inc self.deathTimer
    
    if self.deathTimer > 40:
      self.gameOverMsg.update()
      
    if self.deathTimer > 80:
      self.highScoreMsg.update()
    
    if self.deathTimer > 110:
      self.continueMsg.update()
    
    if self.deathTimer > 130 and keyHit(kiA):
      self.state = bsFadeOut
  
  of bsFadeOut:
    if fader.fadeAmount < 31:
      inc fader.fadeAmount
    else:
      self.done = true
  
  self.bonusMsg.update()
  

proc draw*(self: var Board) =
  
  if self.state in {bsDying, bsFadeOut}:
    
    self.gameOverMsg.draw()
    self.highScoreMsg.draw()
    self.continueMsg.draw()
    
    for y in 0..<self.h:
      let scale = fp(1) - (fp(self.deathTimer - y*8) / 16).clamp(fp(0), fp(1))
      if scale > 0:
        withAff:
          affScaleInv(aff, scale, scale)
          for x in 0..<self.w:
            # draw scaled cell sprite
            let cell = self[x, y]
            withObj:
              obj = cell.obj.dup(
                mode = omAff,
                aff = affId,
                tid = self.cellTileId + cellSpriteOffset(cell)
              )
  
  else:
    
    # using an affine matrix for scaling
    withAff:
      let scale = self.animScale
      if scale > fp(0):
        affScaleInv(aff, scale, scale)
      
      for cell in self.cells:
        if cell.obj.mode == omAff:
          # draw scaled cell sprite
          if scale != fp(0):
            withObj:
              obj = cell.obj.dup(aff = affId)
              obj.tid = self.cellTileId + cellSpriteOffset(cell)
        else:
          # draw regular cell sprite
          withObj:
            obj = cell.obj
            obj.tid = self.cellTileId + cellSpriteOffset(cell)
    
    # draw fake cell for wrapping illusion
    withObj:
      obj = self.fakeCell.obj
      obj.tid = self.cellTileId + cellSpriteOffset(self.fakeCell)
    
    # draw cursor
    self.cursor.draw(self.pos)
    
    # draw copy of cursor for wrapping illusion
    if self.cursor.isMoving:
      let bw = self.w * CellWidth
      let bh = self.h * CellHeight
      let dest = self.cursor.gridDest
      if dest.x < 0:        self.cursor.draw(self.pos + vec2i(bw, 0))
      if dest.x > self.w-1: self.cursor.draw(self.pos + vec2i(-bw, 0))
      if dest.y < 0:        self.cursor.draw(self.pos + vec2i(0, bh))
      if dest.y > self.h-1: self.cursor.draw(self.pos + vec2i(0, -bh))
  
