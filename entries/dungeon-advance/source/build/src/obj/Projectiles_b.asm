;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Projectiles_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_ProjectileLaunch_b
	.globl _ProjectileLaunch_b
	.globl b_WeaponAttack_b
	.globl _WeaponAttack_b
	.globl b_ProjectilesInit_b
	.globl _ProjectilesInit_b
	.globl _ScriptStartBg
	.globl _SpritePoolNext
	.globl _current_projectile
	.globl _projectiles
	.globl b_UpdateProjectiles_b
	.globl _UpdateProjectiles_b
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_projectiles::
	.ds 115
_current_projectile::
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
;/tmp/_gbsbuild/src/core/Projectiles_b.c:18: UBYTE current_projectile = 0;
	ld	hl, #_current_projectile
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
;/tmp/_gbsbuild/src/core/Projectiles_b.c:20: void ProjectilesInit_b() __banked {
;	---------------------------------
; Function ProjectilesInit_b
; ---------------------------------
	b_ProjectilesInit_b	= 1
_ProjectilesInit_b::
	dec	sp
;/tmp/_gbsbuild/src/core/Projectiles_b.c:22: for (i = 0; i != MAX_PROJECTILES; i++) {
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
00102$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:23: projectiles[i].sprite_index = SpritePoolNext();
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
	ld	a, l
	add	a, #<(_projectiles)
	ld	c, a
	ld	a, h
	adc	a, #>(_projectiles)
	ld	b, a
	ld	hl, #0x0012
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
;/tmp/_gbsbuild/src/core/Projectiles_b.c:24: projectiles[i].life_time = 0;
	ld	hl, #0x0014
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:22: for (i = 0; i != MAX_PROJECTILES; i++) {
	ldhl	sp,	#0
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:26: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/Projectiles_b.c:28: void WeaponAttack_b(UBYTE sprite, UBYTE palette, UBYTE actor, UBYTE offset, UBYTE col_group, UBYTE col_mask) __banked {
;	---------------------------------
; Function WeaponAttack_b
; ---------------------------------
	b_WeaponAttack_b	= 1
_WeaponAttack_b::
	add	sp, #-5
;/tmp/_gbsbuild/src/core/Projectiles_b.c:29: if (projectiles[current_projectile].life_time == 0) {
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0014
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	NZ, 00105$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:30: projectiles[current_projectile].moving = FALSE;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:31: projectiles[current_projectile].dir.x = actors[actor].dir.x;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0006
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#13
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
	ld	hl, #_actors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:32: projectiles[current_projectile].dir.y = actors[actor].dir.y;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:33: projectiles[current_projectile].pin_actor = actor;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0009
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:34: projectiles[current_projectile].pin_offset = offset;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000a
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:36: if (actors[projectiles[current_projectile].pin_actor].dir.y == 0) {
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0009
	add	hl, bc
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
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), a
;c
	ld	de, #_actors
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
;/tmp/_gbsbuild/src/core/Projectiles_b.c:38: actors[projectiles[current_projectile].pin_actor].pos.x +
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/tmp/_gbsbuild/src/core/Projectiles_b.c:36: if (actors[projectiles[current_projectile].pin_actor].dir.y == 0) {
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:39: (offset * actors[projectiles[current_projectile].pin_actor].dir.x);
	pop	de
	push	de
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	ldhl	sp,	#17
	ld	a, (hl)
	push	af
	inc	sp
	call	__mulsuchar
	add	sp, #2
	pop	bc
;c
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:40: projectiles[current_projectile].pos.y =
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
;/tmp/_gbsbuild/src/core/Projectiles_b.c:41: actors[projectiles[current_projectile].pin_actor].pos.y;
	ld	de, #0x0009
	add	hl, de
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
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00103$
00102$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:44: actors[projectiles[current_projectile].pin_actor].pos.x;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:45: projectiles[current_projectile].pos.y =
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
;/tmp/_gbsbuild/src/core/Projectiles_b.c:46: actors[projectiles[current_projectile].pin_actor].pos.y +
	ld	de, #0x0009
	add	hl, de
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
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;c
	ld	de, #_actors
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:47: (offset * actors[projectiles[current_projectile].pin_actor].dir.y);
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	push	bc
	push	af
	inc	sp
	ldhl	sp,	#17
	ld	a, (hl)
	push	af
	inc	sp
	call	__mulsuchar
	add	sp, #2
	pop	bc
;c
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
00103$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:50: projectiles[current_projectile].move_speed = 0;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0011
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:51: projectiles[current_projectile].life_time = 30;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0014
	add	hl, bc
	ld	(hl), #0x1e
;/tmp/_gbsbuild/src/core/Projectiles_b.c:52: projectiles[current_projectile].col_group = col_group;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0015
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#15
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:53: projectiles[current_projectile].col_mask = col_mask;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0016
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:54: projectiles[current_projectile].time = 1;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0013
	add	hl, bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Projectiles_b.c:55: projectiles[current_projectile].frame = 0;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000e
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:56: projectiles[current_projectile].palette_index = palette;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000c
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:57: projectiles[current_projectile].sprite = sprites_info[sprite].sprite_offset;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000b
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
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
	ld	hl, #_sprites_info
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
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:58: projectiles[current_projectile].sprite_type = sprites_info[sprite].sprite_type;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000d
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:59: projectiles[current_projectile].frames_len = sprites_info[sprite].frames_len;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000f
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl)
	ld	(bc), a
00105$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:62: current_projectile = (current_projectile + 1) % MAX_PROJECTILES;
	ld	hl, #_current_projectile
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	hl, #0x0005
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	hl, #_current_projectile
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Projectiles_b.c:63: }
	add	sp, #5
	ret
;/tmp/_gbsbuild/src/core/Projectiles_b.c:65: void ProjectileLaunch_b(UBYTE sprite,
;	---------------------------------
; Function ProjectileLaunch_b
; ---------------------------------
	b_ProjectileLaunch_b	= 1
_ProjectileLaunch_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/Projectiles_b.c:76: if (projectiles[current_projectile].life_time == 0) {
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0014
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	NZ, 00102$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:77: projectiles[current_projectile].pin_actor = NO_ACTOR_PINNED;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/Projectiles_b.c:78: projectiles[current_projectile].moving = moving;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0008
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#18
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:79: projectiles[current_projectile].pos.x = x;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:80: projectiles[current_projectile].pos.y = y;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:81: projectiles[current_projectile].dir.x = dir_x;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0006
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:82: projectiles[current_projectile].dir.y = dir_y;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0007
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#17
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:83: projectiles[current_projectile].move_speed = move_speed;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0011
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#19
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:84: projectiles[current_projectile].life_time = life_time;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0014
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#20
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:85: projectiles[current_projectile].col_group = col_group;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0015
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:86: projectiles[current_projectile].col_mask = col_mask;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0016
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#22
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:87: projectiles[current_projectile].sprite_type = SPRITE_ACTOR_ANIMATED;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000d
	add	hl, bc
	ld	(hl), #0x02
;/tmp/_gbsbuild/src/core/Projectiles_b.c:88: projectiles[current_projectile].time = 1;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0013
	add	hl, bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Projectiles_b.c:89: projectiles[current_projectile].frame = 0;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000e
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:90: projectiles[current_projectile].frames_len = 2;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000f
	add	hl, bc
	ld	(hl), #0x02
;/tmp/_gbsbuild/src/core/Projectiles_b.c:91: projectiles[current_projectile].palette_index = palette;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000c
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:92: projectiles[current_projectile].sprite = sprites_info[sprite].sprite_offset;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000b
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	inc	sp
	inc	sp
;c
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #_sprites_info
	add	hl, de
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
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:93: projectiles[current_projectile].sprite_type = sprites_info[sprite].sprite_type;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000d
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:94: projectiles[current_projectile].frames_len = sprites_info[sprite].frames_len;
	ld	hl, #_current_projectile
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
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000f
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl)
	ld	(bc), a
00102$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:97: current_projectile = (current_projectile + 1) % MAX_PROJECTILES;
	ld	hl, #_current_projectile
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	hl, #0x0005
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	hl, #_current_projectile
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Projectiles_b.c:98: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/Projectiles_b.c:100: void UpdateProjectiles_b() __banked {
;	---------------------------------
; Function UpdateProjectiles_b
; ---------------------------------
	b_UpdateProjectiles_b	= 1
_UpdateProjectiles_b::
	add	sp, #-20
;/tmp/_gbsbuild/src/core/Projectiles_b.c:105: for (i = 0; i != MAX_PROJECTILES; i++) {
	xor	a, a
	ldhl	sp,	#19
	ld	(hl), a
00192$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:107: if (projectiles[i].life_time != 0) {
	ldhl	sp,	#19
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
	ld	bc,#_projectiles
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;/tmp/_gbsbuild/src/core/Projectiles_b.c:164: projectiles[i].life_time = 1;
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
;/tmp/_gbsbuild/src/core/Projectiles_b.c:107: if (projectiles[i].life_time != 0) {
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:152: k = projectiles[i].sprite_index;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:107: if (projectiles[i].life_time != 0) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00175$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:109: hit = NO_ACTOR_COLLISON;
	ldhl	sp,	#12
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/Projectiles_b.c:110: for (j = 0; j != actors_active_size; j++) {
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0016
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#7
	ld	(hl), a
	xor	a, a
	ldhl	sp,	#18
	ld	(hl), a
00191$:
	ld	a, (#_actors_active_size)
	ldhl	sp,	#18
	sub	a, (hl)
	jp	Z,00112$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:111: UBYTE a = actors_active[j];
;c
	ld	de, #_actors_active
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#17
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:113: if (!actors[a].enabled || !actors[a].collisionsEnabled) {
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
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
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
	jp	Z, 00111$
;c
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0017
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jp	Z, 00111$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:117: if (!(actors[a].collision_group & projectiles[i].col_mask)) {
;c
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0018
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#7
	and	a,(hl)
	jp	Z, 00111$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:121: if ((projectiles[i].pos.x + 12 >= actors[a].pos.x) &&
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#8
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
	jr	Z, 00379$
	bit	7, d
	jr	NZ, 00380$
	cp	a, a
	jr	00380$
00379$:
	bit	7, d
	jr	Z, 00380$
	scf
00380$:
	jp	C, 00111$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:122: (projectiles[i].pos.x <= actors[a].pos.x + 12) &&
	ld	bc, #0x000c
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00381$
	bit	7, d
	jr	NZ, 00382$
	cp	a, a
	jr	00382$
00381$:
	bit	7, d
	jr	Z, 00382$
	scf
00382$:
	jr	C, 00111$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:123: (projectiles[i].pos.y + 8 >= actors[a].pos.y) &&
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;c
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
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
	jr	Z, 00383$
	bit	7, d
	jr	NZ, 00384$
	cp	a, a
	jr	00384$
00383$:
	bit	7, d
	jr	Z, 00384$
	scf
00384$:
	jr	C, 00111$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:124: (projectiles[i].pos.y <= actors[a].pos.y + 8)) {
	ld	bc, #0x0008
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00385$
	bit	7, d
	jr	NZ, 00386$
	cp	a, a
	jr	00386$
00385$:
	bit	7, d
	jr	Z, 00386$
	scf
00386$:
	jr	C, 00111$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:125: hit = a;
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
00111$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:110: for (j = 0; j != actors_active_size; j++) {
	ldhl	sp,	#18
	inc	(hl)
	jp	00191$
00112$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:161: if (projectiles[i].pin_actor == NO_ACTOR_PINNED) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:130: if (hit != NO_ACTOR_COLLISON) {
	ldhl	sp,	#12
	ld	a, (hl)
	inc	a
	jp	Z,00130$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:131: if (projectiles[i].pin_actor == NO_ACTOR_PINNED) {
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	a
	jr	NZ, 00114$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:132: projectiles[i].life_time = 0;
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00114$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:134: if (projectiles[i].col_group == 2) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0015
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:135: if (actors[hit].hit_1_ptr.bank) {
	inc	hl
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
;/tmp/_gbsbuild/src/core/Projectiles_b.c:134: if (projectiles[i].col_group == 2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00127$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:135: if (actors[hit].hit_1_ptr.bank) {
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x0024
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00130$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:136: projectiles[i].col_group = 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:137: ScriptStartBg(&actors[hit].hit_1_ptr, hit);
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_ScriptStartBg
	add	sp, #3
	jr	00130$
00127$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:139: } else if (projectiles[i].col_group == 4) {
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00124$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:140: if (actors[hit].hit_2_ptr.bank) {
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x0027
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00130$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:141: projectiles[i].col_group = 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:142: ScriptStartBg(&actors[hit].hit_2_ptr, hit);
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_ScriptStartBg
	add	sp, #3
	jr	00130$
00124$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:144: } else if (projectiles[i].col_group == 8) {
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00130$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:145: if (actors[hit].hit_3_ptr.bank) {
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x002a
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00130$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:146: projectiles[i].col_group = 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:147: ScriptStartBg(&actors[hit].hit_3_ptr, hit);
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_ScriptStartBg
	add	sp, #3
00130$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:152: k = projectiles[i].sprite_index;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:155: fo = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:156: flip = FALSE;
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:157: if ((projectiles[i].time & 0x3) == 0) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0013
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:158: projectiles[i].frame++;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
;/tmp/_gbsbuild/src/core/Projectiles_b.c:157: if ((projectiles[i].time & 0x3) == 0) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	and	a, #0x03
	jr	NZ, 00132$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:158: projectiles[i].frame++;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl), a
	ld	c, (hl)
	inc	c
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00132$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:160: if (projectiles[i].frame == projectiles[i].frames_len) {
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	sub	a, c
	jr	NZ, 00137$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:161: if (projectiles[i].pin_actor == NO_ACTOR_PINNED) {
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	a
	jr	NZ, 00134$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:162: projectiles[i].frame = 0;
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00137$
00134$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:164: projectiles[i].life_time = 1;
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Projectiles_b.c:165: projectiles[i].frame--;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	dec	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00137$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:169: if (projectiles[i].sprite_type != SPRITE_STATIC) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#13
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:171: if (IS_NEG(projectiles[i].dir.y)) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
;/tmp/_gbsbuild/src/core/Projectiles_b.c:178: if (IS_NEG(projectiles[i].dir.x)) {
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:169: if (projectiles[i].sprite_type != SPRITE_STATIC) {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:171: if (IS_NEG(projectiles[i].dir.y)) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ld	e, b
;/tmp/_gbsbuild/src/core/Projectiles_b.c:172: fo = 1 + (projectiles[i].sprite_type == SPRITE_ACTOR_ANIMATED);
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00403$
	xor	a, a
00403$:
	ld	c, a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:171: if (IS_NEG(projectiles[i].dir.y)) {
	bit	7, e
	jr	Z, 00142$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:172: fo = 1 + (projectiles[i].sprite_type == SPRITE_ACTOR_ANIMATED);
	ld	a, c
	inc	a
	ldhl	sp,	#7
	ld	(hl), a
	jr	00145$
00142$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:173: } else if (projectiles[i].dir.y == 0 && projectiles[i].dir.x != 0) {
	ld	a, b
	or	a, a
	jr	NZ, 00145$
	ldhl	sp,	#16
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:174: fo = 2 + MUL_2(projectiles[i].sprite_type == SPRITE_ACTOR_ANIMATED);
	ld	a, c
	add	a, a
	add	a, #0x02
	ldhl	sp,	#7
	ld	(hl), a
00145$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:178: if (IS_NEG(projectiles[i].dir.x)) {
	ldhl	sp,	#16
	ld	a, (hl)
	rlca
	jr	NC, 00147$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:179: flip = TRUE;
	ldhl	sp,	#8
	ld	(hl), #0x01
00147$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:181: frame = MUL_4(projectiles[i].sprite + projectiles[i].frame + fo);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, (hl)
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, c
	ldhl	sp,	#7
	add	a, (hl)
	add	a, a
	add	a, a
	ldhl	sp,	#18
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:186: set_sprite_prop(k, projectiles[i].palette_index | S_FLIPX);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:184: if (flip) {
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00149$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:186: set_sprite_prop(k, projectiles[i].palette_index | S_FLIPX);
	ld	a, b
	or	a, #0x20
	ldhl	sp,	#13
	ld	(hl), a
;/tmp/_gbstools/gbdk/include/gb/gb.h:1045: shadow_OAM[nb].prop=prop;
	ldhl	sp,	#6
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#16
	ld	(hl), c
	inc	hl
	ld	(hl), a
	push	de
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:187: set_sprite_prop(k + 1, projectiles[i].palette_index | S_FLIPX);
	ld	a, (de)
	ld	c, a
	set	5, c
	ldhl	sp,	#6
	ld	b, (hl)
	inc	b
	ld	e, b
;/tmp/_gbstools/gbdk/include/gb/gb.h:1045: shadow_OAM[nb].prop=prop;
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Projectiles_b.c:192: set_sprite_tile(k, frame + 2);
	ldhl	sp,	#18
	ld	c, (hl)
	inc	c
	inc	c
;/tmp/_gbstools/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:193: set_sprite_tile(k + 1, frame);
;/tmp/_gbstools/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#18
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:193: set_sprite_tile(k + 1, frame);
	jr	00150$
00149$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:196: set_sprite_prop(k, projectiles[i].palette_index);
	ldhl	sp,	#13
	ld	(hl), b
;/tmp/_gbstools/gbdk/include/gb/gb.h:1045: shadow_OAM[nb].prop=prop;
	ldhl	sp,	#6
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#16
	ld	(hl), c
	inc	hl
	ld	(hl), a
	push	de
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:197: set_sprite_prop(k + 1, projectiles[i].palette_index);
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#6
	ld	c, (hl)
	inc	c
	ld	e, c
;/tmp/_gbstools/gbdk/include/gb/gb.h:1045: shadow_OAM[nb].prop=prop;
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), b
;/tmp/_gbstools/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
;c
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#18
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:203: set_sprite_tile(k + 1, frame + 2);
	ld	b, (hl)
	inc	b
	inc	b
;/tmp/_gbstools/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Projectiles_b.c:203: set_sprite_tile(k + 1, frame + 2);
00150$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:207: screen_x = 8u + projectiles[i].pos.x - scroll_x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scroll_x + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ldhl	sp,	#7
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Projectiles_b.c:208: screen_y = 8u + projectiles[i].pos.y - scroll_y;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scroll_y + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ldhl	sp,	#12
	ld	a, c
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:210: move_sprite(k, screen_x, screen_y);
	ld	a, b
	ld	(hl-), a
	ld	b, (hl)
	ldhl	sp,	#7
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	c, a
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Projectiles_b.c:211: move_sprite(k + 1, screen_x + 8, screen_y);
	ldhl	sp,	#12
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	dec	hl
	ld	e, (hl)
	inc	e
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Projectiles_b.c:214: if (IS_FRAME_4) {
	ld	hl, #_game_time
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/Projectiles_b.c:164: projectiles[i].life_time = 1;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:214: if (IS_FRAME_4) {
	ld	a, c
	and	a, #0x03
	jr	NZ, 00156$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:215: if (((UINT16)(screen_x + 32u) >= SCREENWIDTH_PLUS_64) ||
;c
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0xe0
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00151$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:216: ((UINT16)(screen_y + 32u) >= SCREENHEIGHT_PLUS_64)) {
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, c
	sub	a, #0xd0
	ld	a, b
	sbc	a, #0x00
	jr	C, 00152$
00151$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:218: projectiles[i].life_time = 0;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #0x00
	jr	00156$
00152$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:220: projectiles[i].life_time--;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	dec	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00156$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:224: if (projectiles[i].pin_actor == NO_ACTOR_PINNED) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:171: if (IS_NEG(projectiles[i].dir.y)) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:224: if (projectiles[i].pin_actor == NO_ACTOR_PINNED) {
	ldhl	sp,	#16
	ld	a, (hl)
	inc	a
	jp	NZ,00172$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:226: if (projectiles[i].moving) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00173$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:227: if (projectiles[i].move_speed == 0) {
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0011
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00160$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:229: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	rrca
	jp	C,00173$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:230: projectiles[i].pos.x += projectiles[i].dir.x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Projectiles_b.c:231: projectiles[i].pos.y += projectiles[i].dir.y;
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00173$
00160$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:234: projectiles[i].pos.x += projectiles[i].dir.x * projectiles[i].move_speed;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	inc	hl
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
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Projectiles_b.c:235: projectiles[i].pos.y += projectiles[i].dir.y * projectiles[i].move_speed;
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#7
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	h, a
	pop	af
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
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jp	00173$
00172$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:240: if ((actors[projectiles[i].pin_actor].dir.x != projectiles[i].dir.x) ||
	ldhl	sp,	#16
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
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	NZ, 00167$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:241: (actors[projectiles[i].pin_actor].dir.y != projectiles[i].dir.y)) {
	ld	hl, #0x0006
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, (hl)
	jr	Z, 00168$
00167$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:242: projectiles[i].life_time = 0;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #0x00
	jp	00173$
00168$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:245: projectiles[i].pos.x = actors[projectiles[i].pin_actor].pos.x +
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/tmp/_gbsbuild/src/core/Projectiles_b.c:246: (projectiles[i].pin_offset * actors[projectiles[i].pin_actor].dir.x);
;c
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
;/tmp/_gbsbuild/src/core/Projectiles_b.c:244: if (actors[projectiles[i].pin_actor].dir.y == 0) {
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00165$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:246: (projectiles[i].pin_offset * actors[projectiles[i].pin_actor].dir.x);
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	__mulsuchar
	add	sp, #2
;c
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/Projectiles_b.c:247: projectiles[i].pos.y = actors[projectiles[i].pin_actor].pos.y;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
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
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_actors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
	jp	00173$
00165$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:249: projectiles[i].pos.x = actors[projectiles[i].pin_actor].pos.x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Projectiles_b.c:250: projectiles[i].pos.y = actors[projectiles[i].pin_actor].pos.y +
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
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
	ld	bc,#_actors
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/tmp/_gbsbuild/src/core/Projectiles_b.c:251: (projectiles[i].pin_offset * actors[projectiles[i].pin_actor].dir.y);
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl), a
;c
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#17
	ld	a, (hl)
	push	af
	inc	sp
	call	__mulsuchar
	add	sp, #2
	push	hl
	ldhl	sp,	#9
	ld	(hl), e
	ldhl	sp,	#10
	ld	(hl), d
	pop	hl
;c
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
00173$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:256: projectiles[i].time++;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	c
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00193$
00175$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:259: k = projectiles[i].sprite_index;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl), a
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00417$:
	ldhl	sp,	#14
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00417$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:261: move_sprite(k + 1, 0, 0);
	ldhl	sp,	#18
	inc	(hl)
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00418$:
	ldhl	sp,	#17
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00418$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	(hl+), a
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Projectiles_b.c:261: move_sprite(k + 1, 0, 0);
00193$:
;/tmp/_gbsbuild/src/core/Projectiles_b.c:105: for (i = 0; i != MAX_PROJECTILES; i++) {
	ldhl	sp,	#19
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jp	NZ,00192$
;/tmp/_gbsbuild/src/core/Projectiles_b.c:264: }
	add	sp, #20
	ret
	.area _CODE_1
	.area _CABS (ABS)
