;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Sprite
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_SpritePoolNext_b
	.globl _SpritePoolNext_b
	.globl b_SpritePoolReturn_b
	.globl _SpritePoolReturn_b
	.globl b_SpritePoolReset_b
	.globl _SpritePoolReset_b
	.globl _hide_sprites
	.globl _sprite_pool
	.globl _sprites_info
	.globl _SpritePoolReset
	.globl _SpritePoolReturn
	.globl _SpritePoolNext
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprites_info::
	.ds 75
_sprite_pool::
	.ds 20
_hide_sprites::
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
;/tmp/_gbsbuild/src/core/Sprite.c:7: DECLARE_STACK(sprite_pool, MAX_SPRITES);
	ld	hl, #_sprite_pool
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite.c:8: UBYTE hide_sprites = FALSE;
	ld	hl, #_hide_sprites
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
;/tmp/_gbsbuild/src/core/Sprite.c:14: void SpritePoolReset() {
;	---------------------------------
; Function SpritePoolReset
; ---------------------------------
_SpritePoolReset::
;/tmp/_gbsbuild/src/core/Sprite.c:15: SpritePoolReset_b();
	ld	e, #b_SpritePoolReset_b
	ld	hl, #_SpritePoolReset_b
;/tmp/_gbsbuild/src/core/Sprite.c:16: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Sprite.c:18: void SpritePoolReturn(UINT8 i) {
;	---------------------------------
; Function SpritePoolReturn
; ---------------------------------
_SpritePoolReturn::
;/tmp/_gbsbuild/src/core/Sprite.c:19: SpritePoolReturn_b(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_SpritePoolReturn_b
	ld	hl, #_SpritePoolReturn_b
	call	___sdcc_bcall_ehl
	inc	sp
;/tmp/_gbsbuild/src/core/Sprite.c:20: }
	ret
;/tmp/_gbsbuild/src/core/Sprite.c:22: UINT8 SpritePoolNext() {
;	---------------------------------
; Function SpritePoolNext
; ---------------------------------
_SpritePoolNext::
;/tmp/_gbsbuild/src/core/Sprite.c:23: return SpritePoolNext_b();
	ld	e, #b_SpritePoolNext_b
	ld	hl, #_SpritePoolNext_b
;/tmp/_gbsbuild/src/core/Sprite.c:24: }
	jp  ___sdcc_bcall_ehl
	.area _CODE
	.area _CABS (ABS)
