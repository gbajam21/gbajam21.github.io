;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Actor
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_ActorRunCollisionScripts_b
	.globl _ActorRunCollisionScripts_b
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
	.globl b_InitPlayer_b
	.globl _InitPlayer_b
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
	.globl _ScriptCtxPoolReturn
	.globl _ScriptStart
	.globl _SpritePoolReturn
	.globl _player_iframes
	.globl _map_next_sprite
	.globl _map_next_dir
	.globl _map_next_pos
	.globl _actor_move_settings
	.globl _actors_active_size
	.globl _actors_active
	.globl _actor_ptrs
	.globl _actors
	.globl _ActorsInit
	.globl _ActivateActor
	.globl _DeactivateActor
	.globl _DeactivateActiveActor
	.globl _ActorAtTile
	.globl _ActorAt1x2Tile
	.globl _ActorAt1x3Tile
	.globl _ActorAt3x1Tile
	.globl _ActorAt2x3Tile
	.globl _ActorAt3x3Tile
	.globl _ActorOverlapsPlayer
	.globl _ActorInFrontOfPlayer
	.globl _ActorInFrontOfActor
	.globl _CheckCollisionInDirection
	.globl _InitPlayer
	.globl _ActorRunScript
	.globl _ActorRunCollisionScripts
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_actors::
	.ds 1426
_actor_ptrs::
	.ds 62
_actors_active::
	.ds 11
_actors_active_size::
	.ds 1
_actor_move_settings::
	.ds 1
_map_next_pos::
	.ds 4
_map_next_dir::
	.ds 2
_map_next_sprite::
	.ds 2
_player_iframes::
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
;/tmp/_gbsbuild/src/core/Actor.c:29: UBYTE actors_active_size = 0;
	ld	hl, #_actors_active_size
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor.c:30: UBYTE actor_move_settings = 0;
	ld	hl, #_actor_move_settings
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor.c:34: UWORD map_next_sprite = 0;
	ld	hl, #_map_next_sprite
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor.c:35: UBYTE player_iframes = 0;
	ld	hl, #_player_iframes
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
;/tmp/_gbsbuild/src/core/Actor.c:37: void ActorsInit() {
;	---------------------------------
; Function ActorsInit
; ---------------------------------
_ActorsInit::
	dec	sp
;/tmp/_gbsbuild/src/core/Actor.c:39: for (i = 0; i != MAX_ACTORS; i++) {
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
00102$:
;/tmp/_gbsbuild/src/core/Actor.c:40: actor_ptrs[i] = &actors[i];
	ldhl	sp,	#0
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	a, l
	add	a, #<(_actor_ptrs)
	ld	c, a
	ld	a, h
	adc	a, #>(_actor_ptrs)
	ld	b, a
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_actors
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Actor.c:39: for (i = 0; i != MAX_ACTORS; i++) {
	ldhl	sp,	#0
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x1f
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/Actor.c:42: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/Actor.c:44: void ActivateActor(UBYTE i) {
;	---------------------------------
; Function ActivateActor
; ---------------------------------
_ActivateActor::
;/tmp/_gbsbuild/src/core/Actor.c:45: ActivateActor_b(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActivateActor_b
	ld	hl, #_ActivateActor_b
	call	___sdcc_bcall_ehl
	inc	sp
;/tmp/_gbsbuild/src/core/Actor.c:46: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:48: void DeactivateActor(UBYTE i) {
;	---------------------------------
; Function DeactivateActor
; ---------------------------------
_DeactivateActor::
;/tmp/_gbsbuild/src/core/Actor.c:49: DeactivateActor_b(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_DeactivateActor_b
	ld	hl, #_DeactivateActor_b
	call	___sdcc_bcall_ehl
	inc	sp
;/tmp/_gbsbuild/src/core/Actor.c:50: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:52: void DeactivateActiveActor(UBYTE i) {
;	---------------------------------
; Function DeactivateActiveActor
; ---------------------------------
_DeactivateActiveActor::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/Actor.c:53: if(UBYTE_LESS_THAN(i, actors_active_size)) {
	ldhl	sp,	#5
	ld	c, (hl)
	ld	hl, #_actors_active_size
	ld	e, (hl)
	ld	a, c
	sub	a, e
	bit	7,a
	jr	Z, 00107$
;/tmp/_gbsbuild/src/core/Actor.c:54: UBYTE a = actors_active[i];
;c
	ld	de, #_actors_active
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
;/tmp/_gbsbuild/src/core/Actor.c:55: if (a == 0) {
	ld	(hl), a
	or	a, a
;/tmp/_gbsbuild/src/core/Actor.c:57: return;
	jr	Z, 00107$
;/tmp/_gbsbuild/src/core/Actor.c:59: SpritePoolReturn(actors[a].sprite_index);
	ld	bc, #_actors+0
	ldhl	sp,	#2
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
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
;/tmp/_gbsbuild/src/core/Actor.c:60: actors[a].sprite_index = 0;
	xor	a, a
	ld	(de), a
;/tmp/_gbsbuild/src/core/Actor.c:61: if (actors[a].movement_ctx) {
	ld	hl, #0x002d
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/Actor.c:62: ScriptCtxPoolReturn(actors[a].movement_ctx, a);
	ldhl	sp,	#2
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_ScriptCtxPoolReturn
	add	sp, #2
00104$:
;/tmp/_gbsbuild/src/core/Actor.c:64: actors_active[i] = actors_active[--actors_active_size];     
	ld	hl, #_actors_active_size
	dec	(hl)
	ld	a, #<(_actors_active)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_actors_active)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
00107$:
;/tmp/_gbsbuild/src/core/Actor.c:66: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/Actor.c:68: UBYTE ActorAtTile(UBYTE tx, UBYTE ty, UBYTE inc_noclip) {
;	---------------------------------
; Function ActorAtTile
; ---------------------------------
_ActorAtTile::
;/tmp/_gbsbuild/src/core/Actor.c:69: return ActorAtTile_b(tx, ty, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorAtTile_b
	ld	hl, #_ActorAtTile_b
	call	___sdcc_bcall_ehl
	add	sp, #3
;/tmp/_gbsbuild/src/core/Actor.c:70: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:72: UBYTE ActorAt1x2Tile(UBYTE tx, UBYTE ty, UBYTE inc_noclip) {
;	---------------------------------
; Function ActorAt1x2Tile
; ---------------------------------
_ActorAt1x2Tile::
;/tmp/_gbsbuild/src/core/Actor.c:73: return ActorAt1x2Tile_b(tx, ty, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorAt1x2Tile_b
	ld	hl, #_ActorAt1x2Tile_b
	call	___sdcc_bcall_ehl
	add	sp, #3
;/tmp/_gbsbuild/src/core/Actor.c:74: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:76: UBYTE ActorAt1x3Tile(UBYTE tx, UBYTE ty, UBYTE inc_noclip) {
;	---------------------------------
; Function ActorAt1x3Tile
; ---------------------------------
_ActorAt1x3Tile::
;/tmp/_gbsbuild/src/core/Actor.c:77: return ActorAt1x3Tile_b(tx, ty, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorAt1x3Tile_b
	ld	hl, #_ActorAt1x3Tile_b
	call	___sdcc_bcall_ehl
	add	sp, #3
;/tmp/_gbsbuild/src/core/Actor.c:78: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:80: UBYTE ActorAt3x1Tile(UBYTE tx, UBYTE ty, UBYTE inc_noclip) {
;	---------------------------------
; Function ActorAt3x1Tile
; ---------------------------------
_ActorAt3x1Tile::
;/tmp/_gbsbuild/src/core/Actor.c:81: return ActorAt3x1Tile_b(tx, ty, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorAt3x1Tile_b
	ld	hl, #_ActorAt3x1Tile_b
	call	___sdcc_bcall_ehl
	add	sp, #3
;/tmp/_gbsbuild/src/core/Actor.c:82: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:84: UBYTE ActorAt2x3Tile(UBYTE tx, UBYTE ty, UBYTE inc_noclip) {
;	---------------------------------
; Function ActorAt2x3Tile
; ---------------------------------
_ActorAt2x3Tile::
;/tmp/_gbsbuild/src/core/Actor.c:85: return ActorAt2x3Tile_b(tx, ty, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorAt2x3Tile_b
	ld	hl, #_ActorAt2x3Tile_b
	call	___sdcc_bcall_ehl
	add	sp, #3
;/tmp/_gbsbuild/src/core/Actor.c:86: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:88: UBYTE ActorAt3x3Tile(UBYTE tx, UBYTE ty, UBYTE inc_noclip) {
;	---------------------------------
; Function ActorAt3x3Tile
; ---------------------------------
_ActorAt3x3Tile::
;/tmp/_gbsbuild/src/core/Actor.c:89: return ActorAt3x3Tile_b(tx, ty, inc_noclip);
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorAt3x3Tile_b
	ld	hl, #_ActorAt3x3Tile_b
	call	___sdcc_bcall_ehl
	add	sp, #3
;/tmp/_gbsbuild/src/core/Actor.c:90: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:92: UBYTE ActorOverlapsPlayer(UBYTE inc_noclip) {
;	---------------------------------
; Function ActorOverlapsPlayer
; ---------------------------------
_ActorOverlapsPlayer::
;/tmp/_gbsbuild/src/core/Actor.c:93: return ActorOverlapsPlayer_b(inc_noclip);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorOverlapsPlayer_b
	ld	hl, #_ActorOverlapsPlayer_b
	call	___sdcc_bcall_ehl
	inc	sp
;/tmp/_gbsbuild/src/core/Actor.c:94: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:96: UBYTE ActorInFrontOfPlayer(UBYTE grid_size, UBYTE inc_noclip) {
;	---------------------------------
; Function ActorInFrontOfPlayer
; ---------------------------------
_ActorInFrontOfPlayer::
;/tmp/_gbsbuild/src/core/Actor.c:97: return ActorInFrontOfPlayer_b(grid_size, inc_noclip);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorInFrontOfPlayer_b
	ld	hl, #_ActorInFrontOfPlayer_b
	call	___sdcc_bcall_ehl
	add	sp, #2
;/tmp/_gbsbuild/src/core/Actor.c:98: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:100: UBYTE ActorInFrontOfActor(UBYTE i) {
;	---------------------------------
; Function ActorInFrontOfActor
; ---------------------------------
_ActorInFrontOfActor::
;/tmp/_gbsbuild/src/core/Actor.c:101: return ActorInFrontOfActor_b(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ActorInFrontOfActor_b
	ld	hl, #_ActorInFrontOfActor_b
	call	___sdcc_bcall_ehl
	inc	sp
;/tmp/_gbsbuild/src/core/Actor.c:102: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:104: UBYTE CheckCollisionInDirection(UBYTE start_x, UBYTE start_y, UBYTE end_tile, COL_CHECK_DIR check_dir) {
;	---------------------------------
; Function CheckCollisionInDirection
; ---------------------------------
_CheckCollisionInDirection::
;/tmp/_gbsbuild/src/core/Actor.c:105: return CheckCollisionInDirection_b(start_x, start_y, end_tile, check_dir);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_CheckCollisionInDirection_b
	ld	hl, #_CheckCollisionInDirection_b
	call	___sdcc_bcall_ehl
	add	sp, #4
;/tmp/_gbsbuild/src/core/Actor.c:106: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:108: void InitPlayer() {
;	---------------------------------
; Function InitPlayer
; ---------------------------------
_InitPlayer::
;/tmp/_gbsbuild/src/core/Actor.c:109: InitPlayer_b();
	ld	e, #b_InitPlayer_b
	ld	hl, #_InitPlayer_b
;/tmp/_gbsbuild/src/core/Actor.c:110: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Actor.c:112: void ActorRunScript(UBYTE i) {
;	---------------------------------
; Function ActorRunScript
; ---------------------------------
_ActorRunScript::
;/tmp/_gbsbuild/src/core/Actor.c:113: script_main_ctx_actor = i;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	hl, #_script_main_ctx_actor
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Actor.c:114: actors[i].moving = FALSE;
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Actor.c:115: ScriptStart(&actors[i].events_ptr);
	ld	hl, #0x001e
	add	hl, bc
	push	hl
	call	_ScriptStart
	add	sp, #2
;/tmp/_gbsbuild/src/core/Actor.c:116: }
	ret
;/tmp/_gbsbuild/src/core/Actor.c:118: void ActorRunCollisionScripts() {
;	---------------------------------
; Function ActorRunCollisionScripts
; ---------------------------------
_ActorRunCollisionScripts::
;/tmp/_gbsbuild/src/core/Actor.c:119: ActorRunCollisionScripts_b();
	ld	e, #b_ActorRunCollisionScripts_b
	ld	hl, #_ActorRunCollisionScripts_b
;/tmp/_gbsbuild/src/core/Actor.c:120: }
	jp  ___sdcc_bcall_ehl
	.area _CODE
	.area _CABS (ABS)
