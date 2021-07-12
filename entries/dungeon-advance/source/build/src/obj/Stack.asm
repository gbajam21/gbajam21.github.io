;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Stack
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _StackPush
	.globl _StackPop
	.globl _StackShift
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
;/tmp/_gbsbuild/src/core/Stack.c:3: void StackPush(UINT8* stack, UINT8 elem) {
;	---------------------------------
; Function StackPush
; ---------------------------------
_StackPush::
;/tmp/_gbsbuild/src/core/Stack.c:4: stack[++stack[0]] = elem;
	pop	bc
	pop	de
	push	de
	push	bc
	ld	a, (de)
	inc	a
	ld	(de), a
	add	a, e
	ld	c, a
	ld	a, #0x00
	adc	a, d
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Stack.c:5: }
	ret
;/tmp/_gbsbuild/src/core/Stack.c:7: UINT8 StackPop(UINT8* stack) {
;	---------------------------------
; Function StackPop
; ---------------------------------
_StackPop::
;/tmp/_gbsbuild/src/core/Stack.c:8: return stack[(stack[0]--)];
	pop	bc
	pop	de
	push	de
	push	bc
	ld	a, (de)
	ld	c, a
	dec	a
	ld	(de), a
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Stack.c:9: }
	ret
;/tmp/_gbsbuild/src/core/Stack.c:11: UINT8 StackShift(UINT8* stack) {
;	---------------------------------
; Function StackShift
; ---------------------------------
_StackShift::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/Stack.c:13: UBYTE elem = stack[1];
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Stack.c:14: for (i = 0; i != stack[0]; i++) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	xor	a, a
	ldhl	sp,	#1
	ld	(hl), a
00103$:
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	jr	Z, 00101$
;/tmp/_gbsbuild/src/core/Stack.c:15: stack[i + 1] = stack[i + 2];
	ldhl	sp,	#1
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	inc	hl
	add	hl, de
	inc	bc
	inc	bc
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	ld	a, (bc)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Stack.c:14: for (i = 0; i != stack[0]; i++) {
	ldhl	sp,	#1
	inc	(hl)
	jr	00103$
00101$:
;/tmp/_gbsbuild/src/core/Stack.c:17: stack[0]--;
	ld	a, c
	dec	a
	ld	(de), a
;/tmp/_gbsbuild/src/core/Stack.c:18: return elem;
	ldhl	sp,	#0
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Stack.c:19: }
	add	sp, #2
	ret
	.area _CODE
	.area _CABS (ABS)
