;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module UI_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_UIShowMenu_b
	.globl _UIShowMenu_b
	.globl _UICloseDialogue_b
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
	.globl b_UIInit_b
	.globl _UIInit_b
	.globl _GetToken_b
	.globl _itoa
	.globl _strlen
	.globl _GetWinAddr
	.globl _SetTile
	.globl _SetBankedBkgData
	.globl _UIShowText
	.globl _UIDrawDialogueFrame
	.globl _UIDrawFrame
	.globl _UIMoveTo
	.globl _UISetPos
	.globl _fill_win_rect
	.globl _set_bkg_data
	.globl _current_text_speed
	.globl _text_draw_speeds
	.globl _ui_black
	.globl _ui_white
	.globl b_UIUpdate_b
	.globl _UIUpdate_b
	.globl _UIDrawTextBufferChar_b
	.globl b_UIOnInteract_b
	.globl _UIOnInteract_b
	.globl _UIDrawMenuCursor_b
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_current_text_speed::
	.ds 1
_UIShowText_b_src_65537_149:
	.ds 2
_UIShowText_b_dest_65537_149:
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;/tmp/_gbsbuild/src/core/UI_b.c:49: void UIInit_b() __banked {
;	---------------------------------
; Function UIInit_b
; ---------------------------------
	b_UIInit_b	= 1
_UIInit_b::
;/tmp/_gbsbuild/src/core/UI_b.c:53: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/UI_b.c:54: fill_win_rect(0, 0, 20, 18, ui_bkg_tile);
	ld	de, #0x0712
	push	de
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:55: VBK_REG = 0;
	ld	a, #0x00
	ldh	(_VBK_REG+0),a
;/tmp/_gbsbuild/src/core/UI_b.c:58: UISetPos(0, 144);
	ld	a, #0x90
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_UISetPos
	add	sp, #2
;/tmp/_gbsbuild/src/core/UI_b.c:62: SetBankedBkgData(192, 9, ptr, FRAME_BANK);
	ld	a, #0x06
	push	af
	inc	sp
	ld	hl, #0x4e00
	push	hl
	ld	de, #0x09c0
	push	de
	call	_SetBankedBkgData
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:64: set_bkg_data(ui_while_tile, 1, ui_white);
	ld	hl, #_ui_white
	push	hl
	ld	de, #0x01c9
	push	de
	call	_set_bkg_data
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI_b.c:65: set_bkg_data(ui_black_tile, 1, ui_black);
	ld	hl, #_ui_black
	push	hl
	ld	de, #0x01ca
	push	de
	call	_set_bkg_data
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI_b.c:68: SetBankedBkgData(0xCB, 1, ptr, CURSOR_BANK);
	ld	a, #0x06
	push	af
	inc	sp
	ld	hl, #0x4e90
	push	hl
	ld	de, #0x01cb
	push	de
	call	_SetBankedBkgData
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:69: }
	ret
_ui_white:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_ui_black:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
_text_draw_speeds:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
;/tmp/_gbsbuild/src/core/UI_b.c:71: void UIReset_b() __banked {
;	---------------------------------
; Function UIReset_b
; ---------------------------------
	b_UIReset_b	= 1
_UIReset_b::
;/tmp/_gbsbuild/src/core/UI_b.c:72: UISetPos(0, 144);
	ld	a, #0x90
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_UISetPos
	add	sp, #2
;/tmp/_gbsbuild/src/core/UI_b.c:73: }
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:75: void UIUpdate_b() __banked {
;	---------------------------------
; Function UIUpdate_b
; ---------------------------------
	b_UIUpdate_b	= 1
_UIUpdate_b::
;/tmp/_gbsbuild/src/core/UI_b.c:78: if (win_speed == 5 && ((game_time & 0x7) != 0)) {
	ld	hl, #_game_time
	ld	c, (hl)
	ld	a, (#_win_speed)
	sub	a, #0x05
	jr	NZ, 00112$
	ld	a, c
	and	a, #0x07
;/tmp/_gbsbuild/src/core/UI_b.c:79: return;
	ret	NZ
00112$:
;/tmp/_gbsbuild/src/core/UI_b.c:80: } else if (win_speed == 4 && ((game_time & 0x3) != 0)) {
	ld	a, (#_win_speed)
	sub	a, #0x04
	jr	NZ, 00108$
	ld	a, c
	and	a, #0x03
;/tmp/_gbsbuild/src/core/UI_b.c:81: return;
	ret	NZ
00108$:
;/tmp/_gbsbuild/src/core/UI_b.c:82: } else if (win_speed == 3 && ((game_time & 0x1) != 0)) {
	ld	a, (#_win_speed)
	sub	a, #0x03
	jr	NZ, 00104$
	bit	0, c
;/tmp/_gbsbuild/src/core/UI_b.c:83: return;
	ret	NZ
00104$:
;/tmp/_gbsbuild/src/core/UI_b.c:84: } else if (win_speed == 0xFF) {
	ld	a, (#_win_speed)
	inc	a
	jr	NZ, 00109$
;/tmp/_gbsbuild/src/core/UI_b.c:86: win_speed = 0;
	ld	hl, #_win_speed
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:87: return;
	ret
00109$:
;/tmp/_gbsbuild/src/core/UI_b.c:90: if (win_speed == 1) {
	ld	a, (#_win_speed)
	dec	a
;/tmp/_gbsbuild/src/core/UI_b.c:91: interval = 2;
;/tmp/_gbsbuild/src/core/UI_b.c:93: interval = 1;
	ld	c, #0x02
	jr	Z, 00117$
	ld	c, #0x01
00117$:
;/tmp/_gbsbuild/src/core/UI_b.c:96: if (win_pos_x != win_dest_pos_x) {
	ld	a, (#_win_pos_x)
	ld	hl, #_win_dest_pos_x
	sub	a, (hl)
	jr	Z, 00122$
;/tmp/_gbsbuild/src/core/UI_b.c:97: if (win_pos_x < win_dest_pos_x) {
	ld	a, (#_win_pos_x)
	ld	hl, #_win_dest_pos_x
	sub	a, (hl)
	jr	NC, 00119$
;/tmp/_gbsbuild/src/core/UI_b.c:98: win_pos_x += interval;
	ld	hl, #_win_pos_x
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	jr	00122$
00119$:
;/tmp/_gbsbuild/src/core/UI_b.c:100: win_pos_x -= interval;
	ld	hl, #_win_pos_x
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
00122$:
;/tmp/_gbsbuild/src/core/UI_b.c:104: if (win_pos_y != win_dest_pos_y) {
	ld	a, (#_win_pos_y)
	ld	hl, #_win_dest_pos_y
	sub	a, (hl)
	jr	Z, 00131$
;/tmp/_gbsbuild/src/core/UI_b.c:105: if (win_pos_y < win_dest_pos_y) {
	ld	a, (#_win_pos_y)
	ld	hl, #_win_dest_pos_y
	sub	a, (hl)
	jr	NC, 00124$
;/tmp/_gbsbuild/src/core/UI_b.c:106: win_pos_y += interval;
	ld	hl, #_win_pos_y
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	jr	00132$
00124$:
;/tmp/_gbsbuild/src/core/UI_b.c:108: win_pos_y -= interval;
	ld	hl, #_win_pos_y
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	jr	00132$
00131$:
;/tmp/_gbsbuild/src/core/UI_b.c:110: } else if(!text_drawn) {
	ld	a, (#_text_drawn)
	or	a, a
	jr	NZ, 00132$
;/tmp/_gbsbuild/src/core/UI_b.c:111: if ( (joy & text_ff_joypad) | ((game_time & current_text_speed) == 0) ) {
	ld	a, (#_joy)
	ld	hl, #_text_ff_joypad
	and	a, (hl)
	ld	c, a
	ld	a, (#_game_time)
	ld	hl, #_current_text_speed
	and	a,(hl)
	ld	a, #0x01
	jr	Z, 00221$
	xor	a, a
00221$:
	or	a, c
	or	a, a
	jr	Z, 00132$
;/tmp/_gbsbuild/src/core/UI_b.c:112: UIDrawTextBufferChar_b();
	call	_UIDrawTextBufferChar_b
00132$:
;/tmp/_gbsbuild/src/core/UI_b.c:116: WX_REG = win_pos_x + 7;
	ld	a, (#_win_pos_x)
	add	a, #0x07
	ldh	(_WX_REG+0),a
;/tmp/_gbsbuild/src/core/UI_b.c:117: WY_REG = win_pos_y;
	ld	a, (#_win_pos_y)
	ldh	(_WY_REG+0),a
;/tmp/_gbsbuild/src/core/UI_b.c:118: }
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:120: void UIDrawFrame_b(UBYTE x, UBYTE y, UBYTE width, UBYTE height) __banked {
;	---------------------------------
; Function UIDrawFrame_b
; ---------------------------------
	b_UIDrawFrame_b	= 1
_UIDrawFrame_b::
	dec	sp
;/tmp/_gbsbuild/src/core/UI_b.c:121: fill_win_rect(x,         y,              1,         1,      ui_frame_tl_tiles);  // top-left
	ld	de, #0xc001
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:122: fill_win_rect(x + 1,     y,              width - 1, 1,      ui_frame_t_tiles);   // top
	ldhl	sp,	#9
	ld	b, (hl)
	dec	b
	dec	hl
	dec	hl
	ld	c, (hl)
	inc	c
	ld	de, #0xc101
	push	de
	push	bc
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:123: fill_win_rect(x + width, y,              1,         1,      ui_frame_tr_tiles);  // top-right
	ldhl	sp,	#7
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	de, #0xc201
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:124: fill_win_rect(x,         y + 1,          1,         height, ui_frame_l_tiles);   // left
	ldhl	sp,	#8
	ld	e, (hl)
	inc	e
	push	de
	ld	a, #0xc3
	push	af
	inc	sp
	inc	hl
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	d, #0x01
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
	pop	de
;/tmp/_gbsbuild/src/core/UI_b.c:125: fill_win_rect(x + width, y + 1,          1,         height, ui_frame_r_tiles);   // right
	push	de
	ld	a, #0xc5
	push	af
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ld	d, #0x01
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
	pop	de
;/tmp/_gbsbuild/src/core/UI_b.c:126: fill_win_rect(x,         y + height + 1, 1,         1,      ui_frame_bl_tiles);  // bottom-left
	ldhl	sp,	#8
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
	ld	d, a
	inc	d
	push	de
	ld	hl, #0xc601
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
	pop	de
;/tmp/_gbsbuild/src/core/UI_b.c:127: fill_win_rect(x + 1,     y + height + 1, width - 1, 1,      ui_frame_b_tiles);   // bottom
	push	de
	ld	hl, #0xc701
	push	hl
	push	bc
	inc	sp
	ld	e, c
	push	de
	call	_fill_win_rect
	add	sp, #5
	pop	de
;/tmp/_gbsbuild/src/core/UI_b.c:128: fill_win_rect(x + width, y + height + 1, 1,         1,      ui_frame_br_tiles);  // bottom-right
	push	de
	ld	hl, #0xc801
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
	pop	de
;/tmp/_gbsbuild/src/core/UI_b.c:129: fill_win_rect(x + 1,     y + 1,          width - 1, height, ui_frame_bg_tiles);  // background
	ld	a, #0xc4
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	b, e
	push	bc
	call	_fill_win_rect
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:130: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:132: void UIDrawDialogueFrame_b(UBYTE h) __banked {
;	---------------------------------
; Function UIDrawDialogueFrame_b
; ---------------------------------
	b_UIDrawDialogueFrame_b	= 1
_UIDrawDialogueFrame_b::
;/tmp/_gbsbuild/src/core/UI_b.c:133: UIDrawFrame_b(0, 0, 19, h);
	ldhl	sp,	#6
	ld	d, (hl)
	ld	e,#0x13
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	e, #b_UIDrawFrame_b
	ld	hl, #_UIDrawFrame_b
	call	___sdcc_bcall_ehl
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI_b.c:134: }
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:136: void UISetColor_b(UBYTE color) __banked {
;	---------------------------------
; Function UISetColor_b
; ---------------------------------
	b_UISetColor_b	= 1
_UISetColor_b::
;/tmp/_gbsbuild/src/core/UI_b.c:137: UBYTE id = ((color) ? ui_while_tile : ui_black_tile);
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00103$
	ld	bc, #0x00c9
	jr	00104$
00103$:
	ld	bc, #0x00ca
00104$:
;/tmp/_gbsbuild/src/core/UI_b.c:141: set_bkg_data(ui_while_tile, 1, ui_white);
	ld	hl, #_ui_white
	push	hl
	ld	de, #0x01c9
	push	de
	call	_set_bkg_data
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI_b.c:142: set_bkg_data(ui_black_tile, 1, ui_black);
	ld	hl, #_ui_black
	push	hl
	ld	de, #0x01ca
	push	de
	call	_set_bkg_data
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI_b.c:143: fill_win_rect(0, 0, 20, 18, id);
	ld	d, c
	ld	e,#0x12
	push	de
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_fill_win_rect
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:144: }
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:146: void UIShowText_b() __banked {
;	---------------------------------
; Function UIShowText_b
; ---------------------------------
	b_UIShowText_b	= 1
_UIShowText_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/UI_b.c:150: ui_block = TRUE;
	ld	hl, #_ui_block
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI_b.c:151: current_text_speed = text_draw_speed;
	ld	a, (#_text_draw_speed)
	ld	(#_current_text_speed),a
;/tmp/_gbsbuild/src/core/UI_b.c:154: src = tmp_text_lines + 1, dest = text_lines;
	ld	hl, #_UIShowText_b_src_65537_149
	ld	a, #<((_tmp_text_lines + 0x0001))
	ld	(hl+), a
	ld	(hl), #>((_tmp_text_lines + 0x0001))
	ld	hl, #_UIShowText_b_dest_65537_149
	ld	a, #<(_text_lines)
	ld	(hl+), a
	ld	(hl), #>(_text_lines)
;/tmp/_gbsbuild/src/core/UI_b.c:155: for (i = 0; (*src) && (i != 80u); i++) {
	xor	a, a
	ldhl	sp,	#3
	ld	(hl), a
00122$:
	ld	hl, #_UIShowText_b_src_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ld	c, a
	or	a, a
	jp	Z, 00114$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x50
	jp	Z,00114$
;/tmp/_gbsbuild/src/core/UI_b.c:158: l = GetToken_b(src + 1, '$', &var_index);
	ld	hl, #_UIShowText_b_src_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
;/tmp/_gbsbuild/src/core/UI_b.c:156: switch (*src) {
	ld	a,c
	cp	a,#0x21
	jp	Z,00107$
	cp	a,#0x23
	jr	Z, 00104$
	sub	a, #0x24
	jp	NZ,00112$
;/tmp/_gbsbuild/src/core/UI_b.c:158: l = GetToken_b(src + 1, '$', &var_index);
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	push	bc
	ld	a, #0x24
	push	af
	inc	sp
	push	de
	call	_GetToken_b
	add	sp, #5
	ld	c, e
;/tmp/_gbsbuild/src/core/UI_b.c:159: if (l) {
	ld	a, c
	or	a, a
	jp	Z, 00112$
;/tmp/_gbsbuild/src/core/UI_b.c:160: dest += strlen(itoa(script_variables[var_index], dest));
;c
	ld	de, #_script_variables
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	push	bc
	ld	hl, #_UIShowText_b_dest_65537_149
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	call	_itoa
	add	sp, #4
	push	de
	call	_strlen
	add	sp, #2
	pop	bc
	ld	hl, #_UIShowText_b_dest_65537_149
	ld	a, (hl)
	add	a, e
	ld	(hl+), a
	ld	a, (hl)
	adc	a, d
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:161: src += l + 1; 
	ld	b, #0x00
	inc	bc
	ld	hl, #_UIShowText_b_src_65537_149
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:162: continue;
	jp	00113$
;/tmp/_gbsbuild/src/core/UI_b.c:166: case '#':
00104$:
;/tmp/_gbsbuild/src/core/UI_b.c:167: l = GetToken_b(src + 1, '#', &var_index);
	ldhl	sp,	#0
	push	hl
	ld	a, #0x23
	push	af
	inc	sp
	push	de
	call	_GetToken_b
	add	sp, #5
	ldhl	sp,	#2
	ld	(hl), e
;/tmp/_gbsbuild/src/core/UI_b.c:168: if (l) {
	ld	a, (hl)
	or	a, a
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/UI_b.c:169: *dest++ = script_variables[var_index] + 0x20u; 
	ld	hl, #_UIShowText_b_dest_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;c
	ld	de, #_script_variables
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0x20
	ld	(bc), a
	ld	hl, #_UIShowText_b_dest_65537_149
	inc	(hl)
	jr	NZ, 00198$
	inc	hl
	inc	(hl)
00198$:
;/tmp/_gbsbuild/src/core/UI_b.c:170: src += l + 1; 
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	hl, #_UIShowText_b_src_65537_149
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:171: continue;
	jr	00113$
;/tmp/_gbsbuild/src/core/UI_b.c:175: case '!':
00107$:
;/tmp/_gbsbuild/src/core/UI_b.c:176: if (*(src+1) == 'S') {
	ld	a, (de)
	sub	a, #0x53
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/UI_b.c:177: l = GetToken_b(src + 2, '!', &var_index);
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	hl, #_UIShowText_b_src_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	push	bc
	ld	a, #0x21
	push	af
	inc	sp
	push	de
	call	_GetToken_b
	add	sp, #5
;/tmp/_gbsbuild/src/core/UI_b.c:178: if (l) {
	ld	a, e
	or	a, a
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/UI_b.c:179: *dest++ = var_index + 0x10u;
	ld	hl, #_UIShowText_b_dest_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x10
	ld	(bc), a
	ld	hl, #_UIShowText_b_dest_65537_149
	inc	(hl)
	jr	NZ, 00201$
	inc	hl
	inc	(hl)
00201$:
;/tmp/_gbsbuild/src/core/UI_b.c:180: src += l + 2;
	ld	d, #0x00
	inc	de
	inc	de
	ld	c, e
	ld	hl, #_UIShowText_b_src_65537_149
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, d
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:181: continue;
	jr	00113$
;/tmp/_gbsbuild/src/core/UI_b.c:185: }
00112$:
;/tmp/_gbsbuild/src/core/UI_b.c:186: *dest++ = *src++;
	ld	hl, #_UIShowText_b_dest_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_UIShowText_b_src_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	dec	hl
	inc	(hl)
	jr	NZ, 00202$
	inc	hl
	inc	(hl)
00202$:
	ld	a, e
	ld	(bc), a
	ld	hl, #_UIShowText_b_dest_65537_149
	inc	(hl)
	jr	NZ, 00203$
	inc	hl
	inc	(hl)
00203$:
00113$:
;/tmp/_gbsbuild/src/core/UI_b.c:155: for (i = 0; (*src) && (i != 80u); i++) {
	ldhl	sp,	#3
	inc	(hl)
	jp	00122$
00114$:
;/tmp/_gbsbuild/src/core/UI_b.c:188: *dest = 0;
	ld	hl, #_UIShowText_b_dest_65537_149 + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/UI_b.c:191: text_num_lines = tmp_text_lines[0];
	ld	hl, #_tmp_text_lines
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/UI_b.c:190: if (menu_layout) {
	ld	a, (#_menu_layout)
	or	a, a
	jr	Z, 00116$
;/tmp/_gbsbuild/src/core/UI_b.c:191: text_num_lines = tmp_text_lines[0];
	ld	hl, #_text_num_lines
	ld	(hl), c
;/tmp/_gbsbuild/src/core/UI_b.c:192: UIDrawFrame(0, 0, 8, text_num_lines);
	ld	d, (hl)
	ld	e,#0x08
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_UIDrawFrame
	add	sp, #4
;/tmp/_gbsbuild/src/core/UI_b.c:193: UISetPos(MENU_LAYOUT_INITIAL_X, MENU_CLOSED_Y);
	ld	de, #0x9058
	push	de
	call	_UISetPos
	add	sp, #2
;/tmp/_gbsbuild/src/core/UI_b.c:194: UIMoveTo(MENU_LAYOUT_INITIAL_X, MENU_CLOSED_Y - ((text_num_lines + 2) << 3), text_in_speed);
	ld	a, (#_text_num_lines)
	add	a, #0x02
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	ld	a, #0x90
	sub	a, c
	ld	hl, #_text_in_speed
	ld	h, (hl)
	push	hl
	inc	sp
	ld	d,a
	ld	e,#0x58
	push	de
	call	_UIMoveTo
	add	sp, #3
	jr	00117$
00116$:
;/tmp/_gbsbuild/src/core/UI_b.c:196: text_num_lines = MIN(tmp_text_lines[0], 4);
	ld	a, c
	sub	a, #0x04
	jr	C, 00126$
	ld	bc, #0x0004
00126$:
	ld	hl, #_text_num_lines
	ld	(hl), c
;/tmp/_gbsbuild/src/core/UI_b.c:197: UIDrawDialogueFrame(text_num_lines);
	ld	a, (hl)
	push	af
	inc	sp
	call	_UIDrawDialogueFrame
	inc	sp
;/tmp/_gbsbuild/src/core/UI_b.c:198: UISetPos(0, MENU_CLOSED_Y);
	ld	a, #0x90
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_UISetPos
	add	sp, #2
;/tmp/_gbsbuild/src/core/UI_b.c:199: UIMoveTo(0, MENU_CLOSED_Y - ((text_num_lines + 2) << 3), text_in_speed);
	ld	a, (#_text_num_lines)
	add	a, #0x02
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	ld	a, #0x90
	sub	a, c
	ld	hl, #_text_in_speed
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_UIMoveTo
	add	sp, #3
00117$:
;/tmp/_gbsbuild/src/core/UI_b.c:202: text_drawn = FALSE;
	ld	hl, #_text_drawn
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:203: text_x = 0;
	ld	hl, #_text_x
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:204: text_y = 0;
	ld	hl, #_text_y
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:205: text_count = 0;
	ld	hl, #_text_count
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:206: text_tile_count = 0;
	ld	hl, #_text_tile_count
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:209: if (text_draw_speed == 0) {
	ld	a, (#_text_draw_speed)
	or	a, a
	jr	NZ, 00123$
;/tmp/_gbsbuild/src/core/UI_b.c:210: UIDrawTextBufferChar_b();
	call	_UIDrawTextBufferChar_b
00123$:
;/tmp/_gbsbuild/src/core/UI_b.c:212: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:214: void UIDrawTextBufferChar_b() {
;	---------------------------------
; Function UIDrawTextBufferChar_b
; ---------------------------------
_UIDrawTextBufferChar_b::
	add	sp, #-9
;/tmp/_gbsbuild/src/core/UI_b.c:222: if (text_wait != 0) {
	ld	hl, #_text_wait
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/UI_b.c:223: text_wait--;
	dec	(hl)
;/tmp/_gbsbuild/src/core/UI_b.c:224: return;
	jp	00129$
00102$:
;/tmp/_gbsbuild/src/core/UI_b.c:227: text_size = strlen(text_lines);
	ld	hl, #_text_lines
	push	hl
	call	_strlen
	add	sp, #2
	ld	c, e
;/tmp/_gbsbuild/src/core/UI_b.c:229: if (UBYTE_LESS_THAN(text_count, text_size)) {
	ld	a, (#_text_count)
	ld	l, c
	sub	a, l
	bit	7,a
	jp	Z,00124$
;/tmp/_gbsbuild/src/core/UI_b.c:230: text_drawn = FALSE;
	ld	hl, #_text_drawn
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:232: if (text_count == 0) {
	ld	a, (#_text_count)
	or	a, a
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/UI_b.c:233: text_x = 0;
	ld	hl, #_text_x
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:234: text_y = 0;
	ld	hl, #_text_y
	ld	(hl), #0x00
00104$:
;/tmp/_gbsbuild/src/core/UI_b.c:237: letter = text_lines[text_count] - 32;
;c
	ld	de, #_text_lines
	ld	hl, #_text_count
	ld	l, (hl)
	ld	h, #0x00
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
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0xe0
	ldhl	sp,	#7
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:243: text_remaining = 18 - text_x;
	ld	hl, #_text_x
	ld	b, (hl)
	ld	a, #0x12
	sub	a, b
	ld	b, a
;/tmp/_gbsbuild/src/core/UI_b.c:245: for (i = text_count; i != text_size; i++) {
	ld	hl, #_text_count
	ld	e, (hl)
	ld	d, #0x00
00127$:
	ld	a, c
	sub	a, e
	jr	Z, 00107$
;/tmp/_gbsbuild/src/core/UI_b.c:247: if (text_lines[i] < ' ') {
	ld	a, #<(_text_lines)
	add	a, e
	ld	l, a
	ld	a, #>(_text_lines)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	sub	a, #0x20
	jr	C, 00107$
;/tmp/_gbsbuild/src/core/UI_b.c:250: word_len++;
	inc	d
;/tmp/_gbsbuild/src/core/UI_b.c:245: for (i = text_count; i != text_size; i++) {
	inc	e
	jr	00127$
00107$:
;/tmp/_gbsbuild/src/core/UI_b.c:252: if (UBYTE_LESS_THAN(text_remaining, word_len) && UBYTE_LESS_THAN(word_len, 18u)) {
	ld	c, #0x00
	ldhl	sp,	#5
	ld	(hl), d
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	e, b
	dec	hl
	ld	a, (hl+)
	ld	l, a
	ld	a, e
	sub	a, l
	bit	7,a
	jr	Z, 00109$
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	bit	7, (hl)
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/UI_b.c:253: text_x = 0;
	ld	hl, #_text_x
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:254: text_y++;
	ld	hl, #_text_y
	inc	(hl)
00109$:
;/tmp/_gbsbuild/src/core/UI_b.c:258: if (text_lines[text_count] >= ' ') {
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x20
	jp	C, 00112$
;/tmp/_gbsbuild/src/core/UI_b.c:259: i = text_tile_count + avatar_enabled * 4;
	ld	a, (#_avatar_enabled)
	add	a, a
	add	a, a
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (#_text_tile_count)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	add	a, (hl)
	inc	hl
	inc	hl
;/tmp/_gbsbuild/src/core/UI_b.c:261: SetBankedBkgData(TEXT_BUFFER_START + i, 1, ptr + ((UWORD)letter * 16), FONT_BANK);
	ld	(hl-), a
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, #0x04
00213$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00213$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x4000
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0xcc
	ld	b, a
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_SetBankedBkgData
	add	sp, #5
	pop	bc
;/tmp/_gbsbuild/src/core/UI_b.c:262: tile = TEXT_BUFFER_START + i;
	ldhl	sp,	#0
	ld	(hl), b
;/tmp/_gbsbuild/src/core/UI_b.c:263: id = (UINT16)GetWinAddr() +
	call	_GetWinAddr
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;/tmp/_gbsbuild/src/core/UI_b.c:264: MOD_32((text_x + 1 + avatar_enabled * 2 + menu_enabled +
	ld	hl, #_text_x
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	a, (#_avatar_enabled)
	ldhl	sp,	#7
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	ld	hl, #_menu_enabled
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_text_y)
	ld	hl, #_text_num_lines
	sub	a, (hl)
	jr	C, 00131$
	ldhl	sp,	#5
	ld	(hl), #0x09
	xor	a, a
	inc	hl
	ld	(hl), a
	jr	00132$
00131$:
	xor	a, a
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), a
00132$:
;c
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl)
	and	a, #0x1f
	dec	hl
	dec	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:266: ((UINT16)MOD_32((text_y % text_num_lines) + 1) << 5);
	ld	a, (#_text_num_lines)
	push	af
	inc	sp
	ld	a, (#_text_y)
	push	af
	inc	sp
	call	__moduchar
	add	sp, #2
	ldhl	sp,	#7
	ld	(hl), e
	xor	a, a
	inc	hl
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl)
	and	a, #0x1f
	ldhl	sp,	#7
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, #0x05
00215$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00215$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
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
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/UI_b.c:267: SetTile(id, tile);
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/UI_b.c:269: text_tile_count++;
	ld	hl, #_text_tile_count
	inc	(hl)
00112$:
;/tmp/_gbsbuild/src/core/UI_b.c:273: if (text_lines[text_count] >= 0x10 && text_lines[text_count] < 0x16) {
	ld	a, #<(_text_lines)
	ld	hl, #_text_count
	add	a, (hl)
	ld	c, a
	ld	a, #>(_text_lines)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
	sub	a, #0x10
	jr	C, 00114$
;/tmp/_gbsbuild/src/core/UI_b.c:274: current_text_speed = text_draw_speeds[text_lines[text_count] - 0x10];
	ld	a,(hl)
	cp	a,#0x16
	jr	NC, 00114$
	add	a, #0xf0
	ld	(hl), a
	ldhl	sp,	#5
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
;c
	ld	de, #_text_draw_speeds
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
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
	ld	(#_current_text_speed),a
;/tmp/_gbsbuild/src/core/UI_b.c:275: text_x--;
	ld	hl, #_text_x
	dec	(hl)
00114$:
;/tmp/_gbsbuild/src/core/UI_b.c:278: text_count++;
	ld	hl, #_text_count
	inc	(hl)
;/tmp/_gbsbuild/src/core/UI_b.c:279: text_x++;
	ld	hl, #_text_x
	inc	(hl)
;/tmp/_gbsbuild/src/core/UI_b.c:280: if (text_lines[text_count] == '\n') {
	ld	a, #<(_text_lines)
	ld	hl, #_text_count
	add	a, (hl)
	ld	c, a
	ld	a, #>(_text_lines)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
;/tmp/_gbsbuild/src/core/UI_b.c:254: text_y++;
	ld	hl, #_text_y
	ld	c, (hl)
	inc	c
;/tmp/_gbsbuild/src/core/UI_b.c:280: if (text_lines[text_count] == '\n') {
	sub	a, #0x0a
	jr	NZ, 00119$
;/tmp/_gbsbuild/src/core/UI_b.c:281: text_x = 0;
	ld	hl, #_text_x
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:282: text_y++;
	ld	hl, #_text_y
	ld	(hl), c
;/tmp/_gbsbuild/src/core/UI_b.c:283: text_count++;
	ld	hl, #_text_count
	inc	(hl)
	jr	00120$
00119$:
;/tmp/_gbsbuild/src/core/UI_b.c:284: } else if (UBYTE_GT_THAN(text_x, 17u)) {
	ld	hl, #_text_x
	ld	e, (hl)
	ld	a, #0x11
	sub	a, e
	bit	7,a
	jr	Z, 00120$
;/tmp/_gbsbuild/src/core/UI_b.c:285: text_x = 0;
	ld	hl, #_text_x
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:286: text_y++;
	ld	hl, #_text_y
	ld	(hl), c
00120$:
;/tmp/_gbsbuild/src/core/UI_b.c:289: if (current_text_speed == 0) {
	ld	a, (#_current_text_speed)
	or	a, a
	jr	NZ, 00129$
;/tmp/_gbsbuild/src/core/UI_b.c:290: UIDrawTextBufferChar_b();
	call	_UIDrawTextBufferChar_b
	jr	00129$
00124$:
;/tmp/_gbsbuild/src/core/UI_b.c:293: text_drawn = TRUE;
	ld	hl, #_text_drawn
	ld	(hl), #0x01
00129$:
;/tmp/_gbsbuild/src/core/UI_b.c:295: }
	add	sp, #9
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:297: void UICloseDialogue_b() {
;	---------------------------------
; Function UICloseDialogue_b
; ---------------------------------
_UICloseDialogue_b::
;/tmp/_gbsbuild/src/core/UI_b.c:298: UIMoveTo(menu_layout ? MENU_LAYOUT_INITIAL_X : 0, MENU_CLOSED_Y, text_out_speed);
	ld	a, (#_menu_layout)
	or	a, a
	jr	Z, 00103$
	ld	bc, #0x0058
	jr	00104$
00103$:
	ld	bc, #0x0000
00104$:
	ld	a, c
	ld	hl, #_text_out_speed
	ld	h, (hl)
	push	hl
	inc	sp
	ld	h, #0x90
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_UIMoveTo
	add	sp, #3
;/tmp/_gbsbuild/src/core/UI_b.c:301: text_count = 0;
	ld	hl, #_text_count
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:302: text_lines[0] = '\0';
	ld	hl, #_text_lines
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:303: text_tile_count = 0;
	ld	hl, #_text_tile_count
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:304: text_num_lines = 3;
	ld	hl, #_text_num_lines
	ld	(hl), #0x03
;/tmp/_gbsbuild/src/core/UI_b.c:305: menu_enabled = FALSE;
	ld	hl, #_menu_enabled
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:306: menu_layout = 0;
	ld	hl, #_menu_layout
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:307: avatar_enabled = FALSE;
	ld	hl, #_avatar_enabled
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:308: ui_block = FALSE;
	ld	hl, #_ui_block
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:309: }
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:311: void UIOnInteract_b() __banked {
;	---------------------------------
; Function UIOnInteract_b
; ---------------------------------
	b_UIOnInteract_b	= 1
_UIOnInteract_b::
	add	sp, #-12
;/tmp/_gbsbuild/src/core/UI_b.c:312: if (INPUT_A_PRESSED) {
	ld	a, (#_joy)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_last_joy)
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:315: if (menu_cancel_on_last_option && menu_index + 1 == menu_num_options) {
	ld	a, (#_menu_index)
	ldhl	sp,	#4
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#_menu_num_options)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:318: script_variables[menu_flag] = menu_index + 1;
	ld	a, (#_menu_index)
	inc	a
	ldhl	sp,	#6
;/tmp/_gbsbuild/src/core/UI_b.c:315: if (menu_cancel_on_last_option && menu_index + 1 == menu_num_options) {
;c
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:312: if (INPUT_A_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00154$
	ld	hl, #_input_override_default
	bit	4, (hl)
	jr	NZ, 00150$
00154$:
	ldhl	sp,	#2
	bit	4, (hl)
	jr	Z, 00150$
	ldhl	sp,	#3
	bit	4, (hl)
	jr	NZ, 00150$
;/tmp/_gbsbuild/src/core/UI_b.c:313: if (text_drawn && text_count != 0) {
	ld	a, (#_text_drawn)
	or	a, a
	jp	Z, 00155$
	ld	a, (#_text_count)
	or	a, a
	jp	Z, 00155$
;/tmp/_gbsbuild/src/core/UI_b.c:314: if (menu_enabled) {
	ld	a, (#_menu_enabled)
	or	a, a
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/UI_b.c:315: if (menu_cancel_on_last_option && menu_index + 1 == menu_num_options) {
	ld	a, (#_menu_cancel_on_last_option)
	or	a, a
	jr	Z, 00102$
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NZ, 00102$
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/UI_b.c:316: script_variables[menu_flag] = 0;
	ld	a, #<(_script_variables)
	ld	hl, #_menu_flag
	add	a, (hl)
	ld	c, a
	ld	a, #>(_script_variables)
	inc	hl
	adc	a, (hl)
	ld	b, a
	xor	a, a
	ld	(bc), a
	jr	00103$
00102$:
;/tmp/_gbsbuild/src/core/UI_b.c:318: script_variables[menu_flag] = menu_index + 1;
	ld	a, #<(_script_variables)
	ld	hl, #_menu_flag
	add	a, (hl)
	ld	c, a
	ld	a, #>(_script_variables)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(bc), a
00103$:
;/tmp/_gbsbuild/src/core/UI_b.c:320: UICloseDialogue_b();
	call	_UICloseDialogue_b
	jp	00155$
00106$:
;/tmp/_gbsbuild/src/core/UI_b.c:322: UICloseDialogue_b();
	call	_UICloseDialogue_b
	jp	00155$
00150$:
;/tmp/_gbsbuild/src/core/UI_b.c:325: } else if (menu_enabled) {
	ld	a, (#_menu_enabled)
	or	a, a
	jp	Z, 00155$
;/tmp/_gbsbuild/src/core/UI_b.c:326: if (INPUT_UP_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00146$
	ld	hl, #_input_override_default
	bit	2, (hl)
	jr	NZ, 00142$
00146$:
	ldhl	sp,	#2
	bit	2, (hl)
	jr	Z, 00142$
	ldhl	sp,	#3
	bit	2, (hl)
	jr	NZ, 00142$
;/tmp/_gbsbuild/src/core/UI_b.c:327: menu_index = MAX(menu_index - 1, 0);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ld	e, b
	ld	d, #0x00
	xor	a, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00332$
	bit	7, d
	jr	NZ, 00333$
	cp	a, a
	jr	00333$
00332$:
	bit	7, d
	jr	Z, 00333$
	scf
00333$:
	jr	NC, 00157$
	ld	a, (#_menu_index)
	dec	a
	ldhl	sp,	#10
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl), a
	jr	00158$
00157$:
	xor	a, a
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), a
00158$:
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(#_menu_index),a
;/tmp/_gbsbuild/src/core/UI_b.c:328: UIDrawMenuCursor_b();
	call	_UIDrawMenuCursor_b
	jp	00155$
00142$:
;/tmp/_gbsbuild/src/core/UI_b.c:330: menu_index = MIN(menu_index + 1, menu_num_options - 1);
	ld	hl, #_menu_num_options
	ld	c, (hl)
	pop	de
	push	de
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
	ld	a, c
	add	a, #0xff
	inc	hl
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/UI_b.c:329: } else if (INPUT_DOWN_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00140$
	ld	hl, #_input_override_default
	bit	3, (hl)
	jr	NZ, 00136$
00140$:
	ldhl	sp,	#2
	bit	3, (hl)
	jr	Z, 00136$
	ldhl	sp,	#3
	bit	3, (hl)
	jr	NZ, 00136$
;/tmp/_gbsbuild/src/core/UI_b.c:330: menu_index = MIN(menu_index + 1, menu_num_options - 1);
	ldhl	sp,	#7
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00339$
	bit	7, d
	jr	NZ, 00340$
	cp	a, a
	jr	00340$
00339$:
	bit	7, d
	jr	Z, 00340$
	scf
00340$:
	jr	NC, 00159$
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
00159$:
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(#_menu_index),a
;/tmp/_gbsbuild/src/core/UI_b.c:331: UIDrawMenuCursor_b();
	call	_UIDrawMenuCursor_b
	jp	00155$
00136$:
;/tmp/_gbsbuild/src/core/UI_b.c:332: } else if (INPUT_LEFT_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00134$
	ld	hl, #_input_override_default
	bit	1, (hl)
	jr	NZ, 00130$
00134$:
	ldhl	sp,	#2
	bit	1, (hl)
	jr	Z, 00130$
	ldhl	sp,	#3
	bit	1, (hl)
	jr	NZ, 00130$
;/tmp/_gbsbuild/src/core/UI_b.c:333: if (menu_layout == 0) {
	ld	a, (#_menu_layout)
	or	a, a
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/UI_b.c:334: menu_index = MAX(menu_index - 4, 0);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ld	e, b
	ld	d, #0x00
	xor	a, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00346$
	bit	7, d
	jr	NZ, 00347$
	cp	a, a
	jr	00347$
00346$:
	bit	7, d
	jr	Z, 00347$
	scf
00347$:
	jr	NC, 00161$
	ld	a, (#_menu_index)
	add	a, #0xfc
	ld	c, a
	rla
	jr	00162$
00161$:
	ld	bc, #0x0000
00162$:
	ld	hl, #_menu_index
	ld	(hl), c
	jr	00113$
00112$:
;/tmp/_gbsbuild/src/core/UI_b.c:336: menu_index = 0;
	ld	hl, #_menu_index
	ld	(hl), #0x00
00113$:
;/tmp/_gbsbuild/src/core/UI_b.c:338: UIDrawMenuCursor_b();
	call	_UIDrawMenuCursor_b
	jp	00155$
00130$:
;/tmp/_gbsbuild/src/core/UI_b.c:339: } else if (INPUT_RIGHT_PRESSED) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00128$
	ld	hl, #_input_override_default
	bit	0, (hl)
	jr	NZ, 00124$
00128$:
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00124$
	ldhl	sp,	#3
	bit	0, (hl)
	jr	NZ, 00124$
;/tmp/_gbsbuild/src/core/UI_b.c:340: if (menu_layout == 0) {
	ld	a, (#_menu_layout)
	or	a, a
	jr	NZ, 00115$
;/tmp/_gbsbuild/src/core/UI_b.c:341: menu_index = MIN(menu_index + 4, menu_num_options - 1);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00353$
	bit	7, d
	jr	NZ, 00354$
	cp	a, a
	jr	00354$
00353$:
	bit	7, d
	jr	Z, 00354$
	scf
00354$:
	jr	NC, 00163$
	ld	a, (#_menu_index)
	inc	a
	inc	a
	inc	a
	inc	a
	jr	00164$
00163$:
	ldhl	sp,	#11
	ld	a, (hl)
00164$:
	ld	(#_menu_index),a
	jr	00116$
00115$:
;/tmp/_gbsbuild/src/core/UI_b.c:343: menu_index = menu_num_options - 1;
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(#_menu_index),a
00116$:
;/tmp/_gbsbuild/src/core/UI_b.c:345: UIDrawMenuCursor_b();
	call	_UIDrawMenuCursor_b
	jr	00155$
00124$:
;/tmp/_gbsbuild/src/core/UI_b.c:346: } else if (menu_cancel_on_b && INPUT_B_PRESSED) {
	ld	a, (#_menu_cancel_on_b)
	or	a, a
	jr	Z, 00155$
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00121$
	ld	hl, #_input_override_default
	bit	5, (hl)
	jr	NZ, 00155$
00121$:
	ldhl	sp,	#2
	bit	5, (hl)
	jr	Z, 00155$
	ldhl	sp,	#3
	bit	5, (hl)
	jr	NZ, 00155$
;/tmp/_gbsbuild/src/core/UI_b.c:347: script_variables[menu_flag] = 0;
	ld	a, #<(_script_variables)
	ld	hl, #_menu_flag
	add	a, (hl)
	ld	c, a
	ld	a, #>(_script_variables)
	inc	hl
	adc	a, (hl)
	ld	b, a
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/UI_b.c:348: UICloseDialogue_b();
	call	_UICloseDialogue_b
00155$:
;/tmp/_gbsbuild/src/core/UI_b.c:351: }
	add	sp, #12
	ret
;/tmp/_gbsbuild/src/core/UI_b.c:353: void UIShowMenu_b(UWORD flag_index,
;	---------------------------------
; Function UIShowMenu_b
; ---------------------------------
	b_UIShowMenu_b	= 1
_UIShowMenu_b::
;/tmp/_gbsbuild/src/core/UI_b.c:361: menu_index = 0;
	ld	hl, #_menu_index
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:362: menu_flag = flag_index;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_menu_flag
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/UI_b.c:363: menu_enabled = TRUE;
	ld	hl, #_menu_enabled
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/UI_b.c:364: menu_cancel_on_last_option = cancel_config & MENU_CANCEL_ON_LAST_OPTION;
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	and	a, #0x01
	ld	(#_menu_cancel_on_last_option),a
	pop	af
;/tmp/_gbsbuild/src/core/UI_b.c:365: menu_cancel_on_b = cancel_config & MENU_CANCEL_ON_B_PRESSED;
	and	a, #0x02
	ld	(#_menu_cancel_on_b),a
;/tmp/_gbsbuild/src/core/UI_b.c:366: menu_layout = layout;
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(#_menu_layout),a
;/tmp/_gbsbuild/src/core/UI_b.c:367: tmp_text_draw_speed = text_draw_speed;
	ld	hl, #_text_draw_speed
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/UI_b.c:368: text_draw_speed = 0;
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/UI_b.c:370: UIShowText(bank, bank_offset);
	push	bc
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	call	_UIShowText
	add	sp, #3
	pop	bc
;/tmp/_gbsbuild/src/core/UI_b.c:372: text_draw_speed = tmp_text_draw_speed;
	ld	hl, #_text_draw_speed
	ld	(hl), c
;/tmp/_gbsbuild/src/core/UI_b.c:373: menu_num_options = tmp_text_lines[0];
	ld	a, (#_tmp_text_lines + 0)
	ld	(#_menu_num_options),a
;/tmp/_gbsbuild/src/core/UI_b.c:375: UIDrawMenuCursor_b();
;/tmp/_gbsbuild/src/core/UI_b.c:376: }
	jp  _UIDrawMenuCursor_b
;/tmp/_gbsbuild/src/core/UI_b.c:378: void UIDrawMenuCursor_b() {
;	---------------------------------
; Function UIDrawMenuCursor_b
; ---------------------------------
_UIDrawMenuCursor_b::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/UI_b.c:381: for (i = 0; i != menu_num_options; i++) {
	xor	a, a
	ldhl	sp,	#2
	ld	(hl), a
00103$:
	ld	a, (#_menu_num_options)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	Z, 00105$
;/tmp/_gbsbuild/src/core/UI_b.c:382: addr = (UINT16)GetWinAddr() +
	call	_GetWinAddr
	inc	sp
	inc	sp
	push	de
;/tmp/_gbsbuild/src/core/UI_b.c:383: (i >= text_num_lines ? 10 : 1) +
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_text_num_lines
	sub	a, (hl)
	jr	C, 00107$
	ld	bc, #0x000a
	jr	00108$
00107$:
	ld	bc, #0x0001
00108$:
	pop	hl
	push	hl
	add	hl, bc
;/tmp/_gbsbuild/src/core/UI_b.c:384: (((i % text_num_lines) + 1) << 5);
	push	hl
	ld	a, (#_text_num_lines)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	__moduchar
	add	sp, #2
	pop	bc
	ld	d, #0x00
	inc	de
	ld	a, d
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/UI_b.c:385: SetTile(addr, menu_index == (BYTE)i ? ui_cursor_tiles : ui_bg_tiles);
	ldhl	sp,	#2
	ld	e, (hl)
	ld	a, (#_menu_index)
	sub	a, e
	jr	NZ, 00109$
	ld	de, #0x00cb
	jr	00110$
00109$:
	ld	de, #0x00c4
00110$:
	ld	a, e
	push	af
	inc	sp
	push	bc
	call	_SetTile
	add	sp, #3
;/tmp/_gbsbuild/src/core/UI_b.c:381: for (i = 0; i != menu_num_options; i++) {
	ldhl	sp,	#2
	inc	(hl)
	jr	00103$
00105$:
;/tmp/_gbsbuild/src/core/UI_b.c:387: }
	add	sp, #3
	ret
	.area _CODE_1
	.area _CABS (ABS)
