;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module UI
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_UIShowMenu_b
	.globl _UIShowMenu_b
	.globl b_UIOnInteract_b
	.globl _UIOnInteract_b
	.globl b_UIShowText_b
	.globl _UIShowText_b
	.globl b_UISetColor_b
	.globl _UISetColor_b
	.globl b_UIDrawDialogueFrame_b
	.globl _UIDrawDialogueFrame_b
	.globl b_UIDrawFrame_b
	.globl _UIDrawFrame_b
	.globl b_UIReset_b
	.globl _UIReset_b
	.globl b_UIUpdate_b
	.globl _UIUpdate_b
	.globl b_UIInit_b
	.globl _UIInit_b
	.globl _PopBank
	.globl _PushBank
	.globl _ReadBankedBankPtr
	.globl _ReadBankedUBYTE
	.globl _SetBankedBkgData
	.globl _strcat
	.globl _memcpy
	.globl _strcpy
	.globl _set_win_tiles
	.globl _tmp_text_lines
	.globl _text_lines
	.globl _menu_layout
	.globl _menu_cancel_on_b
	.globl _menu_cancel_on_last_option
	.globl _menu_num_options
	.globl _menu_flag
	.globl _menu_index
	.globl _menu_enabled
	.globl _avatar_enabled
	.globl _text_num_lines
	.globl _tmp_text_out_speed
	.globl _tmp_text_in_speed
	.globl _text_ff_joypad
	.globl _text_draw_speed
	.globl _text_out_speed
	.globl _text_in_speed
	.globl _text_wait
	.globl _text_tile_count
	.globl _text_count
	.globl _text_drawn
	.globl _text_y
	.globl _text_x
	.globl _win_speed
	.globl _win_dest_pos_y
	.globl _win_dest_pos_x
	.globl _win_pos_y
	.globl _win_pos_x
	.globl _ui_block
	.globl _UIInit
	.globl _UIUpdate
	.globl _UIReset
	.globl _UIDrawFrame
	.globl _UIDrawDialogueFrame
	.globl _UIShowText
	.globl _UIShowAvatar
	.globl _UIShowChoice
	.globl _UIShowMenu
	.globl _UISetPos
	.globl _UIMoveTo
	.globl _UIIsClosed
	.globl _UIOnInteract
	.globl _UIAtDest
	.globl _UISetColor
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ui_block::
	.ds 1
_win_pos_x::
	.ds 1
_win_pos_y::
	.ds 1
_win_dest_pos_x::
	.ds 1
_win_dest_pos_y::
	.ds 1
_win_speed::
	.ds 1
_text_x::
	.ds 1
_text_y::
	.ds 1
_text_drawn::
	.ds 1
_text_count::
	.ds 1
_text_tile_count::
	.ds 1
_text_wait::
	.ds 1
_text_in_speed::
	.ds 1
_text_out_speed::
	.ds 1
_text_draw_speed::
	.ds 1
_text_ff_joypad::
	.ds 1
_tmp_text_in_speed::
	.ds 1
_tmp_text_out_speed::
	.ds 1
_text_num_lines::
	.ds 1
_avatar_enabled::
	.ds 1
_menu_enabled::
	.ds 1
_menu_index::
	.ds 1
_menu_flag::
	.ds 2
_menu_num_options::
	.ds 1
_menu_cancel_on_last_option::
	.ds 1
_menu_cancel_on_b::
	.ds 1
_menu_layout::
	.ds 1
_text_lines::
	.ds 80
_tmp_text_lines::
	.ds 80
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
;/tmp/_gbsbuild/src/core/UI.c:27: UBYTE ui_block = FALSE;
	ld	hl, #_ui_block
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:37: UBYTE text_count = 0;
	ld	hl, #_text_count
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:39: UBYTE text_wait = 0;
	ld	hl, #_text_wait
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:40: UBYTE text_in_speed = 1;
	ld	hl, #_text_in_speed
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:41: UBYTE text_out_speed = 1;
	ld	hl, #_text_out_speed
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:42: UBYTE text_draw_speed = 1;
	ld	hl, #_text_draw_speed
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:43: UBYTE text_ff_joypad = J_A | J_B;
	ld	hl, #_text_ff_joypad
	ld	(hl), #0x30
;/tmp/_gbsbuild/src/core/UI.c:44: UBYTE tmp_text_in_speed = 1;
	ld	hl, #_tmp_text_in_speed
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:45: UBYTE tmp_text_out_speed = 1;
	ld	hl, #_tmp_text_out_speed
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:46: UBYTE text_num_lines = 0;
	ld	hl, #_text_num_lines
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:48: UBYTE avatar_enabled = 0;
	ld	hl, #_avatar_enabled
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:49: UBYTE menu_enabled = FALSE;
	ld	hl, #_menu_enabled
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:50: BYTE menu_index = 0;
	ld	hl, #_menu_index
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:52: UBYTE menu_num_options = 2;
	ld	hl, #_menu_num_options
	ld	(hl), #0x02
;/tmp/_gbsbuild/src/core/UI.c:53: UBYTE menu_cancel_on_last_option = TRUE;
	ld	hl, #_menu_cancel_on_last_option
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:54: UBYTE menu_cancel_on_b = TRUE;
	ld	hl, #_menu_cancel_on_b
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:55: UBYTE menu_layout = FALSE;
	ld	hl, #_menu_layout
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:57: unsigned char text_lines[80] = "";
	ld	hl, #_text_lines
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_text_lines + 0x004f)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:58: unsigned char tmp_text_lines[80] = "";
	ld	hl, #_tmp_text_lines
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_tmp_text_lines + 0x004f)
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
;/tmp/_gbsbuild/src/core/UI.c:60: void UIInit() {
;	---------------------------------
; Function UIInit
; ---------------------------------
_UIInit::
;/tmp/_gbsbuild/src/core/UI.c:61: ui_block = FALSE;
	ld	hl, #_ui_block
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI.c:62: text_drawn = TRUE;
	ld	hl, #_text_drawn
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI.c:63: UIInit_b();
	ld	e, #b_UIInit_b
	ld	hl, #_UIInit_b
;/tmp/_gbsbuild/src/core/UI.c:64: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/UI.c:66: void UIUpdate() {
;	---------------------------------
; Function UIUpdate
; ---------------------------------
_UIUpdate::
;/tmp/_gbsbuild/src/core/UI.c:67: UIUpdate_b();
	ld	e, #b_UIUpdate_b
	ld	hl, #_UIUpdate_b
;/tmp/_gbsbuild/src/core/UI.c:68: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/UI.c:70: void UIReset() {
;	---------------------------------
; Function UIReset
; ---------------------------------
_UIReset::
;/tmp/_gbsbuild/src/core/UI.c:71: UIReset_b();
	ld	e, #b_UIReset_b
	ld	hl, #_UIReset_b
;/tmp/_gbsbuild/src/core/UI.c:72: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/UI.c:74: void UIDrawFrame(UBYTE x, UBYTE y, UBYTE width, UBYTE height) {
;	---------------------------------
; Function UIDrawFrame
; ---------------------------------
_UIDrawFrame::
;/tmp/_gbsbuild/src/core/UI.c:75: UIDrawFrame_b(x, y, width, height);
	ldhl	sp,	#5
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
	ld	e, #b_UIDrawFrame_b
	ld	hl, #_UIDrawFrame_b
	call	___sdcc_bcall_ehl
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI.c:76: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:78: void UIDrawDialogueFrame(UBYTE h) {
;	---------------------------------
; Function UIDrawDialogueFrame
; ---------------------------------
_UIDrawDialogueFrame::
;/tmp/_gbsbuild/src/core/UI.c:79: UIDrawDialogueFrame_b(h);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_UIDrawDialogueFrame_b
	ld	hl, #_UIDrawDialogueFrame_b
	call	___sdcc_bcall_ehl
	inc	sp
;/tmp/_gbsbuild/src/core/UI.c:80: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:82: void UIShowText(UBYTE bank, UWORD bank_offset) {
;	---------------------------------
; Function UIShowText
; ---------------------------------
_UIShowText::
;/tmp/_gbsbuild/src/core/UI.c:85: strcpy(tmp_text_lines, "");
	ld	hl, #___str_0
	push	hl
	ld	hl, #_tmp_text_lines
	push	hl
	call	_strcpy
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI.c:87: ptr = (BankDataPtr(bank)) + bank_offset;
;c
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x4000
	add	hl, de
;/tmp/_gbsbuild/src/core/UI.c:89: PUSH_BANK(bank);
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	ld	hl, #_tmp_text_lines
	push	hl
	call	_strcat
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI.c:91: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/UI.c:93: UIShowText_b();
	ld	e, #b_UIShowText_b
	ld	hl, #_UIShowText_b
;/tmp/_gbsbuild/src/core/UI.c:94: }
	jp  ___sdcc_bcall_ehl
___str_0:
	.db 0x00
;/tmp/_gbsbuild/src/core/UI.c:96: void UIShowAvatar(UBYTE avatar_index) {
;	---------------------------------
; Function UIShowAvatar
; ---------------------------------
_UIShowAvatar::
	add	sp, #-128
	add	sp, #-84
;/tmp/_gbsbuild/src/core/UI.c:104: ReadBankedBankPtr(DATA_PTRS_BANK, &avatar_bank_ptr, &avatar_bank_ptrs[avatar_index]);
	ld	hl, #214
	add	hl, sp
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_avatar_bank_ptrs
	add	hl,bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	push	hl
	push	de
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_ReadBankedBankPtr
	add	sp, #5
	pop	bc
;/tmp/_gbsbuild/src/core/UI.c:105: avatar_ptr = (BankDataPtr(avatar_bank_ptr.bank)) + avatar_bank_ptr.offset;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	l, (hl)
	ld	e, a
	ld	a, l
	add	a, #0x40
	ld	d, a
;/tmp/_gbsbuild/src/core/UI.c:106: avatar_len = MUL_4(ReadBankedUBYTE(avatar_bank_ptr.bank, avatar_ptr));
	ld	a, (bc)
	push	bc
	push	de
	push	de
	push	af
	inc	sp
	call	_ReadBankedUBYTE
	add	sp, #3
	ld	a, e
	pop	de
	pop	bc
	add	a, a
	add	a, a
	ld	hl, #207
	add	hl, sp
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI.c:108: PUSH_BANK(avatar_bank_ptr.bank);
	ld	a, (bc)
	push	de
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/UI.c:109: memcpy(tmp_avatar_ptr, avatar_ptr + 1, avatar_len * 16);
	ld	hl, #207
	add	hl, sp
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	inc	hl
	ld	(hl), c
	inc	hl
	ld	(hl), a
	inc	de
	ldhl	sp,	#7
	ld	c, l
	ld	b, h
	ld	hl, #210
	add	hl, sp
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	push	bc
	ld	hl, #210
	add	hl, sp
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	ld	hl, #216
	add	hl, sp
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_memcpy
	add	sp, #6
	call	_PopBank
	pop	bc
;/tmp/_gbsbuild/src/core/UI.c:111: SetBankedBkgData(TEXT_BUFFER_START, avatar_len, (unsigned char *)tmp_avatar_ptr, FONT_BANK);
	ld	a, #0x06
	push	af
	inc	sp
	push	bc
	ld	hl, #210
	add	hl, sp
	ld	d, (hl)
	ld	e,#0xcc
	push	de
	call	_SetBankedBkgData
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI.c:113: tile1 = TEXT_BUFFER_START;
	ldhl	sp,	#3
;/tmp/_gbsbuild/src/core/UI.c:114: tile2 = TEXT_BUFFER_START + 1U;
	ld	a, #0xcc
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/UI.c:115: tile3 = TEXT_BUFFER_START + 2U;
	ld	a, #0xcd
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/UI.c:116: tile4 = TEXT_BUFFER_START + 3U;
	ld	a, #0xce
	ld	(hl+), a
	ld	(hl), #0xcf
;/tmp/_gbsbuild/src/core/UI.c:118: set_win_tiles(1, 1, 1, 1, &tile1);
	ldhl	sp,	#3
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0101
	push	de
	call	_set_win_tiles
	add	sp, #6
;/tmp/_gbsbuild/src/core/UI.c:119: set_win_tiles(2, 1, 1, 1, &tile2);
	ldhl	sp,	#4
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0102
	push	de
	call	_set_win_tiles
	add	sp, #6
;/tmp/_gbsbuild/src/core/UI.c:120: set_win_tiles(1, 2, 1, 1, &tile3);
	ldhl	sp,	#5
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0201
	push	de
	call	_set_win_tiles
	add	sp, #6
;/tmp/_gbsbuild/src/core/UI.c:121: set_win_tiles(2, 2, 1, 1, &tile4);
	ldhl	sp,	#6
	push	hl
	ld	de, #0x0101
	push	de
	ld	de, #0x0202
	push	de
	call	_set_win_tiles
	add	sp, #6
;/tmp/_gbsbuild/src/core/UI.c:122: }
	add	sp, #127
	add	sp, #85
	ret
;/tmp/_gbsbuild/src/core/UI.c:124: void UIShowChoice(UWORD flag_index, UBYTE bank, UWORD bank_offset) {
;	---------------------------------
; Function UIShowChoice
; ---------------------------------
_UIShowChoice::
;/tmp/_gbsbuild/src/core/UI.c:125: UIShowMenu_b(flag_index, bank, bank_offset, 0,
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	e, #b_UIShowMenu_b
	ld	hl, #_UIShowMenu_b
	call	___sdcc_bcall_ehl
	add	sp, #7
;/tmp/_gbsbuild/src/core/UI.c:127: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:129: void UIShowMenu(UWORD flag_index,
;	---------------------------------
; Function UIShowMenu
; ---------------------------------
_UIShowMenu::
;/tmp/_gbsbuild/src/core/UI.c:134: UIShowMenu_b(flag_index, bank, bank_offset, layout, cancel_config);
	ldhl	sp,	#8
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
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	e, #b_UIShowMenu_b
	ld	hl, #_UIShowMenu_b
	call	___sdcc_bcall_ehl
	add	sp, #7
;/tmp/_gbsbuild/src/core/UI.c:135: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:137: void UISetPos(UBYTE x, UBYTE y) {
;	---------------------------------
; Function UISetPos
; ---------------------------------
_UISetPos::
;/tmp/_gbsbuild/src/core/UI.c:138: win_pos_x = x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_win_pos_x),a
;/tmp/_gbsbuild/src/core/UI.c:139: win_dest_pos_x = x;
	ld	(#_win_dest_pos_x),a
;/tmp/_gbsbuild/src/core/UI.c:140: win_pos_y = y;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_win_pos_y),a
;/tmp/_gbsbuild/src/core/UI.c:141: win_dest_pos_y = y;
	ld	(#_win_dest_pos_y),a
;/tmp/_gbsbuild/src/core/UI.c:142: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:144: void UIMoveTo(UBYTE x, UBYTE y, UBYTE speed) {
;	---------------------------------
; Function UIMoveTo
; ---------------------------------
_UIMoveTo::
;/tmp/_gbsbuild/src/core/UI.c:145: win_dest_pos_x = x;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	hl, #_win_dest_pos_x
	ld	(hl), c
;/tmp/_gbsbuild/src/core/UI.c:146: win_dest_pos_y = y;
	ldhl	sp,	#3
	ld	b, (hl)
	ld	hl, #_win_dest_pos_y
	ld	(hl), b
;/tmp/_gbsbuild/src/core/UI.c:147: if (speed == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/UI.c:148: win_pos_x = x;
	ld	hl, #_win_pos_x
	ld	(hl), c
;/tmp/_gbsbuild/src/core/UI.c:149: win_pos_y = y;
	ld	hl, #_win_pos_y
;/tmp/_gbsbuild/src/core/UI.c:150: if (y == MENU_CLOSED_Y) {
	ld	a,b
	ld	(hl),a
	sub	a, #0x90
	ret	NZ
;/tmp/_gbsbuild/src/core/UI.c:151: win_speed = 0xFF;
	ld	hl, #_win_speed
	ld	(hl), #0xff
	ret
00104$:
;/tmp/_gbsbuild/src/core/UI.c:154: win_speed = speed;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_win_speed),a
;/tmp/_gbsbuild/src/core/UI.c:156: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:158: UBYTE UIIsClosed() {
;	---------------------------------
; Function UIIsClosed
; ---------------------------------
_UIIsClosed::
;/tmp/_gbsbuild/src/core/UI.c:159: return win_pos_y == MENU_CLOSED_Y && win_dest_pos_y == MENU_CLOSED_Y;
	ld	a, (#_win_pos_y)
	sub	a, #0x90
	jr	NZ, 00103$
	ld	a, (#_win_dest_pos_y)
	sub	a, #0x90
	jr	Z, 00104$
00103$:
	ld	e, #0x00
	ret
00104$:
	ld	e, #0x01
;/tmp/_gbsbuild/src/core/UI.c:160: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:162: void UIOnInteract() {
;	---------------------------------
; Function UIOnInteract
; ---------------------------------
_UIOnInteract::
;/tmp/_gbsbuild/src/core/UI.c:163: UIOnInteract_b();
	ld	e, #b_UIOnInteract_b
	ld	hl, #_UIOnInteract_b
;/tmp/_gbsbuild/src/core/UI.c:164: }
	jp  ___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/UI.c:166: UBYTE UIAtDest() {
;	---------------------------------
; Function UIAtDest
; ---------------------------------
_UIAtDest::
;/tmp/_gbsbuild/src/core/UI.c:167: return win_pos_x == win_dest_pos_x && win_pos_y == win_dest_pos_y;
	ld	a, (#_win_pos_x)
	ld	hl, #_win_dest_pos_x
	sub	a, (hl)
	jr	NZ, 00103$
	ld	a, (#_win_pos_y)
	ld	hl, #_win_dest_pos_y
	sub	a, (hl)
	jr	Z, 00104$
00103$:
	ld	e, #0x00
	ret
00104$:
	ld	e, #0x01
;/tmp/_gbsbuild/src/core/UI.c:168: }
	ret
;/tmp/_gbsbuild/src/core/UI.c:170: void UISetColor(UBYTE color) {
;	---------------------------------
; Function UISetColor
; ---------------------------------
_UISetColor::
;/tmp/_gbsbuild/src/core/UI.c:171: UISetColor_b(color);
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	e, #b_UISetColor_b
	ld	hl, #_UISetColor_b
	call	___sdcc_bcall_ehl
	add	sp, #2
;/tmp/_gbsbuild/src/core/UI.c:172: }
	ret
	.area _CODE
	.area _CABS (ABS)
