;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Actor_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_ActorRunCollisionScripts_b
	.globl _ActorRunCollisionScripts_b
	.globl b_InitPlayer_b
	.globl _InitPlayer_b
	.globl b_ActorOverlapsPlayer_b
	.globl _ActorOverlapsPlayer_b
	.globl b_ActorAt3x3Tile_b
	.globl _ActorAt3x3Tile_b
	.globl b_ActorAt2x3Tile_b
	.globl _ActorAt2x3Tile_b
	.globl b_ActorAt3x1Tile_b
	.globl _ActorAt3x1Tile_b
	.globl b_ActorAt1x3Tile_b
	.globl _ActorAt1x3Tile_b
	.globl b_ActorAt1x2Tile_b
	.globl _ActorAt1x2Tile_b
	.globl b_ActorAtTile_b
	.globl _ActorAtTile_b
	.globl b_CheckCollisionInDirection_b
	.globl _CheckCollisionInDirection_b
	.globl b_ActorInFrontOfActor_b
	.globl _ActorInFrontOfActor_b
	.globl b_ActorInFrontOfPlayer_b
	.globl _ActorInFrontOfPlayer_b
	.globl b_DeactivateActor_b
	.globl _DeactivateActor_b
	.globl b_ActivateActor_b
	.globl _ActivateActor_b
	.globl _LoadSprite
	.globl _TileAt2x2
	.globl _ScriptCtxPoolReturn
	.globl _ScriptStartBg
	.globl _ActorAt1x2Tile
	.globl _ActorAt3x3Tile
	.globl _ActorAt3x1Tile
	.globl _ActorAt1x3Tile
	.globl _SpritePoolNext
	.globl _SpritePoolReturn
	.globl _actors_active_delete_count
	.globl _actors_active_delete
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_actors_active_delete::
	.ds 11
_actors_active_delete_count::
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
;/tmp/_gbsbuild/src/core/Actor_b.c:18: UBYTE actors_active_delete_count = 0;
	ld	hl, #_actors_active_delete_count
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
;/tmp/_gbsbuild/src/core/Actor_b.c:20: void ActivateActor_b(UBYTE i) __banked {
;	---------------------------------
; Function ActivateActor_b
; ---------------------------------
	b_ActivateActor_b	= 1
_ActivateActor_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/Actor_b.c:23: if (actors_active_size == MAX_ACTIVE_ACTORS) {
	ld	a, (#_actors_active_size)
	sub	a, #0x0b
	jp	Z,00115$
;/tmp/_gbsbuild/src/core/Actor_b.c:24: return;
	jr	00102$
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:28: if (!actors[i].enabled) {
	ldhl	sp,	#10
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
	ld	bc,#_actors
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0012
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	or	a, a
;/tmp/_gbsbuild/src/core/Actor_b.c:29: return;
;/tmp/_gbsbuild/src/core/Actor_b.c:33: for (j = 0; j != actors_active_size; j++) {
	jp	Z,00115$
	ld	e, #0x00
00113$:
	ld	a, (#_actors_active_size)
	sub	a, e
	jr	Z, 00107$
;/tmp/_gbsbuild/src/core/Actor_b.c:34: if (actors_active[j] == i) {
	ld	hl, #_actors_active
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, d
	jr	Z, 00115$
;/tmp/_gbsbuild/src/core/Actor_b.c:35: return;
	jr	00114$
00114$:
;/tmp/_gbsbuild/src/core/Actor_b.c:33: for (j = 0; j != actors_active_size; j++) {
	inc	e
	jr	00113$
00107$:
;/tmp/_gbsbuild/src/core/Actor_b.c:39: actors_active[actors_active_size++] = i;
	ld	hl, #_actors_active_size
	ld	e, (hl)
	inc	(hl)
	ld	a, e
	add	a, #<(_actors_active)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_actors_active)
	ld	d, a
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Actor_b.c:40: actors[i].sprite_index = SpritePoolNext();
	ld	hl, #0x0009
	add	hl, bc
	ld	e, l
	ld	d, h
	push	bc
	push	de
	call	_SpritePoolNext
	ld	a, e
	pop	de
	pop	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/Actor_b.c:41: actors[i].frame_offset = 0;
	ld	hl, #0x0013
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor_b.c:42: actors[i].rerender = TRUE;
	ld	hl, #0x0014
	add	hl, bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Actor_b.c:43: actors[i].moving = FALSE;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor_b.c:44: actors[i].script_control = FALSE;
	ld	hl, #0x001b
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor_b.c:46: if (actors[i].movement_ptr.bank && actors[i].enabled) {
	ld	hl, #0x0021
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;/tmp/_gbsbuild/src/core/Actor_b.c:47: actors[i].movement_ctx = ScriptStartBg(&actors[i].movement_ptr, i);
	ld	a, c
	add	a, #0x2d
	ld	c, a
	jr	NC, 00157$
	inc	b
00157$:
;/tmp/_gbsbuild/src/core/Actor_b.c:46: if (actors[i].movement_ptr.bank && actors[i].enabled) {
	ld	a, l
	or	a, a
	jr	Z, 00109$
	pop	de
	push	de
	ld	a, (de)
	or	a, a
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/Actor_b.c:47: actors[i].movement_ctx = ScriptStartBg(&actors[i].movement_ptr, i);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_ScriptStartBg
	add	sp, #3
	ld	a, e
	pop	bc
	ld	(bc), a
	jr	00115$
00109$:
;/tmp/_gbsbuild/src/core/Actor_b.c:49: actors[i].movement_ctx = 0;
	xor	a, a
	ld	(bc), a
00115$:
;/tmp/_gbsbuild/src/core/Actor_b.c:51: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:53: void DeactivateActor_b(UBYTE i) __banked {
;	---------------------------------
; Function DeactivateActor_b
; ---------------------------------
	b_DeactivateActor_b	= 1
_DeactivateActor_b::
	dec	sp
;/tmp/_gbsbuild/src/core/Actor_b.c:56: a = 0;  // Required to fix GBDK bug
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:58: for (j = 0; j != actors_active_size; j++) {
	ld	c, #0x00
	ld	e, #0x00
00109$:
	ld	a, (#_actors_active_size)
	sub	a, e
	jr	Z, 00103$
;/tmp/_gbsbuild/src/core/Actor_b.c:59: if (actors_active[j] == i) {
	ld	hl, #_actors_active
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:60: a = j;
	ldhl	sp,	#0
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Actor_b.c:61: break;
	jr	00103$
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:58: for (j = 0; j != actors_active_size; j++) {
	inc	e
	ld	c, e
	jr	00109$
00103$:
;/tmp/_gbsbuild/src/core/Actor_b.c:65: if (a) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;/tmp/_gbsbuild/src/core/Actor_b.c:66: SpritePoolReturn(actors[i].sprite_index);
	ldhl	sp,	#7
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
	ld	bc,#_actors
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0009
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	push	bc
	push	de
	push	af
	inc	sp
	call	_SpritePoolReturn
	inc	sp
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/Actor_b.c:67: actors[i].sprite_index = 0;
	xor	a, a
	ld	(de), a
;/tmp/_gbsbuild/src/core/Actor_b.c:68: if (actors[i].movement_ctx) {
	ld	hl, #0x002d
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;/tmp/_gbsbuild/src/core/Actor_b.c:69: ScriptCtxPoolReturn(actors[i].movement_ctx, i);
	ldhl	sp,	#7
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_ScriptCtxPoolReturn
	add	sp, #2
00105$:
;/tmp/_gbsbuild/src/core/Actor_b.c:71: actors_active[a] = actors_active[--actors_active_size];
;c
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_actors_active
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_actors_active_size
	dec	(hl)
	ld	a, #<(_actors_active)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_actors_active)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
00111$:
;/tmp/_gbsbuild/src/core/Actor_b.c:73: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:75: UBYTE ActorInFrontOfPlayer_b(UBYTE grid_size, UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorInFrontOfPlayer_b
; ---------------------------------
	b_ActorInFrontOfPlayer_b	= 1
_ActorInFrontOfPlayer_b::
	add	sp, #-6
;/tmp/_gbsbuild/src/core/Actor_b.c:77: UBYTE hit_actor = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:79: tile_x = player.pos.x >> 3;
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#1
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Actor_b.c:80: tile_y = player.pos.y >> 3;
	ld	hl, #_actors + 2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#2
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Actor_b.c:84: hit_actor = ActorAt3x3Tile(tile_x - 1, tile_y - 3, inc_noclip);
	ld	a, (hl+)
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#4
;/tmp/_gbsbuild/src/core/Actor_b.c:89: hit_actor = ActorAt3x3Tile(tile_x - 3, tile_y - 1, inc_noclip);
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0xff
	inc	hl
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:82: if (grid_size == 16) {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x10
	jp	NZ,00124$
;/tmp/_gbsbuild/src/core/Actor_b.c:83: if (player.dir.y == -1) {
	ld	a, (#(_actors + 0x0006) + 0)
;/tmp/_gbsbuild/src/core/Actor_b.c:84: hit_actor = ActorAt3x3Tile(tile_x - 1, tile_y - 3, inc_noclip);
	ldhl	sp,	#4
	ld	c, (hl)
	dec	c
;/tmp/_gbsbuild/src/core/Actor_b.c:83: if (player.dir.y == -1) {
	cp	a, #0xff
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:84: hit_actor = ActorAt3x3Tile(tile_x - 1, tile_y - 3, inc_noclip);
	dec	hl
	ld	a, (hl)
	add	a, #0xfd
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	ld	b, a
	push	bc
	call	_ActorAt3x3Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jp	00125$
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:85: } else if (player.dir.y == 1) {
	dec	a
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/Actor_b.c:86: hit_actor = ActorAt3x3Tile(tile_x - 1, tile_y + 1, inc_noclip);
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	ld	b, a
	push	bc
	call	_ActorAt3x3Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jp	00125$
00107$:
;/tmp/_gbsbuild/src/core/Actor_b.c:88: if (player.dir.x == -1) {
	ld	a, (#(_actors + 0x0005) + 0)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/Actor_b.c:89: hit_actor = ActorAt3x3Tile(tile_x - 3, tile_y - 1, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0xfd
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x3Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jp	00125$
00104$:
;/tmp/_gbsbuild/src/core/Actor_b.c:90: } else if (player.dir.x == 1) {
	ldhl	sp,	#3
	ld	a, (hl)
	dec	a
	jp	NZ,00125$
;/tmp/_gbsbuild/src/core/Actor_b.c:91: hit_actor = ActorAt3x3Tile(tile_x + 1, tile_y - 1, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#6
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_ActorAt3x3Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jp	00125$
00124$:
;/tmp/_gbsbuild/src/core/Actor_b.c:95: if (player.dir.y == -1) {
	ld	a, (#(_actors + 0x0006) + 0)
	cp	a, #0xff
	jr	NZ, 00121$
;/tmp/_gbsbuild/src/core/Actor_b.c:96: hit_actor = ActorAt3x1Tile(tile_x, tile_y - 1, inc_noclip);
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x1Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jr	00125$
00121$:
;/tmp/_gbsbuild/src/core/Actor_b.c:97: } else if (player.dir.y == 1) {
	dec	a
	jr	NZ, 00118$
;/tmp/_gbsbuild/src/core/Actor_b.c:98: hit_actor = ActorAt3x1Tile(tile_x, tile_y + 2, inc_noclip);
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	inc	a
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x1Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jr	00125$
00118$:
;/tmp/_gbsbuild/src/core/Actor_b.c:100: if (player.dir.x == -1) {
	ld	a, (#(_actors + 0x0005) + 0)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	inc	a
	jr	NZ, 00115$
;/tmp/_gbsbuild/src/core/Actor_b.c:101: hit_actor = ActorAt1x2Tile(tile_x - 2, tile_y, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	dec	a
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_ActorAt1x2Tile
	add	sp, #3
	push	hl
	ldhl	sp,	#7
	ld	(hl), e
	pop	hl
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	jr	00125$
00115$:
;/tmp/_gbsbuild/src/core/Actor_b.c:102: } else if (player.dir.x == 1) {
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	jr	NZ, 00125$
;/tmp/_gbsbuild/src/core/Actor_b.c:103: hit_actor = ActorAt1x2Tile(tile_x + 2, tile_y, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	inc	a
	ldhl	sp,	#13
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_ActorAt1x2Tile
	add	sp, #3
	push	hl
	ldhl	sp,	#7
	ld	(hl), e
	pop	hl
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
00125$:
;/tmp/_gbsbuild/src/core/Actor_b.c:107: if (hit_actor == 0) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
;/tmp/_gbsbuild/src/core/Actor_b.c:108: hit_actor = NO_ACTOR_COLLISON;
	ld	(hl), #0xff
00127$:
;/tmp/_gbsbuild/src/core/Actor_b.c:111: return hit_actor;
	ldhl	sp,	#0
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Actor_b.c:112: }
	add	sp, #6
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:115: UBYTE ActorInFrontOfActor_b(UBYTE i) __banked {
;	---------------------------------
; Function ActorInFrontOfActor_b
; ---------------------------------
	b_ActorInFrontOfActor_b	= 1
_ActorInFrontOfActor_b::
	add	sp, #-7
;/tmp/_gbsbuild/src/core/Actor_b.c:117: UBYTE hit_actor = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:119: tile_x = actors[i].pos.x >> 3;
	ldhl	sp,	#13
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
	ld	bc,#_actors
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#1
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:120: tile_y = actors[i].pos.y >> 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#2
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:122: if (actors[i].dir.y == -1) {
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	ld	hl, #0x0006
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:123: hit_actor = ActorAt3x1Tile(tile_x, tile_y - 1, TRUE);
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#6
;/tmp/_gbsbuild/src/core/Actor_b.c:122: if (actors[i].dir.y == -1) {
	ld	(hl-), a
	ld	a, (hl)
	inc	a
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:123: hit_actor = ActorAt3x1Tile(tile_x, tile_y - 1, TRUE);
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x1Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jp	00111$
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:124: } else if (actors[i].dir.y == 1) {
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/Actor_b.c:125: hit_actor = ActorAt3x1Tile(tile_x, tile_y + 2, TRUE);
	ldhl	sp,	#6
	ld	a, (hl)
	inc	a
	inc	a
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x1Tile
	add	sp, #3
	ldhl	sp,	#0
	ld	(hl), e
	jr	00111$
00107$:
;/tmp/_gbsbuild/src/core/Actor_b.c:127: if (actors[i].dir.x == -1) {
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:128: hit_actor = ActorAt1x2Tile(tile_x - 2, tile_y, TRUE);
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#5
;/tmp/_gbsbuild/src/core/Actor_b.c:127: if (actors[i].dir.x == -1) {
	ld	(hl+), a
	ld	a, (hl)
	inc	a
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/Actor_b.c:128: hit_actor = ActorAt1x2Tile(tile_x - 2, tile_y, TRUE);
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	dec	a
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_ActorAt1x2Tile
	add	sp, #3
	push	hl
	ldhl	sp,	#8
	ld	(hl), e
	pop	hl
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	jr	00111$
00104$:
;/tmp/_gbsbuild/src/core/Actor_b.c:129: } else if (actors[i].dir.x == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	NZ, 00111$
;/tmp/_gbsbuild/src/core/Actor_b.c:130: hit_actor = ActorAt1x2Tile(tile_x + 2, tile_y, TRUE);
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, #0x02
	inc	hl
	ld	(hl), a
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt1x2Tile
	add	sp, #3
	push	hl
	ldhl	sp,	#8
	ld	(hl), e
	pop	hl
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
00111$:
;/tmp/_gbsbuild/src/core/Actor_b.c:134: if (hit_actor == i) {
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NZ, 00113$
;/tmp/_gbsbuild/src/core/Actor_b.c:135: return NO_ACTOR_COLLISON;
	ld	e, #0xff
	jr	00114$
00113$:
;/tmp/_gbsbuild/src/core/Actor_b.c:138: return hit_actor;
	ldhl	sp,	#0
	ld	e, (hl)
00114$:
;/tmp/_gbsbuild/src/core/Actor_b.c:139: }
	add	sp, #7
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:141: UBYTE CheckCollisionInDirection_b(UBYTE start_x, UBYTE start_y, UBYTE end_tile, COL_CHECK_DIR check_dir) __banked {
;	---------------------------------
; Function CheckCollisionInDirection_b
; ---------------------------------
	b_CheckCollisionInDirection_b	= 1
_CheckCollisionInDirection_b::
;/tmp/_gbsbuild/src/core/Actor_b.c:145: if (TileAt2x2(start_x - 1, start_y - 1) ||                                // Tile left
	ldhl	sp,	#7
;/tmp/_gbsbuild/src/core/Actor_b.c:144: while (start_x != end_tile) {
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/Actor_b.c:145: if (TileAt2x2(start_x - 1, start_y - 1) ||                                // Tile left
	dec	b
;/tmp/_gbsbuild/src/core/Actor_b.c:142: switch (check_dir) {
	ldhl	sp,	#9
	ld	a, (hl)
	dec	a
	jr	Z, 00139$
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00142$
;/tmp/_gbsbuild/src/core/Actor_b.c:164: while (start_y != end_tile) {
	ldhl	sp,	#7
;/tmp/_gbsbuild/src/core/Actor_b.c:142: switch (check_dir) {
	ld	a, (hl+)
	ld	c, a
	inc	hl
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00145$
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x04
	jp	Z,00149$
	jp	00130$
;/tmp/_gbsbuild/src/core/Actor_b.c:144: while (start_x != end_tile) {
00139$:
00105$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	Z, 00107$
;/tmp/_gbsbuild/src/core/Actor_b.c:145: if (TileAt2x2(start_x - 1, start_y - 1) ||                                // Tile left
	ld	d, c
	ld	a, d
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	ld	a, e
	pop	de
	pop	bc
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/Actor_b.c:146: ActorAt1x3Tile(start_x - 2, start_y - 1, FALSE) != NO_ACTOR_COLLISON  // Actor left
	dec	d
	dec	d
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	c, d
	push	bc
	call	_ActorAt1x3Tile
	add	sp, #3
	pop	bc
	inc	e
	jr	Z, 00103$
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:148: return start_x;
	ldhl	sp,	#6
	ld	e, (hl)
	ret
00103$:
;/tmp/_gbsbuild/src/core/Actor_b.c:150: start_x--;
	dec	c
	ldhl	sp,	#6
	ld	(hl), c
	jr	00105$
00107$:
;/tmp/_gbsbuild/src/core/Actor_b.c:152: return end_tile;
	ldhl	sp,	#8
	ld	e, (hl)
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:154: while (start_x != end_tile) {
00142$:
00112$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	Z, 00114$
;/tmp/_gbsbuild/src/core/Actor_b.c:155: if (TileAt2x2(start_x + 1, start_y - 1) ||                                // Tile right
	ld	e, c
	ld	a, e
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	ld	a, e
	pop	de
	pop	bc
	or	a, a
	jr	NZ, 00109$
;/tmp/_gbsbuild/src/core/Actor_b.c:156: ActorAt1x3Tile(start_x + 2, start_y - 1, FALSE) != NO_ACTOR_COLLISON  // Actor right
	ld	a, e
	inc	a
	inc	a
	push	bc
	ld	h, #0x00
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_ActorAt1x3Tile
	add	sp, #3
	pop	bc
	inc	e
	jr	Z, 00110$
00109$:
;/tmp/_gbsbuild/src/core/Actor_b.c:158: return start_x;
	ldhl	sp,	#6
	ld	e, (hl)
	ret
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:160: start_x++;
	inc	c
	ldhl	sp,	#6
	ld	(hl), c
	jr	00112$
00114$:
;/tmp/_gbsbuild/src/core/Actor_b.c:162: return end_tile;
	ldhl	sp,	#8
	ld	e, (hl)
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:164: while (start_y != end_tile) {
00145$:
00119$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	Z, 00121$
;/tmp/_gbsbuild/src/core/Actor_b.c:165: if (TileAt2x2(start_x, start_y - 2) ||                                      // Tile up
	ld	b, c
	dec	b
	dec	b
	push	bc
	push	bc
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	NZ, 00116$
;/tmp/_gbsbuild/src/core/Actor_b.c:166: (ActorAt3x1Tile(start_x, start_y - 2, FALSE) != NO_ACTOR_COLLISON)  // Actor up
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x1Tile
	add	sp, #3
	pop	bc
	inc	e
	jr	Z, 00117$
00116$:
;/tmp/_gbsbuild/src/core/Actor_b.c:168: return start_y;
	ldhl	sp,	#7
	ld	e, (hl)
	ret
00117$:
;/tmp/_gbsbuild/src/core/Actor_b.c:170: start_y--;
	dec	c
	ldhl	sp,	#7
	ld	(hl), c
	jr	00119$
00121$:
;/tmp/_gbsbuild/src/core/Actor_b.c:172: return end_tile;
	ldhl	sp,	#8
	ld	e, (hl)
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:174: while (start_y != end_tile) {
00149$:
00127$:
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	Z, 00129$
;/tmp/_gbsbuild/src/core/Actor_b.c:175: if (TileAt2x2(start_x, start_y) ||  // Tile down
	push	bc
	ld	a, c
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	NZ, 00123$
;/tmp/_gbsbuild/src/core/Actor_b.c:176: ActorAt3x1Tile(start_x, start_y + 1, FALSE) !=
	ld	b, c
	ld	a, b
	inc	a
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x1Tile
	add	sp, #3
	pop	bc
	inc	e
	jr	NZ, 00123$
;/tmp/_gbsbuild/src/core/Actor_b.c:178: ActorAt3x1Tile(start_x, start_y + 2, FALSE) !=
	inc	b
	inc	b
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorAt3x1Tile
	add	sp, #3
	pop	bc
	inc	e
	jr	Z, 00124$
00123$:
;/tmp/_gbsbuild/src/core/Actor_b.c:181: return start_y;
	ldhl	sp,	#7
	ld	e, (hl)
	ret
00124$:
;/tmp/_gbsbuild/src/core/Actor_b.c:183: start_y++;
	inc	c
	ldhl	sp,	#7
	ld	(hl), c
	jr	00127$
00129$:
;/tmp/_gbsbuild/src/core/Actor_b.c:185: return end_tile;
	ldhl	sp,	#8
	ld	e, (hl)
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:186: }
00130$:
;/tmp/_gbsbuild/src/core/Actor_b.c:187: return end_tile;
	ldhl	sp,	#8
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/Actor_b.c:188: }
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:190: UBYTE ActorAtTile_b(UBYTE tx, UBYTE ty, UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorAtTile_b
; ---------------------------------
	b_ActorAtTile_b	= 1
_ActorAtTile_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/Actor_b.c:193: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ld	a, (#_actors_active_size)
	add	a, #0xff
	ldhl	sp,	#3
	ld	(hl), a
00114$:
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	jp	Z,00112$
;/tmp/_gbsbuild/src/core/Actor_b.c:194: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:197: if (!actors[a].enabled || (!inc_noclip && !actors[a].collisionsEnabled)) {
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
	ld	a, l
	add	a, #<(_actors)
	ld	c, a
	ld	a, h
	adc	a, #>(_actors)
	ld	b, a
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00111$
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x0017
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;/tmp/_gbsbuild/src/core/Actor_b.c:198: continue;
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:201: a_tx = DIV_8(actors[a].pos.x);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#2
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:202: a_ty = DIV_8(actors[a].pos.y);
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Actor_b.c:204: if ((ty == a_ty || ty == a_ty + 1) && (tx == a_tx || tx == a_tx + 1 || tx == a_tx - 1)) {
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	Z, 00110$
	ld	b, #0x00
	inc	bc
	ldhl	sp,	#11
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00111$
	ld	a, d
	sub	a, b
	jr	NZ, 00111$
00110$:
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	Z, 00105$
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#10
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00157$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00105$
00157$:
	dec	bc
	ld	a, c
	sub	a, e
	jr	NZ, 00111$
	ld	a, b
	sub	a, d
	jr	NZ, 00111$
00105$:
;/tmp/_gbsbuild/src/core/Actor_b.c:205: return a;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00115$
00111$:
;/tmp/_gbsbuild/src/core/Actor_b.c:193: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ldhl	sp,	#3
	dec	(hl)
	jp	00114$
00112$:
;/tmp/_gbsbuild/src/core/Actor_b.c:208: return NO_ACTOR_COLLISON;
	ld	e, #0xff
00115$:
;/tmp/_gbsbuild/src/core/Actor_b.c:209: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:211: UBYTE ActorAt1x2Tile_b(UBYTE tx, UBYTE ty, UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorAt1x2Tile_b
; ---------------------------------
	b_ActorAt1x2Tile_b	= 1
_ActorAt1x2Tile_b::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/Actor_b.c:214: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ld	a, (#_actors_active_size)
	add	a, #0xff
	ldhl	sp,	#2
	ld	(hl), a
00112$:
	ldhl	sp,	#2
	ld	a, (hl)
	inc	a
	jp	Z,00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:215: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:218: if (!actors[a].enabled || (!inc_noclip && !actors[a].collisionsEnabled)) {
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
	ld	a, l
	add	a, #<(_actors)
	ld	c, a
	ld	a, h
	adc	a, #>(_actors)
	ld	b, a
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x0017
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/Actor_b.c:219: continue;
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:222: a_tx = DIV_8(actors[a].pos.x);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#1
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:223: a_ty = DIV_8(actors[a].pos.y);
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Actor_b.c:225: if ((ty == a_ty || ty == a_ty - 1) && (tx == a_tx)) {
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, c
	jr	Z, 00108$
	ld	b, #0x00
	dec	bc
	ldhl	sp,	#10
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00109$
	ld	a, d
	sub	a, b
	jr	NZ, 00109$
00108$:
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	NZ, 00109$
;/tmp/_gbsbuild/src/core/Actor_b.c:226: return a;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00113$
00109$:
;/tmp/_gbsbuild/src/core/Actor_b.c:214: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ldhl	sp,	#2
	dec	(hl)
	jp	00112$
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:229: return NO_ACTOR_COLLISON;
	ld	e, #0xff
00113$:
;/tmp/_gbsbuild/src/core/Actor_b.c:230: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:232: UBYTE ActorAt1x3Tile_b(UBYTE tx, UBYTE ty, UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorAt1x3Tile_b
; ---------------------------------
	b_ActorAt1x3Tile_b	= 1
_ActorAt1x3Tile_b::
	add	sp, #-5
;/tmp/_gbsbuild/src/core/Actor_b.c:235: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ld	a, (#_actors_active_size)
	add	a, #0xff
	ldhl	sp,	#4
	ld	(hl), a
00113$:
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	jp	Z,00111$
;/tmp/_gbsbuild/src/core/Actor_b.c:236: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:239: if (!actors[a].enabled || (!inc_noclip && !actors[a].collisionsEnabled)) {
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
	ld	a, l
	add	a, #<(_actors)
	ld	c, a
	ld	a, h
	adc	a, #>(_actors)
	ld	b, a
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x0017
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:240: continue;
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:243: a_tx = DIV_8(actors[a].pos.x);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#1
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:244: a_ty = DIV_8(actors[a].pos.y);
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Actor_b.c:246: if ((ty == a_ty || ty == a_ty - 1 || ty == a_ty - 2) && (tx == a_tx)) {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	Z, 00109$
	ld	b, #0x00
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#12
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00153$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00109$
00153$:
	dec	bc
	dec	bc
	ld	a, c
	sub	a, e
	jr	NZ, 00110$
	ld	a, b
	sub	a, d
	jr	NZ, 00110$
00109$:
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:247: return a;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00114$
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:235: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ldhl	sp,	#4
	dec	(hl)
	jp	00113$
00111$:
;/tmp/_gbsbuild/src/core/Actor_b.c:250: return NO_ACTOR_COLLISON;
	ld	e, #0xff
00114$:
;/tmp/_gbsbuild/src/core/Actor_b.c:251: }
	add	sp, #5
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:253: UBYTE ActorAt3x1Tile_b(UBYTE tx, UBYTE ty, UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorAt3x1Tile_b
; ---------------------------------
	b_ActorAt3x1Tile_b	= 1
_ActorAt3x1Tile_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/Actor_b.c:256: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ld	a, (#_actors_active_size)
	add	a, #0xff
	ldhl	sp,	#3
	ld	(hl), a
00113$:
	ldhl	sp,	#3
	ld	a, (hl)
	inc	a
	jp	Z,00111$
;/tmp/_gbsbuild/src/core/Actor_b.c:257: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:260: if (!actors[a].enabled || (!inc_noclip && !actors[a].collisionsEnabled)) {
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
	ld	a, l
	add	a, #<(_actors)
	ld	c, a
	ld	a, h
	adc	a, #>(_actors)
	ld	b, a
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x0017
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:261: continue;
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:265: a_tx = DIV_8(actors[a].pos.x);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#2
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:266: a_ty = DIV_8(actors[a].pos.y);
	ld	l, c
	ld	h, b
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
;/tmp/_gbsbuild/src/core/Actor_b.c:269: if ((ty == a_ty) && (tx == a_tx || tx == a_tx - 1 || tx == a_tx + 1)) {
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00110$
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	Z, 00105$
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ldhl	sp,	#10
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	jr	NZ, 00155$
	ld	a, b
	sub	a, d
	jr	Z, 00105$
00155$:
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, l
	sub	a, e
	jr	NZ, 00110$
	ld	a, h
	sub	a, d
	jr	NZ, 00110$
00105$:
;/tmp/_gbsbuild/src/core/Actor_b.c:270: return a;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00114$
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:256: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ldhl	sp,	#3
	dec	(hl)
	jp	00113$
00111$:
;/tmp/_gbsbuild/src/core/Actor_b.c:274: return NO_ACTOR_COLLISON;
	ld	e, #0xff
00114$:
;/tmp/_gbsbuild/src/core/Actor_b.c:275: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:277: UBYTE ActorAt2x3Tile_b(UBYTE tx, UBYTE ty, UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorAt2x3Tile_b
; ---------------------------------
	b_ActorAt2x3Tile_b	= 1
_ActorAt2x3Tile_b::
	add	sp, #-5
;/tmp/_gbsbuild/src/core/Actor_b.c:280: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ld	a, (#_actors_active_size)
	add	a, #0xff
	ldhl	sp,	#4
	ld	(hl), a
00114$:
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	jp	Z,00112$
;/tmp/_gbsbuild/src/core/Actor_b.c:281: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:284: if (!actors[a].enabled || (!inc_noclip && !actors[a].collisionsEnabled)) {
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
	ld	a, l
	add	a, #<(_actors)
	ld	c, a
	ld	a, h
	adc	a, #>(_actors)
	ld	b, a
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00111$
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x0017
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;/tmp/_gbsbuild/src/core/Actor_b.c:285: continue;
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:288: a_tx = DIV_8(actors[a].pos.x);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#1
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:289: a_ty = DIV_8(actors[a].pos.y);
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Actor_b.c:291: if ((ty == a_ty || ty == a_ty - 1 || ty == a_ty - 2) && (tx == a_tx || tx == a_tx - 1)) {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	Z, 00110$
	ld	b, #0x00
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#12
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00154$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00110$
00154$:
	dec	bc
	dec	bc
	ld	a, c
	sub	a, e
	jr	NZ, 00111$
	ld	a, b
	sub	a, d
	jr	NZ, 00111$
00110$:
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	Z, 00105$
	ldhl	sp,	#1
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ldhl	sp,	#11
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00111$
	ld	a, d
	sub	a, b
	jr	NZ, 00111$
00105$:
;/tmp/_gbsbuild/src/core/Actor_b.c:292: return a;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00115$
00111$:
;/tmp/_gbsbuild/src/core/Actor_b.c:280: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ldhl	sp,	#4
	dec	(hl)
	jp	00114$
00112$:
;/tmp/_gbsbuild/src/core/Actor_b.c:296: return NO_ACTOR_COLLISON;
	ld	e, #0xff
00115$:
;/tmp/_gbsbuild/src/core/Actor_b.c:297: }
	add	sp, #5
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:299: UBYTE ActorAt3x3Tile_b(UBYTE tx, UBYTE ty, UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorAt3x3Tile_b
; ---------------------------------
	b_ActorAt3x3Tile_b	= 1
_ActorAt3x3Tile_b::
	add	sp, #-5
;/tmp/_gbsbuild/src/core/Actor_b.c:302: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ld	a, (#_actors_active_size)
	add	a, #0xff
	ldhl	sp,	#4
	ld	(hl), a
00115$:
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	jp	Z,00113$
;/tmp/_gbsbuild/src/core/Actor_b.c:303: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:306: if (!actors[a].enabled || (!inc_noclip && !actors[a].collisionsEnabled)) {
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
	ld	a, l
	add	a, #<(_actors)
	ld	c, a
	ld	a, h
	adc	a, #>(_actors)
	ld	b, a
	ld	hl, #0x0012
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00112$
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	ld	hl, #0x0017
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00112$
;/tmp/_gbsbuild/src/core/Actor_b.c:307: continue;
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:310: a_tx = DIV_8(actors[a].pos.x);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#1
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Actor_b.c:311: a_ty = DIV_8(actors[a].pos.y);
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/Actor_b.c:313: if ((ty == a_ty || ty == a_ty - 1 || ty == a_ty - 2) && (tx == a_tx || tx == a_tx - 1 || tx == a_tx - 2)) {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	Z, 00111$
	ld	b, #0x00
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#12
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00160$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00111$
00160$:
	dec	bc
	dec	bc
	ld	a, c
	sub	a, e
	jr	NZ, 00112$
	ld	a, b
	sub	a, d
	jr	NZ, 00112$
00111$:
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	Z, 00105$
	ldhl	sp,	#1
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	inc	hl
	inc	hl
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#11
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00164$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00105$
00164$:
	dec	bc
	dec	bc
	ld	a, c
	sub	a, e
	jr	NZ, 00112$
	ld	a, b
	sub	a, d
	jr	NZ, 00112$
00105$:
;/tmp/_gbsbuild/src/core/Actor_b.c:314: return a;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00116$
00112$:
;/tmp/_gbsbuild/src/core/Actor_b.c:302: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ldhl	sp,	#4
	dec	(hl)
	jp	00115$
00113$:
;/tmp/_gbsbuild/src/core/Actor_b.c:318: return NO_ACTOR_COLLISON;
	ld	e, #0xff
00116$:
;/tmp/_gbsbuild/src/core/Actor_b.c:319: }
	add	sp, #5
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:321: UBYTE ActorOverlapsPlayer_b(UBYTE inc_noclip) __banked {
;	---------------------------------
; Function ActorOverlapsPlayer_b
; ---------------------------------
	b_ActorOverlapsPlayer_b	= 1
_ActorOverlapsPlayer_b::
	add	sp, #-6
;/tmp/_gbsbuild/src/core/Actor_b.c:324: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ld	a, (#_actors_active_size)
	add	a, #0xff
	ldhl	sp,	#5
	ld	(hl), a
00113$:
	ldhl	sp,	#5
	ld	a, (hl)
	inc	a
	jp	Z,00111$
;/tmp/_gbsbuild/src/core/Actor_b.c:325: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:327: if (!actors[a].enabled || (!inc_noclip && !actors[a].collisionsEnabled)) {
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
	ld	bc,#_actors
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00110$
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0017
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:328: continue;
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:331: if ((player.pos.x + 15 >= actors[a].pos.x) && (player.pos.x <= actors[a].pos.x + 15) &&
	ld	de, #_actors
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00157$
	bit	7, d
	jr	NZ, 00158$
	cp	a, a
	jr	00158$
00157$:
	bit	7, d
	jr	Z, 00158$
	scf
00158$:
	jr	C, 00110$
	ld	bc, #0x000f
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00159$
	bit	7, d
	jr	NZ, 00160$
	cp	a, a
	jr	00160$
00159$:
	bit	7, d
	jr	Z, 00160$
	scf
00160$:
	jr	C, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:332: (player.pos.y + 7 >= actors[a].pos.y) && (player.pos.y <= actors[a].pos.y + 7)) {
	ld	de, #(_actors + 0x0002)
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00161$
	bit	7, d
	jr	NZ, 00162$
	cp	a, a
	jr	00162$
00161$:
	bit	7, d
	jr	Z, 00162$
	scf
00162$:
	jr	C, 00110$
	ld	bc, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	C, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:333: return a;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00114$
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:324: for (i = actors_active_size - 1; i != 0xFF; i--) {
	ldhl	sp,	#5
	dec	(hl)
	jp	00113$
00111$:
;/tmp/_gbsbuild/src/core/Actor_b.c:337: return NO_ACTOR_COLLISON;
	ld	e, #0xff
00114$:
;/tmp/_gbsbuild/src/core/Actor_b.c:338: }
	add	sp, #6
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:340: void InitPlayer_b() __banked {
;	---------------------------------
; Function InitPlayer_b
; ---------------------------------
	b_InitPlayer_b	= 1
_InitPlayer_b::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/Actor_b.c:343: sprite_frames = DIV_4(LoadSprite(map_next_sprite, 0));
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_map_next_sprite
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_LoadSprite
	add	sp, #3
	ld	a, e
	rrca
	rrca
	and	a, #0x3f
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Actor_b.c:344: player.enabled = TRUE;
	ld	hl, #(_actors + 0x0012)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Actor_b.c:345: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor_b.c:346: player.palette_index = PLAYER_PALETTE;
	ld	hl, #(_actors + 0x000a)
	ld	(hl), #0x07
;/tmp/_gbsbuild/src/core/Actor_b.c:347: player.collisionsEnabled = TRUE;
	ld	hl, #(_actors + 0x0017)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Actor_b.c:348: player.collision_group = 1;
	ld	hl, #(_actors + 0x0018)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Actor_b.c:349: player.pos.x = map_next_pos.x;
	ld	hl, #_map_next_pos
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Actor_b.c:350: player.pos.y = map_next_pos.y;
	ld	de, #(_map_next_pos + 0x0002)
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	de, #(_actors + 0x0002)
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Actor_b.c:351: player.start_pos.x = player.pos.x;
	ld	hl, #(_actors + 0x000b)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Actor_b.c:352: player.start_pos.y = player.pos.y;
	ld	de, #(_actors + 0x000d)
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Actor_b.c:353: player.dir.x = map_next_dir.x;
	ld	bc, #_actors + 5
	ld	a, (#_map_next_dir + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Actor_b.c:354: player.dir.y = map_next_dir.y;
	ld	bc, #_actors + 6
	ld	a, (#(_map_next_dir + 0x0001) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Actor_b.c:357: player.sprite_type = SPRITE_STATIC;
	ld	bc, #_actors + 25
;/tmp/_gbsbuild/src/core/Actor_b.c:358: player.frames_len = 6;
	ld	de, #_actors + 16
;/tmp/_gbsbuild/src/core/Actor_b.c:355: if (sprite_frames > 6) {
	ld	a, #0x06
	dec	hl
	dec	hl
	sub	a, (hl)
	jr	NC, 00108$
;/tmp/_gbsbuild/src/core/Actor_b.c:357: player.sprite_type = SPRITE_STATIC;
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Actor_b.c:358: player.frames_len = 6;
	ld	a, #0x06
	ld	(de), a
	jr	00109$
00108$:
;/tmp/_gbsbuild/src/core/Actor_b.c:359: } else if (sprite_frames == 6) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00105$
;/tmp/_gbsbuild/src/core/Actor_b.c:360: player.sprite_type = SPRITE_ACTOR_ANIMATED;
;/tmp/_gbsbuild/src/core/Actor_b.c:361: player.frames_len = 2;
	ld	a,#0x02
	ld	(bc),a
	ld	(de), a
	jr	00109$
00105$:
;/tmp/_gbsbuild/src/core/Actor_b.c:362: } else if (sprite_frames == 3) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/Actor_b.c:363: player.sprite_type = SPRITE_ACTOR;
;/tmp/_gbsbuild/src/core/Actor_b.c:364: player.frames_len = 1;    
	ld	a,#0x01
	ld	(bc),a
	ld	(de), a
	jr	00109$
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:366: player.sprite_type = SPRITE_STATIC;
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Actor_b.c:367: player.frames_len = sprite_frames;    
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
00109$:
;/tmp/_gbsbuild/src/core/Actor_b.c:369: player.sprite_index = SpritePoolNext();
	call	_SpritePoolNext
	ld	a, e
	ld	(#(_actors + 0x0009)),a
;/tmp/_gbsbuild/src/core/Actor_b.c:370: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Actor_b.c:371: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor_b.c:372: player.animate = FALSE;
	ld	hl, #(_actors + 0x0011)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor_b.c:373: player.hit_actor = NO_ACTOR_COLLISON;
	ld	hl, #(_actors + 0x001a)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/Actor_b.c:374: player.script_control = FALSE;
	ld	hl, #(_actors + 0x001b)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor_b.c:375: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/Actor_b.c:377: void ActorRunCollisionScripts_b() __banked {
;	---------------------------------
; Function ActorRunCollisionScripts_b
; ---------------------------------
	b_ActorRunCollisionScripts_b	= 1
_ActorRunCollisionScripts_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/Actor_b.c:380: if (player_iframes == 0 && player.hit_actor != NO_ACTOR_COLLISON) {
	ld	a, (#_player_iframes)
	or	a, a
	jp	NZ, 00126$
	ld	a, (#(_actors + 0x001a) + 0)
	cp	a, #0xff
	jp	Z,00126$
;/tmp/_gbsbuild/src/core/Actor_b.c:381: actor = &actors[player.hit_actor];
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	e, l
	ld	d, h
;/tmp/_gbsbuild/src/core/Actor_b.c:383: if (actor->collision_group) {
	ld	hl, #0x0018
	add	hl, de
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	Z, 00129$
;/tmp/_gbsbuild/src/core/Actor_b.c:388: if (actor->events_ptr.bank) {
;c
	ld	hl, #0x001e
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;/tmp/_gbsbuild/src/core/Actor_b.c:384: if (actor->collision_group == 2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00119$
;/tmp/_gbsbuild/src/core/Actor_b.c:385: if (player.hit_1_ptr.bank) {
	ld	bc, #_actors + 36
	ld	a, (bc)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/Actor_b.c:386: ScriptStartBg(&player.hit_1_ptr, 0);
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_ScriptStartBg
	add	sp, #3
00102$:
;/tmp/_gbsbuild/src/core/Actor_b.c:388: if (actor->events_ptr.bank) {
	pop	de
	push	de
	ld	a, (de)
	or	a, a
	jr	Z, 00120$
;/tmp/_gbsbuild/src/core/Actor_b.c:389: ScriptStartBg(&actor->events_ptr, player.hit_actor);
	ld	a, (#(_actors + 0x001a) + 0)
	push	af
	inc	sp
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_ScriptStartBg
	add	sp, #3
	jr	00120$
00119$:
;/tmp/_gbsbuild/src/core/Actor_b.c:391: } else if (actor->collision_group == 4) {
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00116$
;/tmp/_gbsbuild/src/core/Actor_b.c:392: if (player.hit_2_ptr.bank) {
	ld	bc, #_actors + 39
	ld	a, (bc)
	or	a, a
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/Actor_b.c:393: ScriptStartBg(&player.hit_2_ptr, 0);
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_ScriptStartBg
	add	sp, #3
00106$:
;/tmp/_gbsbuild/src/core/Actor_b.c:395: if (actor->events_ptr.bank) {
	pop	de
	push	de
	ld	a, (de)
	or	a, a
	jr	Z, 00120$
;/tmp/_gbsbuild/src/core/Actor_b.c:396: ScriptStartBg(&actor->events_ptr, player.hit_actor);
	ld	a, (#(_actors + 0x001a) + 0)
	push	af
	inc	sp
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_ScriptStartBg
	add	sp, #3
	jr	00120$
00116$:
;/tmp/_gbsbuild/src/core/Actor_b.c:398: } else if (actor->collision_group == 8) {
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00120$
;/tmp/_gbsbuild/src/core/Actor_b.c:399: if (player.hit_3_ptr.bank) {
	ld	a, (#(_actors + 0x002a) + 0)
	or	a, a
	jr	Z, 00110$
;/tmp/_gbsbuild/src/core/Actor_b.c:400: ScriptStartBg(&player.hit_3_ptr, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #(_actors + 0x002a)
	push	hl
	call	_ScriptStartBg
	add	sp, #3
00110$:
;/tmp/_gbsbuild/src/core/Actor_b.c:402: if (actor->events_ptr.bank) {
	pop	de
	push	de
	ld	a, (de)
	or	a, a
	jr	Z, 00120$
;/tmp/_gbsbuild/src/core/Actor_b.c:403: ScriptStartBg(&actor->events_ptr, player.hit_actor);
	ld	a, (#(_actors + 0x001a) + 0)
	push	af
	inc	sp
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_ScriptStartBg
	add	sp, #3
00120$:
;/tmp/_gbsbuild/src/core/Actor_b.c:406: player_iframes = 10;
	ld	hl, #_player_iframes
	ld	(hl), #0x0a
;/tmp/_gbsbuild/src/core/Actor_b.c:407: player.hit_actor = NO_ACTOR_COLLISON;
	ld	hl, #(_actors + 0x001a)
	ld	(hl), #0xff
	jr	00129$
00126$:
;/tmp/_gbsbuild/src/core/Actor_b.c:409: } else if (player_iframes != 0) {
	ld	hl, #_player_iframes
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
;/tmp/_gbsbuild/src/core/Actor_b.c:410: player_iframes--;
	dec	(hl)
00129$:
;/tmp/_gbsbuild/src/core/Actor_b.c:412: }
	add	sp, #2
	ret
	.area _CODE_1
	.area _CABS (ABS)
