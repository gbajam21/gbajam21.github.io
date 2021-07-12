;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Projectiles
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_UpdateProjectiles_b
	.globl _UpdateProjectiles_b
	.globl b_ProjectileLaunch_b
	.globl _ProjectileLaunch_b
	.globl b_WeaponAttack_b
	.globl _WeaponAttack_b
	.globl b_ProjectilesInit_b
	.globl _ProjectilesInit_b
	.globl _ProjectilesInit
	.globl _WeaponAttack
	.globl _ProjectileLaunch
	.globl _UpdateProjectiles
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
	.area _CODE
;/tmp/_gbsbuild/src/core/Projectiles.c:20: void ProjectilesInit() {
;	---------------------------------
; Function ProjectilesInit
; ---------------------------------
_ProjectilesInit::
;/tmp/_gbsbuild/src/core/Projectiles.c:21: ProjectilesInit_b();
	ld	e, #b_ProjectilesInit_b
	ld	hl, #_ProjectilesInit_b
;/tmp/_gbsbuild/src/core/Projectiles.c:22: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Projectiles.c:24: void WeaponAttack(UBYTE sprite, UBYTE palette, UBYTE actor, UBYTE offset, UBYTE col_group, UBYTE col_mask) {
;	---------------------------------
; Function WeaponAttack
; ---------------------------------
_WeaponAttack::
;/tmp/_gbsbuild/src/core/Projectiles.c:25: WeaponAttack_b(sprite, palette, actor, offset, col_group, col_mask);
	ldhl	sp,	#7
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
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_WeaponAttack_b
	ld	hl, #_WeaponAttack_b
	call	___sdcc_bcall_ehl
	add	sp, #6
;/tmp/_gbsbuild/src/core/Projectiles.c:26: }
	ret
;/tmp/_gbsbuild/src/core/Projectiles.c:28: void ProjectileLaunch(UBYTE sprite,
;	---------------------------------
; Function ProjectileLaunch
; ---------------------------------
_ProjectileLaunch::
;/tmp/_gbsbuild/src/core/Projectiles.c:39: ProjectileLaunch_b(sprite, palette, x, y, dir_x, dir_y, moving, move_speed, life_time, col_group,
	ldhl	sp,	#14
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
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_ProjectileLaunch_b
	ld	hl, #_ProjectileLaunch_b
	call	___sdcc_bcall_ehl
	add	sp, #13
;/tmp/_gbsbuild/src/core/Projectiles.c:41: }
	ret
;/tmp/_gbsbuild/src/core/Projectiles.c:43: void UpdateProjectiles() {
;	---------------------------------
; Function UpdateProjectiles
; ---------------------------------
_UpdateProjectiles::
;/tmp/_gbsbuild/src/core/Projectiles.c:44: UpdateProjectiles_b();
	ld	e, #b_UpdateProjectiles_b
	ld	hl, #_UpdateProjectiles_b
;/tmp/_gbsbuild/src/core/Projectiles.c:45: }
	jp  ___sdcc_bcall_ehl
	.area _CODE
	.area _CABS (ABS)
