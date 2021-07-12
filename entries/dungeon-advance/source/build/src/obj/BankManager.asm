;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module BankManager
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _StackPop
	.globl _StackPush
	.globl _bank_stack
	.globl _PushBank
	.globl _PopBank
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_stack::
	.ds 11
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
;/tmp/_gbsbuild/src/core/BankManager.c:3: DECLARE_STACK(bank_stack, N_PUSH_BANKS);
	ld	hl, #_bank_stack
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
;/tmp/_gbsbuild/src/core/BankManager.c:5: void PushBank(UINT8 b) {
;	---------------------------------
; Function PushBank
; ---------------------------------
_PushBank::
;/tmp/_gbsbuild/src/core/BankManager.c:6: StackPush(bank_stack, _current_bank);
	ldh	a, (__current_bank+0)
	push	af
	inc	sp
	ld	hl, #_bank_stack
	push	hl
	call	_StackPush
	add	sp, #3
;/tmp/_gbsbuild/src/core/BankManager.c:7: SWITCH_ROM(b);
	ldhl	sp,	#2
	ld	a, (hl)
	ldh	(__current_bank+0),a
	ld	de, #0x2000
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/BankManager.c:8: }
	ret
;/tmp/_gbsbuild/src/core/BankManager.c:10: void PopBank() {
;	---------------------------------
; Function PopBank
; ---------------------------------
_PopBank::
;/tmp/_gbsbuild/src/core/BankManager.c:11: REFRESH_BANK;
	ld	bc, #_bank_stack+0
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ldh	(__current_bank+0),a
	ld	(#0x2000),a
;/tmp/_gbsbuild/src/core/BankManager.c:12: StackPop(bank_stack);
	push	bc
	call	_StackPop
	add	sp, #2
;/tmp/_gbsbuild/src/core/BankManager.c:13: }
	ret
	.area _CODE
	.area _CABS (ABS)
