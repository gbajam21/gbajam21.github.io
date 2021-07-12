;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Trigger_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_TriggerAtTile_b
	.globl _TriggerAtTile_b
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
;/tmp/_gbsbuild/src/core/Trigger_b.c:5: UBYTE TriggerAtTile_b(UBYTE tx_a, UBYTE ty_a) __banked {
;	---------------------------------
; Function TriggerAtTile_b
; ---------------------------------
	b_TriggerAtTile_b	= 1
_TriggerAtTile_b::
	add	sp, #-8
;/tmp/_gbsbuild/src/core/Trigger_b.c:8: for (i = 0; i != triggers_len; i++) {
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, #0x00
00108$:
	ld	a, (#_triggers_len)
	sub	a, c
	jp	Z,00106$
;/tmp/_gbsbuild/src/core/Trigger_b.c:9: tx_b = triggers[i].x;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_triggers)
	ld	e, a
	ld	a, h
	adc	a, #>(_triggers)
	ld	d, a
	ld	a, (de)
	ld	b, a
;/tmp/_gbsbuild/src/core/Trigger_b.c:10: ty_b = triggers[i].y;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Trigger_b.c:11: tx_c = tx_b + triggers[i].w - 1;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	add	a, b
	add	a, #0xff
	ldhl	sp,	#2
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Trigger_b.c:12: ty_c = ty_b + triggers[i].h - 1;
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	dec	hl
	add	a, (hl)
	add	a, #0xff
	inc	hl
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Trigger_b.c:14: if ((tx_a + 1) >= tx_b && tx_a <= tx_c && ty_a >= ty_b && ty_a <= ty_c) {
	ldhl	sp,	#14
	ld	e, (hl)
	ld	d, #0x00
	inc	de
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl+), a
	ld	(hl), b
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00143$
	bit	7, d
	jr	NZ, 00144$
	cp	a, a
	jr	00144$
00143$:
	bit	7, d
	jr	Z, 00144$
	scf
00144$:
	jr	C, 00109$
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	C, 00109$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	C, 00109$
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#15
	sub	a, (hl)
	jr	C, 00109$
;/tmp/_gbsbuild/src/core/Trigger_b.c:15: return i;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00110$
00109$:
;/tmp/_gbsbuild/src/core/Trigger_b.c:8: for (i = 0; i != triggers_len; i++) {
	inc	c
	ldhl	sp,	#0
	ld	(hl), c
	jp	00108$
00106$:
;/tmp/_gbsbuild/src/core/Trigger_b.c:19: return NO_TRIGGER_COLLISON;
	ld	e, #0xff
00110$:
;/tmp/_gbsbuild/src/core/Trigger_b.c:20: }
	add	sp, #8
	ret
	.area _CODE_1
	.area _CABS (ABS)
