This ROM streams a video (with audio) from one GBA to another one using the Link Cable in Normal Mode.

** It can only be tested on NO$GBA or hardware **

If you use NO$GBA:

- Set `Number of Emulated Gameboys` to 2
- Set `Link Gamepaks` to `Gamepaks in all GBAs` (default)
- Set `Link Cable Type` to `Automatic` (default)
- Use `sender-and-receiver.gba`, since the emulator doesn't allow linking two different ROMs. Set the GBA at the right as the sender and the one at the left as the receiver, so it plays sound.

If you use Hardware:

- Use a GBC Link Cable, not a GBA one. Normal Mode transfers are one-way only when using GBA cables.
- You can use `sender.gba` and `receiver.gba`
- Here's a video of the demo: https://www.youtube.com/watch?v=V2r4hANl914

Source code of the main project:
  https://github.com/rodri042/gba-remote-play

Source code of the GBA Jam demo:
  https://github.com/rodri042/gba-remote-play/compare/gba-jam?expand=1



#######
Credits
#######

This project relies on the following open-source libraries:

- GBA hardware access by libtonc: https://www.coranac.com/projects/#tonc
- GBA audio decompression by gsmplayer-gba: https://github.com/pinobatch/gsmplayer-gba
- GBA multiboot writer by gba_03_multiboot: https://github.com/akkera102/gba_03_multiboot
- Raspberry PI SPI transfers by the C library for Broadcom BCM 2835: https://www.airspayce.com/mikem/bcm2835/

The GBA Jam demo, uses these two open Blender clips with Creative Commons licenses:

- Caminandes 2: Gran Dillama: https://www.youtube.com/watch?v=Z4C82eyhwgU
- Caminandes 3: Llamigos: https://www.youtube.com/watch?v=SkVqJ1SGeL0

Also, here are some documentation links that I made use of:

- TONC: The greatest GBA tutorial ever made: https://www.coranac.com/tonc/text/toc.htm
- GBATEK: Documentation of NO$GBA with GBA internals: https://problemkaputt.de/gbatek.htm
- rpi-fbcp's dispmanx API usage: https://github.com/tasanakorn/rpi-fbcp/blob/master/main.c
- Linux uinput's usage tutorial: https://blog.marekkraus.sk/c/linuxs-uinput-usage-tutorial-virtual-gamepad/
- Playing with ALSA loopback devices: https://sysplay.in/blog/linux/2019/06/playing-with-alsa-loopback-devices/

Special thanks to my friend Lucas Fryzek (@Hazematman), who has a deep knowledge of embedded systems and helped me a lot with design decisions.