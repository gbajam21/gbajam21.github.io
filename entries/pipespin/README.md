# PipeSpin

* [itch.io page (download)](https://hippydave.itch.io/pipespin)
* [github page (source code)](https://github.com/hippydave/pipespin)

## About

PipeSpin is an action puzzle game for the Game Boy Advance, that involves making loops out of pieces of pipe. The gameplay takes inspiration from the venerable Pipe Mania (Pipe Dream in the US) and the GBA classic Guru Logic Champ. The hiscore music is a tribute to one of the all-time classics - actually one of the classic games and one of the classic game music composers - Tetris on the original Game Boy (which also inspired the overall game structure), whose music was composed by Hirokazu "Hip" Tanaka.

PipeSpin was created for GBA Jam 2021, a three-month long jam to make games for the Game Boy Advance, in celebration of the handheld's 20th anniversary. It's a system I loved in its time, and have been revisiting recently having bought a Game Boy Micro last year. It's a fun one to develop for too, and this jam has been very good experience for me in terms of following through with adding all the bits and pieces that turn a project from a playable prototype into something more resembling an actual game. I have more ideas I want to add to this game, including one or two alternate play modes, and improvements I might want to make, but I feel happy that what I've managed to get done within the jam's time limit resembles a complete, if small, package (Minimum Viable Product is the technical term).

## How to play

(tl;dr play it and find out;)

PipeSpin is a Game Boy Advance game, so it comes in the form of a .gba file which can be played with an emulator (recommended [mGBA](https://mgba.io/)) or loaded onto a flash cart to be played on a real GBA/DS console. There will also be a link to play it online in your browser, available soon.

If you use an EZ Flash Omega (or Definitive Edition), to get it to display the thumbnail image for the game, copy PSPN.bmp into IMGS/P/S/ on your Omega's SD card (the IMGS folder is in the root directory if you're using the stock kernel, or inside the SYSTEM directory if you're using Stereophonik's Simple kernel).

Currently the only play mode is Score Attack, the goal is to get the highest score possible before the play grid fills up. Selecting a start level affects how quickly new pipe pieces are initially added to the grid, this speed continues to increase each time you reach a new level during gameplay. A queue on the right of the screen shows you what kind of pipes are coming next. Each level number is reached by clearing 10 times that number of pipe pieces - so starting at level 0, clearing 10 pipes moves you to level 1, and 20 pipes to level two, but if you start on level 7, you need to clear 80 pipes to reach level 8, and then 90 to level 9 and so on.

You clear pipes by moving them around the play grid until they form completed loops. Pipes appear in two different colours, and a loop must be made up of pieces all of the same colour to count as complete. Moving the pipes is achieved by the two cannons, which you control with the D-Pad. The cannon at the bottom of the grid moves left and right, aims upward through the grid, and can be used to pick up a pipe from the play grid, which is then held in the cannon and can be fired back onto the grid, but only where there is another pipe or block for it to stop against. The cannon to the left of the grid moves up and down and aims across the grid to the right. It cannot pick up pipes, but it can be used to blast a pipe in such a way that it flips over onto the next square to the right, reversing its orientation. The final thing you can do to help move pipes where you want them is to rotate the play grid in either direction, this gives you access to all sides, and if you are holding a pipe in the bottom cannon and return it to the grid from a different rotation, this also changes the pipe's orientation relative to the pipes on the grid.

A further obstacle takes the form of rainbow blocks, which appear one at the start of the game and one more for each level increase, and can't be moved around the grid. The only way to get rid of a block is to complete a loop around it. If you surround more than one block in the same loop, the bonus score you receive for the loop grows exponentially for each additional block - the same applies for the number of cross pieces that are crossed through in both directions in the completed loop. The score for a loop grows similarly based on the number of pipe pieces it's made up of, and all scores are multiplied depending on the current game level. So make big loops with multiple crosses surrounding as many blocks as possible, on higher levels, for the most enormous hiscores!

## Controls

By default the game displays button labels to let you know what controls what, but I recommend turning them off in the settings when you know what you're doing, because it looks nicer!

* D-Pad left/right - move bottom cannon
* D-Pad up/down - move side cannon
* A button - collect/return pipe from/to the play grid using the bottom cannon
* B button - Flip pipe over to the right using the side cannon
* L button - rotate grid 90° anticlockwise
* R button - rotate grid 90° clockwise
* L & R buttons together - rotate grid 180°
* Select button - add the next pipe to the grid immediately
* Start button - pause game/access settings menu or quit

## Settings menu

* Button labels - as mentioned, shows or hides the on-screen control hints
* Music volume/Sound FX volume - does much as you'd expect
* Colour adjust - adapts the colours to the GBA's screen. I recommend having it On for GBA/SP/Micro, Off for emulators, IPS screens etc, but do what you prefer
* Gamma adjust - tweak the relative brightness, to help with unlit screens etc
* Save indicator - a disk icon is displayed in the top left corner of the screen when save data is being written (when a new hiscore is entered or a setting is changed), so you know not to turn it off at that moment. This setting controls how long the icon is displayed for. It defaults to 5 seconds because of the EZ Flash Omega flashcard needing extra time to copy the save data to SD card, but you can decrease it to 1 second if you're not using that model (or if you like life on the edge I guess)

## Credits

* Game concept, code, graphics, sfx and music by hippydave
* Hiscore music originally composed by Hip Tanaka, cover version by hippydave
* Colour palette and rainbow blocks by Haley Halcyon (CC0) https://opengameart.org/content/color-match-puzzle-rainbow-panels
* Font by Pixel-boy (CC0) http://opengameart.org/content/superpowers-assets-bitmap-fonts
* Logo/Game Over font based on Down the Drain (origin unclear but marked as freeware) https://www.dafont.com/down-the-drain.font (and every other font site)
* Disk icon modified from Vellidragon (CC0) https://opengameart.org/content/menu-icons-0
* Steel drum samples from Jason Champion (freeware) https://freewavesamples.com/instrument/steel-drums
* Other CC0 sound samples used for the music were found by searching "metallic" on freesound.org, will try and track down links

* Developed using devkitPro and libgba (per libgba's licence "PipeSpin is based in part on the work of the devkitpro project (http://sourceforge.net/projects/devkitpro)")
* Tested using mGBA by endrift/Vicki Pfau  https://mgba.io/
* Debug code mgba.c/mgba.h by endrift/Vicki Pfau https://github.com/mgba-emu/mgba/tree/master/opt/libgba
* GBA colour correction based on code by the late, great Near (formerly known as byuu) https://web.archive.org/web/20201130021101/https://byuu.net/video/color-emulation/
* Gamma correction based on code by Flubba https://forum.gbadev.org/viewtopic.php?f=9&t=3231
* posprintf by Dan Posluns (public domain) http://danposluns.com/gbadev/posprintf/
* Vital hardware reference - tonc by cearn/J Vijn https://www.coranac.com/tonc/text/toc.htm

Huge thanks to the hosts of GBA Jam 2021 (avivace, GValiente, peterlemon, skylyrac, exelotl), and to the people of the gbadev discord and extended gba dev community for inspiration and support.

Hugest thanks to my incredible wife, whose love, support and advice (especially her genius about colours) makes everything possible.

## Licence

Please keep the "In memory of Ruby" screen intact in any source or binary distributions of the PipeSpin game itself. The game code is licensed under the terms of the Gnu Public Licence v3.0, see LICENSE for full terms. If you wish to use any small portions of code in a project that you do not wish to licence under the GPL for whatever reason, contact me to arrange something.
