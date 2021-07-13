import os, strutils
import natu/config

const main = "source/main.nim"         # path to project file
const name = "xniq"                    # name of ROM

put "natu.toolchain", "devkitarm"
put "natu.gameTitle", "XNIQ"           # max 12 chars, uppercase
put "natu.gameCode", "2XNP"            # "2" = SRAM on EverDrive; "XN" = xniq; P = Europe

if projectPath() == thisDir() / main:
  # This runs only when compiling the project file:
  gbaCfg()                             # set C compiler + linker options for GBA target
  switch "os", "any"
  switch "gc", "arc"
  switch "define", "useMalloc"
  switch "define", "noSignalHandler"
  switch "lineTrace", "on"
  # switch "define", "panics:on"
  # switch "checks", "off"               # toggle assertions, bounds checking, etc.
  switch "path", projectDir()          # allow imports relative to the main file
  switch "header"                      # output "{project}.h"
  switch "nimcache", "nimcache"        # output C sources to local directory
  switch "cincludes", nimcacheDir()    # allow external C files to include "{project}.h"

task build, "builds the GBA rom":
  let args = commandLineParams()[1..^1].join(" ")
  gfxConvert "graphics.nims"
  bgConvert "backgrounds.nims"
  mmConvert "audio.nims"
  selfExec "c " & args & " -o:" & name & ".elf " & thisDir() / main
  gbaStrip name & ".elf", name & ".gba"
  gbaFix name & ".gba"

task clean, "removes build files":
  rmDir "nimcache"
  rmDir "output"
  rmFile name & ".gba"
  rmFile name & ".elf"
  rmFile name & ".elf.map"
