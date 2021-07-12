;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Platform
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ActivateTriggerAt
	.globl _ScriptStart
	.globl _TileAt
	.globl _ActorOverlapsPlayer
	.globl _ActorAtTile
	.globl _pl_pos_y
	.globl _pl_pos_x
	.globl _pl_vel_y
	.globl _pl_vel_x
	.globl _on_ladder
	.globl _grounded
	.globl _Start_Platform
	.globl _Update_Platform
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_grounded::
	.ds 1
_on_ladder::
	.ds 1
_pl_vel_x::
	.ds 2
_pl_vel_y::
	.ds 2
_pl_pos_x::
	.ds 2
_pl_pos_y::
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
;/tmp/_gbsbuild/src/states/Platform.c:22: UBYTE grounded = FALSE;
	ld	hl, #_grounded
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:23: UBYTE on_ladder = FALSE;
	ld	hl, #_on_ladder
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:24: WORD pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:25: WORD pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:26: WORD pl_pos_x = 16512;
	ld	hl, #_pl_pos_x
	ld	(hl), #0x80
	inc	hl
	ld	(hl), #0x40
;/tmp/_gbsbuild/src/states/Platform.c:27: WORD pl_pos_y = 1024;
	ld	hl, #_pl_pos_y
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x04
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_5
;/tmp/_gbsbuild/src/states/Platform.c:29: void Start_Platform() {
;	---------------------------------
; Function Start_Platform
; ---------------------------------
_Start_Platform::
;/tmp/_gbsbuild/src/states/Platform.c:32: pl_pos_x = (player.pos.x + 4u) << 4;
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	(_pl_pos_x), a
	ld	a, h
	ld	(_pl_pos_x + 1), a
;/tmp/_gbsbuild/src/states/Platform.c:33: pl_pos_y = player.pos.y << 4;
	ld	hl, #_actors + 2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	(_pl_pos_y), a
	ld	a, h
	ld	(_pl_pos_y + 1), a
;/tmp/_gbsbuild/src/states/Platform.c:34: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:35: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:37: if (player.dir.x == 0) {
;/tmp/_gbsbuild/src/states/Platform.c:38: player.dir.y = 0;
;/tmp/_gbsbuild/src/states/Platform.c:37: if (player.dir.x == 0) {
	ld	a, (#(_actors + 0x0005) + 0)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/states/Platform.c:38: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:39: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:40: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
00102$:
;/tmp/_gbsbuild/src/states/Platform.c:43: tile_x = DIV_8(player.pos.x)+1;
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
	inc	c
;/tmp/_gbsbuild/src/states/Platform.c:44: tile_y = DIV_8(player.pos.y);
	ld	hl, #_actors + 2
	ld	a, (hl+)
	ld	h, (hl)
	ld	b, a
	sra	h
	rr	b
	sra	h
	rr	b
	sra	h
	rr	b
;/tmp/_gbsbuild/src/states/Platform.c:46: grounded = FALSE;
	ld	hl, #_grounded
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:48: if (TileAt(tile_x, tile_y) & TILE_PROP_LADDER) {
	push	bc
	call	_TileAt
	add	sp, #2
	bit	4, e
	jr	Z, 00104$
;/tmp/_gbsbuild/src/states/Platform.c:49: on_ladder = TRUE;
	ld	hl, #_on_ladder
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:50: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:51: player.dir.y = -1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0xff
00104$:
;/tmp/_gbsbuild/src/states/Platform.c:54: camera_offset.x = 0;
	ld	hl, #_camera_offset
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:55: camera_offset.y = 0;
	ld	hl, #(_camera_offset + 0x0001)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:56: camera_deadzone.x = PLATFORM_CAMERA_DEADZONE_X;
	ld	hl, #_camera_deadzone
	ld	(hl), #0x04
;/tmp/_gbsbuild/src/states/Platform.c:57: camera_deadzone.y = PLATFORM_CAMERA_DEADZONE_Y;
	ld	hl, #(_camera_deadzone + 0x0001)
	ld	(hl), #0x10
;/tmp/_gbsbuild/src/states/Platform.c:59: game_time = 0;
	ld	hl, #_game_time
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:60: }
	ret
;/tmp/_gbsbuild/src/states/Platform.c:62: void Update_Platform() {
;	---------------------------------
; Function Update_Platform
; ---------------------------------
_Update_Platform::
	add	sp, #-9
;/tmp/_gbsbuild/src/states/Platform.c:68: pl_pos_x = ((player.pos.x + 4u) << 4) + (pl_pos_x & 0xF);
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_pl_pos_x
	ld	a, (hl)
	and	a, #0x0f
	ld	d, #0x00
	add	a, c
	ld	(hl), a
	ld	a, d
	adc	a, b
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Platform.c:69: pl_pos_y = ((player.pos.y) << 4) + (pl_pos_y & 0xF);
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_pl_pos_y
	ld	a, (hl)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	a, e
	add	a, c
	ld	(hl), a
	ld	a, d
	adc	a, b
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Platform.c:72: tile_x_mid = DIV_8(player.pos.x+4u);
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,	#0
	ld	(hl), c
;/tmp/_gbsbuild/src/states/Platform.c:73: tile_y = DIV_8(player.pos.y);
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#8
	ld	(hl), c
;/tmp/_gbsbuild/src/states/Platform.c:76: if (on_ladder) {
	ld	a, (#_on_ladder)
	or	a, a
	jp	Z, 00170$
;/tmp/_gbsbuild/src/states/Platform.c:77: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:78: player.dir.y = -1;
	ld	bc, #_actors + 6
	ld	a, #0xff
	ld	(bc), a
;/tmp/_gbsbuild/src/states/Platform.c:79: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:80: if (INPUT_UP) {
	ld	hl, #_joy
	ld	e, (hl)
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00119$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00116$
00119$:
	bit	2, e
	jr	Z, 00116$
;/tmp/_gbsbuild/src/states/Platform.c:81: pl_vel_y = -plat_walk_vel;
	xor	a, a
	ld	hl, #_plat_walk_vel
	sub	a, (hl)
	ld	(#_pl_vel_y),a
	ld	a, #0x00
	ld	hl, #_plat_walk_vel + 1
	sbc	a, (hl)
	ld	(#_pl_vel_y + 1),a
	jp	00171$
00116$:
;/tmp/_gbsbuild/src/states/Platform.c:82: } else if (INPUT_DOWN) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00114$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00111$
00114$:
	bit	3, e
	jr	Z, 00111$
;/tmp/_gbsbuild/src/states/Platform.c:83: pl_vel_y = plat_walk_vel;
	ld	hl, #_plat_walk_vel
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pl_vel_y
	ld	(hl+), a
	ld	(hl), e
	jp	00171$
00111$:
;/tmp/_gbsbuild/src/states/Platform.c:89: player.rerender = TRUE;
;/tmp/_gbsbuild/src/states/Platform.c:85: if (INPUT_LEFT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jr	NZ, 00106$
00109$:
	bit	1, e
	jr	Z, 00106$
;/tmp/_gbsbuild/src/states/Platform.c:86: on_ladder = FALSE;
	ld	hl, #_on_ladder
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:87: player.dir.x = -1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/Platform.c:88: player.dir.y = 0;
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/states/Platform.c:89: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
	jr	00107$
00106$:
;/tmp/_gbsbuild/src/states/Platform.c:90: } else if (INPUT_RIGHT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00104$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jr	NZ, 00107$
00104$:
	bit	0, e
	jr	Z, 00107$
;/tmp/_gbsbuild/src/states/Platform.c:91: on_ladder = FALSE;
	ld	hl, #_on_ladder
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:92: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:93: player.dir.y = 0;
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/states/Platform.c:94: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
00107$:
;/tmp/_gbsbuild/src/states/Platform.c:96: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jp	00171$
00170$:
;/tmp/_gbsbuild/src/states/Platform.c:99: player.dir.y = 0;
	ld	bc, #_actors + 6
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/states/Platform.c:80: if (INPUT_UP) {
	ld	hl, #_joy
	ld	e, (hl)
;/tmp/_gbsbuild/src/states/Platform.c:105: player.rerender = TRUE;
;/tmp/_gbsbuild/src/states/Platform.c:100: if ((INPUT_UP || INPUT_DOWN) && ((TileAt(tile_x_mid, tile_y) & TILE_PROP_LADDER))) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00123$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00126$
00123$:
	bit	2, e
	jr	NZ, 00127$
00126$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00125$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00121$
00125$:
	bit	3, e
	jr	Z, 00121$
00127$:
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	pop	bc
	bit	4, e
	jr	Z, 00121$
;/tmp/_gbsbuild/src/states/Platform.c:101: on_ladder = TRUE;
	ld	hl, #_on_ladder
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:102: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:103: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:104: player.dir.y = -1;
	ld	a, #0xff
	ld	(bc), a
;/tmp/_gbsbuild/src/states/Platform.c:105: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
00121$:
;/tmp/_gbsbuild/src/states/Platform.c:80: if (INPUT_UP) {
	ld	hl, #_joy
	ld	c, (hl)
;/tmp/_gbsbuild/src/states/Platform.c:108: if (INPUT_LEFT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00168$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jp	NZ,00165$
00168$:
	bit	1, c
	jp	Z,00165$
;/tmp/_gbsbuild/src/states/Platform.c:109: player.dir.x = -1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/Platform.c:80: if (INPUT_UP) {
	ld	a, (#_joy)
	ldhl	sp,	#6
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Platform.c:112: pl_vel_x = CLAMP(pl_vel_x, -plat_run_vel, -plat_min_vel);
	ld	de, #0x0000
	ld	hl, #_plat_min_vel
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
	ld	(hl), e
;/tmp/_gbsbuild/src/states/Platform.c:110: if (INPUT_A) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00132$
	ld	hl, #_input_override_default
	bit	4, (hl)
	jp	NZ,00129$
00132$:
	ldhl	sp,	#6
	bit	4, (hl)
	jp	Z,00129$
;/tmp/_gbsbuild/src/states/Platform.c:111: pl_vel_x -= plat_run_acc;
	ld	a, (#_pl_vel_x)
	ld	hl, #_plat_run_acc
	sub	a, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_run_acc + 1
	sbc	a, (hl)
	ld	(#_pl_vel_x + 1),a
;/tmp/_gbsbuild/src/states/Platform.c:112: pl_vel_x = CLAMP(pl_vel_x, -plat_run_vel, -plat_min_vel);
	ld	de, #0x0000
	ld	hl, #_plat_run_vel
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
	ld	de, #_pl_vel_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00758$
	bit	7, d
	jr	NZ, 00759$
	cp	a, a
	jr	00759$
00758$:
	bit	7, d
	jr	Z, 00759$
	scf
00759$:
	jr	C, 00261$
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ld	hl, #_pl_vel_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00760$
	bit	7, d
	jr	NZ, 00761$
	cp	a, a
	jr	00761$
00760$:
	bit	7, d
	jr	Z, 00761$
	scf
00761$:
	jr	NC, 00262$
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	inc	hl
	ld	(hl+), a
	ld	(hl), e
	jr	00263$
00262$:
	ld	hl, #_pl_vel_x
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), e
00263$:
00261$:
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	(hl), e
	jp	00130$
00129$:
;/tmp/_gbsbuild/src/states/Platform.c:114: pl_vel_x -= plat_walk_acc;
	ld	a, (#_pl_vel_x)
	ld	hl, #_plat_walk_acc
	sub	a, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_walk_acc + 1
	sbc	a, (hl)
	ld	(#_pl_vel_x + 1),a
;/tmp/_gbsbuild/src/states/Platform.c:115: pl_vel_x = CLAMP(pl_vel_x, -plat_walk_vel, -plat_min_vel);
	ld	de, #0x0000
	ld	hl, #_plat_walk_vel
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
	ld	de, #_pl_vel_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00762$
	bit	7, d
	jr	NZ, 00763$
	cp	a, a
	jr	00763$
00762$:
	bit	7, d
	jr	Z, 00763$
	scf
00763$:
	jr	C, 00265$
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ld	hl, #_pl_vel_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00764$
	bit	7, d
	jr	NZ, 00765$
	cp	a, a
	jr	00765$
00764$:
	bit	7, d
	jr	Z, 00765$
	scf
00765$:
	jr	NC, 00266$
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	inc	hl
	ld	(hl+), a
	ld	(hl), e
	jr	00267$
00266$:
	ld	hl, #_pl_vel_x
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), e
00267$:
00265$:
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	(hl), e
00130$:
;/tmp/_gbsbuild/src/states/Platform.c:117: if (INPUT_LEFT_PRESSED) { // update player facing direction if button pressed this frame
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00137$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jp	NZ,00171$
00137$:
	ldhl	sp,	#6
	bit	1, (hl)
	jp	Z,00171$
	ld	a, (#_last_joy)
	bit	1, a
	jp	NZ,00171$
;/tmp/_gbsbuild/src/states/Platform.c:118: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
	jp	00171$
00165$:
;/tmp/_gbsbuild/src/states/Platform.c:120: } else if (INPUT_RIGHT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00163$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jp	NZ,00160$
00163$:
	bit	0, c
	jp	Z,00160$
;/tmp/_gbsbuild/src/states/Platform.c:121: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:80: if (INPUT_UP) {
	ld	a, (#_joy)
	ldhl	sp,	#6
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Platform.c:124: pl_vel_x = CLAMP(pl_vel_x, plat_min_vel, plat_run_vel);
	ld	hl, #_plat_min_vel + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/Platform.c:122: if (INPUT_A) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00142$
	ld	hl, #_input_override_default
	bit	4, (hl)
	jr	NZ, 00139$
00142$:
	ldhl	sp,	#6
	bit	4, (hl)
	jr	Z, 00139$
;/tmp/_gbsbuild/src/states/Platform.c:123: pl_vel_x += plat_run_acc;
	ld	a, (#_pl_vel_x)
	ld	hl, #_plat_run_acc
	add	a, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_run_acc + 1
	adc	a, (hl)
	ld	(#_pl_vel_x + 1),a
;/tmp/_gbsbuild/src/states/Platform.c:124: pl_vel_x = CLAMP(pl_vel_x, plat_min_vel, plat_run_vel);
	ld	de, #_pl_vel_x
	ld	hl, #_plat_min_vel
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00777$
	bit	7, d
	jr	NZ, 00778$
	cp	a, a
	jr	00778$
00777$:
	bit	7, d
	jr	Z, 00778$
	scf
00778$:
	jr	C, 00269$
	ld	de, #_plat_run_vel
	ld	hl, #_pl_vel_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00779$
	bit	7, d
	jr	NZ, 00780$
	cp	a, a
	jr	00780$
00779$:
	bit	7, d
	jr	Z, 00780$
	scf
00780$:
	jr	NC, 00270$
	ld	hl, #_plat_run_vel
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	jr	00271$
00270$:
	ld	hl, #_pl_vel_x
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
00271$:
	ld	a, b
	ld	b, c
	ld	c, a
00269$:
	ld	hl, #_pl_vel_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00140$
00139$:
;/tmp/_gbsbuild/src/states/Platform.c:126: pl_vel_x += plat_walk_acc;
	ld	a, (#_pl_vel_x)
	ld	hl, #_plat_walk_acc
	add	a, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_walk_acc + 1
	adc	a, (hl)
	ld	(#_pl_vel_x + 1),a
;/tmp/_gbsbuild/src/states/Platform.c:127: pl_vel_x = CLAMP(pl_vel_x, plat_min_vel, plat_walk_vel);
	ld	de, #_pl_vel_x
	ld	hl, #_plat_min_vel
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00781$
	bit	7, d
	jr	NZ, 00782$
	cp	a, a
	jr	00782$
00781$:
	bit	7, d
	jr	Z, 00782$
	scf
00782$:
	jr	C, 00273$
	ld	de, #_plat_walk_vel
	ld	hl, #_pl_vel_x
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00783$
	bit	7, d
	jr	NZ, 00784$
	cp	a, a
	jr	00784$
00783$:
	bit	7, d
	jr	Z, 00784$
	scf
00784$:
	jr	NC, 00274$
	ld	hl, #_plat_walk_vel
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), e
	jr	00275$
00274$:
	ld	hl, #_pl_vel_x
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), e
00275$:
	ldhl	sp,#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00273$:
	ld	hl, #_pl_vel_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00140$:
;/tmp/_gbsbuild/src/states/Platform.c:129: if (INPUT_RIGHT_PRESSED) { // update player facing direction if button pressed this frame
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00147$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jp	NZ,00171$
00147$:
	ldhl	sp,	#6
	bit	0, (hl)
	jp	Z,00171$
	ld	a, (#_last_joy)
	rrca
	jp	C,00171$
;/tmp/_gbsbuild/src/states/Platform.c:130: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
	jp	00171$
00160$:
;/tmp/_gbsbuild/src/states/Platform.c:132: } else if (grounded) {
	ld	a, (#_grounded)
	or	a, a
	jp	Z, 00171$
;/tmp/_gbsbuild/src/states/Platform.c:133: if (pl_vel_x < 0) {
	ld	hl, #_pl_vel_x
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00790$
	bit	7, d
	jr	NZ, 00791$
	cp	a, a
	jr	00791$
00790$:
	bit	7, d
	jr	Z, 00791$
	scf
00791$:
	jr	NC, 00155$
;/tmp/_gbsbuild/src/states/Platform.c:134: pl_vel_x += plat_dec;
	ld	a, (#_pl_vel_x)
	ld	hl, #_plat_dec
	add	a, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_dec + 1
	adc	a, (hl)
	ld	hl, #_pl_vel_x + 1
;/tmp/_gbsbuild/src/states/Platform.c:135: if (pl_vel_x > 0) {
	ld	(hl-), a
	ld	a, #0x00
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00792$
	bit	7, d
	jr	NZ, 00793$
	cp	a, a
	jr	00793$
00792$:
	bit	7, d
	jr	Z, 00793$
	scf
00793$:
	jr	NC, 00171$
;/tmp/_gbsbuild/src/states/Platform.c:136: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00171$
00155$:
;/tmp/_gbsbuild/src/states/Platform.c:138: } else if (pl_vel_x > 0) {
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00794$
	bit	7, d
	jr	NZ, 00795$
	cp	a, a
	jr	00795$
00794$:
	bit	7, d
	jr	Z, 00795$
	scf
00795$:
	jr	NC, 00171$
;/tmp/_gbsbuild/src/states/Platform.c:139: pl_vel_x -= plat_dec;
	ld	a, (#_pl_vel_x)
	ld	hl, #_plat_dec
	sub	a, (hl)
	ld	hl, #_pl_vel_x
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_dec + 1
	sbc	a, (hl)
	ld	hl, #_pl_vel_x + 1
;/tmp/_gbsbuild/src/states/Platform.c:140: if (pl_vel_x < 0) {
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00796$
	bit	7, d
	jr	NZ, 00797$
	cp	a, a
	jr	00797$
00796$:
	bit	7, d
	jr	Z, 00797$
	scf
00797$:
	jr	NC, 00171$
;/tmp/_gbsbuild/src/states/Platform.c:141: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
00171$:
;/tmp/_gbsbuild/src/states/Platform.c:147: pl_pos_x += pl_vel_x >> 8;
	ld	hl, #_pl_vel_x + 1
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_pl_pos_x
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
;/tmp/_gbsbuild/src/states/Platform.c:148: tile_x = pl_pos_x >> 7;
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
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#1
	ld	(hl), c
;/tmp/_gbsbuild/src/states/Platform.c:149: tile_y = pl_pos_y >> 7;
	ld	hl, #_pl_pos_y
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
;/tmp/_gbsbuild/src/states/Platform.c:153: hit_actor = ActorAtTile(tile_x + 2, tile_y, TRUE);
	ldhl	sp,	#1
	ld	c, (hl)
;/tmp/_gbsbuild/src/states/Platform.c:151: if (grounded && INPUT_A_PRESSED) {
	ld	a, (#_grounded)
	or	a, a
	jr	Z, 00179$
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00182$
	ld	hl, #_input_override_default
	bit	4, (hl)
	jr	NZ, 00179$
00182$:
	ld	a, (#_joy)
	bit	4, a
	jr	Z, 00179$
	ld	hl, #_last_joy
	bit	4, (hl)
	jr	NZ, 00179$
;/tmp/_gbsbuild/src/states/Platform.c:152: if (player.dir.x == 1) {
	ld	a, (#(_actors + 0x0005) + 0)
	dec	a
	jr	NZ, 00173$
;/tmp/_gbsbuild/src/states/Platform.c:153: hit_actor = ActorAtTile(tile_x + 2, tile_y, TRUE);
	ld	a, c
	inc	a
	inc	a
	push	bc
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_ActorAtTile
	add	sp, #3
	ld	a, e
	pop	bc
	jr	00174$
00173$:
;/tmp/_gbsbuild/src/states/Platform.c:155: hit_actor = ActorAtTile(tile_x - 1, tile_y, TRUE);
	ld	a, c
	dec	a
	push	bc
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_ActorAtTile
	add	sp, #3
	ld	a, e
	pop	bc
00174$:
;/tmp/_gbsbuild/src/states/Platform.c:157: if (hit_actor && (hit_actor != NO_ACTOR_COLLISON)) {
	or	a, a
	jr	Z, 00179$
	cp	a, #0xff
	jr	Z, 00179$
;/tmp/_gbsbuild/src/states/Platform.c:158: ScriptStart(&actors[hit_actor].events_ptr);
	ld	e, a
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
	ld	de, #0x001e
	add	hl, de
	push	bc
	push	hl
	call	_ScriptStart
	add	sp, #2
	pop	bc
00179$:
;/tmp/_gbsbuild/src/states/Platform.c:163: if (INPUT_B_PRESSED && grounded) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00193$
	ld	hl, #_input_override_default
	bit	5, (hl)
	jp	NZ,00190$
00193$:
	ld	a, (#_joy)
	bit	5, a
	jp	Z,00190$
	ld	a, (#_last_joy)
	bit	5, a
	jp	NZ,00190$
	ld	a, (#_grounded)
	or	a, a
	jr	Z, 00190$
;/tmp/_gbsbuild/src/states/Platform.c:164: if (!( (((pl_pos_x >> 4) & 0x7) != 7 &&
	ld	hl, #_pl_pos_x + 1
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
	sra	d
	rr	e
	ld	a, e
	and	a, #0x07
	ld	e, a
	ld	d, #0x00
;/tmp/_gbsbuild/src/states/Platform.c:165: TileAt(tile_x, tile_y - 1) & COLLISION_BOTTOM) ||  // Left Edge
	dec	b
;/tmp/_gbsbuild/src/states/Platform.c:164: if (!( (((pl_pos_x >> 4) & 0x7) != 7 &&
	ld	a, e
	sub	a, #0x07
	or	a, d
	jr	Z, 00188$
;/tmp/_gbsbuild/src/states/Platform.c:165: TileAt(tile_x, tile_y - 1) & COLLISION_BOTTOM) ||  // Left Edge
	push	bc
	push	bc
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	pop	bc
	bit	1, e
	jr	NZ, 00190$
00188$:
;/tmp/_gbsbuild/src/states/Platform.c:166: (((pl_pos_x >> 4) & 0x7) != 0 &&
	ld	hl, #_pl_pos_x + 1
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
	sra	d
	rr	e
	ld	a, e
	and	a, #0x07
	jr	Z, 00184$
;/tmp/_gbsbuild/src/states/Platform.c:167: TileAt(tile_x + 1, tile_y - 1) & COLLISION_BOTTOM))) {  // Right edge
	ld	a, c
	inc	a
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	bit	1, e
	jr	NZ, 00190$
00184$:
;/tmp/_gbsbuild/src/states/Platform.c:168: pl_vel_y = -plat_jump_vel;
	xor	a, a
	ld	hl, #_plat_jump_vel
	sub	a, (hl)
	ld	(#_pl_vel_y),a
	ld	a, #0x00
	ld	hl, #_plat_jump_vel + 1
	sbc	a, (hl)
	ld	(#_pl_vel_y + 1),a
;/tmp/_gbsbuild/src/states/Platform.c:169: grounded = FALSE;
	ld	hl, #_grounded
	ld	(hl), #0x00
00190$:
;/tmp/_gbsbuild/src/states/Platform.c:173: if (!on_ladder) {
	ld	a, (#_on_ladder)
	or	a, a
	jr	NZ, 00202$
;/tmp/_gbsbuild/src/states/Platform.c:175: if (INPUT_B && pl_vel_y < 0) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00199$
	ld	hl, #_input_override_default
	bit	5, (hl)
	jr	NZ, 00196$
00199$:
	ld	a, (#_joy)
	bit	5, a
	jr	Z, 00196$
	ld	hl, #_pl_vel_y
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00820$
	bit	7, d
	jr	NZ, 00821$
	cp	a, a
	jr	00821$
00820$:
	bit	7, d
	jr	Z, 00821$
	scf
00821$:
	jr	NC, 00196$
;/tmp/_gbsbuild/src/states/Platform.c:176: pl_vel_y += plat_hold_grav;
	ld	a, (#_pl_vel_y)
	ld	hl, #_plat_hold_grav
	add	a, (hl)
	ld	hl, #_pl_vel_y
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_hold_grav + 1
	adc	a, (hl)
	ld	(#_pl_vel_y + 1),a
	jr	00202$
00196$:
;/tmp/_gbsbuild/src/states/Platform.c:178: pl_vel_y += plat_grav;
	ld	a, (#_pl_vel_y)
	ld	hl, #_plat_grav
	add	a, (hl)
	ld	hl, #_pl_vel_y
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_plat_grav + 1
	adc	a, (hl)
	ld	(#_pl_vel_y + 1),a
00202$:
;/tmp/_gbsbuild/src/states/Platform.c:182: pl_vel_y = MIN(pl_vel_y, plat_max_fall_vel);
	ld	de, #_pl_vel_y
	ld	hl, #_plat_max_fall_vel
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00822$
	bit	7, d
	jr	NZ, 00823$
	cp	a, a
	jr	00823$
00822$:
	bit	7, d
	jr	Z, 00823$
	scf
00823$:
	jr	NC, 00276$
	ld	hl, #_pl_vel_y + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	jr	00277$
00276$:
	ld	hl, #_plat_max_fall_vel + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00277$:
	ld	hl, #_pl_vel_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Platform.c:183: pl_pos_y += pl_vel_y >> 8;
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_pl_pos_y
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
;/tmp/_gbsbuild/src/states/Platform.c:184: tile_y = pl_pos_y >> 7;
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
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#2
	ld	(hl), c
;/tmp/_gbsbuild/src/states/Platform.c:185: tile_y_ceil = (pl_pos_y - 7u) >> 7;
	ld	hl, #_pl_pos_y + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf9
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;/tmp/_gbsbuild/src/states/Platform.c:188: if (pl_vel_x < 0) {
	ld	hl, #_pl_vel_x
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00824$
	bit	7, d
	jr	NZ, 00825$
	cp	a, a
	jr	00825$
00824$:
	bit	7, d
	jr	Z, 00825$
	scf
00825$:
	jr	NC, 00207$
;/tmp/_gbsbuild/src/states/Platform.c:189: if (TileAt(tile_x, tile_y) & COLLISION_RIGHT || 
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	pop	bc
	bit	3, e
	jr	NZ, 00203$
;/tmp/_gbsbuild/src/states/Platform.c:190: TileAt(tile_x, tile_y_ceil) & COLLISION_RIGHT) {
	push	bc
	ld	a, c
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	pop	bc
	bit	3, e
	jr	Z, 00207$
00203$:
;/tmp/_gbsbuild/src/states/Platform.c:191: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:192: pl_pos_x = ((tile_x + 1) * 8) << 4;
	ldhl	sp,	#1
	ld	e, (hl)
	ld	d, #0x00
	inc	de
	ld	a, d
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	(_pl_pos_x), a
	ld	a, h
	ld	(_pl_pos_x + 1), a
;/tmp/_gbsbuild/src/states/Platform.c:193: tile_x = pl_pos_x >> 7;
	ld	hl, #_pl_pos_x
	ld	a, (hl+)
	ld	b, a
	ld	e, (hl)
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	ldhl	sp,	#1
	ld	(hl), b
00207$:
;/tmp/_gbsbuild/src/states/Platform.c:198: if (pl_vel_x > 0) {
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00829$
	bit	7, d
	jr	NZ, 00830$
	cp	a, a
	jr	00830$
00829$:
	bit	7, d
	jr	Z, 00830$
	scf
00830$:
	jr	NC, 00212$
;/tmp/_gbsbuild/src/states/Platform.c:199: if (TileAt(tile_x + 1, tile_y) & COLLISION_LEFT ||
	ldhl	sp,	#1
	ld	b, (hl)
	inc	b
	push	bc
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_TileAt
	add	sp, #2
	pop	bc
	bit	2, e
	jr	NZ, 00208$
;/tmp/_gbsbuild/src/states/Platform.c:200: TileAt(tile_x + 1, tile_y_ceil) & COLLISION_LEFT) {
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_TileAt
	add	sp, #2
	bit	2, e
	jr	Z, 00212$
00208$:
;/tmp/_gbsbuild/src/states/Platform.c:201: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:202: pl_pos_x = (tile_x * 8) << 4;
	ldhl	sp,	#1
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	(_pl_pos_x), a
	ld	a, h
	ld	(_pl_pos_x + 1), a
;/tmp/_gbsbuild/src/states/Platform.c:203: tile_x = pl_pos_x >> 7;
	ld	hl, #_pl_pos_x + 1
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
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#1
	ld	(hl), c
00212$:
;/tmp/_gbsbuild/src/states/Platform.c:165: TileAt(tile_x, tile_y - 1) & COLLISION_BOTTOM) ||  // Left Edge
	ldhl	sp,	#2
	ld	a, (hl+)
;/tmp/_gbsbuild/src/states/Platform.c:228: pl_pos_y = (tile_y * 8) << 4;
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	xor	a, a
	inc	hl
;/tmp/_gbsbuild/src/states/Platform.c:223: tile_below = TileAt(tile_x_mid, tile_y + 1);
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	inc	a
	ldhl	sp,	#6
;/tmp/_gbsbuild/src/states/Platform.c:228: pl_pos_y = (tile_y * 8) << 4;
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, #0x03
00834$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00834$
	ld	a, #0x04
00835$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00835$
;/tmp/_gbsbuild/src/states/Platform.c:207: if (on_ladder) {
	ld	a, (#_on_ladder)
	or	a, a
	jp	Z, 00238$
;/tmp/_gbsbuild/src/states/Platform.c:210: if (!(TileAt(tile_x_mid, tile_y) & TILE_PROP_LADDER)) {
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	bit	4, e
	jr	NZ, 00219$
;/tmp/_gbsbuild/src/states/Platform.c:211: if (INPUT_DOWN) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00217$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00214$
00217$:
	ld	a, (#_joy)
	bit	3, a
	jr	Z, 00214$
;/tmp/_gbsbuild/src/states/Platform.c:212: on_ladder = FALSE;
	ld	hl, #_on_ladder
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:213: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:214: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:215: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
	jr	00219$
00214$:
;/tmp/_gbsbuild/src/states/Platform.c:217: pl_pos_y -= pl_vel_y >> 8;
	ld	hl, #_pl_vel_y + 1
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_pl_pos_y
	ld	a, (hl)
	sub	a, c
	ld	(hl+), a
	ld	a, (hl)
	sbc	a, b
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Platform.c:218: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
00219$:
;/tmp/_gbsbuild/src/states/Platform.c:223: tile_below = TileAt(tile_x_mid, tile_y + 1);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	c, e
;/tmp/_gbsbuild/src/states/Platform.c:224: if (pl_vel_y >= 0) {
	ld	hl, #_pl_vel_y
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00841$
	bit	7, d
	jr	NZ, 00842$
	cp	a, a
	jr	00842$
00841$:
	bit	7, d
	jr	Z, 00842$
	scf
00842$:
	jp	C, 00239$
;/tmp/_gbsbuild/src/states/Platform.c:225: if ((tile_below & COLLISION_TOP) && !(tile_below & TILE_PROP_LADDER)) {
	bit	0, c
	jp	Z,00239$
	bit	4, c
	jp	NZ,00239$
;/tmp/_gbsbuild/src/states/Platform.c:226: grounded = TRUE;
	ld	hl, #_grounded
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:227: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:228: pl_pos_y = (tile_y * 8) << 4;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pl_pos_y
	ld	(hl+), a
	ld	(hl), e
	jp	00239$
00238$:
;/tmp/_gbsbuild/src/states/Platform.c:153: hit_actor = ActorAtTile(tile_x + 2, tile_y, TRUE);
	ldhl	sp,	#1
	ld	c, (hl)
;/tmp/_gbsbuild/src/states/Platform.c:167: TileAt(tile_x + 1, tile_y - 1) & COLLISION_BOTTOM))) {  // Right edge
	inc	c
;/tmp/_gbsbuild/src/states/Platform.c:234: if (pl_vel_y >= 0 && (TileAt(tile_x, tile_y + 1) & COLLISION_TOP ||  // Left Edge
	ld	hl, #_pl_vel_y
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00846$
	bit	7, d
	jr	NZ, 00847$
	cp	a, a
	jr	00847$
00846$:
	bit	7, d
	jr	Z, 00847$
	scf
00847$:
	jr	C, 00232$
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	pop	bc
	rrca
	jr	C, 00231$
;/tmp/_gbsbuild/src/states/Platform.c:235: (((pl_pos_x >> 4) & 0x7) != 0 &&
	ld	hl, #_pl_pos_x
	ld	a, (hl+)
	ld	b, a
	ld	e, (hl)
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	sra	e
	rr	b
	ld	a, b
	and	a, #0x07
	jr	Z, 00232$
;/tmp/_gbsbuild/src/states/Platform.c:236: TileAt(tile_x + 1, tile_y + 1) & COLLISION_TOP))  // Right edge
	push	bc
	ldhl	sp,	#8
	ld	b, (hl)
	push	bc
	call	_TileAt
	add	sp, #2
	ld	a, e
	pop	bc
	rrca
	jr	NC, 00232$
00231$:
;/tmp/_gbsbuild/src/states/Platform.c:238: grounded = TRUE;
	ld	hl, #_grounded
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Platform.c:239: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:240: pl_pos_y = (tile_y * 8) << 4;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_pl_pos_y
	ld	(hl+), a
	ld	(hl), e
	jp	00239$
00232$:
;/tmp/_gbsbuild/src/states/Platform.c:242: grounded = FALSE;
	ld	hl, #_grounded
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:245: if (pl_vel_y < 0) {
	ld	hl, #_pl_vel_y
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00852$
	bit	7, d
	jr	NZ, 00853$
	cp	a, a
	jr	00853$
00852$:
	bit	7, d
	jr	Z, 00853$
	scf
00853$:
	jr	NC, 00239$
;/tmp/_gbsbuild/src/states/Platform.c:246: if (TileAt(tile_x, tile_y - 1) & COLLISION_BOTTOM ||  // Left Edge
	ldhl	sp,	#3
	ld	b, (hl)
	dec	b
	push	bc
	push	bc
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	pop	bc
	bit	1, e
	jr	NZ, 00225$
;/tmp/_gbsbuild/src/states/Platform.c:247: (((pl_pos_x >> 4) & 0x7) != 0 &&
	ld	hl, #_pl_pos_x + 1
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
	sra	d
	rr	e
	ld	a, e
	and	a, #0x07
	jr	Z, 00239$
;/tmp/_gbsbuild/src/states/Platform.c:248: TileAt(tile_x + 1, tile_y - 1) & COLLISION_BOTTOM)  // Right edge
	push	bc
	call	_TileAt
	add	sp, #2
	bit	1, e
	jr	Z, 00239$
00225$:
;/tmp/_gbsbuild/src/states/Platform.c:250: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:251: pl_pos_y = (((tile_y + 1) * 8) << 4);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, #0x03
00858$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00858$
	dec	hl
	ld	a, (hl)
	ld	(#_pl_pos_y),a
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(#_pl_pos_y + 1),a
	ld	a, #0x04
00859$:
	ld	hl, #_pl_pos_y
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00859$
00239$:
;/tmp/_gbsbuild/src/states/Platform.c:258: player.pos.x = (pl_pos_x >> 4) - 4u;
	ld	hl, #_pl_pos_x + 1
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
	sra	b
	rr	c
	ld	a, c
	add	a, #0xfc
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Platform.c:259: player.pos.y = pl_pos_y >> 4;
	ld	hl, #_pl_pos_y + 1
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
	sra	b
	rr	c
	ld	hl, #(_actors + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Platform.c:262: if (player.pos.x < 0) {
	ld	de, #_actors
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00860$
	bit	7, d
	jr	NZ, 00861$
	cp	a, a
	jr	00861$
00860$:
	bit	7, d
	jr	Z, 00861$
	scf
00861$:
	jr	NC, 00243$
;/tmp/_gbsbuild/src/states/Platform.c:263: player.pos.x = 0;
	ld	hl, #_actors
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Platform.c:264: pl_pos_x = 0;
	ld	hl, #_pl_pos_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:265: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00244$
00243$:
;/tmp/_gbsbuild/src/states/Platform.c:266: } else if (player.pos.x > image_width - 16) {
	ld	hl, #_image_width
	ld	a, (hl)
	add	a, #0xf0
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00244$
;/tmp/_gbsbuild/src/states/Platform.c:267: player.pos.x = image_width - 16;
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Platform.c:268: pl_pos_x = 0;
	ld	hl, #_pl_pos_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:269: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
00244$:
;/tmp/_gbsbuild/src/states/Platform.c:69: pl_pos_y = ((player.pos.y) << 4) + (pl_pos_y & 0xF);
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/Platform.c:272: if (player.pos.y < 0) {
	bit	7, b
	jr	Z, 00248$
;/tmp/_gbsbuild/src/states/Platform.c:273: player.pos.y = 0;
	ld	hl, #(_actors + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Platform.c:274: pl_pos_y = 0;
	ld	hl, #_pl_pos_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:275: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00249$
00248$:
;/tmp/_gbsbuild/src/states/Platform.c:276: } else if (player.pos.y > image_height - 8) {
	ld	hl, #_image_height + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00249$
;/tmp/_gbsbuild/src/states/Platform.c:277: player.pos.y = image_height - 8;
	ld	de, #(_actors + 0x0002)
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/states/Platform.c:278: pl_pos_y = 0;
	ld	hl, #_pl_pos_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:279: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:280: grounded = TRUE;
	ld	hl, #_grounded
	ld	(hl), #0x01
00249$:
;/tmp/_gbsbuild/src/states/Platform.c:283: player.animate = (grounded && pl_vel_x != 0) || (on_ladder && pl_vel_y != 0);
	ld	a, (#_grounded)
	or	a, a
	jr	Z, 00283$
	ld	hl, #_pl_vel_x + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00279$
00283$:
	ld	a, (#_on_ladder)
	or	a, a
	jr	Z, 00278$
	ld	hl, #_pl_vel_y + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00279$
00278$:
	xor	a, a
	jr	00280$
00279$:
	ld	a, #0x01
00280$:
	ld	(#(_actors + 0x0011)),a
;/tmp/_gbsbuild/src/states/Platform.c:286: if (ActivateTriggerAt(tile_x, tile_y, INPUT_UP_PRESSED)) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00291$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00287$
00291$:
	ld	a, (#_joy)
	bit	2, a
	jr	Z, 00287$
	ld	hl, #_last_joy
	ld	c, (hl)
	xor	a, a
	bit	2, c
	jr	Z, 00288$
00287$:
	xor	a, a
	jr	00289$
00288$:
	ld	a, #0x01
00289$:
	push	af
	inc	sp
	ldhl	sp,	#3
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
;/tmp/_gbsbuild/src/states/Platform.c:288: return;
	jr	NZ, 00258$
;/tmp/_gbsbuild/src/states/Platform.c:292: hit_actor = ActorOverlapsPlayer(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_ActorOverlapsPlayer
	inc	sp
	ld	c, e
;/tmp/_gbsbuild/src/states/Platform.c:293: if (hit_actor && hit_actor != NO_ACTOR_COLLISON && player_iframes == 0) {
	ld	a, c
	or	a, a
	jr	Z, 00258$
	ld	a, c
	inc	a
	jr	Z, 00258$
	ld	a, (#_player_iframes)
;/tmp/_gbsbuild/src/states/Platform.c:294: if (actors[hit_actor].collision_group) {
	or	a,a
	jr	NZ, 00258$
	ld	b,a
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
	jr	Z, 00258$
;/tmp/_gbsbuild/src/states/Platform.c:295: player.hit_actor = 0;
	ld	hl, #_actors + 26
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Platform.c:296: player.hit_actor = hit_actor;
	ld	(hl), c
00258$:
;/tmp/_gbsbuild/src/states/Platform.c:299: }
	add	sp, #9
	ret
	.area _CODE_5
	.area _CABS (ABS)
