@echo off
rem 2021-07-11
rem padmb.bat for windows 7

set pname=wrong-road
set vba=C:\programs\vba\VisualBoyAdvance.exe
set ext=_mb.gba

echo Adding graphics and sounds
copy /b main%ext% + pad.txt + gfx\track.lz77 + gfx\title.lz77 + gfx\racer.bin + gfx\font8px.bin + gfx\numbers8px.bin + gfx\pausemenu.lz77 + gfx\pausecursor.bin + sfx\crash-22kHz-mono-8bit.bin + sfx\highbleep-22kHz-mono-8bit.bin + sfx\lowbleep-22kHz-mono-8bit.bin %pname%%ext%

echo Starting visualboyadvance
%vba% %pname%%ext%

cls
exit
