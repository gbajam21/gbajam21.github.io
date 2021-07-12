;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module TopDown
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ActivateTriggerAt
	.globl _TileAt2x2
	.globl _TileAt2x1
	.globl _ActorRunScript
	.globl _ActorInFrontOfPlayer
	.globl _ActorOverlapsPlayer
	.globl _Start_TopDown
	.globl _Update_TopDown
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
	.area _CODE_5
;/tmp/_gbsbuild/src/states/TopDown.c:13: void Start_TopDown() {
;	---------------------------------
; Function Start_TopDown
; ---------------------------------
_Start_TopDown::
;/tmp/_gbsbuild/src/states/TopDown.c:14: camera_offset.x = 0;
	ld	hl, #_camera_offset
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:15: camera_offset.y = 0;
	ld	hl, #(_camera_offset + 0x0001)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:16: camera_deadzone.x = 0;
	ld	hl, #_camera_deadzone
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:17: camera_deadzone.y = 0;
	ld	hl, #(_camera_deadzone + 0x0001)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:19: if (topdown_grid == 16) {
	ld	a, (#_topdown_grid)
	sub	a, #0x10
	ret	NZ
;/tmp/_gbsbuild/src/states/TopDown.c:21: player.pos.x = MUL_16(DIV_16(player.pos.x));
	ld	hl, #_actors
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/TopDown.c:22: player.pos.y = 8 + MUL_16(DIV_16(player.pos.y));
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0008
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #(_actors + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/TopDown.c:24: }
	ret
;/tmp/_gbsbuild/src/states/TopDown.c:26: void Update_TopDown() {
;	---------------------------------
; Function Update_TopDown
; ---------------------------------
_Update_TopDown::
	add	sp, #-7
;/tmp/_gbsbuild/src/states/TopDown.c:29: tile_x = DIV_8(player.pos.x);
	ld	de, #_actors
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	bc
	push	bc
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	inc	hl
	ld	(hl), c
;/tmp/_gbsbuild/src/states/TopDown.c:30: tile_y = DIV_8(player.pos.y);
	ld	de, #(_actors + 0x0002)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#3
	ld	(hl), c
;/tmp/_gbsbuild/src/states/TopDown.c:33: if ((topdown_grid == 16 && (MOD_16(player.pos.x) == 0 && MOD_16(player.pos.y) == 8)) ||
	ld	a, (#_topdown_grid)
	sub	a, #0x10
	jr	NZ, 00189$
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0x0f
	jr	NZ, 00189$
	ldhl	sp,	#5
	ld	a, (hl)
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x08
	or	a, b
	jr	Z, 00183$
00189$:
;/tmp/_gbsbuild/src/states/TopDown.c:34: (topdown_grid ==  8 && (MOD_8(player.pos.x)  == 0 && MOD_8(player.pos.y)  == 0))) {
	ld	a, (#_topdown_grid)
	sub	a, #0x08
	jp	NZ,00184$
	ldhl	sp,	#0
	ld	a, (hl)
	and	a, #0x07
	jp	NZ,00184$
	ldhl	sp,	#5
	ld	a, (hl)
	and	a, #0x07
	jp	NZ,00184$
00183$:
;/tmp/_gbsbuild/src/states/TopDown.c:37: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:40: if (ActivateTriggerAt(tile_x, tile_y, FALSE)) {
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActivateTriggerAt
	add	sp, #3
	ld	a, e
	or	a, a
;/tmp/_gbsbuild/src/states/TopDown.c:42: return;
	jp	NZ,00197$
;/tmp/_gbsbuild/src/states/TopDown.c:46: if (INPUT_RECENT_LEFT) {
	ld	hl, #_recent_joy
	ld	c, (hl)
	ld	hl, #_joy
	ld	e, (hl)
;/tmp/_gbsbuild/src/states/TopDown.c:47: player.dir.x = -1;
;/tmp/_gbsbuild/src/states/TopDown.c:48: player.dir.y = 0;
;/tmp/_gbsbuild/src/states/TopDown.c:49: player.rerender = TRUE;
;/tmp/_gbsbuild/src/states/TopDown.c:53: UBYTE tile_left = tile_x - 2;
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
;/tmp/_gbsbuild/src/states/TopDown.c:54: if (tile_x != 0 && !(TileAt2x2(tile_left, tile_y-1) & COLLISION_RIGHT)) {
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	add	a, #0xff
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/states/TopDown.c:46: if (INPUT_RECENT_LEFT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00165$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jr	NZ, 00160$
00165$:
	bit	1, c
	jr	NZ, 00159$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00160$
	bit	1, e
	jr	Z, 00160$
00159$:
;/tmp/_gbsbuild/src/states/TopDown.c:47: player.dir.x = -1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/TopDown.c:48: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:49: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/TopDown.c:52: if (topdown_grid == 16) {
	ld	a, (#_topdown_grid)
	sub	a, #0x10
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/states/TopDown.c:53: UBYTE tile_left = tile_x - 2;
	ldhl	sp,	#4
	ld	b, (hl)
	dec	b
	dec	b
;/tmp/_gbsbuild/src/states/TopDown.c:54: if (tile_x != 0 && !(TileAt2x2(tile_left, tile_y-1) & COLLISION_RIGHT)) {
	dec	hl
	dec	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00161$
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	bit	3, e
	jp	NZ,00161$
;/tmp/_gbsbuild/src/states/TopDown.c:55: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jp	00161$
00110$:
;/tmp/_gbsbuild/src/states/TopDown.c:58: UBYTE tile_left = tile_x - 1;
	ldhl	sp,	#4
	ld	b, (hl)
	dec	b
;/tmp/_gbsbuild/src/states/TopDown.c:59: if (tile_x != 0 && !(TileAt2x1(tile_left, tile_y) & COLLISION_RIGHT)) {
	dec	hl
	dec	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00161$
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_TileAt2x1
	add	sp, #2
	bit	3, e
	jp	NZ,00161$
;/tmp/_gbsbuild/src/states/TopDown.c:60: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jp	00161$
00160$:
;/tmp/_gbsbuild/src/states/TopDown.c:64: } else if (INPUT_RECENT_RIGHT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00158$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jp	NZ,00153$
00158$:
	bit	0, c
	jr	NZ, 00152$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00153$
	bit	0, e
	jr	Z, 00153$
00152$:
;/tmp/_gbsbuild/src/states/TopDown.c:65: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/TopDown.c:66: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:67: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/TopDown.c:72: if (tile_x != image_tile_width - 2 && !(TileAt2x2(tile_right, tile_y-1) & COLLISION_LEFT)) {
	ld	hl, #_image_tile_width
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	e, (hl)
	ld	d, #0x00
	dec	bc
	dec	bc
	ld	a, c
	sub	a, e
	jr	NZ, 00476$
	ld	a, b
	sub	a, d
	ld	a, #0x01
	jr	Z, 00477$
00476$:
	xor	a, a
00477$:
	ld	c, a
;/tmp/_gbsbuild/src/states/TopDown.c:70: if (topdown_grid == 16) {
	ld	a, (#_topdown_grid)
	sub	a, #0x10
	jr	NZ, 00119$
;/tmp/_gbsbuild/src/states/TopDown.c:71: UBYTE tile_right = tile_x + 2;
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	inc	a
;/tmp/_gbsbuild/src/states/TopDown.c:72: if (tile_x != image_tile_width - 2 && !(TileAt2x2(tile_right, tile_y-1) & COLLISION_LEFT)) {
	bit	0, c
	jp	NZ, 00161$
	inc	hl
	inc	hl
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	bit	2, e
	jp	NZ,00161$
;/tmp/_gbsbuild/src/states/TopDown.c:73: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jp	00161$
00119$:
;/tmp/_gbsbuild/src/states/TopDown.c:76: UBYTE tile_right = tile_x + 1;
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
;/tmp/_gbsbuild/src/states/TopDown.c:77: if (tile_x != image_tile_width - 2 && !(TileAt2x1(tile_right, tile_y) & COLLISION_LEFT)) {
	bit	0, c
	jp	NZ, 00161$
	dec	hl
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_TileAt2x1
	add	sp, #2
	bit	2, e
	jp	NZ,00161$
;/tmp/_gbsbuild/src/states/TopDown.c:78: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jp	00161$
00153$:
;/tmp/_gbsbuild/src/states/TopDown.c:82: } else if (INPUT_RECENT_UP) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00151$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00146$
00151$:
	bit	2, c
	jr	NZ, 00145$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00146$
	bit	2, e
	jr	Z, 00146$
00145$:
;/tmp/_gbsbuild/src/states/TopDown.c:84: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:85: player.dir.y = -1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/TopDown.c:86: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/TopDown.c:89: if (topdown_grid == 16) {
	ld	a, (#_topdown_grid)
	sub	a, #0x10
	jr	NZ, 00128$
;/tmp/_gbsbuild/src/states/TopDown.c:90: UBYTE tile_up = tile_y - 3;
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, #0xfd
	ld	b, a
;/tmp/_gbsbuild/src/states/TopDown.c:91: if (tile_y != 0 && !(TileAt2x2(tile_x, tile_up) & COLLISION_BOTTOM)) {
	dec	hl
	dec	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00161$
	push	bc
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	bit	1, e
	jp	NZ,00161$
;/tmp/_gbsbuild/src/states/TopDown.c:92: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jp	00161$
00128$:
;/tmp/_gbsbuild/src/states/TopDown.c:95: UBYTE tile_up = tile_y - 1;
	ldhl	sp,	#6
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/TopDown.c:96: if (tile_y != 0 && !(TileAt2x1(tile_x, tile_up) & COLLISION_BOTTOM)) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jp	Z, 00161$
	push	bc
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt2x1
	add	sp, #2
	bit	1, e
	jp	NZ,00161$
;/tmp/_gbsbuild/src/states/TopDown.c:97: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jp	00161$
00146$:
;/tmp/_gbsbuild/src/states/TopDown.c:101: } else if (INPUT_RECENT_DOWN) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00144$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jp	NZ,00161$
00144$:
	bit	3, c
	jr	NZ, 00139$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00161$
	bit	3, e
	jr	Z, 00161$
00139$:
;/tmp/_gbsbuild/src/states/TopDown.c:102: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:103: player.dir.y = 1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/TopDown.c:104: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/TopDown.c:109: if (tile_y != image_tile_height - 1 && !(TileAt2x2(tile_x, tile_down) & COLLISION_TOP)) {
	ld	hl, #_image_tile_height
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/states/TopDown.c:108: UBYTE tile_down = tile_y + 1;
	ldhl	sp,	#5
	ld	e, (hl)
	inc	e
;/tmp/_gbsbuild/src/states/TopDown.c:109: if (tile_y != image_tile_height - 1 && !(TileAt2x2(tile_x, tile_down) & COLLISION_TOP)) {
	dec	bc
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00500$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00501$
00500$:
	xor	a, a
00501$:
	ld	c, a
;/tmp/_gbsbuild/src/states/TopDown.c:107: if (topdown_grid == 16) {
	ld	a, (#_topdown_grid)
	sub	a, #0x10
	jr	NZ, 00137$
;/tmp/_gbsbuild/src/states/TopDown.c:108: UBYTE tile_down = tile_y + 1;
	ld	a, e
;/tmp/_gbsbuild/src/states/TopDown.c:109: if (tile_y != image_tile_height - 1 && !(TileAt2x2(tile_x, tile_down) & COLLISION_TOP)) {
	bit	0, c
	jr	NZ, 00161$
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt2x2
	add	sp, #2
	ld	a, e
	rrca
	jr	C, 00161$
;/tmp/_gbsbuild/src/states/TopDown.c:110: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jr	00161$
00137$:
;/tmp/_gbsbuild/src/states/TopDown.c:113: UBYTE tile_down = tile_y + 1;
	ld	a, e
;/tmp/_gbsbuild/src/states/TopDown.c:114: if (tile_y != image_tile_height - 1 && !(TileAt2x1(tile_x, tile_down) & COLLISION_TOP)) {
	bit	0, c
	jr	NZ, 00161$
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt2x1
	add	sp, #2
	ld	a, e
	rrca
	jr	C, 00161$
;/tmp/_gbsbuild/src/states/TopDown.c:115: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
00161$:
;/tmp/_gbsbuild/src/states/TopDown.c:120: hit_actor = ActorOverlapsPlayer(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_ActorOverlapsPlayer
	inc	sp
	ld	c, e
;/tmp/_gbsbuild/src/states/TopDown.c:123: player.hit_actor = 0;
;/tmp/_gbsbuild/src/states/TopDown.c:121: if (hit_actor && hit_actor != NO_ACTOR_COLLISON) {
	ld	a, c
	or	a, a
	jr	Z, 00169$
	ld	a, c
	inc	a
	jr	Z, 00169$
;/tmp/_gbsbuild/src/states/TopDown.c:122: if (actors[hit_actor].collision_group) {
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
	ld	de, #0x0018
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00169$
;/tmp/_gbsbuild/src/states/TopDown.c:123: player.hit_actor = 0;
	ld	hl, #(_actors + 0x001a)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:124: player.hit_actor = hit_actor;
	ld	(hl), c
00169$:
;/tmp/_gbsbuild/src/states/TopDown.c:129: if (player.moving) {
	ld	a, (#(_actors + 0x0007) + 0)
	or	a, a
	jr	Z, 00174$
;/tmp/_gbsbuild/src/states/TopDown.c:130: hit_actor = ActorInFrontOfPlayer(topdown_grid, FALSE);
	xor	a, a
	push	af
	inc	sp
	ld	a, (#_topdown_grid)
	push	af
	inc	sp
	call	_ActorInFrontOfPlayer
	add	sp, #2
	ld	a, e
;/tmp/_gbsbuild/src/states/TopDown.c:131: if (hit_actor != NO_ACTOR_COLLISON) {
	cp	a, #0xff
	jr	Z, 00174$
;/tmp/_gbsbuild/src/states/TopDown.c:132: player.hit_actor = hit_actor;
	ld	(#(_actors + 0x001a)),a
;/tmp/_gbsbuild/src/states/TopDown.c:133: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
00174$:
;/tmp/_gbsbuild/src/states/TopDown.c:137: if (INPUT_A_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00182$
	ld	hl, #_input_override_default
	bit	4, (hl)
	jp	NZ,00184$
00182$:
	ld	a, (#_joy)
	bit	4, a
	jp	Z,00184$
	ld	a, (#_last_joy)
	bit	4, a
	jp	NZ,00184$
;/tmp/_gbsbuild/src/states/TopDown.c:138: hit_actor = ActorInFrontOfPlayer(topdown_grid, TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, (#_topdown_grid)
	push	af
	inc	sp
	call	_ActorInFrontOfPlayer
	add	sp, #2
	ldhl	sp,	#3
	ld	(hl), e
;/tmp/_gbsbuild/src/states/TopDown.c:139: if (hit_actor != NO_ACTOR_COLLISON && !actors[hit_actor].collision_group) {
	ld	a, (hl)
	inc	a
	jr	Z, 00184$
	ldhl	sp,	#3
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	ld	hl, #0x0018
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00184$
;/tmp/_gbsbuild/src/states/TopDown.c:141: actors[hit_actor].dir.x = -player.dir.x;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #(_actors + 0x0005)
	ld	l, (hl)
	xor	a, a
	sub	a, l
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/states/TopDown.c:142: actors[hit_actor].dir.y = -player.dir.y;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #(_actors + 0x0006)
	ld	l, (hl)
	xor	a, a
	sub	a, l
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/states/TopDown.c:143: actors[hit_actor].rerender = TRUE;
	ld	hl, #0x0014
	add	hl, bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/TopDown.c:146: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/TopDown.c:149: ActorRunScript(hit_actor);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActorRunScript
	inc	sp
00184$:
;/tmp/_gbsbuild/src/states/TopDown.c:155: if (player.moving) {
	ld	a, (#(_actors + 0x0007) + 0)
	or	a, a
	jp	Z, 00197$
;/tmp/_gbsbuild/src/states/TopDown.c:157: if (player.move_speed == 0) {
	ld	hl, #(_actors + 0x0004)
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/TopDown.c:160: player.pos.x += (WORD)player.dir.x;
;/tmp/_gbsbuild/src/states/TopDown.c:161: player.pos.y += (WORD)player.dir.y;
;/tmp/_gbsbuild/src/states/TopDown.c:157: if (player.move_speed == 0) {
	ld	a, b
	or	a, a
	jr	NZ, 00193$
;/tmp/_gbsbuild/src/states/TopDown.c:159: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	rrca
	jr	C, 00197$
;/tmp/_gbsbuild/src/states/TopDown.c:160: player.pos.x += (WORD)player.dir.x;
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0005) + 0)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/TopDown.c:161: player.pos.y += (WORD)player.dir.y;
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0006) + 0)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_actors + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00197$
00193$:
;/tmp/_gbsbuild/src/states/TopDown.c:164: player.pos.x += (WORD)(player.dir.x * player.move_speed);
	ld	de, #_actors
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#(_actors + 0x0005) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	__muluschar
	add	sp, #2
;c
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/TopDown.c:165: player.pos.y += (WORD)(player.dir.y * player.move_speed);
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0006) + 0)
	ld	hl, #(_actors + 0x0004)
	ld	h, (hl)
	push	bc
	push	hl
	inc	sp
	push	af
	inc	sp
	call	__muluschar
	add	sp, #2
	pop	bc
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	hl, #(_actors + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00197$:
;/tmp/_gbsbuild/src/states/TopDown.c:168: }
	add	sp, #7
	ret
	.area _CODE_5
	.area _CABS (ABS)
