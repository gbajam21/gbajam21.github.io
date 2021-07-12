;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Collision
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PopBank
	.globl _PushBank
	.globl _TileAt
	.globl _TileAt2x1
	.globl _TileAt2x2
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/tmp/_gbsbuild/src/core/Collision.c:8: UBYTE TileAt(UBYTE tx, UBYTE ty) {
;	---------------------------------
; Function TileAt
; ---------------------------------
_TileAt::
;/tmp/_gbsbuild/src/core/Collision.c:13: if (tx == MAX_UINT8 || tx == image_tile_width || ty == image_tile_height || ty == MAX_UINT8) {
	ldhl	sp,	#2
	ld	a, (hl)
	inc	a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_image_tile_width
	sub	a, (hl)
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_image_tile_height
	sub	a, (hl)
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
00101$:
;/tmp/_gbsbuild/src/core/Collision.c:14: return COLLISION_ALL;
	ld	e, #0x0f
	ret
00102$:
;/tmp/_gbsbuild/src/core/Collision.c:17: y_offset = ty * (UINT16)image_tile_width;
	ld	hl, #_image_tile_width
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#3
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
;/tmp/_gbsbuild/src/core/Collision.c:19: PUSH_BANK(collision_bank);
	push	de
	ld	a, (#_collision_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/Collision.c:20: tile = (UBYTE) * (collision_ptr + y_offset + tx);
	ld	a, e
	ld	hl, #_collision_ptr
	add	a, (hl)
	ld	c, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
;/tmp/_gbsbuild/src/core/Collision.c:21: POP_BANK;
	push	de
	call	_PopBank
	pop	de
;/tmp/_gbsbuild/src/core/Collision.c:22: return tile;
;/tmp/_gbsbuild/src/core/Collision.c:23: }
	ret
;/tmp/_gbsbuild/src/core/Collision.c:25: UBYTE TileAt2x1(UBYTE tx, UBYTE ty) {
;	---------------------------------
; Function TileAt2x1
; ---------------------------------
_TileAt2x1::
;/tmp/_gbsbuild/src/core/Collision.c:30: if (tx == MAX_UINT8 || tx == image_tile_width || ty == image_tile_height || ty == MAX_UINT8) {
	ldhl	sp,	#2
	ld	a, (hl)
	inc	a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_image_tile_width
	sub	a, (hl)
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_image_tile_height
	sub	a, (hl)
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
00101$:
;/tmp/_gbsbuild/src/core/Collision.c:31: return COLLISION_ALL;
	ld	e, #0x0f
	ret
00102$:
;/tmp/_gbsbuild/src/core/Collision.c:35: collision_ptr_tmp = ty * (UINT16)image_tile_width + tx + collision_ptr;
	ld	hl, #_image_tile_width
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#3
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	ld	a, c
	ld	hl, #_collision_ptr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
;/tmp/_gbsbuild/src/core/Collision.c:37: PUSH_BANK(collision_bank);
	push	bc
	ld	a, (#_collision_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/Collision.c:38: tile = (UBYTE) * collision_ptr_tmp | (UBYTE) *(collision_ptr_tmp + 1U);
	ld	a, (bc)
	ld	e, a
	inc	bc
	ld	a, (bc)
	or	a, e
	ld	e, a
;/tmp/_gbsbuild/src/core/Collision.c:39: POP_BANK;
	push	de
	call	_PopBank
	pop	de
;/tmp/_gbsbuild/src/core/Collision.c:40: return tile;
;/tmp/_gbsbuild/src/core/Collision.c:41: }
	ret
;/tmp/_gbsbuild/src/core/Collision.c:43: UBYTE TileAt2x2(UBYTE tx, UBYTE ty) {
;	---------------------------------
; Function TileAt2x2
; ---------------------------------
_TileAt2x2::
;/tmp/_gbsbuild/src/core/Collision.c:48: if (tx == MAX_UINT8 || tx == image_tile_width || ty == image_tile_height || ty == MAX_UINT8) {
	ldhl	sp,	#2
	ld	a, (hl)
	inc	a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_image_tile_width
	sub	a, (hl)
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_image_tile_height
	sub	a, (hl)
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
00101$:
;/tmp/_gbsbuild/src/core/Collision.c:49: return COLLISION_ALL;
	ld	e, #0x0f
	ret
00102$:
;/tmp/_gbsbuild/src/core/Collision.c:53: collision_ptr_tmp = ty * (UINT16)image_tile_width + tx + collision_ptr;
	ld	hl, #_image_tile_width
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	push	de
	push	bc
	call	__mulint
	add	sp, #4
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	ld	a, c
	ld	hl, #_collision_ptr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
;/tmp/_gbsbuild/src/core/Collision.c:55: PUSH_BANK(collision_bank);
	push	bc
	ld	a, (#_collision_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/Collision.c:56: tile = (UBYTE) * (collision_ptr_tmp);
	ld	a, (bc)
;/tmp/_gbsbuild/src/core/Collision.c:57: if (!tile) {
	ld	e, a
	or	a, a
	jr	NZ, 00111$
;/tmp/_gbsbuild/src/core/Collision.c:58: tile = (UBYTE) * (collision_ptr_tmp + 1U);
	ld	l, c
	ld	h, b
	inc	hl
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Collision.c:59: if (!tile) {
	ld	a, e
	or	a, a
	jr	NZ, 00111$
;/tmp/_gbsbuild/src/core/Collision.c:61: collision_ptr_tmp = collision_ptr_tmp + (UINT16)image_tile_width;
	ld	hl, #_image_tile_width
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
;/tmp/_gbsbuild/src/core/Collision.c:62: tile = (UBYTE) * (collision_ptr_tmp);
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Collision.c:63: if (!tile) {
	ld	a, e
	or	a, a
	jr	NZ, 00111$
;/tmp/_gbsbuild/src/core/Collision.c:64: tile = (UBYTE) * (collision_ptr_tmp + 1U);
	inc	hl
	ld	e, (hl)
00111$:
;/tmp/_gbsbuild/src/core/Collision.c:68: POP_BANK;
	push	de
	call	_PopBank
	pop	de
;/tmp/_gbsbuild/src/core/Collision.c:69: return tile;
;/tmp/_gbsbuild/src/core/Collision.c:70: }
	ret
	.area _CODE
	.area _CABS (ABS)
