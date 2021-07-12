=========
DTV BOXES
=========
 * File: wrong-road_mb.gba
 * Date: 2021-06-24
 * Program: wrong road for gba
 * Author: Jenswa
 * Copyright (c) 2021, Johan Jansen, Hayo van Reek
 * License: New BSD License, expect for data files like graphics, sounds and maps


Contents
========
 - About
 - Features
 - Controls
 - Testers
 - Thanks to
 - License


About
=====
Avoid opposing racers for as long as you can!


Features
========
 - mode 4 with sprites
 - lz77 compressed mode 4 images
 - single sound channel effects
 - pause menu with sleep option (press L+R+START to wake up)
 - VBlankIntrWait()
 - appended binary assets
 - 256 color mode, but I should probably have gone for 16 color mode


Controls
========
 - START to continu from the title screen
 - LEFT or RIGHT moves the racer into a new lane
 - START opens the pause menu
 - UP or DOWN for choosing options from the pause menu
 - A to select the choosen option from the pause menu


Testers
=======
 - Jenswa on Windows 10 x64 with VBA 1.8.0-beta 3
 - Jenswa on Nintendo DS Lite with EZ Flash Omega
 - Jenswa on GBA-SP with ED X5 Mini (the game was hardly visible on this SP unit)


Thanks to
=========

 - Jason Wilkins (Dev-Kit Advance)
   http://devkitadv.sourceforge.net/
 - Forgotten (VisualBoyAdvance)
   http://vba.ngemu.com/
 - Eloist (gba header files)
   eloist@gmx.de
 - Nokturn (gba keys demo)
   http://www.zophar.net/pdroms/gba/keys.html
 - Dovoto (dma)
   http://www.drunkencoders.com/tutorials/GBA/Table%20of%20Contents.html
 - Dark Fader (gbafix, to patch my multiboot headers) 
   http://darkfader.net/gba/main.html
 - CowBite Virtual Hardware Specifications
   http://www.cs.rit.edu/~tjh8300/CowBite/CowBiteSpec.htm
 - GBATEK
   http://nocash.emubase.de/gbatek.htm
 - GameBoy Advance Dev'rs
   http://www.devrs.com/gba/
 - gbajunkie (his tutorials got me started)
   http://www.gbajunkie.co.uk/
 - Jonathan S. Harbour (got me started with interrupts)
   http://www.jharbour.com/
 - nmain reply in Krawall with swi_vblank on the gbadev forum
   https://forum.gbadev.org/viewtopic.php?p=75101#p75101
 - Chris Strickland (his article about Audio Programming On The GameboyAdvance)
   https://www.gamedev.net/articles/programming/general-and-gameplay-programming/audio-programming-on-the-gameboy-advance-part-1-r1823/


Website
=======
jenswa.neocities.com


License
=======
Graphic files contains the following copyright notice:
-----------------------------------------------------
Copyright (c) 2018, Hayo van Reek
Copyright (c) 2018-2021, Johan Jansen

Sound files contains the following copyright notice:
---------------------------------------------------
Copyright (c) 2018, Hayo van Reek
Copyright (c) 2018-2021, Johan Jansen

Map files contains the following copyright notice:
---------------------------------------------------
Copyright (c) 2021, Johan Jansen
Sourcecode files are released under the new BSD license
-------------------------------------------------------

Copyright (c) 2021, Johan Jansen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Johan Jansen nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL JOHAN JANSEN BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
