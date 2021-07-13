@echo off
rem 2012-08-04
rem makemb.bat for windows 7

path=C:\programs\devkitadv\bin
set pname=wrong-road
set vba=C:\programs\vba\VisualBoyAdvance.exe
set gbafix=C:\programs\gbatools\gbafix.exe
set ext=_mb.gba

echo Compiling
rem thumb mode
rem gcc -Wall -O -mthumb -mthumb-interwork -s -o bin.elf main.c multiboot.c -lm
rem arm mode
gcc -o bin.elf main.c multiboot.c -lm

if exist bin.elf goto :succes
if not exist bin.elf goto :failed

:succes
  objcopy -O binary bin.elf main%ext%
  echo Compiling done, patching header
  %gbafix% main%ext%

  echo Adding graphics
  rem copy /b main%ext% + gfx\track.bin %pname%%ext%
  rem copy /b main%ext% + gfx\track.lz77 %pname%%ext%
  copy /b main%ext% + gfx\track.lz77 + gfx\title.lz77 + gfx\racer.bin + gfx\font8px.bin + gfx\numbers8px.bin + gfx\pausemenu.lz77 + gfx\pausecursor.bin + sfx\crash-22kHz-mono-8bit.bin + sfx\highbleep-22kHz-mono-8bit.bin + sfx\lowbleep-22kHz-mono-8bit.bin %pname%%ext%

  echo Removing temporary files
  del bin.elf

  echo Starting visualboyadvance
  %vba% %pname%%ext%

  cls
  exit

:failed
  echo Compiling failed
  pause
