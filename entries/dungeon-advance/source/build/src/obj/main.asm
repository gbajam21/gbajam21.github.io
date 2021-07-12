;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _BGB_profiler_message
	.globl _core_start
	.globl _stateBanks
	.globl _updateFuncs
	.globl _startFuncs
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
___BGB_PROFILER_INIT:
	.ds 2
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
;/tmp/_gbstools/gbdk/include/gb/bgb_emu.h:42: static void * __BGB_PROFILER_INIT = &BGB_profiler_message;
	ld	hl, #___BGB_PROFILER_INIT
	ld	(hl), #<(_BGB_profiler_message)
	inc	hl
	ld	(hl), #>(_BGB_profiler_message)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/tmp/_gbsbuild/src/main.c:17: int main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;/tmp/_gbsbuild/src/main.c:18: core_start();
	call	_core_start
;/tmp/_gbsbuild/src/main.c:19: return 0;
	ld	de, #0x0000
;/tmp/_gbsbuild/src/main.c:20: }
	ret
_startFuncs:
	.dw #0x0000
	.dw _Start_TopDown
	.dw _Start_Platform
	.dw _Start_Adventure
	.dw _Start_Shmup
	.dw _Start_PointNClick
_updateFuncs:
	.dw #0x0000
	.dw _Update_TopDown
	.dw _Update_Platform
	.dw _Update_Adventure
	.dw _Update_Shmup
	.dw _Update_PointNClick
_stateBanks:
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.area _CODE
	.area _CABS (ABS)
