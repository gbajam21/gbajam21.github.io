;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Input
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ScriptStartBg
	.globl _input_override_default
	.globl _input_script_persist
	.globl _input_script_ptrs
	.globl _input_wait
	.globl _await_input
	.globl _recent_joy
	.globl _last_joy
	.globl _joy
	.globl _HandleInputScripts
	.globl _RemoveInputScripts
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_joy::
	.ds 1
_last_joy::
	.ds 1
_recent_joy::
	.ds 1
_await_input::
	.ds 1
_input_wait::
	.ds 1
_input_script_ptrs::
	.ds 24
_input_script_persist::
	.ds 1
_input_override_default::
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
;/tmp/_gbsbuild/src/core/Input.c:5: UBYTE joy = 0;
	ld	hl, #_joy
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Input.c:6: UBYTE last_joy = 0;
	ld	hl, #_last_joy
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Input.c:7: UBYTE recent_joy = 0;
	ld	hl, #_recent_joy
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Input.c:8: UBYTE await_input = 0;
	ld	hl, #_await_input
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Input.c:9: UBYTE input_wait = 0;
	ld	hl, #_input_wait
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Input.c:11: UBYTE input_script_persist = 0;
	ld	hl, #_input_script_persist
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Input.c:12: UBYTE input_override_default = 0;
	ld	hl, #_input_override_default
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
;/tmp/_gbsbuild/src/core/Input.c:14: void HandleInputScripts() {
;	---------------------------------
; Function HandleInputScripts
; ---------------------------------
_HandleInputScripts::
	dec	sp
;/tmp/_gbsbuild/src/core/Input.c:17: if (input_wait != 0) {
	ld	hl, #_input_wait
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/Input.c:18: input_wait--;
	dec	(hl)
;/tmp/_gbsbuild/src/core/Input.c:19: return;
	jr	00114$
00102$:
;/tmp/_gbsbuild/src/core/Input.c:22: if (!script_ctxs[0].script_ptr_bank && joy != 0 && joy != last_joy) {
	ld	a, (#(_script_ctxs + 0x000e) + 0)
	or	a, a
	jr	NZ, 00114$
	ld	hl, #_joy
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
	ld	a, (hl)
	ld	hl, #_last_joy
	sub	a, (hl)
	jr	Z, 00114$
;/tmp/_gbsbuild/src/core/Input.c:24: input_joy = joy;
	ld	a, (#_joy)
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/Input.c:25: for (input_index = 0; input_index != 8; ++input_index) {
	ld	b, #0x00
00112$:
;/tmp/_gbsbuild/src/core/Input.c:26: if (input_joy & 1) {
	bit	0, c
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/Input.c:27: if (input_script_ptrs[input_index].bank) {
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	ld	a, #<(_input_script_ptrs)
	add	a, l
	ld	e, a
	ld	a, #>(_input_script_ptrs)
	adc	a, h
	ld	d, a
	ld	a, (de)
	or	a, a
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/Input.c:28: last_joy = joy;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_last_joy),a
;/tmp/_gbsbuild/src/core/Input.c:29: input_wait = 10;
	ld	hl, #_input_wait
	ld	(hl), #0x0a
;/tmp/_gbsbuild/src/core/Input.c:30: ScriptStartBg(&input_script_ptrs[input_index], 255);
	ld	a, #0xff
	push	af
	inc	sp
	push	de
	call	_ScriptStartBg
	add	sp, #3
;/tmp/_gbsbuild/src/core/Input.c:31: return;
	jr	00114$
00106$:
;/tmp/_gbsbuild/src/core/Input.c:34: input_joy = input_joy >> 1;
	srl	c
;/tmp/_gbsbuild/src/core/Input.c:25: for (input_index = 0; input_index != 8; ++input_index) {
	inc	b
	ld	a, b
	sub	a, #0x08
	jr	NZ, 00112$
00114$:
;/tmp/_gbsbuild/src/core/Input.c:37: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/Input.c:39: void RemoveInputScripts() {
;	---------------------------------
; Function RemoveInputScripts
; ---------------------------------
_RemoveInputScripts::
;/tmp/_gbsbuild/src/core/Input.c:41: for (i = 0; i != 8; ++i) {
	ld	c, #0x00
00104$:
;/tmp/_gbsbuild/src/core/Input.c:42: if (!GET_BIT(input_script_persist, i)) {
	ld	a, c
	push	af
	ld	de, #0x0001
	pop	af
	inc	a
	jr	00120$
00119$:
	sla	e
	rl	d
00120$:
	dec	a
	jr	NZ,00119$
	ld	hl, #_input_script_persist
	ld	b, (hl)
	xor	a, a
	push	af
	ld	a, b
	and	a, e
	ld	b, a
	pop	af
	and	a, d
;/tmp/_gbsbuild/src/core/Input.c:43: input_script_ptrs[i].bank = 0;
	or	a,b
	jr	NZ, 00105$
	ld	b,a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	de, #_input_script_ptrs
	add	hl, de
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Input.c:44: UNSET_BIT(input_override_default, i);
	ld	b, c
	ld	a, #0x01
	inc	b
	jr	00122$
00121$:
	add	a, a
00122$:
	dec	b
	jr	NZ,00121$
	cpl
	ld	hl, #_input_override_default
	and	a, (hl)
	ld	(hl), a
00105$:
;/tmp/_gbsbuild/src/core/Input.c:41: for (i = 0; i != 8; ++i) {
	inc	c
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/Input.c:47: }
	ret
	.area _CODE
	.area _CABS (ABS)
