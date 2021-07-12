;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module MusicManager
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gbt_update
	.globl _gbt_loop
	.globl _gbt_stop
	.globl _gbt_play
	.globl _PopBank
	.globl _PushBank
	.globl _ReadBankedUBYTE
	.globl _tone_frames
	.globl _current_index
	.globl _MusicPlay
	.globl _MusicStop
	.globl _MusicUpdate
	.globl _SoundPlayTone
	.globl _SoundStopTone
	.globl _SoundPlayBeep
	.globl _SoundPlayCrash
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_current_index::
	.ds 1
_tone_frames::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;/tmp/_gbsbuild/src/core/MusicManager.c:10: UBYTE current_index = MAX_MUSIC;
	ld	hl, #_current_index
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/MusicManager.c:11: UBYTE tone_frames = 0;
	ld	hl, #_tone_frames
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/tmp/_gbsbuild/src/core/MusicManager.c:13: void MusicPlay(UBYTE index, UBYTE loop, UBYTE return_bank) {
;	---------------------------------
; Function MusicPlay
; ---------------------------------
_MusicPlay::
;/tmp/_gbsbuild/src/core/MusicManager.c:16: if (index != current_index) {
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_current_index
	sub	a, (hl)
	ret	Z
;/tmp/_gbsbuild/src/core/MusicManager.c:17: current_index = index;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	hl, #_current_index
	ld	(hl), c
;/tmp/_gbsbuild/src/core/MusicManager.c:18: music_bank = ReadBankedUBYTE(DATA_PTRS_BANK, &music_banks[index]);
	ld	de, #_music_banks+0
	ld	l, c
	ld	h, #0x00
	add	hl, de
	push	bc
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_ReadBankedUBYTE
	add	sp, #3
	ld	a, e
	pop	bc
	ld	b, a
;/tmp/_gbsbuild/src/core/MusicManager.c:20: PUSH_BANK(DATA_PTRS_BANK);
	push	bc
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/MusicManager.c:21: gbt_play((void*)music_tracks[index], music_bank, 7);
	ld	de, #_music_tracks+0
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	l, (hl)
	ld	a, #0x07
	push	af
	inc	sp
	push	bc
	ld	b, l
	inc	sp
	push	bc
	call	_gbt_play
	add	sp, #4
;/tmp/_gbsbuild/src/core/MusicManager.c:22: gbt_loop(loop);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_gbt_loop
	inc	sp
;/tmp/_gbsbuild/src/core/MusicManager.c:23: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/MusicManager.c:24: SWITCH_ROM(return_bank);
	ldhl	sp,	#4
	ld	a, (hl)
	ldh	(__current_bank+0),a
	ld	de, #0x2000
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/MusicManager.c:26: }
	ret
;/tmp/_gbsbuild/src/core/MusicManager.c:28: void MusicStop(UBYTE return_bank) {
;	---------------------------------
; Function MusicStop
; ---------------------------------
_MusicStop::
;/tmp/_gbsbuild/src/core/MusicManager.c:29: gbt_stop();
	call	_gbt_stop
;/tmp/_gbsbuild/src/core/MusicManager.c:30: current_index = MAX_MUSIC;
	ld	hl, #_current_index
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/MusicManager.c:31: SWITCH_ROM(return_bank);
	ldhl	sp,	#2
	ld	a, (hl)
	ldh	(__current_bank+0),a
	ld	de, #0x2000
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/MusicManager.c:32: }
	ret
;/tmp/_gbsbuild/src/core/MusicManager.c:34: void MusicUpdate() {
;	---------------------------------
; Function MusicUpdate
; ---------------------------------
_MusicUpdate::
;/tmp/_gbsbuild/src/core/MusicManager.c:35: UINT8 _bank = _current_bank;
	ldh	a, (__current_bank+0)
	ld	c, a
;/tmp/_gbsbuild/src/core/MusicManager.c:36: gbt_update();
	push	bc
	call	_gbt_update
	pop	bc
;/tmp/_gbsbuild/src/core/MusicManager.c:37: SWITCH_ROM(_bank);
	ld	a, c
	ldh	(__current_bank+0),a
	ld	hl, #0x2000
	ld	(hl), c
;/tmp/_gbsbuild/src/core/MusicManager.c:39: if (tone_frames != 0) {
	ld	hl, #_tone_frames
	ld	a, (hl)
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/MusicManager.c:40: tone_frames--;
;/tmp/_gbsbuild/src/core/MusicManager.c:41: if (tone_frames == 0) {
	dec	(hl)
	ld	a, (hl)
	ret	NZ
;/tmp/_gbsbuild/src/core/MusicManager.c:42: SoundStopTone();
;/tmp/_gbsbuild/src/core/MusicManager.c:45: }
	jp  _SoundStopTone
;/tmp/_gbsbuild/src/core/MusicManager.c:47: void SoundPlayTone(UWORD tone, UBYTE frames) {
;	---------------------------------
; Function SoundPlayTone
; ---------------------------------
_SoundPlayTone::
;/tmp/_gbsbuild/src/core/MusicManager.c:48: tone_frames = frames;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_tone_frames),a
;/tmp/_gbsbuild/src/core/MusicManager.c:51: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:54: NR10_REG = 0x00;
	ld	a, #0x00
	ldh	(_NR10_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:55: NR11_REG = (0x0U << 6U) | 0x01U;
	ld	a, #0x01
	ldh	(_NR11_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:56: NR12_REG = (0x0FU << 4U) | 0x00U;
	ld	a, #0xf0
	ldh	(_NR12_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:57: NR13_REG = (tone & 0x00FF);
	ldhl	sp,	#2
	ld	a, (hl)
	ldh	(_NR13_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:58: NR14_REG = 0x80 | ((tone & 0x0700) >> 8U);
	inc	hl
	ld	a, (hl)
	and	a, #0x07
	or	a, #0x80
	ldh	(_NR14_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:61: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:64: NR51_REG |= 0x11;
	ldh	a, (_NR51_REG+0)
	or	a, #0x11
	ldh	(_NR51_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:65: }
	ret
;/tmp/_gbsbuild/src/core/MusicManager.c:67: void SoundStopTone() {
;	---------------------------------
; Function SoundStopTone
; ---------------------------------
_SoundStopTone::
;/tmp/_gbsbuild/src/core/MusicManager.c:69: NR12_REG = 0x00;
	ld	a, #0x00
	ldh	(_NR12_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:70: }
	ret
;/tmp/_gbsbuild/src/core/MusicManager.c:72: void SoundPlayBeep(UBYTE pitch) {
;	---------------------------------
; Function SoundPlayBeep
; ---------------------------------
_SoundPlayBeep::
;/tmp/_gbsbuild/src/core/MusicManager.c:74: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:77: NR41_REG = 0x01;
	ld	a, #0x01
	ldh	(_NR41_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:78: NR42_REG = (0x0FU << 4U);
	ld	a, #0xf0
	ldh	(_NR42_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:79: NR43_REG = 0x20 | 0x08 | pitch;
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, #0x28
	ldh	(_NR43_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:80: NR44_REG = 0x80 | 0x40;
	ld	a, #0xc0
	ldh	(_NR44_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:83: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:86: NR51_REG |= 0x88;
	ldh	a, (_NR51_REG+0)
	or	a, #0x88
	ldh	(_NR51_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:89: }
	ret
;/tmp/_gbsbuild/src/core/MusicManager.c:91: void SoundPlayCrash() {
;	---------------------------------
; Function SoundPlayCrash
; ---------------------------------
_SoundPlayCrash::
;/tmp/_gbsbuild/src/core/MusicManager.c:93: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:96: NR41_REG = 0x01;
	ld	a, #0x01
	ldh	(_NR41_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:97: NR42_REG = (0x0FU << 4U) | 0x02U;
	ld	a, #0xf2
	ldh	(_NR42_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:98: NR43_REG = 0x13;
	ld	a, #0x13
	ldh	(_NR43_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:99: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:102: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:105: NR51_REG |= 0x88;
	ldh	a, (_NR51_REG+0)
	or	a, #0x88
	ldh	(_NR51_REG+0),a
;/tmp/_gbsbuild/src/core/MusicManager.c:108: }
	ret
	.area _CODE
	.area _CABS (ABS)
