;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Shmup
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ActivateTriggerAt
	.globl _ScriptStartBg
	.globl _TileAt
	.globl _ActorOverlapsPlayer
	.globl _Gt16
	.globl _Lt16
	.globl _shooter_reached_end
	.globl _shooter_direction
	.globl _shooter_horizontal
	.globl _Start_Shmup
	.globl _Update_Shmup
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_shooter_horizontal::
	.ds 1
_shooter_direction::
	.ds 1
_shooter_reached_end::
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
;/tmp/_gbsbuild/src/states/Shmup.c:15: UBYTE shooter_horizontal = 0;
	ld	hl, #_shooter_horizontal
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:16: BYTE shooter_direction = 0;
	ld	hl, #_shooter_direction
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:17: UBYTE shooter_reached_end = 0;
	ld	hl, #_shooter_reached_end
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_5
;/tmp/_gbsbuild/src/states/Shmup.c:19: void Start_Shmup() {
;	---------------------------------
; Function Start_Shmup
; ---------------------------------
_Start_Shmup::
;/tmp/_gbsbuild/src/states/Shmup.c:20: camera_offset.x = 0;
	ld	hl, #_camera_offset
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:21: camera_offset.y = 0;
	ld	hl, #(_camera_offset + 0x0001)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:22: camera_deadzone.x = 0;
	ld	hl, #_camera_deadzone
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:23: camera_deadzone.y = 0;
	ld	hl, #(_camera_deadzone + 0x0001)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:25: if (player.dir.x < 0) {
	ld	hl, #(_actors + 0x0005)
	ld	c, (hl)
	bit	7, c
	jr	Z, 00108$
;/tmp/_gbsbuild/src/states/Shmup.c:27: camera_offset.x = 56;
	ld	hl, #_camera_offset
	ld	(hl), #0x38
;/tmp/_gbsbuild/src/states/Shmup.c:28: shooter_horizontal = 1;
	ld	hl, #_shooter_horizontal
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Shmup.c:29: shooter_direction = -1;
	ld	hl, #_shooter_direction
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/Shmup.c:32: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
	jr	00109$
00108$:
;/tmp/_gbsbuild/src/states/Shmup.c:33: } else if (player.dir.x > 0) {
	ld	e, c
	ld	d, #0x00
	xor	a, a
	sub	a, c
	bit	7, e
	jr	Z, 00127$
	bit	7, d
	jr	NZ, 00128$
	cp	a, a
	jr	00128$
00127$:
	bit	7, d
	jr	Z, 00128$
	scf
00128$:
	jr	NC, 00105$
;/tmp/_gbsbuild/src/states/Shmup.c:35: camera_offset.x = -56;
	ld	hl, #_camera_offset
	ld	(hl), #0xc8
;/tmp/_gbsbuild/src/states/Shmup.c:36: shooter_horizontal = 1;
	ld	hl, #_shooter_horizontal
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Shmup.c:37: shooter_direction = 1;
	ld	hl, #_shooter_direction
	ld	(hl), #0x01
	jr	00109$
00105$:
;/tmp/_gbsbuild/src/states/Shmup.c:38: } else if (player.dir.y < 0) {
	ld	hl, #(_actors + 0x0006)
	bit	7, (hl)
	jr	Z, 00102$
;/tmp/_gbsbuild/src/states/Shmup.c:40: camera_offset.y = 56;
	ld	hl, #(_camera_offset + 0x0001)
	ld	(hl), #0x38
;/tmp/_gbsbuild/src/states/Shmup.c:41: shooter_horizontal = 0;
	ld	hl, #_shooter_horizontal
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:42: shooter_direction = -1;
	ld	hl, #_shooter_direction
	ld	(hl), #0xff
	jr	00109$
00102$:
;/tmp/_gbsbuild/src/states/Shmup.c:45: camera_offset.y = -40;
	ld	hl, #(_camera_offset + 0x0001)
	ld	(hl), #0xd8
;/tmp/_gbsbuild/src/states/Shmup.c:46: shooter_horizontal = 0;
	ld	hl, #_shooter_horizontal
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:47: shooter_direction = 1;
	ld	hl, #_shooter_direction
	ld	(hl), #0x01
00109$:
;/tmp/_gbsbuild/src/states/Shmup.c:50: shooter_reached_end = FALSE;
	ld	hl, #_shooter_reached_end
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:52: player.animate = TRUE;
	ld	hl, #(_actors + 0x0011)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Shmup.c:53: }
	ret
;/tmp/_gbsbuild/src/states/Shmup.c:55: void Update_Shmup() {
;	---------------------------------
; Function Update_Shmup
; ---------------------------------
_Update_Shmup::
	add	sp, #-5
;/tmp/_gbsbuild/src/states/Shmup.c:58: tile_x = DIV_8(player.pos.x);
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
;/tmp/_gbsbuild/src/states/Shmup.c:59: tile_y = DIV_8(player.pos.y);
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
	ldhl	sp,	#4
	ld	(hl), c
;/tmp/_gbsbuild/src/states/Shmup.c:62: if (ActivateTriggerAt(tile_x, tile_y, FALSE)) {
	xor	a, a
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_ActivateTriggerAt
	add	sp, #3
	push	hl
	ldhl	sp,	#5
	ld	(hl), e
	pop	hl
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
;/tmp/_gbsbuild/src/states/Shmup.c:63: return;
	jp	NZ,00207$
;/tmp/_gbsbuild/src/states/Shmup.c:68: if (INPUT_RECENT_UP && Gt16(player.pos.y, 8) &&
	ld	a, (#_recent_joy)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_joy)
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Shmup.c:66: if (shooter_horizontal) {
	ld	a, (#_shooter_horizontal)
	or	a, a
	jp	Z, 00198$
;/tmp/_gbsbuild/src/states/Shmup.c:69: !(TileAt(tile_x, tile_y - 1) & COLLISION_BOTTOM)) {
;/tmp/_gbsbuild/src/states/Shmup.c:68: if (INPUT_RECENT_UP && Gt16(player.pos.y, 8) &&
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00118$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00113$
00118$:
	ldhl	sp,	#2
	bit	2, (hl)
	jr	NZ, 00119$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00113$
	ldhl	sp,	#3
	bit	2, (hl)
	jr	Z, 00113$
00119$:
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
	jr	Z, 00113$
;/tmp/_gbsbuild/src/states/Shmup.c:69: !(TileAt(tile_x, tile_y - 1) & COLLISION_BOTTOM)) {
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	bit	1, e
	jr	NZ, 00113$
;/tmp/_gbsbuild/src/states/Shmup.c:70: player.dir.y = -1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/Shmup.c:71: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
	jr	00114$
00113$:
;/tmp/_gbsbuild/src/states/Shmup.c:72: } else if (INPUT_RECENT_DOWN && Lt16(player.pos.y, (image_height - 8)) &&
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00104$
00109$:
	ld	a, (#_recent_joy)
	bit	3, a
	jr	NZ, 00110$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00104$
	ld	a, (#_joy)
	bit	3, a
	jr	Z, 00104$
00110$:
	ld	hl, #_image_height
	ld	a, (hl)
	add	a, #0xf8
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00104$
;/tmp/_gbsbuild/src/states/Shmup.c:73: !(TileAt(tile_x, tile_y + 1) & COLLISION_TOP)) {
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	rrca
	jr	C, 00104$
;/tmp/_gbsbuild/src/states/Shmup.c:74: player.dir.y = 1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Shmup.c:75: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
	jr	00114$
00104$:
;/tmp/_gbsbuild/src/states/Shmup.c:77: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:78: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
00114$:
;/tmp/_gbsbuild/src/states/Shmup.c:68: if (INPUT_RECENT_UP && Gt16(player.pos.y, 8) &&
	ld	hl, #_joy
	ld	c, (hl)
;/tmp/_gbsbuild/src/states/Shmup.c:81: if (INPUT_UP_PRESSED || INPUT_DOWN_PRESSED) {
	ld	hl, #_last_joy
	ld	b, (hl)
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00125$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00129$
00125$:
	bit	2, c
	jr	Z, 00129$
	bit	2, b
	jr	Z, 00121$
00129$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00128$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00122$
00128$:
	bit	3, c
	jr	Z, 00122$
	bit	3, b
	jr	NZ, 00122$
00121$:
;/tmp/_gbsbuild/src/states/Shmup.c:83: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
00122$:
;/tmp/_gbsbuild/src/states/Shmup.c:58: tile_x = DIV_8(player.pos.x);
	ld	de, #_actors
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Shmup.c:87: if (shooter_direction == 1) {
	ld	a, (#_shooter_direction)
	dec	a
	jr	NZ, 00135$
;/tmp/_gbsbuild/src/states/Shmup.c:89: if (Gt16(player.pos.x, image_width - SCREEN_WIDTH_HALF - 64)) {
	ld	hl, #_image_width
	ld	a, (hl)
	add	a, #0x70
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	push	bc
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00136$
;/tmp/_gbsbuild/src/states/Shmup.c:90: shooter_reached_end = TRUE;
	ld	hl, #_shooter_reached_end
	ld	(hl), #0x01
	jr	00136$
00135$:
;/tmp/_gbsbuild/src/states/Shmup.c:94: if (Lt16(player.pos.x, SCREEN_WIDTH_HALF + 48)) {
	ld	hl, #0x0080
	push	hl
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00136$
;/tmp/_gbsbuild/src/states/Shmup.c:95: shooter_reached_end = TRUE;
	ld	hl, #_shooter_reached_end
	ld	(hl), #0x01
00136$:
;/tmp/_gbsbuild/src/states/Shmup.c:104: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	and	a, #0x01
	ld	c, a
	ld	b, #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:100: if (shooter_reached_end) {
	ld	a, (#_shooter_reached_end)
	or	a, a
	jr	Z, 00148$
;/tmp/_gbsbuild/src/states/Shmup.c:102: if (player.move_speed == 0) {
	ld	a, (#(_actors + 0x0004) + 0)
	ldhl	sp,	#4
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Shmup.c:105: player.pos.y += (WORD)player.dir.y;
;/tmp/_gbsbuild/src/states/Shmup.c:102: if (player.move_speed == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00140$
;/tmp/_gbsbuild/src/states/Shmup.c:104: if (IS_FRAME_2) {
	ld	a, b
	or	a, c
	jp	NZ, 00199$
;/tmp/_gbsbuild/src/states/Shmup.c:105: player.pos.y += (WORD)player.dir.y;
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
	jp	00199$
00140$:
;/tmp/_gbsbuild/src/states/Shmup.c:108: player.pos.y += (WORD)(player.dir.y * player.move_speed);
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0006) + 0)
	push	bc
	ldhl	sp,	#6
	ld	h, (hl)
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
	jp	00199$
00148$:
;/tmp/_gbsbuild/src/states/Shmup.c:111: if (player.move_speed == 0) {
	ld	a, (#(_actors + 0x0004) + 0)
	ldhl	sp,	#4
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Shmup.c:115: player.pos.y += (WORD)player.dir.y;
;/tmp/_gbsbuild/src/states/Shmup.c:111: if (player.move_speed == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00145$
;/tmp/_gbsbuild/src/states/Shmup.c:113: if (IS_FRAME_2) {
	ld	a, b
	or	a, c
	jp	NZ, 00199$
;/tmp/_gbsbuild/src/states/Shmup.c:114: player.pos.x += (WORD)shooter_direction;
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_shooter_direction)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Shmup.c:115: player.pos.y += (WORD)player.dir.y;
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
	jp	00199$
00145$:
;/tmp/_gbsbuild/src/states/Shmup.c:118: player.pos.x += (WORD)(shooter_direction * player.move_speed);
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, (#_shooter_direction)
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
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Shmup.c:119: player.pos.y += (WORD)(player.dir.y * player.move_speed);
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
	jp	00199$
00198$:
;/tmp/_gbsbuild/src/states/Shmup.c:125: if (INPUT_RECENT_LEFT && (player.pos.x > 0) && !(TileAt(tile_x, tile_y) & COLLISION_RIGHT)) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00165$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jr	NZ, 00160$
00165$:
	ldhl	sp,	#2
	bit	1, (hl)
	jr	NZ, 00166$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00160$
	ldhl	sp,	#3
	bit	1, (hl)
	jr	Z, 00160$
00166$:
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0x00
	xor	a, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00489$
	bit	7, d
	jr	NZ, 00490$
	cp	a, a
	jr	00490$
00489$:
	bit	7, d
	jr	Z, 00490$
	scf
00490$:
	jr	NC, 00160$
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	bit	3, e
	jr	NZ, 00160$
;/tmp/_gbsbuild/src/states/Shmup.c:126: player.dir.x = -1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/Shmup.c:127: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
	jr	00161$
00160$:
;/tmp/_gbsbuild/src/states/Shmup.c:128: } else if (INPUT_RECENT_RIGHT && Lt16(player.pos.x, image_width - 16) &&
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00156$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jr	NZ, 00151$
00156$:
	ld	a, (#_recent_joy)
	rrca
	jr	C, 00157$
	ld	a, (#_recent_joy)
	or	a, a
	jr	NZ, 00151$
	ld	a, (#_joy)
	rrca
	jr	NC, 00151$
00157$:
	ld	hl, #_image_width
	ld	a, (hl)
	add	a, #0xf0
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
	jr	Z, 00151$
;/tmp/_gbsbuild/src/states/Shmup.c:129: !(TileAt(tile_x + 2, tile_y) & COLLISION_LEFT)) {
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x02
	ldhl	sp,	#4
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	bit	2, e
	jr	NZ, 00151$
;/tmp/_gbsbuild/src/states/Shmup.c:130: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Shmup.c:131: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
	jr	00161$
00151$:
;/tmp/_gbsbuild/src/states/Shmup.c:133: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:134: player.dir.y = shooter_direction;
	ld	de, #(_actors + 0x0006)
	ld	a, (#_shooter_direction)
	ld	(de), a
00161$:
;/tmp/_gbsbuild/src/states/Shmup.c:68: if (INPUT_RECENT_UP && Gt16(player.pos.y, 8) &&
	ld	hl, #_joy
	ld	c, (hl)
;/tmp/_gbsbuild/src/states/Shmup.c:81: if (INPUT_UP_PRESSED || INPUT_DOWN_PRESSED) {
	ld	hl, #_last_joy
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/Shmup.c:137: if (INPUT_LEFT_PRESSED || INPUT_RIGHT_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00172$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jr	NZ, 00176$
00172$:
	bit	1, c
	jr	Z, 00176$
	bit	1, b
	jr	Z, 00168$
00176$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00175$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jr	NZ, 00169$
00175$:
	bit	0, c
	jr	Z, 00169$
	bit	0, b
	jr	NZ, 00169$
00168$:
;/tmp/_gbsbuild/src/states/Shmup.c:139: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
00169$:
;/tmp/_gbsbuild/src/states/Shmup.c:59: tile_y = DIV_8(player.pos.y);
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/Shmup.c:142: if (shooter_direction == 1) {
	ld	a, (#_shooter_direction)
	dec	a
	jr	NZ, 00182$
;/tmp/_gbsbuild/src/states/Shmup.c:144: if (Gt16(player.pos.y, image_height - SCREEN_WIDTH_HALF - 40)) {
	ld	hl, #_image_height
	ld	a, (hl)
	add	a, #0x88
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	d, a
	push	de
	push	bc
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00183$
;/tmp/_gbsbuild/src/states/Shmup.c:145: shooter_reached_end = TRUE;
	ld	hl, #_shooter_reached_end
	ld	(hl), #0x01
	jr	00183$
00182$:
;/tmp/_gbsbuild/src/states/Shmup.c:149: if (Lt16(player.pos.y, SCREEN_WIDTH_HALF + 40)) {
	ld	hl, #0x0078
	push	hl
	push	bc
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00183$
;/tmp/_gbsbuild/src/states/Shmup.c:150: shooter_reached_end = TRUE;
	ld	hl, #_shooter_reached_end
	ld	(hl), #0x01
00183$:
;/tmp/_gbsbuild/src/states/Shmup.c:104: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	and	a, #0x01
	ld	c, a
	ld	b, #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:155: if (shooter_reached_end) {
	ld	a, (#_shooter_reached_end)
	or	a, a
	jr	Z, 00195$
;/tmp/_gbsbuild/src/states/Shmup.c:157: if (player.move_speed == 0) {
	ld	a, (#(_actors + 0x0004) + 0)
	ldhl	sp,	#4
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Shmup.c:160: player.pos.x += (WORD)player.dir.x;
;/tmp/_gbsbuild/src/states/Shmup.c:157: if (player.move_speed == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00187$
;/tmp/_gbsbuild/src/states/Shmup.c:159: if (IS_FRAME_2) {
	ld	a, b
	or	a, c
	jp	NZ, 00199$
;/tmp/_gbsbuild/src/states/Shmup.c:160: player.pos.x += (WORD)player.dir.x;
	ld	de, #_actors
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#(_actors + 0x0005) + 0)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00199$
00187$:
;/tmp/_gbsbuild/src/states/Shmup.c:163: player.pos.x += (WORD)(player.dir.x * player.move_speed);
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0005) + 0)
	push	bc
	ldhl	sp,	#6
	ld	h, (hl)
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
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00199$
00195$:
;/tmp/_gbsbuild/src/states/Shmup.c:166: if (player.move_speed == 0) {
	ld	a, (#(_actors + 0x0004) + 0)
	ldhl	sp,	#4
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Shmup.c:169: player.pos.x += (WORD)player.dir.x;
;/tmp/_gbsbuild/src/states/Shmup.c:170: player.pos.y += (WORD)shooter_direction;
;/tmp/_gbsbuild/src/states/Shmup.c:166: if (player.move_speed == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00192$
;/tmp/_gbsbuild/src/states/Shmup.c:168: if (IS_FRAME_2) {
	ld	a, b
	or	a, c
	jr	NZ, 00199$
;/tmp/_gbsbuild/src/states/Shmup.c:169: player.pos.x += (WORD)player.dir.x;
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
;/tmp/_gbsbuild/src/states/Shmup.c:170: player.pos.y += (WORD)shooter_direction;
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_shooter_direction)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
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
	jr	00199$
00192$:
;/tmp/_gbsbuild/src/states/Shmup.c:173: player.pos.x += (WORD)(player.dir.x * player.move_speed);
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0005) + 0)
	push	bc
	ldhl	sp,	#6
	ld	h, (hl)
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
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Shmup.c:174: player.pos.y += (WORD)(shooter_direction * player.move_speed);
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_actors + 0x0004) + 0)
	push	bc
	push	af
	inc	sp
	ld	a, (#_shooter_direction)
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
00199$:
;/tmp/_gbsbuild/src/states/Shmup.c:180: hit_actor = ActorOverlapsPlayer(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_ActorOverlapsPlayer
	inc	sp
	ldhl	sp,	#0
	ld	(hl), e
;/tmp/_gbsbuild/src/states/Shmup.c:181: if (hit_actor && hit_actor != NO_ACTOR_COLLISON && player_iframes == 0) {
	ld	a, (hl)
	or	a, a
	jr	Z, 00207$
	ld	a, (hl)
	inc	a
	jr	Z, 00207$
	ld	a, (#_player_iframes)
	or	a, a
	jr	NZ, 00207$
;/tmp/_gbsbuild/src/states/Shmup.c:182: if (actors[hit_actor].collision_group) {
	ldhl	sp,	#0
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
	ld	hl, #0x0018
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	or	a, a
	jr	Z, 00201$
;/tmp/_gbsbuild/src/states/Shmup.c:183: player.hit_actor = 0;
	ld	hl, #(_actors + 0x001a)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Shmup.c:184: player.hit_actor = hit_actor;
	ld	de, #(_actors + 0x001a)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	jr	00207$
00201$:
;/tmp/_gbsbuild/src/states/Shmup.c:186: player_iframes = SHOOTER_HURT_IFRAMES;
	ld	hl, #_player_iframes
	ld	(hl), #0x0a
;/tmp/_gbsbuild/src/states/Shmup.c:187: ScriptStartBg(&actors[hit_actor].events_ptr, hit_actor);
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_ScriptStartBg
	add	sp, #3
00207$:
;/tmp/_gbsbuild/src/states/Shmup.c:190: }
	add	sp, #5
	ret
	.area _CODE_5
	.area _CABS (ABS)
