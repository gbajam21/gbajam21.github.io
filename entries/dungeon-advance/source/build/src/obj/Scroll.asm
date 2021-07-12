;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Scroll
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ScrollUpdateColumnWithDelay
	.globl _ScrollUpdateColumnR
	.globl _ScrollUpdateRowWithDelay
	.globl _ScrollUpdateRowR
	.globl b_RefreshScroll_b
	.globl _RefreshScroll_b
	.globl _ApplyPaletteChange
	.globl _PopBank
	.globl _PushBank
	.globl _ActivateActor
	.globl _SetTile
	.globl _display_off
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _scroll_target
	.globl _pending_w_i
	.globl _pending_w_y
	.globl _pending_w_x
	.globl _pending_w_cmap
	.globl _pending_h_cmap
	.globl _pending_w_map
	.globl _pending_h_map
	.globl _pending_h_i
	.globl _pending_h_y
	.globl _pending_h_x
	.globl _scroll_offset_y
	.globl _scroll_offset_x
	.globl _scroll_y_max
	.globl _scroll_x_max
	.globl _draw_scroll_y
	.globl _draw_scroll_x
	.globl _scroll_y
	.globl _scroll_x
	.globl _ScrollUpdateRow
	.globl _RefreshScroll
	.globl _InitScroll
	.globl _RenderScreen
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scroll_x::
	.ds 2
_scroll_y::
	.ds 2
_draw_scroll_x::
	.ds 2
_draw_scroll_y::
	.ds 2
_scroll_x_max::
	.ds 2
_scroll_y_max::
	.ds 2
_scroll_offset_x::
	.ds 2
_scroll_offset_y::
	.ds 2
_pending_h_x::
	.ds 2
_pending_h_y::
	.ds 2
_pending_h_i::
	.ds 1
_pending_h_map::
	.ds 2
_pending_w_map::
	.ds 2
_pending_h_cmap::
	.ds 2
_pending_w_cmap::
	.ds 2
_pending_w_x::
	.ds 2
_pending_w_y::
	.ds 2
_pending_w_i::
	.ds 1
_scroll_target::
	.ds 2
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
;/tmp/_gbsbuild/src/core/Scroll.c:12: INT16 scroll_x = 0;
	ld	hl, #_scroll_x
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:13: INT16 scroll_y = 0;
	ld	hl, #_scroll_y
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:14: INT16 draw_scroll_x = 0;
	ld	hl, #_draw_scroll_x
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:15: INT16 draw_scroll_y = 0;
	ld	hl, #_draw_scroll_y
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:16: UINT16 scroll_x_max = 0;
	ld	hl, #_scroll_x_max
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:17: UINT16 scroll_y_max = 0;
	ld	hl, #_scroll_y_max
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:19: INT16 scroll_offset_x = 0;
	ld	hl, #_scroll_offset_x
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:20: INT16 scroll_offset_y = 0;
	ld	hl, #_scroll_offset_y
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:24: unsigned char* pending_h_map = 0;
	ld	hl, #_pending_h_map
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:25: unsigned char* pending_w_map = 0;
	ld	hl, #_pending_w_map
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:27: unsigned char* pending_h_cmap = 0;
	ld	hl, #_pending_h_cmap
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:28: unsigned char* pending_w_cmap = 0;
	ld	hl, #_pending_w_cmap
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:32: Pos* scroll_target = 0;
	ld	hl, #_scroll_target
	ld	(hl), #0x00
	inc	hl
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
;/tmp/_gbsbuild/src/core/Scroll.c:38: void ScrollUpdateRowR() {
;	---------------------------------
; Function ScrollUpdateRowR
; ---------------------------------
_ScrollUpdateRowR::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/Scroll.c:43: y_offset = MOD_32(pending_w_y);
	ld	a, (#_pending_w_y)
	and	a, #0x1f
	ld	c, a
;/tmp/_gbsbuild/src/core/Scroll.c:45: PUSH_BANK(image_bank);
	push	bc
	ld	a, (#_image_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:50: id = 0x9800 + MOD_32(pending_w_x++) + ((UINT16)y_offset << 5);
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Scroll.c:48: if (_cpu == CGB_TYPE) {  // Color Row Load
	ld	a, (#__cpu)
	sub	a, #0x11
	jp	NZ,00122$
;/tmp/_gbsbuild/src/core/Scroll.c:49: for (i = 0u; i != 5 && pending_w_i != 0; ++i, --pending_w_i) {
	xor	a, a
	ldhl	sp,	#2
	ld	(hl), a
00108$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	jp	Z,00105$
	ld	a, (#_pending_w_i)
	or	a, a
	jp	Z, 00105$
;/tmp/_gbsbuild/src/core/Scroll.c:50: id = 0x9800 + MOD_32(pending_w_x++) + ((UINT16)y_offset << 5);
	ld	hl, #_pending_w_x + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	(hl)
	jr	NZ, 00157$
	inc	hl
	inc	(hl)
00157$:
	ld	a, c
	and	a, #0x1f
	ld	l, a
	ld	h, #0x00
	ld	c, l
	ld	a, h
	add	a, #0x98
	ld	b, a
	pop	hl
	push	hl
	add	hl, bc
;/tmp/_gbsbuild/src/core/Scroll.c:51: PUSH_BANK(image_attr_bank);
	push	hl
	ld	a, (#_image_attr_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:52: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/Scroll.c:54: SetTile(id, *pending_w_cmap);
	ld	hl, #_pending_w_cmap + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:55: VBK_REG = 0;
	ld	a, #0x00
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/Scroll.c:56: POP_BANK;
	push	bc
	call	_PopBank
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:58: SetTile(id, *pending_w_map);
	ld	hl, #_pending_w_map + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:59: pending_w_map++;
	ld	hl, #_pending_w_map
	inc	(hl)
	jr	NZ, 00158$
	inc	hl
	inc	(hl)
00158$:
;/tmp/_gbsbuild/src/core/Scroll.c:60: pending_w_cmap++;
	ld	hl, #_pending_w_cmap
	inc	(hl)
	jr	NZ, 00159$
	inc	hl
	inc	(hl)
00159$:
;/tmp/_gbsbuild/src/core/Scroll.c:49: for (i = 0u; i != 5 && pending_w_i != 0; ++i, --pending_w_i) {
	ldhl	sp,	#2
	inc	(hl)
	ld	hl, #_pending_w_i
	dec	(hl)
	jr	00108$
;/tmp/_gbsbuild/src/core/Scroll.c:65: for (i = 0u; i != 5 && pending_w_i != 0; ++i, --pending_w_i) {
00122$:
	xor	a, a
	ldhl	sp,	#2
	ld	(hl), a
00112$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00105$
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00105$
;/tmp/_gbsbuild/src/core/Scroll.c:67: id = 0x9800 + MOD_32(pending_w_x++) + ((UINT16)y_offset << 5);
	ld	hl, #_pending_w_x + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	(hl)
	jr	NZ, 00161$
	inc	hl
	inc	(hl)
00161$:
	ld	a, c
	and	a, #0x1f
	ld	h, #0x00
	ld	c, a
	ld	a, h
	add	a, #0x98
	ld	b, a
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/Scroll.c:68: SetTile(id, *pending_w_map);
	ld	hl, #_pending_w_map + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:69: pending_w_map++;
	ld	hl, #_pending_w_map
	inc	(hl)
	jr	NZ, 00162$
	inc	hl
	inc	(hl)
00162$:
;/tmp/_gbsbuild/src/core/Scroll.c:65: for (i = 0u; i != 5 && pending_w_i != 0; ++i, --pending_w_i) {
	ldhl	sp,	#2
	inc	(hl)
	ld	hl, #_pending_w_i
	dec	(hl)
	jr	00112$
00105$:
;/tmp/_gbsbuild/src/core/Scroll.c:73: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/Scroll.c:74: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/Scroll.c:76: void ScrollUpdateRowWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRowWithDelay
; ---------------------------------
_ScrollUpdateRowWithDelay::
	add	sp, #-7
;/tmp/_gbsbuild/src/core/Scroll.c:79: while (pending_w_i) {
00101$:
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00103$
;/tmp/_gbsbuild/src/core/Scroll.c:80: ScrollUpdateRowR();
	call	_ScrollUpdateRowR
	jr	00101$
00103$:
;/tmp/_gbsbuild/src/core/Scroll.c:83: pending_w_x = x;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pending_w_x
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Scroll.c:84: pending_w_y = y;
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pending_w_y
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Scroll.c:86: pending_w_i = SCREEN_TILE_REFRES_W;
	ld	hl, #_pending_w_i
	ld	(hl), #0x17
;/tmp/_gbsbuild/src/core/Scroll.c:87: pending_w_map = image_ptr + image_tile_width * y + x;
	ld	hl, #_image_tile_width
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	__mulint
	add	sp, #4
	ld	a, e
	ld	hl, #_image_ptr
	add	a, (hl)
	ld	c, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, l
	ld	(_pending_w_map), a
	ld	a, h
	ld	(_pending_w_map + 1), a
;/tmp/_gbsbuild/src/core/Scroll.c:90: for (i = 1; i != actors_len; i++) {
;c
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0017
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	(hl), #0x01
00111$:
	ld	a, (#_actors_len)
	ldhl	sp,	#6
	sub	a, (hl)
	jp	Z,00109$
;/tmp/_gbsbuild/src/core/Scroll.c:91: if (actors[i].pos.y >> 3 == y) {
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_actors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00112$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/Scroll.c:92: INT16 tx = actors[i].pos.x >> 3;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Scroll.c:93: if (U_LESS_THAN(x, tx) && U_LESS_THAN(tx, x + SCREEN_TILE_REFRES_W)) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	bit	7, (hl)
	jr	Z, 00112$
	pop	de
	push	de
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	bit	7, a
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/Scroll.c:94: ActivateActor(i);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActivateActor
	inc	sp
00112$:
;/tmp/_gbsbuild/src/core/Scroll.c:90: for (i = 1; i != actors_len; i++) {
	ldhl	sp,	#6
	inc	(hl)
	jp	00111$
00109$:
;/tmp/_gbsbuild/src/core/Scroll.c:100: pending_w_cmap = image_attr_ptr + image_tile_width * y + x;
	ld	hl, #_image_tile_width
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	__mulint
	add	sp, #4
	ld	a, e
	ld	hl, #_image_attr_ptr
	add	a, (hl)
	ld	c, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, l
	ld	(_pending_w_cmap), a
	ld	a, h
	ld	(_pending_w_cmap + 1), a
;/tmp/_gbsbuild/src/core/Scroll.c:102: }
	add	sp, #7
	ret
;/tmp/_gbsbuild/src/core/Scroll.c:104: void ScrollUpdateRow(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRow
; ---------------------------------
_ScrollUpdateRow::
	add	sp, #-7
;/tmp/_gbsbuild/src/core/Scroll.c:108: unsigned char* map = image_ptr + image_tile_width * y + x;
	ld	hl, #_image_tile_width
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	__mulint
	add	sp, #4
	ld	a, e
	ld	hl, #_image_ptr
	add	a, (hl)
	ld	c, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/Scroll.c:110: unsigned char* cmap = image_attr_ptr + image_tile_width * y + x;
	ld	a, e
	ld	hl, #_image_attr_ptr
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
;c
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
;/tmp/_gbsbuild/src/core/Scroll.c:113: PUSH_BANK(image_bank);
	push	bc
	push	de
	ld	a, (#_image_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:115: screen_x = x;
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Scroll.c:116: screen_y = MOD_32(y);
	ldhl	sp,	#11
	ld	a, (hl)
	and	a, #0x1f
	ldhl	sp,	#0
;/tmp/_gbsbuild/src/core/Scroll.c:118: for (i = 0; i != 23; i++) {
	ld	(hl+), a
	inc	hl
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	xor	a, a
	inc	hl
	ld	(hl), a
00108$:
;/tmp/_gbsbuild/src/core/Scroll.c:119: id = 0x9800 + MOD_32(screen_x++) + ((UINT16)screen_y << 5);
	ldhl	sp,	#1
	ld	c, (hl)
	inc	(hl)
	ld	a, c
	and	a, #0x1f
	ld	l, a
	ld	h, #0x00
	ld	c, l
	ld	a, h
	add	a, #0x98
	ld	b, a
	ldhl	sp,	#0
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;/tmp/_gbsbuild/src/core/Scroll.c:122: PUSH_BANK(image_attr_bank);
	push	hl
	ld	a, (#_image_attr_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:123: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/Scroll.c:124: SetTile(id, *(cmap++));
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	inc	(hl)
	jr	NZ, 00152$
	inc	hl
	inc	(hl)
00152$:
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:125: VBK_REG = 0;
	ld	a, #0x00
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/Scroll.c:126: POP_BANK;
	push	bc
	call	_PopBank
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:128: SetTile(id, *(map++));
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	inc	(hl)
	jr	NZ, 00153$
	inc	hl
	inc	(hl)
00153$:
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:118: for (i = 0; i != 23; i++) {
	ldhl	sp,	#6
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x17
	jr	NZ, 00108$
;/tmp/_gbsbuild/src/core/Scroll.c:132: for (i = 1; i != actors_len; i++) {
;c
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0018
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	(hl), #0x01
00111$:
	ld	a, (#_actors_len)
	ldhl	sp,	#6
	sub	a, (hl)
	jp	Z,00107$
;/tmp/_gbsbuild/src/core/Scroll.c:133: if (actors[i].pos.y >> 3 == y) {
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_actors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00112$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/Scroll.c:134: INT16 tx = actors[i].pos.x >> 3;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Scroll.c:135: if (U_LESS_THAN(x, tx + 1) && U_LESS_THAN(tx, x + 24)) {
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	bit	7, (hl)
	jr	Z, 00112$
	pop	de
	push	de
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	bit	7, a
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/Scroll.c:136: ActivateActor(i);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActivateActor
	inc	sp
00112$:
;/tmp/_gbsbuild/src/core/Scroll.c:132: for (i = 1; i != actors_len; i++) {
	ldhl	sp,	#6
	inc	(hl)
	jp	00111$
00107$:
;/tmp/_gbsbuild/src/core/Scroll.c:141: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/Scroll.c:142: }
	add	sp, #7
	ret
;/tmp/_gbsbuild/src/core/Scroll.c:144: void ScrollUpdateColumnR() {
;	---------------------------------
; Function ScrollUpdateColumnR
; ---------------------------------
_ScrollUpdateColumnR::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/Scroll.c:150: PUSH_BANK(image_bank);
	ld	a, (#_image_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/Scroll.c:152: x_offset = MOD_32(pending_h_x);
	ld	a, (#_pending_h_x)
	and	a, #0x1f
;/tmp/_gbsbuild/src/core/Scroll.c:157: id = 0x9800 + (0x1F & (x_offset)) + ((0x1F & (MOD_32(pending_h_y))) << 5);
	and	a, #0x1f
	ld	b, #0x00
	ld	c, a
	ld	hl, #0x9800
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;/tmp/_gbsbuild/src/core/Scroll.c:155: if (_cpu == CGB_TYPE) {  // Color Column Load
	ld	a, (#__cpu)
	sub	a, #0x11
	jp	NZ,00122$
;/tmp/_gbsbuild/src/core/Scroll.c:156: for (i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i--) {
	xor	a, a
	ldhl	sp,	#2
	ld	(hl), a
00108$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	jp	Z,00105$
	ld	a, (#_pending_h_i)
	or	a, a
	jp	Z, 00105$
;/tmp/_gbsbuild/src/core/Scroll.c:157: id = 0x9800 + (0x1F & (x_offset)) + ((0x1F & (MOD_32(pending_h_y))) << 5);
	ld	a, (#_pending_h_y)
	and	a, #0x1f
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
;/tmp/_gbsbuild/src/core/Scroll.c:158: PUSH_BANK(image_attr_bank);
	push	hl
	ld	a, (#_image_attr_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:159: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/Scroll.c:161: SetTile(id, *pending_h_cmap);
	ld	hl, #_pending_h_cmap + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:162: VBK_REG = 0;
	ld	a, #0x00
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/Scroll.c:163: POP_BANK;
	push	bc
	call	_PopBank
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:165: SetTile(id, *pending_h_map);
	ld	hl, #_pending_h_map + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:166: pending_h_y++;
	ld	hl, #_pending_h_y
	inc	(hl)
	jr	NZ, 00156$
	inc	hl
	inc	(hl)
00156$:
;/tmp/_gbsbuild/src/core/Scroll.c:167: pending_h_map += image_tile_width;
	ld	a, (#_pending_h_map)
	ld	hl, #_image_tile_width
	add	a, (hl)
	ld	hl, #_pending_h_map
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Scroll.c:168: pending_h_cmap += image_tile_width;
	ld	a, (#_pending_h_cmap)
	ld	hl, #_image_tile_width
	add	a, (hl)
	ld	hl, #_pending_h_cmap
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Scroll.c:156: for (i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i--) {
	ldhl	sp,	#2
	inc	(hl)
	ld	hl, #_pending_h_i
	dec	(hl)
	jp	00108$
;/tmp/_gbsbuild/src/core/Scroll.c:173: for (i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i--) {
00122$:
	xor	a, a
	ldhl	sp,	#2
	ld	(hl), a
00112$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00105$
	ld	a, (#_pending_h_i)
	or	a, a
	jr	Z, 00105$
;/tmp/_gbsbuild/src/core/Scroll.c:175: id = 0x9800 + (0x1F & (x_offset)) + ((0x1F & (MOD_32(pending_h_y++))) << 5);
	ld	hl, #_pending_h_y + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	inc	(hl)
	jr	NZ, 00158$
	inc	hl
	inc	(hl)
00158$:
	ld	a, c
	and	a, #0x1f
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/Scroll.c:176: SetTile(id, *pending_h_map);
	ld	hl, #_pending_h_map + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/Scroll.c:177: pending_h_map += image_tile_width;
	ld	a, (#_pending_h_map)
	ld	hl, #_image_tile_width
	add	a, (hl)
	ld	hl, #_pending_h_map
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Scroll.c:173: for (i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i--) {
	ldhl	sp,	#2
	inc	(hl)
	ld	hl, #_pending_h_i
	dec	(hl)
	jr	00112$
00105$:
;/tmp/_gbsbuild/src/core/Scroll.c:181: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/Scroll.c:182: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/Scroll.c:184: void ScrollUpdateColumnWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumnWithDelay
; ---------------------------------
_ScrollUpdateColumnWithDelay::
	add	sp, #-7
;/tmp/_gbsbuild/src/core/Scroll.c:187: while (pending_h_i) {
00101$:
	ld	a, (#_pending_h_i)
	or	a, a
	jr	Z, 00121$
;/tmp/_gbsbuild/src/core/Scroll.c:190: ScrollUpdateColumnR();
	call	_ScrollUpdateColumnR
	jr	00101$
;/tmp/_gbsbuild/src/core/Scroll.c:194: for (i = 1; i != actors_len; i++) {
00121$:
;c
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0015
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#6
	ld	(hl), #0x01
00111$:
	ld	a, (#_actors_len)
	ldhl	sp,	#6
	sub	a, (hl)
	jp	Z,00109$
;/tmp/_gbsbuild/src/core/Scroll.c:195: if (actors[i].pos.x >> 3 == x) {
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_actors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00112$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/Scroll.c:196: INT16 ty = actors[i].pos.y >> 3;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Scroll.c:197: if (U_LESS_THAN(y, ty) && U_LESS_THAN(ty, y + SCREEN_TILE_REFRES_H)) {
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	bit	7, (hl)
	jr	Z, 00112$
	pop	de
	push	de
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	bit	7, a
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/Scroll.c:198: ActivateActor(i);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActivateActor
	inc	sp
00112$:
;/tmp/_gbsbuild/src/core/Scroll.c:194: for (i = 1; i != actors_len; i++) {
	ldhl	sp,	#6
	inc	(hl)
	jp	00111$
00109$:
;/tmp/_gbsbuild/src/core/Scroll.c:203: pending_h_x = x;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pending_h_x
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Scroll.c:204: pending_h_y = y;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_pending_h_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Scroll.c:205: pending_h_i = SCREEN_TILE_REFRES_H;
	ld	hl, #_pending_h_i
	ld	(hl), #0x15
;/tmp/_gbsbuild/src/core/Scroll.c:206: pending_h_map = image_ptr + image_tile_width * y + x;
	ld	hl, #_image_tile_width
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__mulint
	add	sp, #4
	ld	a, e
	ld	hl, #_image_ptr
	add	a, (hl)
	ld	c, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, l
	ld	(_pending_h_map), a
	ld	a, h
	ld	(_pending_h_map + 1), a
;/tmp/_gbsbuild/src/core/Scroll.c:209: pending_h_cmap = image_attr_ptr + image_tile_width * y + x;
	ld	a, e
	ld	hl, #_image_attr_ptr
	add	a, (hl)
	ld	c, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, l
	ld	(_pending_h_cmap), a
	ld	a, h
	ld	(_pending_h_cmap + 1), a
;/tmp/_gbsbuild/src/core/Scroll.c:211: }
	add	sp, #7
	ret
;/tmp/_gbsbuild/src/core/Scroll.c:213: void RefreshScroll() {
;	---------------------------------
; Function RefreshScroll
; ---------------------------------
_RefreshScroll::
;/tmp/_gbsbuild/src/core/Scroll.c:214: RefreshScroll_b();
	ld	e, #b_RefreshScroll_b
	ld	hl, #_RefreshScroll_b
;/tmp/_gbsbuild/src/core/Scroll.c:215: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Scroll.c:217: void InitScroll() {
;	---------------------------------
; Function InitScroll
; ---------------------------------
_InitScroll::
;/tmp/_gbsbuild/src/core/Scroll.c:218: pending_w_i = 0;
	ld	hl, #_pending_w_i
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:219: pending_h_i = 0;
	ld	hl, #_pending_h_i
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:220: scroll_x = 0x7FFF;
	ld	hl, #_scroll_x
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0x7f
;/tmp/_gbsbuild/src/core/Scroll.c:221: scroll_y = 0x7FFF;
	ld	hl, #_scroll_y
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0x7f
;/tmp/_gbsbuild/src/core/Scroll.c:222: }
	ret
;/tmp/_gbsbuild/src/core/Scroll.c:224: void RenderScreen() {
;	---------------------------------
; Function RenderScreen
; ---------------------------------
_RenderScreen::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/Scroll.c:228: if (!fade_style)
	ld	a, (#_fade_style)
	or	a, a
	jr	NZ, 00108$
;/tmp/_gbsbuild/src/core/Scroll.c:230: DISPLAY_OFF
	call	_display_off
	jr	00109$
00108$:
;/tmp/_gbsbuild/src/core/Scroll.c:231: } else if (!fade_timer == 0)
	ld	a, (#_fade_timer)
	or	a, a
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/Scroll.c:235: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00103$
;/tmp/_gbsbuild/src/core/Scroll.c:236: for (UBYTE c = 0; c != 32; ++c) {
	ld	bc, #_BkgPaletteBuffer+0
	ld	e, #0x00
00114$:
	ld	a, e
	sub	a, #0x20
	jr	Z, 00101$
;/tmp/_gbsbuild/src/core/Scroll.c:237: BkgPaletteBuffer[c] = RGB_BLACK;
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Scroll.c:236: for (UBYTE c = 0; c != 32; ++c) {
	inc	e
	jr	00114$
00101$:
;/tmp/_gbsbuild/src/core/Scroll.c:239: set_bkg_palette(0, 8, BkgPaletteBuffer);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	a, #0x08
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
	ld	a, #0x08
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_palette
	add	sp, #4
	jr	00104$
00103$:
;/tmp/_gbsbuild/src/core/Scroll.c:243: OBP0_REG = 0xFF;
	ld	a, #0xff
	ldh	(_OBP0_REG+0),a
00104$:
;/tmp/_gbsbuild/src/core/Scroll.c:244: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
00109$:
;/tmp/_gbsbuild/src/core/Scroll.c:248: pending_w_i = 0;
	ld	hl, #_pending_w_i
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:249: pending_h_i = 0;
	ld	hl, #_pending_h_i
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:251: PUSH_BANK(image_bank);
	ld	a, (#_image_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/Scroll.c:252: y = scroll_y >> 3;
	ld	hl, #_scroll_y + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Scroll.c:253: for (i = 0u; i != (SCREEN_TILE_REFRES_H) && y != image_height; ++i, y++) {
	xor	a, a
	ldhl	sp,	#2
	ld	(hl), a
00118$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x15
	jr	Z, 00110$
	ld	e, c
	ld	d, b
	ld	hl, #_image_height
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00173$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00110$
00173$:
;/tmp/_gbsbuild/src/core/Scroll.c:254: ScrollUpdateRow((scroll_x >> 3) - SCREEN_PAD_LEFT, y - SCREEN_PAD_TOP);
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ld	hl, #_scroll_x + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	dec	de
	push	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_ScrollUpdateRow
	add	sp, #4
	pop	bc
;/tmp/_gbsbuild/src/core/Scroll.c:253: for (i = 0u; i != (SCREEN_TILE_REFRES_H) && y != image_height; ++i, y++) {
	ldhl	sp,	#2
	inc	(hl)
	inc	bc
	jr	00118$
00110$:
;/tmp/_gbsbuild/src/core/Scroll.c:256: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/Scroll.c:258: game_time = 0;
	ld	hl, #_game_time
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Scroll.c:260: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;/tmp/_gbsbuild/src/core/Scroll.c:261: if (!fade_timer == 0) {
	ld	a, (#_fade_timer)
	or	a, a
	jr	Z, 00120$
;/tmp/_gbsbuild/src/core/Scroll.c:263: ApplyPaletteChange();
	call	_ApplyPaletteChange
00120$:
;/tmp/_gbsbuild/src/core/Scroll.c:265: }
	add	sp, #3
	ret
	.area _CODE
	.area _CABS (ABS)
