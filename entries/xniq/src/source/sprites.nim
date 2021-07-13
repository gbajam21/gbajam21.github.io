include prelude

type Sprite* = object
  initialised*: bool
  obj*: ObjAttr
  pos*: Vec2i
  tileId: int
  prevFrame: int
  frame*: int
  graphic*: Graphic

proc destroy*(self: var Sprite)

proc init*(self: var Sprite, g: Graphic, pos = vec2i()) =
  if self.initialised:
    self.destroy()
  
  self.graphic = g
  self.tileId = allocObjTiles(g)
  self.obj.init(
    pos = pos,
    tid = self.tileId,
    pal = acquireObjPal(g),
    size = g.size,
  )
  self.pos = pos
  self.prevFrame = -1
  self.frame = 0
  self.initialised = true

proc destroy*(self: var Sprite) =
  if self.initialised:
    freeObjTiles(self.tileId)
    releaseObjPal(self.graphic)
    self.initialised = false

proc draw*(self: var Sprite) =
  if self.initialised:
  
    if self.prevFrame != self.frame:
      self.prevFrame = self.frame
      copyFrame(addr objTileMem[self.tileId], self.graphic, self.frame)
    
    withObj:
      obj = self.obj.dup(pos = self.pos)


type GrowSpriteState = enum
  gsGrowing
  gsWaiting
  gsShrinking

type GrowSprite* = object
  spr: Sprite
  state: GrowSpriteState
  timer: int
  scale: Fixed

const Forever = 99999

proc init*(self: var GrowSprite, g: Graphic, pos = vec2i(), duration = Forever) =
  self.spr.init(g, pos)
  self.timer = duration
  self.scale = fp(0)
  self.state = gsGrowing

proc destroy*(self: var GrowSprite) =
  self.spr.destroy()

proc update*(self: var GrowSprite) =
  if self.spr.initialised:
    case self.state
    of gsGrowing:
      self.scale.approach(fp(1), (fp(1) - self.scale) / 8 + fp(1/128))
      if self.scale == fp(1):
        inc self.state
    of gsWaiting:
      if self.timer != Forever:
        dec self.timer
        if self.timer <= 0:
          inc self.state
    of gsShrinking:
      self.scale.approach(fp(0), fp(1/16))
      if self.scale == fp(0):
        self.destroy()
    # log("%d", self.scale)

proc draw*(self: var GrowSprite) =
  let spr = addr self.spr
  
  if spr.initialised and self.scale > fp(0):
    
    if spr.prevFrame != spr.frame:
      spr.prevFrame = spr.frame
      copyFrame(addr objTileMem[spr.tileId], spr.graphic, spr.frame)
    
    withObjAndAff:
      affScaleInv(aff, self.scale, self.scale)
      obj = spr.obj.dup(
        pos = spr.pos,
        mode = omAff,
        aff = affId
      )
