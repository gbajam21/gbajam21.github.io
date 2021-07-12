;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Adventure
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ActivateTriggerAt
	.globl _ScriptStart
	.globl _TileAt
	.globl _ActorInFrontOfPlayer
	.globl _ActorOverlapsPlayer
	.globl _Start_Adventure
	.globl _Update_Adventure
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
;/tmp/_gbsbuild/src/states/Adventure.c:16: void Start_Adventure() {
;	---------------------------------
; Function Start_Adventure
; ---------------------------------
_Start_Adventure::
;/tmp/_gbsbuild/src/states/Adventure.c:18: camera_offset.x = 0;
	ld	hl, #_camera_offset
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Adventure.c:19: camera_offset.y = 0;
	ld	hl, #(_camera_offset + 0x0001)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Adventure.c:20: camera_deadzone.x = ADVENTURE_CAMERA_DEADZONE;
	ld	hl, #_camera_deadzone
	ld	(hl), #0x08
;/tmp/_gbsbuild/src/states/Adventure.c:21: camera_deadzone.y = ADVENTURE_CAMERA_DEADZONE;
	ld	hl, #(_camera_deadzone + 0x0001)
	ld	(hl), #0x08
;/tmp/_gbsbuild/src/states/Adventure.c:22: }
	ret
;/tmp/_gbsbuild/src/states/Adventure.c:24: void Update_Adventure() {
;	---------------------------------
; Function Update_Adventure
; ---------------------------------
_Update_Adventure::
	add	sp, #-13
;/tmp/_gbsbuild/src/states/Adventure.c:30: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Adventure.c:34: if (INPUT_LEFT) {
	ld	hl, #_joy
	ld	e, (hl)
;/tmp/_gbsbuild/src/states/Adventure.c:35: player.dir.x = -1;
;/tmp/_gbsbuild/src/states/Adventure.c:37: player.rerender = TRUE;
	ld	bc, #_actors + 20
;/tmp/_gbsbuild/src/states/Adventure.c:34: if (INPUT_LEFT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00109$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jr	NZ, 00106$
00109$:
	bit	1, e
	jr	Z, 00106$
;/tmp/_gbsbuild/src/states/Adventure.c:35: player.dir.x = -1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/Adventure.c:36: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
;/tmp/_gbsbuild/src/states/Adventure.c:37: player.rerender = TRUE;
	ld	a,#0x01
	ld	(hl),a
	ld	(bc), a
	jr	00107$
00106$:
;/tmp/_gbsbuild/src/states/Adventure.c:38: } else if (INPUT_RIGHT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00104$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jr	NZ, 00107$
00104$:
	bit	0, e
	jr	Z, 00107$
;/tmp/_gbsbuild/src/states/Adventure.c:39: player.dir.x = 1;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Adventure.c:40: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
;/tmp/_gbsbuild/src/states/Adventure.c:41: player.rerender = TRUE;
	ld	a,#0x01
	ld	(hl),a
	ld	(bc), a
00107$:
;/tmp/_gbsbuild/src/states/Adventure.c:34: if (INPUT_LEFT) {
	ld	hl, #_joy
	ld	e, (hl)
;/tmp/_gbsbuild/src/states/Adventure.c:46: player.dir.y = -1;
;/tmp/_gbsbuild/src/states/Adventure.c:45: if (INPUT_UP) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00118$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00115$
00118$:
	bit	2, e
	jr	Z, 00115$
;/tmp/_gbsbuild/src/states/Adventure.c:46: player.dir.y = -1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/states/Adventure.c:47: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
;/tmp/_gbsbuild/src/states/Adventure.c:48: player.rerender = TRUE;
	ld	a,#0x01
	ld	(hl),a
	ld	(bc), a
	jr	00116$
00115$:
;/tmp/_gbsbuild/src/states/Adventure.c:49: } else if (INPUT_DOWN) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00113$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00116$
00113$:
	bit	3, e
	jr	Z, 00116$
;/tmp/_gbsbuild/src/states/Adventure.c:50: player.dir.y = 1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/states/Adventure.c:51: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
;/tmp/_gbsbuild/src/states/Adventure.c:52: player.rerender = TRUE;
	ld	a,#0x01
	ld	(hl),a
	ld	(bc), a
00116$:
;/tmp/_gbsbuild/src/states/Adventure.c:34: if (INPUT_LEFT) {
	ld	a, (#_input_override_default)
	and	a, #0x02
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #_joy
	ld	e, (hl)
;/tmp/_gbsbuild/src/states/Adventure.c:38: } else if (INPUT_RIGHT) {
	ld	a, (#_input_override_default)
	and	a, #0x01
	ldhl	sp,	#6
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:45: if (INPUT_UP) {
	ld	a, (#_input_override_default)
	and	a, #0x04
	ldhl	sp,	#7
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:49: } else if (INPUT_DOWN) {
	ld	a, (#_input_override_default)
	and	a, #0x08
	ldhl	sp,	#8
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:34: if (INPUT_LEFT) {
	ld	a, e
	and	a, #0x02
	ld	c, a
	ld	b, #0x00
;/tmp/_gbsbuild/src/states/Adventure.c:38: } else if (INPUT_RIGHT) {
	ld	a, e
	and	a, #0x01
	inc	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:45: if (INPUT_UP) {
	ld	a, e
	and	a, #0x04
	inc	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:49: } else if (INPUT_DOWN) {
	ld	a, e
	and	a, #0x08
	ld	e, a
	ld	d, #0x00
;/tmp/_gbsbuild/src/states/Adventure.c:55: if ((INPUT_LEFT || INPUT_RIGHT) && !INPUT_UP && !INPUT_DOWN) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00136$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00139$
00136$:
	ld	a, b
	or	a, c
	jr	NZ, 00142$
00139$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00138$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00133$
00138$:
	ldhl	sp,	#10
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00133$
00142$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00141$
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00145$
00141$:
	ldhl	sp,	#12
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00133$
00145$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00144$
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	NZ, 00132$
00144$:
	ld	a, d
	or	a, e
	jr	NZ, 00133$
00132$:
;/tmp/_gbsbuild/src/states/Adventure.c:56: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
	jr	00134$
00133$:
;/tmp/_gbsbuild/src/states/Adventure.c:57: } else if ((INPUT_UP || INPUT_DOWN) && !INPUT_LEFT && !INPUT_RIGHT) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00122$
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00125$
00122$:
	ldhl	sp,	#12
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00128$
00125$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00124$
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	NZ, 00134$
00124$:
	ld	a, d
	or	a, e
	jr	Z, 00134$
00128$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00127$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00131$
00127$:
	ld	a, b
	or	a, c
	jr	NZ, 00134$
00131$:
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00130$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00119$
00130$:
	ldhl	sp,	#10
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00134$
00119$:
;/tmp/_gbsbuild/src/states/Adventure.c:58: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
00134$:
;/tmp/_gbsbuild/src/states/Adventure.c:61: backup_dir.x = player.dir.x;
	ldhl	sp,	#2
	ld	c, l
	ld	b, h
	ld	a, (#(_actors + 0x0005) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/states/Adventure.c:62: backup_dir.y = player.dir.y;
	ldhl	sp,	#2
	ld	a, l
	ld	d, h
	ldhl	sp,	#4
	ld	(hl+), a
;c
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	hl, #(_actors + 0x0006)
	ld	c, (hl)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;/tmp/_gbsbuild/src/states/Adventure.c:64: tile_x = (player.pos.x + 4 + player.dir.x) >> 3;  // Add Left right Bias for Moving=True
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (#(_actors + 0x0005) + 0)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	bc
	ldhl	sp,	#1
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;/tmp/_gbsbuild/src/states/Adventure.c:65: tile_y = (player.pos.y + 7) >> 3;
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/states/Adventure.c:67: if (INPUT_A_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00152$
	ld	hl, #_input_override_default
	bit	4, (hl)
	jr	NZ, 00149$
00152$:
	ld	a, (#_joy)
	bit	4, a
	jr	Z, 00149$
	ld	a, (#_last_joy)
	bit	4, a
	jr	NZ, 00149$
;/tmp/_gbsbuild/src/states/Adventure.c:68: hit_actor = ActorInFrontOfPlayer(8, TRUE);
	push	bc
	ld	de, #0x0108
	push	de
	call	_ActorInFrontOfPlayer
	add	sp, #2
	ld	a, e
	pop	bc
;/tmp/_gbsbuild/src/states/Adventure.c:69: if (hit_actor != NO_ACTOR_COLLISON) {
	cp	a, #0xff
	jr	Z, 00149$
;/tmp/_gbsbuild/src/states/Adventure.c:70: ScriptStart(&actors[hit_actor].events_ptr);
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
00149$:
;/tmp/_gbsbuild/src/states/Adventure.c:75: if (player.dir.x < 0) {
	ld	a, (#(_actors + 0x0005) + 0)
	ldhl	sp,	#9
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:76: if (TileAt(tile_x, tile_y)) {
	ldhl	sp,	#10
	ld	(hl), c
;/tmp/_gbsbuild/src/states/Adventure.c:77: player.pos.x = (tile_x << 3) + 4;
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, #0x03
00425$:
	ldhl	sp,	#11
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00425$
;/tmp/_gbsbuild/src/states/Adventure.c:75: if (player.dir.x < 0) {
	ldhl	sp,	#9
	bit	7, (hl)
	jr	Z, 00159$
;/tmp/_gbsbuild/src/states/Adventure.c:76: if (TileAt(tile_x, tile_y)) {
	ldhl	sp,	#0
	ld	c, (hl)
	push	bc
	ldhl	sp,	#12
	ld	b, (hl)
	push	bc
	call	_TileAt
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00156$
;/tmp/_gbsbuild/src/states/Adventure.c:77: player.pos.x = (tile_x << 3) + 4;
;c
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_actors
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Adventure.c:78: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
	jr	00159$
00156$:
;/tmp/_gbsbuild/src/states/Adventure.c:79: } else if (TileAt(tile_x, (player.pos.y) >> 3)) {
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	b, a
	ld	l, (hl)
	sra	l
	rr	b
	sra	l
	rr	b
	sra	l
	rr	b
	push	bc
	call	_TileAt
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00159$
;/tmp/_gbsbuild/src/states/Adventure.c:80: player.dir.y = 1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x01
00159$:
;/tmp/_gbsbuild/src/states/Adventure.c:85: if (player.dir.x > 0) {
	ld	hl, #(_actors + 0x0005)
	ld	c, (hl)
	ld	e, c
	ld	d, #0x00
	xor	a, a
	sub	a, c
	bit	7, e
	jr	Z, 00426$
	bit	7, d
	jr	NZ, 00427$
	cp	a, a
	jr	00427$
00426$:
	bit	7, d
	jr	Z, 00427$
	scf
00427$:
	jr	NC, 00166$
;/tmp/_gbsbuild/src/states/Adventure.c:86: if (TileAt(tile_x + 1, tile_y)) {
	ldhl	sp,	#0
	ld	b, (hl)
	inc	b
	push	bc
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00163$
;/tmp/_gbsbuild/src/states/Adventure.c:87: player.pos.x = (tile_x << 3) - 5;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	a, e
	ld	hl, #_actors
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Adventure.c:88: player.dir.x = 0;
	ld	hl, #(_actors + 0x0005)
	ld	(hl), #0x00
	jr	00166$
00163$:
;/tmp/_gbsbuild/src/states/Adventure.c:89: } else if (TileAt(tile_x + 1, (player.pos.y) >> 3)) {
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
	ld	a, l
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00166$
;/tmp/_gbsbuild/src/states/Adventure.c:90: player.dir.y = 1;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x01
00166$:
;/tmp/_gbsbuild/src/states/Adventure.c:94: tile_x = (player.pos.x + 4 - player.dir.x) >> 3;  // Remove LeftRight Bias to not stick
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (#(_actors + 0x0005) + 0)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/states/Adventure.c:95: tile_y = (player.pos.y + player.dir.y) >> 3;
	ld	de, #(_actors + 0x0002)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:62: backup_dir.y = player.dir.y;
	ld	a, (#(_actors + 0x0006) + 0)
	ldhl	sp,	#8
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:95: tile_y = (player.pos.y + player.dir.y) >> 3;
	ldhl	sp,	#8
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;c
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;/tmp/_gbsbuild/src/states/Adventure.c:76: if (TileAt(tile_x, tile_y)) {
	inc	hl
	inc	hl
;/tmp/_gbsbuild/src/states/Adventure.c:86: if (TileAt(tile_x + 1, tile_y)) {
	ld	a,c
	ld	(hl),a
;/tmp/_gbsbuild/src/states/Adventure.c:100: (TileAt(tile_x + 1, tile_y))  // Right edge
	inc	a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/states/Adventure.c:98: if (player.dir.y < 0) {
	ldhl	sp,	#8
	bit	7, (hl)
	jr	Z, 00171$
;/tmp/_gbsbuild/src/states/Adventure.c:99: if (TileAt(tile_x, tile_y) ||     // Left Edge
	inc	hl
	ld	b, (hl)
	push	bc
	push	bc
	inc	sp
	inc	hl
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	NZ, 00167$
;/tmp/_gbsbuild/src/states/Adventure.c:100: (TileAt(tile_x + 1, tile_y))  // Right edge
	push	bc
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00171$
00167$:
;/tmp/_gbsbuild/src/states/Adventure.c:102: player.pos.y = (tile_y + 1 << 3);
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #(_actors + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Adventure.c:103: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
00171$:
;/tmp/_gbsbuild/src/states/Adventure.c:108: if (player.dir.y > 0) {
	ld	hl, #(_actors + 0x0006)
	ld	c, (hl)
	ld	e, c
	ld	d, #0x00
	xor	a, a
	sub	a, c
	bit	7, e
	jr	Z, 00428$
	bit	7, d
	jr	NZ, 00429$
	cp	a, a
	jr	00429$
00428$:
	bit	7, d
	jr	Z, 00429$
	scf
00429$:
	jr	NC, 00176$
;/tmp/_gbsbuild/src/states/Adventure.c:109: if (TileAt(tile_x, tile_y + 1) ||     // Left Edge
	ldhl	sp,	#9
	ld	b, (hl)
	inc	b
	push	bc
	push	bc
	inc	sp
	inc	hl
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	pop	bc
	or	a, a
	jr	NZ, 00172$
;/tmp/_gbsbuild/src/states/Adventure.c:110: (TileAt(tile_x + 1, tile_y + 1))  // Right edge
	push	bc
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	call	_TileAt
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00176$
00172$:
;/tmp/_gbsbuild/src/states/Adventure.c:112: player.pos.y = (tile_y << 3);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #(_actors + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/states/Adventure.c:113: player.dir.y = 0;
	ld	hl, #(_actors + 0x0006)
	ld	(hl), #0x00
00176$:
;/tmp/_gbsbuild/src/states/Adventure.c:117: if (player.moving) {
	ld	a, (#(_actors + 0x0007) + 0)
	or	a, a
	jr	Z, 00180$
;/tmp/_gbsbuild/src/states/Adventure.c:64: tile_x = (player.pos.x + 4 + player.dir.x) >> 3;  // Add Left right Bias for Moving=True
	ld	hl, #(_actors + 0x0005)
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/Adventure.c:118: if (!(player.dir.x > 0 | player.dir.x<0 | player.dir.y> 0 | player.dir.y < 0)) {
	ld	e, b
	ld	d, #0x00
	xor	a, a
	sub	a, b
	bit	7, e
	jr	Z, 00431$
	bit	7, d
	jr	NZ, 00432$
	cp	a, a
	jr	00432$
00431$:
	bit	7, d
	jr	Z, 00432$
	scf
00432$:
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, b
	rlca
	and	a,#0x01
	or	a, c
	ld	c, a
;/tmp/_gbsbuild/src/states/Adventure.c:62: backup_dir.y = player.dir.y;
	ld	hl, #(_actors + 0x0006)
	ld	b, (hl)
;/tmp/_gbsbuild/src/states/Adventure.c:118: if (!(player.dir.x > 0 | player.dir.x<0 | player.dir.y> 0 | player.dir.y < 0)) {
	ld	e, b
	ld	d, #0x00
	xor	a, a
	sub	a, b
	bit	7, e
	jr	Z, 00433$
	bit	7, d
	jr	NZ, 00434$
	cp	a, a
	jr	00434$
00433$:
	bit	7, d
	jr	Z, 00434$
	scf
00434$:
	ld	a, #0x00
	rla
	or	a, c
	ld	c, a
	ld	a, b
	rlca
	and	a,#0x01
	or	a, c
	or	a, a
	jr	NZ, 00180$
;/tmp/_gbsbuild/src/states/Adventure.c:119: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Adventure.c:120: player.dir.x = backup_dir.x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(#(_actors + 0x0005)),a
;/tmp/_gbsbuild/src/states/Adventure.c:121: player.dir.y = backup_dir.y;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(#(_actors + 0x0006)),a
00180$:
;/tmp/_gbsbuild/src/states/Adventure.c:125: tile_x = (player.pos.x + 4) >> 3;
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/states/Adventure.c:126: tile_y = (player.pos.y) >> 3;
	ld	hl, #(_actors + 0x0002)
	ld	a, (hl+)
	ld	l, (hl)
	ld	h, a
	sra	l
	rr	h
	sra	l
	rr	h
	sra	l
	rr	h
;/tmp/_gbsbuild/src/states/Adventure.c:129: if (ActivateTriggerAt(tile_x, tile_y, FALSE)) {
	xor	a, a
	push	af
	inc	sp
	ld	l, c
	push	hl
	call	_ActivateTriggerAt
	add	sp, #3
	ld	a, e
	or	a, a
;/tmp/_gbsbuild/src/states/Adventure.c:131: return;
	jp	NZ,00200$
;/tmp/_gbsbuild/src/states/Adventure.c:135: hit_actor = ActorOverlapsPlayer(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_ActorOverlapsPlayer
	inc	sp
	ld	c, e
;/tmp/_gbsbuild/src/states/Adventure.c:136: if (hit_actor && hit_actor != NO_ACTOR_COLLISON) {
	ld	a, c
	or	a, a
	jr	Z, 00191$
	ld	a, c
	inc	a
	jr	Z, 00191$
;/tmp/_gbsbuild/src/states/Adventure.c:137: if (hit_actor == ActorInFrontOfPlayer(8, FALSE)) {
	push	bc
	xor	a, a
	ld	d,a
	ld	e,#0x08
	push	de
	call	_ActorInFrontOfPlayer
	add	sp, #2
	ld	a, e
	pop	bc
	sub	a, c
	jr	NZ, 00184$
;/tmp/_gbsbuild/src/states/Adventure.c:138: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
00184$:
;/tmp/_gbsbuild/src/states/Adventure.c:140: if (player_iframes == 0) {
	ld	a, (#_player_iframes)
;/tmp/_gbsbuild/src/states/Adventure.c:141: if (actors[hit_actor].collision_group) {
	or	a,a
	jr	NZ, 00191$
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
	jr	Z, 00186$
;/tmp/_gbsbuild/src/states/Adventure.c:142: player.hit_actor = 0;
	ld	hl, #_actors + 26
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/states/Adventure.c:143: player.hit_actor = hit_actor;
	ld	(hl), c
	jr	00191$
00186$:
;/tmp/_gbsbuild/src/states/Adventure.c:145: player_iframes = 10;
	ld	hl, #_player_iframes
	ld	(hl), #0x0a
00191$:
;/tmp/_gbsbuild/src/states/Adventure.c:151: if (player.moving) {
	ld	a, (#(_actors + 0x0007) + 0)
	or	a, a
	jp	Z, 00200$
;/tmp/_gbsbuild/src/states/Adventure.c:153: if (player.move_speed == 0) {
	ld	hl, #(_actors + 0x0004)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00196$
;/tmp/_gbsbuild/src/states/Adventure.c:155: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	rrca
	jp	C,00200$
;/tmp/_gbsbuild/src/states/Adventure.c:156: player.pos.x += (WORD)player.dir.x;
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
;/tmp/_gbsbuild/src/states/Adventure.c:157: player.pos.y += (WORD)player.dir.y;
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
	jr	00200$
00196$:
;/tmp/_gbsbuild/src/states/Adventure.c:160: player.pos.x += (WORD)(player.dir.x * player.move_speed);
	ld	de, #_actors
	ld	a, (de)
	ldhl	sp,	#11
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
	ldhl	sp,	#11
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
;/tmp/_gbsbuild/src/states/Adventure.c:161: player.pos.y += (WORD)(player.dir.y * player.move_speed);
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
00200$:
;/tmp/_gbsbuild/src/states/Adventure.c:164: }
	add	sp, #13
	ret
	.area _CODE_5
	.area _CABS (ABS)
