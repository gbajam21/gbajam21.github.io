;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Palette
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BkgPaletteBuffer
	.globl _SprPaletteBuffer
	.globl _BkgPalette
	.globl _SprPalette
	.globl _palette_update_mask
	.globl _palette_dirty
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_palette_dirty::
	.ds 1
_palette_update_mask::
	.ds 1
_SprPalette::
	.ds 64
_BkgPalette::
	.ds 64
_SprPaletteBuffer::
	.ds 64
_BkgPaletteBuffer::
	.ds 64
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
;/tmp/_gbsbuild/src/core/Palette.c:3: UBYTE palette_dirty = FALSE;
	ld	hl, #_palette_dirty
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Palette.c:4: UBYTE palette_update_mask = 0x3F;
	ld	hl, #_palette_update_mask
	ld	(hl), #0x3f
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _CABS (ABS)
