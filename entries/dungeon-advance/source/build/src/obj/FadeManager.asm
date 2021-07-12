;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module FadeManager
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_ApplyPaletteChange_b
	.globl _ApplyPaletteChange_b
	.globl b_FadeUpdate_b
	.globl _FadeUpdate_b
	.globl b_FadeOut_b
	.globl _FadeOut_b
	.globl b_FadeIn_b
	.globl _FadeIn_b
	.globl _fade_timer
	.globl _fade_black
	.globl _fade_frames_per_step
	.globl _fade_running
	.globl _fade_speeds
	.globl _FadeInit
	.globl _FadeIn
	.globl _FadeOut
	.globl _FadeUpdate
	.globl _ApplyPaletteChange
	.globl _FadeSetSpeed
	.globl _IsFading
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_fade_running::
	.ds 1
_fade_frames_per_step::
	.ds 1
_fade_black::
	.ds 1
_fade_timer::
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
;/tmp/_gbsbuild/src/core/FadeManager.c:7: UBYTE fade_black = 0;
	ld	hl, #_fade_black
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/FadeManager.c:8: UBYTE fade_timer = 0;
	ld	hl, #_fade_timer
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
;/tmp/_gbsbuild/src/core/FadeManager.c:17: void FadeInit() {
;	---------------------------------
; Function FadeInit
; ---------------------------------
_FadeInit::
;/tmp/_gbsbuild/src/core/FadeManager.c:18: fade_frames_per_step = fade_speeds[2];
	ld	a, (#(_fade_speeds + 0x0002) + 0)
	ld	(#_fade_frames_per_step),a
;/tmp/_gbsbuild/src/core/FadeManager.c:19: }
	ret
_fade_speeds:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
;/tmp/_gbsbuild/src/core/FadeManager.c:21: void FadeIn() {
;	---------------------------------
; Function FadeIn
; ---------------------------------
_FadeIn::
;/tmp/_gbsbuild/src/core/FadeManager.c:22: FadeIn_b();
	ld	e, #b_FadeIn_b
	ld	hl, #_FadeIn_b
;/tmp/_gbsbuild/src/core/FadeManager.c:23: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/FadeManager.c:25: void FadeOut() {
;	---------------------------------
; Function FadeOut
; ---------------------------------
_FadeOut::
;/tmp/_gbsbuild/src/core/FadeManager.c:26: FadeOut_b();
	ld	e, #b_FadeOut_b
	ld	hl, #_FadeOut_b
;/tmp/_gbsbuild/src/core/FadeManager.c:27: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/FadeManager.c:29: void FadeUpdate() {
;	---------------------------------
; Function FadeUpdate
; ---------------------------------
_FadeUpdate::
;/tmp/_gbsbuild/src/core/FadeManager.c:30: FadeUpdate_b();
	ld	e, #b_FadeUpdate_b
	ld	hl, #_FadeUpdate_b
;/tmp/_gbsbuild/src/core/FadeManager.c:31: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/FadeManager.c:33: void ApplyPaletteChange() {
;	---------------------------------
; Function ApplyPaletteChange
; ---------------------------------
_ApplyPaletteChange::
;/tmp/_gbsbuild/src/core/FadeManager.c:34: ApplyPaletteChange_b();
	ld	e, #b_ApplyPaletteChange_b
	ld	hl, #_ApplyPaletteChange_b
;/tmp/_gbsbuild/src/core/FadeManager.c:35: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/FadeManager.c:37: void FadeSetSpeed(UBYTE speed) {
;	---------------------------------
; Function FadeSetSpeed
; ---------------------------------
_FadeSetSpeed::
;/tmp/_gbsbuild/src/core/FadeManager.c:38: fade_frames_per_step = fade_speeds[speed];
	ld	bc, #_fade_speeds+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#_fade_frames_per_step),a
;/tmp/_gbsbuild/src/core/FadeManager.c:39: }
	ret
;/tmp/_gbsbuild/src/core/FadeManager.c:41: UBYTE IsFading() {
;	---------------------------------
; Function IsFading
; ---------------------------------
_IsFading::
;/tmp/_gbsbuild/src/core/FadeManager.c:42: return fade_running;
	ld	hl, #_fade_running
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/FadeManager.c:43: }
	ret
	.area _CODE
	.area _CABS (ABS)
