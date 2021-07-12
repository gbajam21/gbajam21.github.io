;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Sprite_b
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
	.globl _StackPop
	.globl _StackPush
	.globl _sprite_active_pool_size
	.globl _sprite_active_pool
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprite_active_pool::
	.ds 19
_sprite_active_pool_size::
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
;/tmp/_gbsbuild/src/core/Sprite_b.c:7: UBYTE sprite_active_pool_size = 0;
	ld	hl, #_sprite_active_pool_size
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;/tmp/_gbsbuild/src/core/Sprite_b.c:9: void SpritePoolReset_b() __banked {
;	---------------------------------
; Function SpritePoolReset_b
; ---------------------------------
	b_SpritePoolReset_b	= 1
_SpritePoolReset_b::
;/tmp/_gbsbuild/src/core/Sprite_b.c:11: sprite_pool[0] = 0;
	ld	hl, #_sprite_pool
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:12: for (i = 0; i != MAX_SPRITES; i++) {
	ld	b, #0x00
00104$:
;/tmp/_gbsbuild/src/core/Sprite_b.c:15: k = (MAX_SPRITES - i) << 1;
	ld	c, b
	ld	a, #0x13
	sub	a, c
	add	a, a
	ld	c, a
;/tmp/_gbsbuild/src/core/Sprite_b.c:16: StackPush(sprite_pool, k);
	push	bc
	ld	a, c
	push	af
	inc	sp
	ld	hl, #_sprite_pool
	push	hl
	call	_StackPush
	add	sp, #3
	pop	bc
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:18: move_sprite(k + 1, 0, 0);
	inc	c
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:12: for (i = 0; i != MAX_SPRITES; i++) {
	inc	b
	ld	a, b
	sub	a, #0x13
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/Sprite_b.c:20: sprite_active_pool[0] = 0;
	ld	hl, #_sprite_active_pool
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:21: sprite_active_pool_size = 0;
	ld	hl, #_sprite_active_pool_size
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:22: }
	ret
;/tmp/_gbsbuild/src/core/Sprite_b.c:24: void SpritePoolReturn_b(UINT8 i) __banked {
;	---------------------------------
; Function SpritePoolReturn_b
; ---------------------------------
	b_SpritePoolReturn_b	= 1
_SpritePoolReturn_b::
;/tmp/_gbsbuild/src/core/Sprite_b.c:26: UBYTE a = 0;
	ld	c, #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:28: StackPush(sprite_pool, i);
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #_sprite_pool
	push	hl
	call	_StackPush
	add	sp, #3
	pop	bc
;/tmp/_gbsbuild/src/core/Sprite_b.c:31: for (j = 0; j != sprite_active_pool_size; j++) {
	ld	b, #0x00
	ld	e, #0x00
00109$:
	ld	a, (#_sprite_active_pool_size)
	sub	a, e
	jr	Z, 00103$
;/tmp/_gbsbuild/src/core/Sprite_b.c:32: if (sprite_active_pool[j] == i) {
	ld	hl, #_sprite_active_pool
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/Sprite_b.c:33: a = j;
	ld	c, b
;/tmp/_gbsbuild/src/core/Sprite_b.c:34: break;
	jr	00103$
00110$:
;/tmp/_gbsbuild/src/core/Sprite_b.c:31: for (j = 0; j != sprite_active_pool_size; j++) {
	inc	e
	ld	b, e
	jr	00109$
00103$:
;/tmp/_gbsbuild/src/core/Sprite_b.c:39: if (a) {
	ld	a, c
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/Sprite_b.c:41: sprite_active_pool[a] = sprite_active_pool[--sprite_active_pool_size];
	ld	a, #<(_sprite_active_pool)
	add	a, c
	ld	c, a
	ld	a, #>(_sprite_active_pool)
	adc	a, #0x00
	ld	b, a
	ld	hl, #_sprite_active_pool_size
	dec	(hl)
	ld	a, #<(_sprite_active_pool)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_sprite_active_pool)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Sprite_b.c:43: move_sprite(i, 0, 0);
	ldhl	sp,	#6
	ld	c, (hl)
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:44: move_sprite(i + 1, 0, 0);
	inc	c
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Sprite_b.c:44: move_sprite(i + 1, 0, 0);
;/tmp/_gbsbuild/src/core/Sprite_b.c:46: }
	ret
;/tmp/_gbsbuild/src/core/Sprite_b.c:48: UINT8 SpritePoolNext_b() __banked {
;	---------------------------------
; Function SpritePoolNext_b
; ---------------------------------
	b_SpritePoolNext_b	= 1
_SpritePoolNext_b::
;/tmp/_gbsbuild/src/core/Sprite_b.c:49: UINT8 next = StackPop(sprite_pool);
	ld	hl, #_sprite_pool
	push	hl
	call	_StackPop
	add	sp, #2
;/tmp/_gbsbuild/src/core/Sprite_b.c:50: sprite_active_pool[sprite_active_pool_size++] = next;
	ld	hl, #_sprite_active_pool_size
	ld	c, (hl)
	inc	(hl)
	ld	hl, #_sprite_active_pool
	ld	b, #0x00
	add	hl, bc
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Sprite_b.c:52: return next;
;/tmp/_gbsbuild/src/core/Sprite_b.c:53: }
	ret
	.area _CODE_1
	.area _CABS (ABS)
