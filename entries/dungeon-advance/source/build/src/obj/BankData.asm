;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module BankData
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _SetBankedBkgData
	.globl _SetBankedSpriteData
	.globl _ReadBankedUBYTE
	.globl _ReadBankedBankPtr
	.globl _MemcpyBanked
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
__save:
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
;/tmp/_gbsbuild/src/core/BankData.c:10: void SetBankedBkgData(UBYTE i, UBYTE l, unsigned char* ptr, UBYTE bank) __naked {
;	---------------------------------
; Function SetBankedBkgData
; ---------------------------------
_SetBankedBkgData::
;/tmp/_gbsbuild/src/core/BankData.c:30: __endasm;  
	ldh	a, (__current_bank)
	ld	(#__save),a
	ldhl	sp, #6
	ld	a, (hl)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	pop	bc
	call	_set_bkg_data
	ld	a, (#__save)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	ld	h, b
	ld	l, c
	jp	(hl)
;/tmp/_gbsbuild/src/core/BankData.c:31: }
;/tmp/_gbsbuild/src/core/BankData.c:33: void SetBankedSpriteData(UBYTE i, UBYTE l, unsigned char* ptr, UBYTE bank) __naked {
;	---------------------------------
; Function SetBankedSpriteData
; ---------------------------------
_SetBankedSpriteData::
;/tmp/_gbsbuild/src/core/BankData.c:53: __endasm;  
	ldh	a, (__current_bank)
	ld	(#__save),a
	ldhl	sp, #6
	ld	a, (hl)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	pop	bc
	call	_set_sprite_data
	ld	a, (#__save)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	ld	h, b
	ld	l, c
	jp	(hl)
;/tmp/_gbsbuild/src/core/BankData.c:54: }
;/tmp/_gbsbuild/src/core/BankData.c:56: UBYTE ReadBankedUBYTE(UBYTE bank, unsigned char* ptr) __naked {
;	---------------------------------
; Function ReadBankedUBYTE
; ---------------------------------
_ReadBankedUBYTE::
;/tmp/_gbsbuild/src/core/BankData.c:76: __endasm;  
	ldh	a, (__current_bank)
	ld	(#__save),a
	ldhl	sp, #2
	ld	a, (hl+)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	e, (hl)
	ld	a, (#__save)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	ret
;/tmp/_gbsbuild/src/core/BankData.c:77: }
;/tmp/_gbsbuild/src/core/BankData.c:79: void ReadBankedBankPtr(UBYTE bank, BankPtr* to, BankPtr* from) __naked {
;	---------------------------------
; Function ReadBankedBankPtr
; ---------------------------------
_ReadBankedBankPtr::
;/tmp/_gbsbuild/src/core/BankData.c:111: __endasm;  
	ldh	a, (__current_bank)
	ld	(#__save),a
	ldhl	sp, #2
	ld	a, (hl+)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	(de), a
	.rept	2
	inc	de
	ld	a, (hl+)
	ld	(de), a
	.endm
	ld	a, (#__save)
	ldh	(__current_bank),a
	ld	(#0x2000), a
	ret
;/tmp/_gbsbuild/src/core/BankData.c:112: }
;/tmp/_gbsbuild/src/core/BankData.c:114: void MemcpyBanked(UBYTE bank, void* to, void* from, size_t n) {
;	---------------------------------
; Function MemcpyBanked
; ---------------------------------
_MemcpyBanked::
;/tmp/_gbsbuild/src/core/BankData.c:115: _save = _current_bank;
	ldh	a, (__current_bank+0)
	ld	(#__save),a
;/tmp/_gbsbuild/src/core/BankData.c:116: SWITCH_ROM(bank);
	ldhl	sp,	#2
	ld	a, (hl)
	ldh	(__current_bank+0),a
	ld	de, #0x2000
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/BankData.c:117: memcpy(to, from, n);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/BankData.c:118: SWITCH_ROM(_save);
	ld	hl, #__save
	ld	a, (hl)
	ldh	(__current_bank+0),a
	ld	de, #0x2000
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/BankData.c:119: }
	ret
	.area _CODE
	.area _CABS (ABS)
