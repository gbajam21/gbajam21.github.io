;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module PointNClick
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TriggerRunScript
	.globl _TriggerAtTile
	.globl _ActorRunScript
	.globl _ActorAtTile
	.globl _Gt16
	.globl _Lt16
	.globl _last_hit_trigger
	.globl _Start_PointNClick
	.globl _Update_PointNClick
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_last_hit_trigger::
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
;/tmp/_gbsbuild/src/states/PointNClick.c:13: UBYTE last_hit_trigger = MAX_TRIGGERS;
	ld	hl, #_last_hit_trigger
	ld	(hl), #0x1f
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_5
;/tmp/_gbsbuild/src/states/PointNClick.c:15: void Start_PointNClick() {
;	---------------------------------
; Function Start_PointNClick
; ---------------------------------
_Start_PointNClick::
;/tmp/_gbsbuild/src/states/PointNClick.c:16: camera_offset.x = 0;
	ld	hl, #_camera_offset
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:17: camera_offset.y = 0;
	ld	hl, #(_camera_offset + 0x0001)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:18: camera_deadzone.x = POINT_N_CLICK_CAMERA_DEADZONE;
	ld	hl, #_camera_deadzone
	ld	(hl), #0x18
;/tmp/_gbsbuild/src/states/PointNClick.c:19: camera_deadzone.y = POINT_N_CLICK_CAMERA_DEADZONE;
	ld	hl, #(_camera_deadzone + 0x0001)
	ld	(hl), #0x18
;/tmp/_gbsbuild/src/states/PointNClick.c:21: player.sprite_type = SPRITE_STATIC;
	ld	hl, #(_actors + 0x0019)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:22: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:23: player.dir.y = 1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/PointNClick.c:24: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/PointNClick.c:25: }
	ret
;/tmp/_gbsbuild/src/states/PointNClick.c:27: void Update_PointNClick() {
;	---------------------------------
; Function Update_PointNClick
; ---------------------------------
_Update_PointNClick::
	add	sp, #-2
;/tmp/_gbsbuild/src/states/PointNClick.c:30: tile_x = DIV_8(player.pos.x);
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
	ldhl	sp,	#0
	ld	(hl), c
;/tmp/_gbsbuild/src/states/PointNClick.c:31: tile_y = DIV_8(player.pos.y);
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
	ldhl	sp,	#1
	ld	(hl), c
;/tmp/_gbsbuild/src/states/PointNClick.c:33: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:34: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:35: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:38: if (INPUT_LEFT && Gt16(player.pos.x, 0)) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00110$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jr	NZ, 00107$
00110$:
	ld	a, (#_joy)
	bit	1, a
	jr	Z, 00107$
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0000
	push	hl
	push	bc
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00107$
;/tmp/_gbsbuild/src/states/PointNClick.c:39: player.dir.x = -1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/PointNClick.c:40: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jr	00108$
00107$:
;/tmp/_gbsbuild/src/states/PointNClick.c:41: } else if (INPUT_RIGHT && Lt16(player.pos.x, image_width - 8)) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00104$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jr	NZ, 00108$
00104$:
	ld	a, (#_joy)
	rrca
	jr	NC, 00108$
	ld	hl, #_image_width
	ld	a, (hl)
	add	a, #0xf8
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #_actors
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00108$
;/tmp/_gbsbuild/src/states/PointNClick.c:42: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/PointNClick.c:43: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
00108$:
;/tmp/_gbsbuild/src/states/PointNClick.c:47: if (INPUT_UP && Gt16(player.pos.y, 8)) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00121$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00118$
00121$:
	ld	a, (#_joy)
	bit	2, a
	jr	Z, 00118$
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	push	hl
	push	bc
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00118$
;/tmp/_gbsbuild/src/states/PointNClick.c:48: player.dir.y = -1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/PointNClick.c:49: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
	jr	00119$
00118$:
;/tmp/_gbsbuild/src/states/PointNClick.c:50: } else if (INPUT_DOWN && Lt16(player.pos.y, image_height)) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00115$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00119$
00115$:
	ld	a, (#_joy)
	bit	3, a
	jr	Z, 00119$
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_image_height
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00119$
;/tmp/_gbsbuild/src/states/PointNClick.c:51: player.dir.y = 1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/PointNClick.c:52: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
00119$:
;/tmp/_gbsbuild/src/states/PointNClick.c:56: hit_trigger = TriggerAtTile(tile_x, tile_y - 1);
	ldhl	sp,	#1
	ld	a, (hl)
	dec	a
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TriggerAtTile
	add	sp, #2
	ld	c, e
;/tmp/_gbsbuild/src/states/PointNClick.c:57: hit_actor = ActorAtTile(tile_x, tile_y, TRUE);
	push	bc
	ld	a, #0x01
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
	call	_ActorAtTile
	add	sp, #3
	ld	a, e
	pop	bc
	ld	b, a
;/tmp/_gbsbuild/src/states/PointNClick.c:59: is_hover_trigger = (hit_trigger != NO_TRIGGER_COLLISON) && (hit_trigger != last_hit_trigger) &&
	ld	a, c
	inc	a
	jr	Z, 00147$
	ld	a, (#_last_hit_trigger)
	sub	a, c
	jr	Z, 00147$
;/tmp/_gbsbuild/src/states/PointNClick.c:60: (triggers[hit_trigger].events_ptr.bank != 0);
	ld	e, c
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #_triggers
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00148$
00147$:
	xor	a, a
	jr	00149$
00148$:
	ld	a, #0x01
00149$:
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/states/PointNClick.c:61: is_hover_actor = (hit_actor != NO_ACTOR_COLLISON) && (hit_actor != 0) &&
	ld	a, b
	inc	a
	jr	Z, 00153$
	ld	a, b
	or	a, a
	jr	Z, 00153$
;/tmp/_gbsbuild/src/states/PointNClick.c:62: (actors[hit_actor].events_ptr.bank != 0);
	ld	e, b
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
	ld	a, (hl)
	or	a, a
	jr	NZ, 00154$
00153$:
	xor	a, a
	jr	00155$
00154$:
	ld	a, #0x01
00155$:
	ldhl	sp,	#1
	ld	(hl), a
;/tmp/_gbsbuild/src/states/PointNClick.c:66: player.frame = 1;
	ld	de, #_actors + 15
;/tmp/_gbsbuild/src/states/PointNClick.c:67: player.rerender = TRUE;
;/tmp/_gbsbuild/src/states/PointNClick.c:65: if ((is_hover_trigger || is_hover_actor) && player.frames_len != 1) {
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00124$
00127$:
	ld	a, (#_actors + 16)
	dec	a
	jr	Z, 00124$
;/tmp/_gbsbuild/src/states/PointNClick.c:66: player.frame = 1;
	ld	a, #0x01
	ld	(de), a
;/tmp/_gbsbuild/src/states/PointNClick.c:67: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
	jr	00125$
00124$:
;/tmp/_gbsbuild/src/states/PointNClick.c:69: player.frame = 0;
	xor	a, a
	ld	(de), a
;/tmp/_gbsbuild/src/states/PointNClick.c:70: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
00125$:
;/tmp/_gbsbuild/src/states/PointNClick.c:73: if (INPUT_A_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00137$
	ld	hl, #_input_override_default
	bit	4, (hl)
	jr	NZ, 00134$
00137$:
	ld	a, (#_joy)
	bit	4, a
	jr	Z, 00134$
	ld	a, (#_last_joy)
	bit	4, a
	jr	NZ, 00134$
;/tmp/_gbsbuild/src/states/PointNClick.c:74: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/PointNClick.c:76: if (is_hover_actor) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00131$
;/tmp/_gbsbuild/src/states/PointNClick.c:78: ActorRunScript(hit_actor);
	push	bc
	inc	sp
	call	_ActorRunScript
	inc	sp
	jr	00134$
00131$:
;/tmp/_gbsbuild/src/states/PointNClick.c:79: } else if (is_hover_trigger) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00134$
;/tmp/_gbsbuild/src/states/PointNClick.c:81: TriggerRunScript(hit_trigger);
	ld	a, c
	push	af
	inc	sp
	call	_TriggerRunScript
	inc	sp
00134$:
;/tmp/_gbsbuild/src/states/PointNClick.c:86: if (player.moving) {
	ld	a, (#(_actors + 0x0007) + 0)
	or	a, a
	jp	Z, 00145$
;/tmp/_gbsbuild/src/states/PointNClick.c:87: if (player.move_speed == 0) {
	ld	hl, #(_actors + 0x0004)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00141$
;/tmp/_gbsbuild/src/states/PointNClick.c:89: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	rrca
	jr	C, 00145$
;/tmp/_gbsbuild/src/states/PointNClick.c:90: player.pos.x += (WORD)player.dir.x;
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0005) + 0)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/PointNClick.c:91: player.pos.y += (WORD)player.dir.y;
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0006) + 0)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	ld	hl, #(_actors + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00145$
00141$:
;/tmp/_gbsbuild/src/states/PointNClick.c:94: player.pos.x += (WORD)(player.dir.x * player.move_speed);
	ld	de, #_actors
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#(_actors + 0x0005) + 0)
	ld	h, c
	push	hl
	inc	sp
	push	af
	inc	sp
	call	__muluschar
	add	sp, #2
;c
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/PointNClick.c:95: player.pos.y += (WORD)(player.dir.y * player.move_speed);
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
00145$:
;/tmp/_gbsbuild/src/states/PointNClick.c:98: }
	add	sp, #2
	ret
	.area _CODE_5
	.area _CABS (ABS)
