;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Math
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DespRight
	.globl _Lt16
	.globl _Gt16
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
;/tmp/_gbsbuild/src/core/Math.c:5: INT16 DespRight(INT16 a, INT16 b) {
;	---------------------------------
; Function DespRight
; ---------------------------------
_DespRight::
;/tmp/_gbsbuild/src/core/Math.c:6: return a >> b;
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	af
	inc	a
	jr	00104$
00103$:
	sra	d
	rr	e
00104$:
	dec	a
	jr	NZ, 00103$
;/tmp/_gbsbuild/src/core/Math.c:7: }
	ret
;/tmp/_gbsbuild/src/core/Math.c:9: UBYTE Lt16(UINT16 a, UINT16 b) {
;	---------------------------------
; Function Lt16
; ---------------------------------
_Lt16::
	dec	sp
;/tmp/_gbsbuild/src/core/Math.c:10: UBYTE a_hi = a >> 8;
	ldhl	sp,	#4
;/tmp/_gbsbuild/src/core/Math.c:11: UBYTE b_hi = b >> 8;
	ld	a, (hl+)
	ld	c, a
	inc	hl
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/Math.c:12: UBYTE a_lo = a & 0xFF;
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Math.c:13: UBYTE b_lo = b & 0xFF;
	ldhl	sp,	#5
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Math.c:14: return a_hi < b_hi || (a_hi == b_hi && a_lo < b_lo);
	ld	a,c
	cp	a,b
	jr	C, 00104$
	sub	a, b
	jr	NZ, 00103$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, e
	jr	C, 00104$
00103$:
	ld	e, #0x00
	jr	00105$
00104$:
	ld	e, #0x01
00105$:
;/tmp/_gbsbuild/src/core/Math.c:15: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/Math.c:17: UBYTE Gt16(UINT16 a, UINT16 b) {
;	---------------------------------
; Function Gt16
; ---------------------------------
_Gt16::
	dec	sp
;/tmp/_gbsbuild/src/core/Math.c:18: UBYTE a_hi = a >> 8;
	ldhl	sp,	#4
;/tmp/_gbsbuild/src/core/Math.c:19: UBYTE b_hi = b >> 8;
	ld	a, (hl+)
	ld	c, a
	inc	hl
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/Math.c:20: UBYTE a_lo = a & 0xFF;
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Math.c:21: UBYTE b_lo = b & 0xFF;
	ldhl	sp,	#5
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Math.c:22: return a_hi > b_hi || (a_hi == b_hi && a_lo > b_lo);
	ld	a, b
	sub	a, c
	jr	C, 00104$
	ld	a, c
	sub	a, b
	jr	NZ, 00103$
	ld	a, e
	ldhl	sp,	#0
	sub	a, (hl)
	jr	C, 00104$
00103$:
	ld	e, #0x00
	jr	00105$
00104$:
	ld	e, #0x01
00105$:
;/tmp/_gbsbuild/src/core/Math.c:23: }
	inc	sp
	ret
	.area _CODE
	.area _CABS (ABS)
