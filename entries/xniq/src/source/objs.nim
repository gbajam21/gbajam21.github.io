import natu/[core, oam]

export oam

# initialisation:

for obj in mitems(objMem):
  obj.attr0 = omHide.uint16   # fast hide


var
  objNum = 128           # id of the object *before* the next one to be allocated (counts down)
  objNumPrev = 128
  objAffCount = 0
  objAffMax = 31

proc oamUpdate* =
  # Hide any objects that were used last frame but not this frame.
  for i in objNumPrev..<objNum:
    objMem[i].attr0 = omHide.uint16
  objNumPrev = objNum
  objNum = 128
  objAffCount = 0

proc objAlloc*: int =
  ## Get an unused OAM entry (will become invalid on the next frame)
  if objNum - 1 >= 0:
    dec objNum
  objNum

proc objAlloc*(n: int): int =
  ## Get some unused OAM entries (will become invalid on the next frame)
  if objNum - n >= 0:
    objNum -= n
  else:
    objNum = 0
  objNum

proc objAffAlloc*: int =
  ## Get an unused affine matrix (will become invalid on the next frame)
  result = objAffCount
  if objAffCount <= objAffMax:
    inc objAffCount

proc objAffReserve*: int =
  ## Permanently reserve an affine matrix
  result = objAffMax
  objAffMax -= 1

iterator mutate[T](a: var T): var T =
  yield a

template withObj*(body: untyped) =
  ## Attempts to allocate a hardware sprite, and executes `body` if successful.
  ## 
  ## Within the `body`, a mutable reference to the sprite is available via `obj`
  ## and the index of the sprite is available via `objId`.
  ## 
  ## **Example:**
  ## 
  ## .. code-block:: nim
  ##   
  ##   var monster: Monster  # some example entity
  ##   
  ##   # During VBlank
  ##   withObj:
  ##     assert(addr obj == addr objMem[objId])
  ##     obj = monster.obj    # copy attributes into OAM
  ##     obj.pos = screenPos  # edit some attributes directly
  ##  
  if objNum - 1 >= 0:
    dec objNum
    let objId {.inject.} = objNum
    for obj {.inject.} in mutate(objMem[objId]):
      body

template withObjs*(count: static[int], body: untyped) =
  if objNum - count >= 0:
    objNum -= count
    let objId {.inject.} = objNum
    let objs {.inject.} = cast[ptr array[count, ObjAttr]](addr objMem[objId])
    body

template withObjs*(count: int, body: untyped) =
  if objNum - count >= 0:
    objNum -= count
    let objId {.inject.} = objNum
    let objs {.inject.} = cast[ptr UncheckedArray[ObjAttr]](addr objMem[objId])
    body

template withAff*(body: untyped) =
  if objAffCount < objAffMax:
    let affId {.inject.} = objAffCount
    inc objAffCount
    for aff {.inject.} in mutate(objAffMem[affId]):
      body

template withObjAndAff*(body: untyped) =
  if objAffCount < objAffMax and objNum-1 >= 0:
    dec objNum
    let objId {.inject.} = objNum
    let affId {.inject.} = objAffCount
    inc objAffCount
    for obj {.inject.} in mutate(objMem[objId]):
      for aff {.inject.} in mutate(objAffMem[affId]):
        body
