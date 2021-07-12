;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Camera
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _camera_deadzone
	.globl _camera_settings
	.globl _camera_speed
	.globl _camera_offset
	.globl _camera_dest
	.globl _camera_pos
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_camera_pos::
	.ds 4
_camera_dest::
	.ds 4
_camera_offset::
	.ds 2
_camera_speed::
	.ds 1
_camera_settings::
	.ds 1
_camera_deadzone::
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
;/tmp/_gbsbuild/src/core/Camera.c:7: UBYTE camera_settings = CAMERA_LOCK_FLAG;
	ld	hl, #_camera_settings
	ld	(hl), #0x10
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _CABS (ABS)
