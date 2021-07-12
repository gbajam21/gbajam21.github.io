;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module ScriptRunner
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_ScriptTimerUpdate_b
	.globl _ScriptTimerUpdate_b
	.globl _memcpy
	.globl _PopBank
	.globl _PushBank
	.globl _StackPop
	.globl _StackPush
	.globl b_Script_StackPop_b
	.globl _Script_StackPop_b
	.globl _ctx_cmd_remaining
	.globl _timer_script_ptr
	.globl _timer_script_time
	.globl _timer_script_duration
	.globl _script_ctx_ptr
	.globl _active_script_ctx_index
	.globl _script_ctxs
	.globl _script_start_stack
	.globl _script_bank_stack
	.globl _script_stack
	.globl _script_stack_ptr
	.globl _script_cmd_args_len
	.globl _script_cmd_args
	.globl _script_main_ctx_actor
	.globl _active_script_ctx
	.globl _script_ctx_pool
	.globl _ScriptRunnerInit
	.globl _ScriptStart
	.globl _ScriptStartBg
	.globl _ScriptRunnerUpdate
	.globl _ScriptTimerUpdate
	.globl _ScriptSaveCtx
	.globl _ScriptRestoreCtx
	.globl _ScriptCtxPoolNext
	.globl _ScriptCtxPoolReturn
	.globl _ScriptCtxPoolReset
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_script_ctx_pool::
	.ds 12
_active_script_ctx::
	.ds 24
_script_main_ctx_actor::
	.ds 1
_script_cmd_args::
	.ds 7
_script_cmd_args_len::
	.ds 1
_script_stack_ptr::
	.ds 1
_script_stack::
	.ds 16
_script_bank_stack::
	.ds 8
_script_start_stack::
	.ds 16
_script_ctxs::
	.ds 288
_active_script_ctx_index::
	.ds 1
_script_ctx_ptr::
	.ds 2
_timer_script_duration::
	.ds 1
_timer_script_time::
	.ds 1
_timer_script_ptr::
	.ds 3
_ctx_cmd_remaining::
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
;/tmp/_gbsbuild/src/core/ScriptRunner.c:14: DECLARE_STACK(script_ctx_pool, MAX_BG_SCRIPT_CONTEXTS);
	ld	hl, #_script_ctx_pool
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:19: UBYTE script_stack_ptr = 0;
	ld	hl, #_script_stack_ptr
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:24: UBYTE active_script_ctx_index = 0;
	ld	hl, #_active_script_ctx_index
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:26: UBYTE timer_script_duration = 0;
	ld	hl, #_timer_script_duration
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:27: UBYTE timer_script_time = 0;
	ld	hl, #_timer_script_time
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:28: BankPtr timer_script_ptr = {0, 0};
	ld	hl, #_timer_script_ptr
	ld	(hl), #0x00
	ld	hl, #(_timer_script_ptr + 0x0001)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:29: UBYTE ctx_cmd_remaining = 5;
	ld	hl, #_ctx_cmd_remaining
	ld	(hl), #0x05
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/tmp/_gbsbuild/src/core/ScriptRunner.c:33: void ScriptRunnerInit() {
;	---------------------------------
; Function ScriptRunnerInit
; ---------------------------------
_ScriptRunnerInit::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:34: ScriptCtxPoolReset();
;/tmp/_gbsbuild/src/core/ScriptRunner.c:35: }
	jp  _ScriptCtxPoolReset
;/tmp/_gbsbuild/src/core/ScriptRunner.c:37: void ScriptStart(BankPtr* events_ptr) {
;	---------------------------------
; Function ScriptStart
; ---------------------------------
_ScriptStart::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:39: player.moving = FALSE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:41: script_variables[TMP_VAR_1] = 0;
	ld	hl, #(_script_variables + 0x0064)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:42: script_variables[TMP_VAR_2] = 0;
	ld	hl, #(_script_variables + 0x0065)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:44: script_ctxs[0].script_ptr_bank = events_ptr->bank;
	ld	de, #_script_ctxs + 14
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:45: script_ctxs[0].script_ptr = (BankDataPtr(script_ctxs[0].script_ptr_bank)) + events_ptr->offset;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
	add	a, #0x40
	ld	b, a
	ld	hl, #(_script_ctxs + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner.c:46: script_ctxs[0].script_update_fn = FALSE;
	ld	hl, #(_script_ctxs + 0x0004)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:47: script_ctxs[0].script_start_ptr = script_ctxs[0].script_ptr;
	ld	hl, #(_script_ctxs + 0x0006)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner.c:48: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner.c:50: UBYTE ScriptStartBg(BankPtr* events_ptr, UBYTE owner) {
;	---------------------------------
; Function ScriptStartBg
; ---------------------------------
_ScriptStartBg::
	add	sp, #-5
;/tmp/_gbsbuild/src/core/ScriptRunner.c:54: new_ctx = ScriptCtxPoolNext();
	call	_ScriptCtxPoolNext
	ld	c, e
	ld	b, #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:68: ScriptRestoreCtx(new_ctx);
	ldhl	sp,	#0
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner.c:56: if (new_ctx != 0) {
	ld	a, b
	or	a, c
	jp	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:57: script_variables[TMP_VAR_1] = 0;
	ld	hl, #(_script_variables + 0x0064)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:58: script_variables[TMP_VAR_2] = 0;
	ld	hl, #(_script_variables + 0x0065)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:60: script_ctxs[new_ctx].owner = 0;  // @wtf
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_script_ctxs
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
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:61: script_ctxs[new_ctx].script_ptr_bank = events_ptr->bank;
;c
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:62: script_ctxs[new_ctx].script_ptr =
	push	de
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner.c:63: (BankDataPtr(script_ctxs[new_ctx].script_ptr_bank)) + events_ptr->offset;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl+)
	ld	l, (hl)
	ld	e, a
	ld	a, l
	add	a, #0x40
	ld	d, a
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:64: script_ctxs[new_ctx].script_update_fn = FALSE;
	push	de
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:65: script_ctxs[new_ctx].script_start_ptr = script_ctxs[new_ctx].script_ptr;
	push	de
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:66: script_ctxs[new_ctx].owner = owner;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:68: ScriptRestoreCtx(new_ctx);
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner.c:70: return new_ctx;
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00103$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:73: return new_ctx;
	ldhl	sp,	#0
	ld	e, (hl)
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:74: }
	add	sp, #5
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner.c:76: void ScriptRunnerUpdate() {
;	---------------------------------
; Function ScriptRunnerUpdate
; ---------------------------------
_ScriptRunnerUpdate::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/ScriptRunner.c:81: active_script_ctx.script_await_next_frame = FALSE;
	ld	hl, #(_active_script_ctx + 0x0010)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:83: if (active_script_ctx.script_update_fn) {
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	a, (hl+)
	or	a,(hl)
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:85: PUSH_BANK(SCRIPT_RUNNER_BANK);
	ld	a, #0x04
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner.c:87: update_complete = (*(active_script_ctx.script_update_fn))();
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	call	___sdcc_call_hl
	ld	a, e
;/tmp/_gbsbuild/src/core/ScriptRunner.c:89: if (update_complete) {
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:90: active_script_ctx.script_update_fn = FALSE;
	ld	hl, #(_active_script_ctx + 0x0004)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:92: POP_BANK;
	call	_PopBank
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:95: if (!active_script_ctx.script_ptr_bank || active_script_ctx.script_update_fn) {
	ld	hl, #(_active_script_ctx + 0x000e)
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner.c:97: active_script_ctx.script_ptr = 0;
;/tmp/_gbsbuild/src/core/ScriptRunner.c:95: if (!active_script_ctx.script_ptr_bank || active_script_ctx.script_update_fn) {
	ld	a, b
	or	a, a
	jr	Z, 00105$
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	a, (hl+)
	ld	c,a
	or	a,(hl)
	jr	Z, 00106$
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:96: ScriptSaveCtx();
	call	_ScriptSaveCtx
;/tmp/_gbsbuild/src/core/ScriptRunner.c:97: active_script_ctx.script_ptr = 0;
	ld	hl, #(_active_script_ctx + 0x0008)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:98: return;
	jp	00121$
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:101: PUSH_BANK(active_script_ctx.script_ptr_bank);
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner.c:102: script_cmd_index = *active_script_ctx.script_ptr;
	ld	de, #(_active_script_ctx + 0x0008)
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	dec	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:104: if (!script_cmd_index) {
	or	a, a
	jr	NZ, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:105: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/ScriptRunner.c:106: if (script_stack_ptr) {
	ld	a, (#_script_stack_ptr)
	or	a, a
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:108: Script_StackPop_b();
	ld	e, #b_Script_StackPop_b
	ld	hl, #_Script_StackPop_b
	call	___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/ScriptRunner.c:109: ScriptSaveCtx();
	call	_ScriptSaveCtx
;/tmp/_gbsbuild/src/core/ScriptRunner.c:110: active_script_ctx.script_ptr = 0;
	ld	hl, #(_active_script_ctx + 0x0008)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:111: return;
	jp	00121$
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:114: active_script_ctx.script_ptr_bank = 0;
	ld	hl, #(_active_script_ctx + 0x000e)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:115: active_script_ctx.script_ptr = 0;
	ld	hl, #(_active_script_ctx + 0x0008)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:116: active_script_ctx.script_actor = 0;
	ld	hl, #(_active_script_ctx + 0x0011)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:117: ScriptSaveCtx();
	call	_ScriptSaveCtx
;/tmp/_gbsbuild/src/core/ScriptRunner.c:118: if (active_script_ctx_index != 0) {
	ld	hl, #_active_script_ctx_index
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:119: ScriptCtxPoolReturn(active_script_ctx_index, script_ctxs[active_script_ctx_index].owner);
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_script_ctxs
	add	hl,bc
	ld	bc, #0x0012
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, (#_active_script_ctx_index)
	push	af
	inc	sp
	call	_ScriptCtxPoolReturn
	add	sp, #2
	jp	00121$
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:121: script_main_ctx_actor = 0;
	ld	hl, #_script_main_ctx_actor
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:123: return;
	jp	00121$
00114$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:127: memcpy(script_cmd_args, active_script_ctx.script_ptr + 1, 7);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	hl, #0x0007
	push	hl
	push	bc
	ld	hl, #_script_cmd_args
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/ScriptRunner.c:128: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/ScriptRunner.c:130: PUSH_BANK(SCRIPT_RUNNER_BANK);
	ld	a, #0x04
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner.c:131: initial_script_ptr = active_script_ctx.script_ptr;
	ld	de, #(_active_script_ctx + 0x0008)
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:132: script_cmd_args_len = script_cmds[script_cmd_index].args_len;
	ld	bc, #_script_cmds+0
	dec	hl
	dec	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	(#_script_cmd_args_len),a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:133: script_cmds[script_cmd_index].fn();
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	call	___sdcc_call_hl
;/tmp/_gbsbuild/src/core/ScriptRunner.c:134: if (initial_script_ptr == active_script_ctx.script_ptr) {
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00116$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00116$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:136: active_script_ctx.script_ptr += 1 + script_cmd_args_len;
	ld	hl, #_script_cmd_args_len
	ld	e, (hl)
	ld	d, #0x00
	inc	de
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00116$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:138: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/ScriptRunner.c:140: if (!active_script_ctx.script_await_next_frame && !active_script_ctx.script_update_fn && ctx_cmd_remaining != 0) {    
	ld	a, (#(_active_script_ctx + 0x0010) + 0)
	or	a, a
	jr	NZ, 00118$
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	a, (hl+)
	or	a,(hl)
	jr	NZ, 00118$
	ld	hl, #_ctx_cmd_remaining
	ld	a, (hl)
	or	a, a
	jr	Z, 00118$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:141: ctx_cmd_remaining--;
	dec	(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner.c:142: ScriptRunnerUpdate();
	call	_ScriptRunnerUpdate
;/tmp/_gbsbuild/src/core/ScriptRunner.c:143: return;
	jr	00121$
00118$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:146: ScriptSaveCtx();
	call	_ScriptSaveCtx
00121$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:147: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner.c:149: void ScriptTimerUpdate() {
;	---------------------------------
; Function ScriptTimerUpdate
; ---------------------------------
_ScriptTimerUpdate::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:150: ScriptTimerUpdate_b();
	ld	e, #b_ScriptTimerUpdate_b
	ld	hl, #_ScriptTimerUpdate_b
;/tmp/_gbsbuild/src/core/ScriptRunner.c:151: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/ScriptRunner.c:153: void ScriptSaveCtx() {
;	---------------------------------
; Function ScriptSaveCtx
; ---------------------------------
_ScriptSaveCtx::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:155: script_ctx_ptr = &script_ctxs[active_script_ctx_index];
	ld	hl, #_active_script_ctx_index
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_script_ctxs
	add	hl, bc
	ld	a, l
	ld	(_script_ctx_ptr), a
	ld	a, h
	ld	(_script_ctx_ptr + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:158: memcpy(script_ctx_ptr, &active_script_ctx, sizeof(ScriptContext)-3);
	ld	de, #_active_script_ctx+0
	ld	hl, #_script_ctx_ptr + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0015
	push	hl
	push	de
	push	bc
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/ScriptRunner.c:159: (*script_ctx_ptr).tmp_1 = script_variables[TMP_VAR_1];
	ld	hl, #_script_ctx_ptr
	ld	a, (hl+)
	ld	e, a
	ld	b, (hl)
	ld	a, e
	add	a, #0x15
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (#(_script_variables + 0x0064) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:160: (*script_ctx_ptr).tmp_2 = script_variables[TMP_VAR_2];
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0016
	add	hl, bc
	ld	bc, #_script_variables + 101
	ld	a, (bc)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:161: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner.c:163: void ScriptRestoreCtx(UBYTE i) {
;	---------------------------------
; Function ScriptRestoreCtx
; ---------------------------------
_ScriptRestoreCtx::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:164: if (!script_ctxs[i].script_ptr_bank || (i != 0 && script_ctxs[0].script_ptr_bank)) {
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_script_ctxs
	add	hl,bc
	ld	bc, #0x000e
	add	hl, bc
	ld	a, (hl)
	or	a, a
	ret	Z
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	ld	a, (#(_script_ctxs + 0x000e) + 0)
	or	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:165: return;
	ret	NZ
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:170: if (i == 0) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:171: ctx_cmd_remaining = 255;
	ld	hl, #_ctx_cmd_remaining
	ld	(hl), #0xff
	jr	00107$
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:173: ctx_cmd_remaining = 2;
	ld	hl, #_ctx_cmd_remaining
	ld	(hl), #0x02
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:176: active_script_ctx_index = i;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	hl, #_active_script_ctx_index
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner.c:179: memcpy(&active_script_ctx, &script_ctxs[i], sizeof(ScriptContext)-3);
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_script_ctxs)
	ld	e, a
	ld	a, h
	adc	a, #>(_script_ctxs)
	ld	d, a
	ld	c, e
	ld	b, d
	push	de
	ld	hl, #0x0015
	push	hl
	push	bc
	ld	hl, #_active_script_ctx
	push	hl
	call	_memcpy
	add	sp, #6
	pop	de
;/tmp/_gbsbuild/src/core/ScriptRunner.c:180: script_variables[TMP_VAR_1] = script_ctxs[i].tmp_1;
	ld	bc, #_script_variables + 100
	ld	hl, #0x0015
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:181: script_variables[TMP_VAR_2] = script_ctxs[i].tmp_2;
	ld	bc, #_script_variables + 101
	ld	hl, #0x0016
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner.c:183: ScriptRunnerUpdate();
;/tmp/_gbsbuild/src/core/ScriptRunner.c:184: }
	jp  _ScriptRunnerUpdate
;/tmp/_gbsbuild/src/core/ScriptRunner.c:186: UINT8 ScriptCtxPoolNext() {
;	---------------------------------
; Function ScriptCtxPoolNext
; ---------------------------------
_ScriptCtxPoolNext::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:188: if (StackSize(script_ctx_pool)) {
	ld	bc, #_script_ctx_pool+0
	ld	a, (bc)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:189: next = StackPop(script_ctx_pool);
	push	bc
	call	_StackPop
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner.c:190: return next;
	ret
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:192: return 0;
	ld	e, #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:193: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner.c:195: void ScriptCtxPoolReturn(UINT8 ctx, UBYTE owner) {
;	---------------------------------
; Function ScriptCtxPoolReturn
; ---------------------------------
_ScriptCtxPoolReturn::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:199: if (script_ctxs[ctx].owner == owner) {
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_script_ctxs
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0012
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, e
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner.c:200: script_ctxs[ctx].script_ptr_bank = 0;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:201: StackPush(script_ctx_pool, ctx);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #_script_ctx_pool
	push	hl
	call	_StackPush
	add	sp, #3
;/tmp/_gbsbuild/src/core/ScriptRunner.c:203: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner.c:205: void ScriptCtxPoolReset() {
;	---------------------------------
; Function ScriptCtxPoolReset
; ---------------------------------
_ScriptCtxPoolReset::
;/tmp/_gbsbuild/src/core/ScriptRunner.c:207: for (i = 1; i != MAX_BG_SCRIPT_CONTEXTS + 1; i++) {
	ld	c, #0x01
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner.c:208: script_ctx_pool[i] = i;
	ld	hl, #_script_ctx_pool
	ld	b, #0x00
	add	hl, bc
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner.c:209: script_ctxs[i].script_ptr_bank = 0;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_script_ctxs
	add	hl, de
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner.c:207: for (i = 1; i != MAX_BG_SCRIPT_CONTEXTS + 1; i++) {
	inc	c
	ld	a, c
	sub	a, #0x0c
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner.c:211: script_ctx_pool[0] = MAX_BG_SCRIPT_CONTEXTS;
	ld	hl, #_script_ctx_pool
	ld	(hl), #0x0b
;/tmp/_gbsbuild/src/core/ScriptRunner.c:212: }
	ret
	.area _CODE
	.area _CABS (ABS)
