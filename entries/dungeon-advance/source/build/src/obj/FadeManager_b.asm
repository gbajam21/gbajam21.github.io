;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module FadeManager_b
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
	.globl _ApplyPaletteChangeDMG
	.globl _ApplyPaletteChangeColor
	.globl _UpdateColorBlack
	.globl _DespRight
	.globl _memcpy
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_fade_frame:
	.ds 1
_fade_direction:
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;/tmp/_gbsbuild/src/core/FadeManager_b.c:20: UWORD UpdateColorBlack(UINT8 i, UWORD col) {
;	---------------------------------
; Function UpdateColorBlack
; ---------------------------------
_UpdateColorBlack::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/FadeManager_b.c:21: return RGB2(DespRight(PAL_RED(col), 5 - i),  DespRight(PAL_GREEN(col), 5 - i),
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0005
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#5
	ld	a, (hl)
	and	a, #0x1f
	ld	c, a
	ld	b, #0x00
	pop	hl
	push	hl
	push	hl
	push	bc
	call	_DespRight
	add	sp, #4
	ld	c, e
	ld	b, d
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, e
	and	a, #0x1f
	ld	e, a
	ld	d, #0x00
	push	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_DespRight
	add	sp, #4
	pop	bc
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, c
	ld	c, a
	ld	a, h
	or	a, b
	ld	b, a
	ldhl	sp,	#6
	ld	a, (hl)
	rrca
	rrca
	and	a, #0x3f
	and	a, #0x1f
	ld	e, a
	ld	d, #0x00
	push	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_DespRight
	add	sp, #4
	pop	bc
	ld	h, e
	ld	l, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, c
	ld	e, a
	ld	a, h
	or	a, b
	ld	d, a
;/tmp/_gbsbuild/src/core/FadeManager_b.c:23: }
	add	sp, #2
	ret
_obj_fade_vals:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0xd0	; 208
	.db #0xd0	; 208
_bgp_fade_vals:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x90	; 144
	.db #0xa4	; 164
	.db #0xe4	; 228
	.db #0xe4	; 228
_obj_fade_black_vals:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xe4	; 228
	.db #0xd4	; 212
	.db #0xd0	; 208
	.db #0xd0	; 208
_bgp_fade_black_vals:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xe9	; 233
	.db #0xe5	; 229
	.db #0xe4	; 228
	.db #0xe4	; 228
;/tmp/_gbsbuild/src/core/FadeManager_b.c:25: void ApplyPaletteChangeColor(UBYTE index) {
;	---------------------------------
; Function ApplyPaletteChangeColor
; ---------------------------------
_ApplyPaletteChangeColor::
	add	sp, #-9
;/tmp/_gbsbuild/src/core/FadeManager_b.c:28: UWORD* col = BkgPalette;
;/tmp/_gbsbuild/src/core/FadeManager_b.c:30: if (index == 5) {
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:31: memcpy(BkgPaletteBuffer, BkgPalette, 64);
	ld	hl, #0x0040
	push	hl
	ld	hl, #_BkgPalette
	push	hl
	ld	hl, #_BkgPaletteBuffer
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/FadeManager_b.c:32: memcpy(SprPaletteBuffer, SprPalette, 64);
	ld	hl, #0x0040
	push	hl
	ld	hl, #_SprPalette
	push	hl
	ld	hl, #_SprPaletteBuffer
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/FadeManager_b.c:33: palette_dirty = TRUE;
	ld	hl, #_palette_dirty
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/FadeManager_b.c:34: return;
	jp	00118$
00102$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:37: if (fade_style) {
	ld	a, (#_fade_style)
	or	a, a
	jp	Z, 00108$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:38: for (c = 0; c != 32; ++c, ++col) {
	xor	a, a
	ldhl	sp,	#8
	ld	(hl), a
	ld	bc, #_BkgPalette
00110$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:39: BkgPaletteBuffer[c] = UpdateColorBlack(index, *col);
	ldhl	sp,	#8
	ld	e, (hl)
	ld	d, #0x00
	sla	e
	rl	d
	dec	hl
	dec	hl
	ld	a, e
	ld	(hl+), a
;c
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_BkgPaletteBuffer
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	call	_UpdateColorBlack
	add	sp, #3
	push	hl
	ldhl	sp,	#10
	ld	(hl), e
	ldhl	sp,	#11
	ld	(hl), d
	pop	hl
	pop	bc
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/FadeManager_b.c:38: for (c = 0; c != 32; ++c, ++col) {
	inc	hl
	inc	(hl)
	inc	bc
	inc	bc
	ld	a, (hl)
	sub	a, #0x20
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:41: col = SprPalette;
	ldhl	sp,	#6
	ld	(hl), #<(_SprPalette)
	inc	hl
	ld	(hl), #>(_SprPalette)
;/tmp/_gbsbuild/src/core/FadeManager_b.c:42: for (c = 0; c != 32; c++, ++col) {
	xor	a, a
	inc	hl
	ld	(hl), a
00112$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:43: SprPaletteBuffer[c] = UpdateColorBlack(index, *col);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_SprPaletteBuffer
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	push	bc
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	call	_UpdateColorBlack
	add	sp, #3
	ld	c, e
	ld	b, d
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/FadeManager_b.c:42: for (c = 0; c != 32; c++, ++col) {
	ldhl	sp,	#8
	inc	(hl)
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl+), a
	ld	a, (hl)
	sub	a, #0x20
	jp	Z,00109$
	jr	00112$
00108$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:46: paletteWhite = RGB2(DespRight(0x1F, index), DespRight(0x1F, index), 
	ldhl	sp,	#11
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	push	bc
	ld	hl, #0x001f
	push	hl
	call	_DespRight
	add	sp, #4
	pop	bc
	ldhl	sp,	#7
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	push	bc
	push	bc
	ld	hl, #0x001f
	push	hl
	call	_DespRight
	add	sp, #4
	pop	bc
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	d, h
	ldhl	sp,	#7
	or	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	or	a, (hl)
	ld	d, a
	push	de
	push	bc
	ld	hl, #0x001f
	push	hl
	call	_DespRight
	add	sp, #4
	ld	c, e
	pop	de
	ld	h, c
	ld	l, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, e
	ld	c, a
	ld	a, h
	or	a, d
	ld	b, a
	inc	sp
	inc	sp
	push	bc
;/tmp/_gbsbuild/src/core/FadeManager_b.c:48: for (c = 0; c != 32; ++c, ++col) {
	xor	a, a
	ldhl	sp,	#8
	ld	(hl), a
	ld	bc, #_BkgPalette
00114$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:49: BkgPaletteBuffer[c] = (UWORD)*col | paletteWhite;
	ldhl	sp,	#8
	ld	e, (hl)
	ld	d, #0x00
	sla	e
	rl	d
	dec	hl
	dec	hl
	ld	a, e
	ld	(hl+), a
;c
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_BkgPaletteBuffer
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	e, c
	ld	d, b
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	or	a, (hl)
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#1
	or	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/FadeManager_b.c:48: for (c = 0; c != 32; ++c, ++col) {
	inc	hl
	inc	(hl)
	inc	bc
	inc	bc
	ld	a, (hl)
	sub	a, #0x20
	jr	NZ, 00114$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:51: col = SprPalette;
	ldhl	sp,	#6
	ld	(hl), #<(_SprPalette)
	inc	hl
	ld	(hl), #>(_SprPalette)
;/tmp/_gbsbuild/src/core/FadeManager_b.c:52: for (c = 0; c != 32; ++c, ++col) {
	xor	a, a
	inc	hl
	ld	(hl), a
00116$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:53: SprPaletteBuffer[c] = (UWORD)*col | paletteWhite;
	ldhl	sp,	#8
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	ld	a, l
	add	a, #<(_SprPaletteBuffer)
	ld	c, a
	ld	a, h
	adc	a, #>(_SprPaletteBuffer)
	ld	b, a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	or	a, (hl)
	ld	e, a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	or	a, (hl)
	ld	d, a
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/FadeManager_b.c:52: for (c = 0; c != 32; ++c, ++col) {
	ldhl	sp,	#8
	inc	(hl)
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl+), a
	ld	a, (hl)
	sub	a, #0x20
	jr	NZ, 00116$
00109$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:57: palette_dirty = TRUE;
	ld	hl, #_palette_dirty
	ld	(hl), #0x01
00118$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:58: }
	add	sp, #9
	ret
;/tmp/_gbsbuild/src/core/FadeManager_b.c:61: void ApplyPaletteChangeDMG(UBYTE index) {
;	---------------------------------
; Function ApplyPaletteChangeDMG
; ---------------------------------
_ApplyPaletteChangeDMG::
;/tmp/_gbsbuild/src/core/FadeManager_b.c:62: if (!fade_style) {
	ld	a, (#_fade_style)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:63: OBP0_REG = obj_fade_vals[index];
	ld	bc, #_obj_fade_vals+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldh	(_OBP0_REG+0),a
;/tmp/_gbsbuild/src/core/FadeManager_b.c:64: BGP_REG = bgp_fade_vals[index];
;c
	ld	de, #_bgp_fade_vals
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldh	(_BGP_REG+0),a
	ret
00102$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:67: OBP0_REG = obj_fade_black_vals[index];
	ld	bc, #_obj_fade_black_vals+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldh	(_OBP0_REG+0),a
;/tmp/_gbsbuild/src/core/FadeManager_b.c:68: BGP_REG = bgp_fade_black_vals[index];
	ld	bc, #_bgp_fade_black_vals+0
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldh	(_BGP_REG+0),a
;/tmp/_gbsbuild/src/core/FadeManager_b.c:70: }
	ret
;/tmp/_gbsbuild/src/core/FadeManager_b.c:72: void FadeIn_b() __banked {
;	---------------------------------
; Function FadeIn_b
; ---------------------------------
	b_FadeIn_b	= 1
_FadeIn_b::
;/tmp/_gbsbuild/src/core/FadeManager_b.c:73: fade_frame = 0;
	ld	hl, #_fade_frame
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/FadeManager_b.c:74: fade_direction = FADE_IN;
	ld	hl, #_fade_direction
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/FadeManager_b.c:75: fade_running = TRUE;
	ld	hl, #_fade_running
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/FadeManager_b.c:76: fade_timer = 0;
	ld	hl, #_fade_timer
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/FadeManager_b.c:78: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:79: ApplyPaletteChangeColor(fade_timer);
	xor	a, a
	push	af
	inc	sp
	call	_ApplyPaletteChangeColor
	inc	sp
	ret
00102$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:82: ApplyPaletteChangeDMG(fade_timer);
	xor	a, a
	push	af
	inc	sp
	call	_ApplyPaletteChangeDMG
	inc	sp
;/tmp/_gbsbuild/src/core/FadeManager_b.c:83: }
	ret
;/tmp/_gbsbuild/src/core/FadeManager_b.c:85: void FadeOut_b() __banked {
;	---------------------------------
; Function FadeOut_b
; ---------------------------------
	b_FadeOut_b	= 1
_FadeOut_b::
;/tmp/_gbsbuild/src/core/FadeManager_b.c:86: fade_frame = 0;
	ld	hl, #_fade_frame
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/FadeManager_b.c:87: fade_direction = FADE_OUT;
	ld	hl, #_fade_direction
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/FadeManager_b.c:88: fade_running = TRUE;
	ld	hl, #_fade_running
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/FadeManager_b.c:89: fade_timer = 5;
	ld	hl, #_fade_timer
	ld	(hl), #0x05
;/tmp/_gbsbuild/src/core/FadeManager_b.c:91: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:92: ApplyPaletteChangeColor(fade_timer);
	ld	a, #0x05
	push	af
	inc	sp
	call	_ApplyPaletteChangeColor
	inc	sp
	ret
00102$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:95: ApplyPaletteChangeDMG(fade_timer);
	ld	a, #0x05
	push	af
	inc	sp
	call	_ApplyPaletteChangeDMG
	inc	sp
;/tmp/_gbsbuild/src/core/FadeManager_b.c:96: }
	ret
;/tmp/_gbsbuild/src/core/FadeManager_b.c:98: void FadeUpdate_b()  __banked {
;	---------------------------------
; Function FadeUpdate_b
; ---------------------------------
	b_FadeUpdate_b	= 1
_FadeUpdate_b::
;/tmp/_gbsbuild/src/core/FadeManager_b.c:99: if (fade_running) {
	ld	a, (#_fade_running)
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/FadeManager_b.c:100: if ((fade_frame & fade_frames_per_step) == 0) {
	ld	a, (#_fade_frame)
	ld	hl, #_fade_frames_per_step
	and	a,(hl)
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:101: if (fade_direction == FADE_IN) {
	ld	a, (#_fade_direction)
	or	a, a
	jr	NZ, 00106$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:102: fade_timer++;
	ld	hl, #_fade_timer
	inc	(hl)
;/tmp/_gbsbuild/src/core/FadeManager_b.c:103: if (fade_timer == 5) {
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:104: fade_running = FALSE;
	ld	hl, #_fade_running
	ld	(hl), #0x00
	jr	00107$
00106$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:107: fade_timer--;
	ld	hl, #_fade_timer
;/tmp/_gbsbuild/src/core/FadeManager_b.c:108: if (fade_timer == 0) {
	dec	(hl)
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:109: fade_running = FALSE;
	ld	hl, #_fade_running
	ld	(hl), #0x00
00107$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:113: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00109$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:114: ApplyPaletteChangeColor(fade_timer);
	ld	a, (#_fade_timer)
	push	af
	inc	sp
	call	_ApplyPaletteChangeColor
	inc	sp
	jr	00112$
00109$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:117: ApplyPaletteChangeDMG(fade_timer);
	ld	a, (#_fade_timer)
	push	af
	inc	sp
	call	_ApplyPaletteChangeDMG
	inc	sp
00112$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:119: fade_frame++;
	ld	hl, #_fade_frame
	inc	(hl)
;/tmp/_gbsbuild/src/core/FadeManager_b.c:121: }
	ret
;/tmp/_gbsbuild/src/core/FadeManager_b.c:123: void ApplyPaletteChange_b() __banked {
;	---------------------------------
; Function ApplyPaletteChange_b
; ---------------------------------
	b_ApplyPaletteChange_b	= 1
_ApplyPaletteChange_b::
;/tmp/_gbsbuild/src/core/FadeManager_b.c:125: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/FadeManager_b.c:126: ApplyPaletteChangeColor(fade_timer);
	ld	a, (#_fade_timer)
	push	af
	inc	sp
	call	_ApplyPaletteChangeColor
	inc	sp
	ret
00102$:
;/tmp/_gbsbuild/src/core/FadeManager_b.c:129: ApplyPaletteChangeDMG(fade_timer);
	ld	a, (#_fade_timer)
	push	af
	inc	sp
	call	_ApplyPaletteChangeDMG
	inc	sp
;/tmp/_gbsbuild/src/core/FadeManager_b.c:130: }
	ret
	.area _CODE_1
	.area _CABS (ABS)
