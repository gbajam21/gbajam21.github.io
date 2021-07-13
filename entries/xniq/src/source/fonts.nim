import natu/tte

{.compile:"../fonts/fntNumbersSmall.c".}
var fntNumbersSmallData* {.importc:"NumbersSmallFont", extern:"NumbersSmallFont", codegenDecl:"extern const $# $#".}: FontObj
template fntNumbersSmall*:Font = addr fntNumbersSmallData


# font prep code from goodboy
# ---------------------------

include prelude
import natu/surface
import utils

const bgnr* = 0
const cbb* = 0     # where to store the tile gfx
const sbb* = 31    # where to store the map data
const pal* = 0    # which palette slot to use

var tcMain*: TextContextObj 
var mainTextTiles: ptr UncheckedArray[Tile]
var mainTextEntries: ptr UncheckedArray[ScrEntry]
var mainTextSeDest: ptr UncheckedArray[ScrEntry]
var mainTextFirstTid: int
var tx1,tx2,ty1,ty2: int

proc refreshMainTextTiles*() =
  ## Copy over the tile contents from the original image
  for y in ty1..<ty2:
    for x in tx1..<tx2:
      let srcSe = mainTextEntries[x + y*32]
      let dstSe = mainTextSeDest[x + y*32]
      let srcTile = addr mainTextTiles[srcSe.tid]
      let dstTile = addr bgTileMem[cbb][dstSe.tid]
      memcpy32(dstTile, srcTile, sizeof(Tile) div sizeof(uint32))

proc initMainText*(
  firstTid: int,
  tiles: ptr UncheckedArray[Tile],
  entries: ptr UncheckedArray[ScrEntry],
  bounds: Rect,
  seDest: ptr UncheckedArray[ScrEntry]
): int =
  
  let tc = addr tcMain
  let surface = addr tc.dst.SurfaceChr4c
  tte.setContext(tc)
  tte.initBase(fntNumbersSmall, chr4cDrawgB4CTS, chr4cErase)
  
  mainTextFirstTid = firstTid
  mainTextTiles = tiles
  mainTextEntries = entries
  mainTextSeDest = seDest
  
  tx1 = bounds.left div 8
  ty1 = bounds.top div 8
  tx2 = (bounds.right + 7) div 8
  ty2 = (bounds.bottom + 7) div 8
  let tw = tx2-tx1
  let th = ty2-ty1
  
  # prepare a section of the map as a 4bpp column-major surface
  block:
    var i = firstTid
    for x in tx1..<tx2:
      for y in ty1..<ty2:
        let se = addr seDest[x + y*32]
        let srcTile = addr bgTileMem[cbb][se[].tid]
        let dstTile = addr bgTileMem[cbb][i]
        se[].tid = i
        # note: possible bug here if srcTile is flipped :\
        # May want to disable flipping during conversion.
        memcpy32(dstTile, srcTile, sizeof(Tile) div sizeof(uint32))
        inc i
    surface.init(
      data = addr bgTileMem[cbb][firstTid],
      width = (tw * 8).uint,
      height = (th * 8).uint,
      pal = addr bgPalMem[pal]
    )
  
  tc.flags0 = bgnr
  tc.ctrl = bgcnt[0]
  tc.ink = 1
  tc.shadow = 2
  tc.paper = 3
  
  tte.setMargins(
    left = bounds.left - tx1*8,
    top = bounds.top - ty1*8,
    right = bounds.right - tx1*8,
    bottom = bounds.bottom - ty1*8,
  )
  tte.setPos(bounds.left - tx1*8, bounds.top - ty1*8)
  
  # return the next free tid
  firstTid + tw * th