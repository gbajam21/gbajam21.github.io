include prelude

type SaveData = object
  header: uint32
  score: uint

var sav {.codegenDecl:EWRAM_BSS, align:4.}: SaveData
  ## in-memory copy of save data

template sram: ptr SaveData = cast[ptr SaveData](addr sramMem[0])
  ## Access SRAM as a structure.
  ## Please only use read() or copyBytes() to read/write.

proc copyBytes(dst, src: pointer, size: int) {.codegenDecl:EWRAM_CODE.} =
  ## Copy 1 byte at a time
  ## All reads/writes to SRAM should use this.
  let src = cast[ptr UncheckedArray[byte]](src)
  let dst = cast[ptr UncheckedArray[byte]](dst)
  for i in 0..<size:
    dst[i] = src[i]

func read[T](src: var T): T {.codegenDecl:EWRAM_CODE.} =
  when sizeof(T) == 1:
    result = src  # 8-bit read is fine
  else:
    copyBytes(addr result, addr src, sizeof(T))


proc load*() =
  if sram.header == 42069:
    # valid save
    copyBytes(
      dst = addr sav,
      src = sram,
      size = sizeof(SaveData)
    )
    log "loaded valid save"
  else:
    sav = default(SaveData)
    sav.header = 42069
    log "created new save"

proc getBestScore*(): uint = sav.score

proc saveBestScore*(n: uint) =
  sav.score = n
  copyBytes(
    dst = sram,
    src = addr sav,
    size = sizeof(SaveData)
  )
  log "saved score %d = ", sav.score
