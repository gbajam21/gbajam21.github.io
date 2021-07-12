;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Trigger
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_TriggerAtTile_b
	.globl _TriggerAtTile_b
	.globl _ScriptStart
	.globl _last_trigger_ty
	.globl _last_trigger_tx
	.globl _triggers_len
	.globl _triggers_active_size
	.globl _triggers_active
	.globl _triggers
	.globl _TriggerAtTile
	.globl _TriggerRunScript
	.globl _ActivateTriggerAt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_triggers::
	.ds 217
_triggers_active::
	.ds 11
_triggers_active_size::
	.ds 1
_triggers_len::
	.ds 1
_last_trigger_tx::
	.ds 1
_last_trigger_ty::
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/tmp/_gbsbuild/src/core/Trigger.c:16: UBYTE TriggerAtTile(UBYTE tx_a, UBYTE ty_a) {
;	---------------------------------
; Function TriggerAtTile
; ---------------------------------
_TriggerAtTile::
;/tmp/_gbsbuild/src/core/Trigger.c:17: return TriggerAtTile_b(tx_a, ty_a);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_TriggerAtTile_b
	ld	hl, #_TriggerAtTile_b
	call	___sdcc_bcall_ehl
	add	sp, #2
;/tmp/_gbsbuild/src/core/Trigger.c:18: }
	ret
;/tmp/_gbsbuild/src/core/Trigger.c:20: void TriggerRunScript(UBYTE i) {
;	---------------------------------
; Function TriggerRunScript
; ---------------------------------
_TriggerRunScript::
;/tmp/_gbsbuild/src/core/Trigger.c:21: ScriptStart(&triggers[i].events_ptr);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_triggers
	add	hl,bc
	ld	bc, #0x0004
	add	hl, bc
	push	hl
	call	_ScriptStart
	add	sp, #2
;/tmp/_gbsbuild/src/core/Trigger.c:22: }
	ret
;/tmp/_gbsbuild/src/core/Trigger.c:24: UBYTE ActivateTriggerAt(UBYTE tx, UBYTE ty, UBYTE force) {
;	---------------------------------
; Function ActivateTriggerAt
; ---------------------------------
_ActivateTriggerAt::
;/tmp/_gbsbuild/src/core/Trigger.c:28: if (!force && ((tx == last_trigger_tx) && (ty == last_trigger_ty))) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	hl, #_last_trigger_tx
	sub	a, (hl)
	jr	NZ, 00102$
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_last_trigger_ty
;/tmp/_gbsbuild/src/core/Trigger.c:29: return FALSE;
	sub	a,(hl)
	jr	NZ, 00102$
	ld	e,a
	ret
00102$:
;/tmp/_gbsbuild/src/core/Trigger.c:32: hit_trigger = TriggerAtTile(tx, ty);
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_TriggerAtTile
	add	sp, #2
;/tmp/_gbsbuild/src/core/Trigger.c:33: last_trigger_tx = tx;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_last_trigger_tx),a
;/tmp/_gbsbuild/src/core/Trigger.c:34: last_trigger_ty = ty;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_last_trigger_ty),a
;/tmp/_gbsbuild/src/core/Trigger.c:36: if (hit_trigger != NO_TRIGGER_COLLISON) {
	ld	a, e
	inc	a
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/Trigger.c:37: TriggerRunScript(hit_trigger);
	ld	a, e
	push	af
	inc	sp
	call	_TriggerRunScript
	inc	sp
;/tmp/_gbsbuild/src/core/Trigger.c:38: return TRUE;
	ld	e, #0x01
	ret
00106$:
;/tmp/_gbsbuild/src/core/Trigger.c:41: return FALSE;
	ld	e, #0x00
;/tmp/_gbsbuild/src/core/Trigger.c:42: }
	ret
	.area _CODE
	.area _CABS (ABS)
