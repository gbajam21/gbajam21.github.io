;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Scroll_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ScrollUpdateColumnR
	.globl _ScrollUpdateRowR
	.globl _ScrollUpdateColumnWithDelay
	.globl _ScrollUpdateRowWithDelay
	.globl _RenderScreen
	.globl b_RefreshScroll_b
	.globl _RefreshScroll_b
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
	.area _CODE_1
;/tmp/_gbsbuild/src/core/Scroll_b.c:12: void RefreshScroll_b() __banked {
;	---------------------------------
; Function RefreshScroll_b
; ---------------------------------
	b_RefreshScroll_b	= 1
_RefreshScroll_b::
	add	sp, #-15
;/tmp/_gbsbuild/src/core/Scroll_b.c:15: UBYTE render = FALSE;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Scroll_b.c:17: x = scroll_target->x - (SCREENWIDTH >> 1);
	ld	hl, #_scroll_target
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#13
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	add	a, #0xb0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
;/tmp/_gbsbuild/src/core/Scroll_b.c:18: y = scroll_target->y - (SCREENHEIGHT >> 1);
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0048
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Scroll_b.c:20: if (x & 0x8000u) {  // check for negative signed bit
	bit	7, b
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/Scroll_b.c:21: x = 0u;
	ld	bc, #0x0000
	jr	00105$
00104$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:22: } else if (x > scroll_x_max) {
	ld	e, c
	ld	d, b
	ld	hl, #_scroll_x_max
	ld	a, (hl)
	sub	a, e
	inc	hl
	ld	a, (hl)
	sbc	a, d
	jr	NC, 00105$
;/tmp/_gbsbuild/src/core/Scroll_b.c:23: x = scroll_x_max;
	ld	hl, #_scroll_x_max + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00105$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:25: if (y & 0x8000u) {
	ldhl	sp,	#2
	bit	7, (hl)
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/Scroll_b.c:26: y = 0u;
	xor	a, a
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), a
	jr	00110$
00109$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:27: } else if (y > scroll_y_max) {
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_scroll_y_max
	ld	a, (hl)
	sub	a, e
	inc	hl
	ld	a, (hl)
	sbc	a, d
	jr	NC, 00110$
;/tmp/_gbsbuild/src/core/Scroll_b.c:28: y = scroll_y_max;
	ld	hl, #_scroll_y_max
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), e
00110$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:31: current_column = scroll_x >> 3;
	ld	a, (#_scroll_x)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_scroll_x + 1)
	ldhl	sp,	#4
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;/tmp/_gbsbuild/src/core/Scroll_b.c:32: new_column = x >> 3;
	inc	hl
	inc	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;/tmp/_gbsbuild/src/core/Scroll_b.c:33: current_row = scroll_y >> 3;
	ld	a, (#_scroll_y)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (#_scroll_y + 1)
	ldhl	sp,	#8
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;/tmp/_gbsbuild/src/core/Scroll_b.c:34: new_row = y >> 3;
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;/tmp/_gbsbuild/src/core/Scroll_b.c:37: if (current_column == new_column - 1) {
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#12
	ld	(hl-), a
;/tmp/_gbsbuild/src/core/Scroll_b.c:40: new_row - SCREEN_PAD_TOP);
	ld	a, e
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Scroll_b.c:37: if (current_column == new_column - 1) {
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#11
	sub	a, (hl)
	jr	NZ, 00117$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#12
	sub	a, (hl)
	jr	NZ, 00117$
;/tmp/_gbsbuild/src/core/Scroll_b.c:39: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1,
;c
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0015
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_ScrollUpdateColumnWithDelay
	add	sp, #4
	pop	bc
	jr	00118$
00117$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:41: } else if (current_column == new_column + 1) {
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00114$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00114$
;/tmp/_gbsbuild/src/core/Scroll_b.c:43: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	push	bc
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_ScrollUpdateColumnWithDelay
	add	sp, #4
	pop	bc
	jr	00118$
00114$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:44: } else if (current_column != new_column) {
	ldhl	sp,	#3
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00214$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	Z, 00118$
00214$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:46: render = TRUE;
	ldhl	sp,	#0
	ld	(hl), #0x01
00118$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:50: if (current_row == new_row - 1) {
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jr	NZ, 00125$
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	NZ, 00125$
;/tmp/_gbsbuild/src/core/Scroll_b.c:53: new_row - SCREEN_PAD_TOP + SCREEN_TILE_REFRES_H - 1);
;c
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0013
	add	hl, de
	ld	e, l
	ld	d, h
;/tmp/_gbsbuild/src/core/Scroll_b.c:52: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT,
	push	bc
	push	de
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_ScrollUpdateRowWithDelay
	add	sp, #4
	pop	bc
	jr	00126$
00125$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:54: } else if (current_row == new_row + 1) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00122$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00122$
;/tmp/_gbsbuild/src/core/Scroll_b.c:56: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	push	bc
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_ScrollUpdateRowWithDelay
	add	sp, #4
	pop	bc
	jr	00126$
00122$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:57: } else if (current_row != new_row) {
	ldhl	sp,	#7
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00219$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	Z, 00126$
00219$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:59: render = TRUE;
	ldhl	sp,	#0
	ld	(hl), #0x01
00126$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:62: scroll_x = x;
	ld	hl, #_scroll_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Scroll_b.c:63: scroll_y = y;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_scroll_y
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Scroll_b.c:64: draw_scroll_x = x + scroll_offset_x;
	ld	a, c
	ld	hl, #_scroll_offset_x
	add	a, (hl)
	ld	(#_draw_scroll_x),a
	ld	a, b
	ld	hl, #_scroll_offset_x + 1
	adc	a, (hl)
	ld	(#_draw_scroll_x + 1),a
;/tmp/_gbsbuild/src/core/Scroll_b.c:65: draw_scroll_y = y + scroll_offset_y;
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_scroll_offset_y
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, l
	ld	(_draw_scroll_y), a
	ld	a, h
	ld	(_draw_scroll_y + 1), a
;/tmp/_gbsbuild/src/core/Scroll_b.c:67: if (render) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00134$
;/tmp/_gbsbuild/src/core/Scroll_b.c:68: RenderScreen();
	call	_RenderScreen
	jr	00136$
00134$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:69: } else if (IS_FRAME_2) {
	ld	a, (#_game_time)
	rrca
	jr	C, 00136$
;/tmp/_gbsbuild/src/core/Scroll_b.c:70: if (pending_w_i) {
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00128$
;/tmp/_gbsbuild/src/core/Scroll_b.c:72: ScrollUpdateRowR();
	call	_ScrollUpdateRowR
00128$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:74: if (pending_h_i) {
	ld	a, (#_pending_h_i)
	or	a, a
	jr	Z, 00136$
;/tmp/_gbsbuild/src/core/Scroll_b.c:76: ScrollUpdateColumnR();
	call	_ScrollUpdateColumnR
00136$:
;/tmp/_gbsbuild/src/core/Scroll_b.c:79: }
	add	sp, #15
	ret
	.area _CODE_1
	.area _CABS (ABS)
