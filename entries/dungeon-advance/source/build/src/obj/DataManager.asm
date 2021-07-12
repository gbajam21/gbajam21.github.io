;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module DataManager
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _RemoveInputScripts
	.globl _UIReset
	.globl _InitScroll
	.globl _ScriptCtxPoolReset
	.globl _ProjectilesInit
	.globl _PopBank
	.globl _PushBank
	.globl _ActivateActor
	.globl _InitPlayer
	.globl _SpritePoolReset
	.globl _memcpy
	.globl _set_sprite_data
	.globl _set_bkg_data
	.globl _scene_events_start_ptr
	.globl _scene_type
	.globl _actors_len
	.globl _sprites_len
	.globl _image_height
	.globl _image_width
	.globl _image_tile_height
	.globl _image_tile_width
	.globl _collision_ptr
	.globl _image_attr_ptr
	.globl _image_ptr
	.globl _collision_bank
	.globl _image_attr_bank
	.globl _image_bank
	.globl _bank_ptr
	.globl _LoadTiles
	.globl _LoadImage
	.globl _LoadImageAttr
	.globl _LoadPalette
	.globl _LoadUIPalette
	.globl _LoadSpritePalette
	.globl _LoadPlayerSpritePalette
	.globl _LoadSprite
	.globl _LoadScene
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_ptr::
	.ds 3
_image_bank::
	.ds 1
_image_attr_bank::
	.ds 1
_collision_bank::
	.ds 1
_image_ptr::
	.ds 2
_image_attr_ptr::
	.ds 2
_collision_ptr::
	.ds 2
_image_tile_width::
	.ds 1
_image_tile_height::
	.ds 1
_image_width::
	.ds 2
_image_height::
	.ds 2
_sprites_len::
	.ds 1
_actors_len::
	.ds 1
_scene_type::
	.ds 1
_scene_events_start_ptr::
	.ds 3
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
;/tmp/_gbsbuild/src/core/DataManager.c:31: UBYTE actors_len = 0;
	ld	hl, #_actors_len
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
;/tmp/_gbsbuild/src/core/DataManager.c:35: void LoadTiles(UINT16 index) {
;	---------------------------------
; Function LoadTiles
; ---------------------------------
_LoadTiles::
;/tmp/_gbsbuild/src/core/DataManager.c:39: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:40: bank = tileset_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_tileset_bank_ptrs
	add	hl,bc
;/tmp/_gbsbuild/src/core/DataManager.c:41: data_ptr = (UBYTE*)(tileset_bank_ptrs[index].offset + (BankDataPtr(bank)));
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	c, (hl)
	ld	e, a
	ld	a, c
	add	a, #0x40
	ld	d, a
;/tmp/_gbsbuild/src/core/DataManager.c:42: POP_BANK;
	push	bc
	push	de
	call	_PopBank
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:44: PUSH_BANK(bank);
	push	de
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:45: size = *(data_ptr++);
	ld	a, (de)
	inc	de
;/tmp/_gbsbuild/src/core/DataManager.c:46: set_bkg_data(0, size, data_ptr);
	push	de
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;/tmp/_gbsbuild/src/core/DataManager.c:47: POP_BANK;
;/tmp/_gbsbuild/src/core/DataManager.c:48: }
	jp  _PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:50: void LoadImage(UINT16 index) {
;	---------------------------------
; Function LoadImage
; ---------------------------------
_LoadImage::
;/tmp/_gbsbuild/src/core/DataManager.c:53: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:54: image_bank = background_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_background_bank_ptrs
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#_image_bank),a
;/tmp/_gbsbuild/src/core/DataManager.c:55: data_ptr = (UBYTE*)(background_bank_ptrs[index].offset + (BankDataPtr(image_bank)));
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
	add	a, #0x40
	ld	b, a
;/tmp/_gbsbuild/src/core/DataManager.c:56: POP_BANK;
	push	bc
	call	_PopBank
	ld	a, (#_image_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:60: LoadTiles(*(data_ptr++));
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	d, #0x00
	push	bc
	push	de
	call	_LoadTiles
	add	sp, #2
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:62: image_tile_width = *(data_ptr++);
	ld	a, (bc)
	ld	(#_image_tile_width),a
	inc	bc
;/tmp/_gbsbuild/src/core/DataManager.c:63: image_tile_height = *(data_ptr++);
	ld	a, (bc)
	ld	(#_image_tile_height),a
	inc	bc
	ld	hl, #_image_ptr
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/DataManager.c:64: image_width = image_tile_width * 8;
	ld	hl, #_image_tile_width
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ld	hl, #_image_width
	ld	(hl), c
	inc	hl
;/tmp/_gbsbuild/src/core/DataManager.c:65: scroll_x_max = image_width - ((UINT16)SCREENWIDTH);
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x60
	ld	(#_scroll_x_max),a
	ld	a, (#_image_width + 1)
	adc	a, #0xff
	ld	(#_scroll_x_max + 1),a
;/tmp/_gbsbuild/src/core/DataManager.c:66: image_height = image_tile_height * 8;
	ld	hl, #_image_tile_height
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ld	hl, #_image_height
	ld	(hl), c
	inc	hl
;/tmp/_gbsbuild/src/core/DataManager.c:67: scroll_y_max = image_height - ((UINT16)SCREENHEIGHT);
	ld	(hl-), a
	ld	a, (hl)
	add	a, #0x70
	ld	(#_scroll_y_max),a
	ld	a, (#_image_height + 1)
	adc	a, #0xff
	ld	(#_scroll_y_max + 1),a
;/tmp/_gbsbuild/src/core/DataManager.c:70: POP_BANK;
;/tmp/_gbsbuild/src/core/DataManager.c:71: }
	jp  _PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:73: void LoadImageAttr(UINT16 index) {
;	---------------------------------
; Function LoadImageAttr
; ---------------------------------
_LoadImageAttr::
;/tmp/_gbsbuild/src/core/DataManager.c:74: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:75: image_attr_bank = background_attr_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_background_attr_bank_ptrs
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#_image_attr_bank),a
;/tmp/_gbsbuild/src/core/DataManager.c:77: (unsigned char*)(background_attr_bank_ptrs[index].offset + (BankDataPtr(image_attr_bank)));
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	hl, #_image_attr_ptr
	ld	(hl), b
	ld	a, c
	add	a, #0x40
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/DataManager.c:78: POP_BANK;
;/tmp/_gbsbuild/src/core/DataManager.c:79: }
	jp  _PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:81: void LoadPalette(UINT16 index) {
;	---------------------------------
; Function LoadPalette
; ---------------------------------
_LoadPalette::
;/tmp/_gbsbuild/src/core/DataManager.c:85: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:86: bank = palette_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_palette_bank_ptrs
	add	hl,bc
;/tmp/_gbsbuild/src/core/DataManager.c:87: data_ptr = (UBYTE*)(palette_bank_ptrs[index].offset + (BankDataPtr(bank)));
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	c, (hl)
	ld	e, a
	ld	a, c
	add	a, #0x40
	ld	d, a
;/tmp/_gbsbuild/src/core/DataManager.c:88: POP_BANK;
	push	bc
	push	de
	call	_PopBank
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:90: PUSH_BANK(bank);
	push	de
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:92: memcpy(BkgPalette, data_ptr, 48);
	ld	c, e
	ld	b, d
;/tmp/_gbsbuild/src/core/DataManager.c:91: if (palette_update_mask == 0x3F) {
	ld	a, (#_palette_update_mask)
	sub	a, #0x3f
	jr	NZ, 00114$
;/tmp/_gbsbuild/src/core/DataManager.c:92: memcpy(BkgPalette, data_ptr, 48);
	ld	hl, #0x0030
	push	hl
	push	bc
	ld	hl, #_BkgPalette
	push	hl
	call	_memcpy
	add	sp, #6
	jp	_PopBank
00114$:
;/tmp/_gbsbuild/src/core/DataManager.c:94: if (palette_update_mask & 0x1) {
	ld	a, (#_palette_update_mask)
	rrca
	jr	NC, 00102$
;/tmp/_gbsbuild/src/core/DataManager.c:95: memcpy(BkgPalette, data_ptr, 8);
	push	de
	ld	hl, #0x0008
	push	hl
	push	bc
	ld	hl, #_BkgPalette
	push	hl
	call	_memcpy
	add	sp, #6
	pop	de
00102$:
;/tmp/_gbsbuild/src/core/DataManager.c:97: if (palette_update_mask & 0x2) {
	ld	a, (#_palette_update_mask)
	bit	1, a
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/DataManager.c:98: memcpy(BkgPalette + 4, data_ptr + 8, 8);
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #0x0008
	push	hl
	push	bc
	ld	hl, #(_BkgPalette + 0x0008)
	push	hl
	call	_memcpy
	add	sp, #6
	pop	de
00104$:
;/tmp/_gbsbuild/src/core/DataManager.c:100: if (palette_update_mask & 0x4) {
	ld	a, (#_palette_update_mask)
	bit	2, a
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/DataManager.c:101: memcpy(BkgPalette + 8, data_ptr + 16, 8);
	ld	hl, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #0x0008
	push	hl
	push	bc
	ld	hl, #(_BkgPalette + 0x0010)
	push	hl
	call	_memcpy
	add	sp, #6
	pop	de
00106$:
;/tmp/_gbsbuild/src/core/DataManager.c:103: if (palette_update_mask & 0x8) {
	ld	a, (#_palette_update_mask)
	bit	3, a
	jr	Z, 00108$
;/tmp/_gbsbuild/src/core/DataManager.c:104: memcpy(BkgPalette + 12, data_ptr + 24, 8);
	ld	hl, #0x0018
	add	hl, de
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #0x0008
	push	hl
	push	bc
	ld	hl, #(_BkgPalette + 0x0018)
	push	hl
	call	_memcpy
	add	sp, #6
	pop	de
00108$:
;/tmp/_gbsbuild/src/core/DataManager.c:106: if (palette_update_mask & 0x10) {
	ld	a, (#_palette_update_mask)
	bit	4, a
	jr	Z, 00110$
;/tmp/_gbsbuild/src/core/DataManager.c:107: memcpy(BkgPalette + 16, data_ptr + 32, 8);
	ld	hl, #0x0020
	add	hl, de
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #0x0008
	push	hl
	push	bc
	ld	hl, #(_BkgPalette + 0x0020)
	push	hl
	call	_memcpy
	add	sp, #6
	pop	de
00110$:
;/tmp/_gbsbuild/src/core/DataManager.c:109: if (palette_update_mask & 0x20) {
	ld	a, (#_palette_update_mask)
	bit	5, a
	jp	Z,_PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:110: memcpy(BkgPalette + 20, data_ptr + 40, 8);
	ld	hl, #0x0028
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0008
	push	hl
	push	bc
	ld	hl, #(_BkgPalette + 0x0028)
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/DataManager.c:112: }  POP_BANK;
;/tmp/_gbsbuild/src/core/DataManager.c:113: }
	jp  _PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:115: void LoadUIPalette(UINT16 index) {
;	---------------------------------
; Function LoadUIPalette
; ---------------------------------
_LoadUIPalette::
;/tmp/_gbsbuild/src/core/DataManager.c:119: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:120: bank = palette_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_palette_bank_ptrs
	add	hl,bc
;/tmp/_gbsbuild/src/core/DataManager.c:121: data_ptr = (UBYTE*)(palette_bank_ptrs[index].offset + (BankDataPtr(bank)));
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	c, (hl)
	ld	e, a
	ld	a, c
	add	a, #0x40
	ld	d, a
;/tmp/_gbsbuild/src/core/DataManager.c:122: POP_BANK;
	push	bc
	push	de
	call	_PopBank
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:124: PUSH_BANK(bank);
	push	de
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:125: memcpy(BkgPalette + UI_PALETTE_OFFSET, data_ptr, 8);
	ld	hl, #0x0008
	push	hl
	push	de
	ld	hl, #(_BkgPalette + 0x0038)
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/DataManager.c:126: POP_BANK;
;/tmp/_gbsbuild/src/core/DataManager.c:127: }
	jp  _PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:129: void LoadSpritePalette(UINT16 index) {
;	---------------------------------
; Function LoadSpritePalette
; ---------------------------------
_LoadSpritePalette::
;/tmp/_gbsbuild/src/core/DataManager.c:133: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:134: bank = palette_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_palette_bank_ptrs
	add	hl,bc
;/tmp/_gbsbuild/src/core/DataManager.c:135: data_ptr = (UBYTE*)(palette_bank_ptrs[index].offset + (BankDataPtr(bank)));
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	c, (hl)
	ld	e, a
	ld	a, c
	add	a, #0x40
	ld	d, a
;/tmp/_gbsbuild/src/core/DataManager.c:136: POP_BANK;
	push	bc
	push	de
	call	_PopBank
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:138: PUSH_BANK(bank);
	push	de
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:139: memcpy(SprPalette, data_ptr, 56);
	ld	hl, #0x0038
	push	hl
	push	de
	ld	hl, #_SprPalette
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/DataManager.c:140: POP_BANK;
;/tmp/_gbsbuild/src/core/DataManager.c:141: }
	jp  _PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:143: void LoadPlayerSpritePalette(UINT16 index) {
;	---------------------------------
; Function LoadPlayerSpritePalette
; ---------------------------------
_LoadPlayerSpritePalette::
;/tmp/_gbsbuild/src/core/DataManager.c:147: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:148: bank = palette_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_palette_bank_ptrs
	add	hl,bc
;/tmp/_gbsbuild/src/core/DataManager.c:149: data_ptr = (UBYTE*)(palette_bank_ptrs[index].offset + (BankDataPtr(bank)));
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	c, (hl)
	ld	e, a
	ld	a, c
	add	a, #0x40
	ld	d, a
;/tmp/_gbsbuild/src/core/DataManager.c:150: POP_BANK;
	push	bc
	push	de
	call	_PopBank
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:152: PUSH_BANK(bank);
	push	de
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:153: memcpy(SprPalette + PLAYER_PALETTE_OFFSET, data_ptr, 8);
	ld	hl, #0x0008
	push	hl
	push	de
	ld	hl, #(_SprPalette + 0x0038)
	push	hl
	call	_memcpy
	add	sp, #6
;/tmp/_gbsbuild/src/core/DataManager.c:154: POP_BANK;
;/tmp/_gbsbuild/src/core/DataManager.c:155: }
	jp  _PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:157: UBYTE LoadSprite(UINT16 index, UBYTE sprite_offset) {
;	---------------------------------
; Function LoadSprite
; ---------------------------------
_LoadSprite::
;/tmp/_gbsbuild/src/core/DataManager.c:161: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:162: bank = sprite_bank_ptrs[index].bank;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	bc,#_sprite_bank_ptrs
	add	hl,bc
;/tmp/_gbsbuild/src/core/DataManager.c:163: data_ptr = (UBYTE*)(sprite_bank_ptrs[index].offset + (BankDataPtr(bank)));
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	c, (hl)
	ld	e, a
	ld	a, c
	add	a, #0x40
	ld	d, a
;/tmp/_gbsbuild/src/core/DataManager.c:164: POP_BANK;
	push	bc
	push	de
	call	_PopBank
	pop	de
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:166: PUSH_BANK(bank);
	push	de
	push	bc
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:167: sprite_frames = *(data_ptr++);
	ld	a, (de)
	ld	c, a
	inc	de
;/tmp/_gbsbuild/src/core/DataManager.c:168: size = sprite_frames * 4;
	ld	a, c
	add	a, a
	add	a, a
	ld	b, a
;/tmp/_gbsbuild/src/core/DataManager.c:170: if (sprite_offset == 0 && sprite_frames > 6) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	ld	a, #0x06
	sub	a, c
	jr	NC, 00102$
;/tmp/_gbsbuild/src/core/DataManager.c:171: load_size = MAX_PLAYER_SPRITE_SIZE;
	ld	a, #0x18
	jr	00103$
00102$:
;/tmp/_gbsbuild/src/core/DataManager.c:173: load_size = size;
	ld	a, b
00103$:
;/tmp/_gbsbuild/src/core/DataManager.c:176: set_sprite_data(sprite_offset, load_size, data_ptr);
	push	de
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;/tmp/_gbsbuild/src/core/DataManager.c:177: POP_BANK;
	push	bc
	call	_PopBank
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:179: return size;
	ld	e, b
;/tmp/_gbsbuild/src/core/DataManager.c:180: }
	ret
;/tmp/_gbsbuild/src/core/DataManager.c:182: void LoadScene(UINT16 index) {
;	---------------------------------
; Function LoadScene
; ---------------------------------
_LoadScene::
	add	sp, #-10
;/tmp/_gbsbuild/src/core/DataManager.c:186: PUSH_BANK(DATA_PTRS_BANK);
	ld	a, #0x05
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:187: bank = scene_bank_ptrs[index].bank;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scene_bank_ptrs
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
;/tmp/_gbsbuild/src/core/DataManager.c:188: data_ptr = (scene_bank_ptrs[index].offset + (BankDataPtr(bank)));
	ld	l, e
	ld	h, d
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x4000
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;/tmp/_gbsbuild/src/core/DataManager.c:190: collision_bank = collision_bank_ptrs[index].bank;
	ld	hl, #_collision_bank_ptrs
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#_collision_bank),a
;/tmp/_gbsbuild/src/core/DataManager.c:192: (unsigned char*)(collision_bank_ptrs[index].offset + (BankDataPtr(collision_bank)));
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	hl, #_collision_ptr
	ld	(hl), b
	ld	a, c
	add	a, #0x40
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/DataManager.c:193: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:195: SpritePoolReset();
	call	_SpritePoolReset
;/tmp/_gbsbuild/src/core/DataManager.c:196: ScriptCtxPoolReset();
	call	_ScriptCtxPoolReset
;/tmp/_gbsbuild/src/core/DataManager.c:198: PUSH_BANK(bank);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/DataManager.c:199: LoadImage((*(data_ptr++) * 256) + *(data_ptr++));
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	c, #0x00
	ld	a, (de)
	inc	de
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	push	de
	push	hl
	call	_LoadImage
	add	sp, #2
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_LoadImageAttr
	add	sp, #2
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:201: LoadPalette((*(data_ptr++) * 256) + *(data_ptr++));
	ld	a, (de)
	ld	c, a
	inc	de
	ld	b, c
	ld	c, #0x00
	ld	a, (de)
	inc	de
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	push	de
	push	hl
	call	_LoadPalette
	add	sp, #2
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:202: LoadSpritePalette((*(data_ptr++) * 256) + *(data_ptr++));
	ld	a, (de)
	ld	c, a
	inc	de
	ld	b, c
	ld	c, #0x00
	ld	a, (de)
	inc	de
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	push	de
	push	hl
	call	_LoadSpritePalette
	add	sp, #2
	ld	hl, #0x0000
	push	hl
	call	_LoadPlayerSpritePalette
	add	sp, #2
	ld	hl, #0x0001
	push	hl
	call	_LoadUIPalette
	add	sp, #2
	call	_UIReset
	call	_RemoveInputScripts
	call	_ProjectilesInit
	call	_InitPlayer
	pop	de
;/tmp/_gbsbuild/src/core/DataManager.c:211: scene_type = (*(data_ptr++)) + 1;
	ld	a, (de)
	inc	de
	inc	a
	ld	(#_scene_type),a
;/tmp/_gbsbuild/src/core/DataManager.c:212: sprites_len = (*(data_ptr++)) + 1;
	ld	a, (de)
	inc	de
	inc	a
	ld	(#_sprites_len),a
;/tmp/_gbsbuild/src/core/DataManager.c:213: actors_len = (*(data_ptr++)) + 1;
	ld	a, (de)
	inc	de
	inc	a
	ld	(#_actors_len),a
;/tmp/_gbsbuild/src/core/DataManager.c:214: triggers_len = *(data_ptr++);
	ld	a, (de)
	ld	(#_triggers_len),a
	inc	de
;/tmp/_gbsbuild/src/core/DataManager.c:216: scene_events_start_ptr.bank = *(data_ptr++);
	ld	bc, #_scene_events_start_ptr+0
	ld	a, (de)
	inc	de
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:217: scene_events_start_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
	ld	a, (de)
	inc	de
	ld	c, a
	ld	b, #0x00
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	inc	de
	inc	sp
	inc	sp
	push	de
	ld	e, (hl)
	ld	a, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	hl, #(_scene_events_start_ptr + 0x0001)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/DataManager.c:220: k = 24;
	ldhl	sp,	#8
;/tmp/_gbsbuild/src/core/DataManager.c:221: for (i = 1; i != sprites_len; i++) {
	ld	a, #0x18
	ld	(hl+), a
	ld	(hl), #0x01
00114$:
	ld	a, (#_sprites_len)
	ldhl	sp,	#9
	sub	a, (hl)
	jp	Z,00107$
;/tmp/_gbsbuild/src/core/DataManager.c:222: UBYTE sprite_len = LoadSprite((*(data_ptr++) * 256) + *(data_ptr++), k);
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	inc	de
	ld	c, #0x00
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	inc	de
	inc	sp
	inc	sp
	push	de
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_LoadSprite
	add	sp, #3
	ldhl	sp,	#2
	ld	(hl), e
;/tmp/_gbsbuild/src/core/DataManager.c:223: sprites_info[i].sprite_offset = DIV_4(k);
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_sprites_info)
	ld	c, a
	ld	a, h
	adc	a, #>(_sprites_info)
	ld	b, a
	ldhl	sp,	#8
	ld	a, (hl)
	rrca
	rrca
	and	a, #0x3f
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:224: sprites_info[i].frames_len = DIV_4(sprite_len);
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	rrca
	rrca
	and	a, #0x3f
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:226: sprites_info[i].sprite_type = SPRITE_ACTOR_ANIMATED;
	inc	bc
	inc	bc
	inc	hl
	ld	a, c
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/DataManager.c:225: if (sprites_info[i].frames_len == 6) {
	ld	a, b
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00105$
;/tmp/_gbsbuild/src/core/DataManager.c:226: sprites_info[i].sprite_type = SPRITE_ACTOR_ANIMATED;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
;/tmp/_gbsbuild/src/core/DataManager.c:227: sprites_info[i].frames_len = 2;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
	jr	00106$
00105$:
;/tmp/_gbsbuild/src/core/DataManager.c:228: } else if (sprites_info[i].frames_len == 3) {
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x03
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/DataManager.c:229: sprites_info[i].sprite_type = SPRITE_ACTOR;
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/DataManager.c:230: sprites_info[i].frames_len = 1;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	jr	00106$
00102$:
;/tmp/_gbsbuild/src/core/DataManager.c:232: sprites_info[i].sprite_type = SPRITE_STATIC;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00106$:
;/tmp/_gbsbuild/src/core/DataManager.c:234: k += sprite_len;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	add	a, (hl)
	ldhl	sp,	#8
;/tmp/_gbsbuild/src/core/DataManager.c:221: for (i = 1; i != sprites_len; i++) {
	ld	(hl+), a
	inc	(hl)
	jp	00114$
00107$:
;/tmp/_gbsbuild/src/core/DataManager.c:238: for (i = 1; i != actors_len; i++) {
	ldhl	sp,	#9
	ld	(hl), #0x01
00117$:
	ld	a, (#_actors_len)
	ldhl	sp,	#9
	sub	a, (hl)
	jp	Z,00108$
;/tmp/_gbsbuild/src/core/DataManager.c:241: actors[i].sprite = *(data_ptr++);
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_actors
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	pop	bc
	push	bc
	inc	bc
	dec	hl
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;/tmp/_gbsbuild/src/core/DataManager.c:242: actors[i].palette_index = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:243: actors[i].enabled = TRUE;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/DataManager.c:244: actors[i].moving = FALSE;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:245: actors[i].sprite_type = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0019
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:246: actors[i].frames_len = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:247: actors[i].animate = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0011
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (bc)
	inc	hl
	ld	(hl), a
	inc	bc
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:248: actors[i].frame = actors[i].animate >> 1;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	srl	a
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:249: actors[i].animate = actors[i].animate & 0x1;
	ld	a, (hl)
	and	a, #0x01
	dec	hl
	dec	hl
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;/tmp/_gbsbuild/src/core/DataManager.c:250: actors[i].pos.x = *(data_ptr++) * 8;
	ld	a, (bc)
	ld	e, a
	inc	bc
	xor	a, a
	sla	e
	adc	a, a
	sla	e
	adc	a, a
	sla	e
	adc	a, a
	ldhl	sp,	#2
	ld	(hl), e
	inc	hl
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:251: actors[i].pos.y = *(data_ptr++) * 8;
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	a, (bc)
	inc	hl
	ld	(hl), a
	inc	bc
	inc	hl
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	dec	hl
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:252: actors[i].start_pos.x = actors[i].pos.x;
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:253: actors[i].start_pos.y = actors[i].pos.y;
;c
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:255: j = *(data_ptr++);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	push	hl
;/tmp/_gbsbuild/src/core/DataManager.c:256: actors[i].dir.x = j == 2 ? -1 : j == 4 ? 1 : 0;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00127$
	ld	de, #0xffff
	jr	00128$
00127$:
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00129$
	ld	de, #0x0001
	jr	00130$
00129$:
	ld	de, #0x0000
00130$:
00128$:
	ld	b, e
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/DataManager.c:257: actors[i].dir.y = j == 8 ? -1 : j == 1 ? 1 : 0;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00131$
	ld	bc, #0xffff
	jr	00132$
00131$:
	dec	c
	jr	NZ, 00133$
	ldhl	sp,	#7
	ld	(hl), #0x01
	xor	a, a
	inc	hl
	ld	(hl), a
	jr	00134$
00133$:
	xor	a, a
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), a
00134$:
	ldhl	sp,#7
	ld	a, (hl+)
	ld	c, a
00132$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;/tmp/_gbsbuild/src/core/DataManager.c:259: actors[i].move_speed = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	pop	de
	push	de
	ld	a, (de)
	pop	de
	push	de
	inc	de
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:260: actors[i].anim_speed = *(data_ptr++);
	push	de
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0015
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (de)
	inc	de
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:261: actors[i].pinned = *(data_ptr++);
	push	de
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0016
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	inc	de
	inc	hl
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:262: actors[i].collision_group = actors[i].pinned >> 1;
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0018
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (hl)
	srl	a
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:263: actors[i].pinned = actors[i].pinned & 0x1;
	ld	a, (hl)
	and	a, #0x01
	ld	e, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:265: actors[i].collisionsEnabled = !actors[i].pinned;
	push	de
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0017
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:267: actors[i].events_ptr.bank = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:268: actors[i].events_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
	push	de
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001f
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ld	a, (de)
	ld	c, e
	ld	b, d
	inc	bc
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	inc	bc
;c
	ld	d, a
	ld	e, #0x00
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
	ld	(hl), a
	pop	de
	push	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:270: actors[i].movement_ptr.bank = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0021
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:271: actors[i].movement_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0022
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	a, (bc)
	inc	bc
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	inc	bc
;c
	ld	d, a
	ld	e, #0x00
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
	ld	(hl), a
	pop	de
	push	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:273: actors[i].hit_1_ptr.bank = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0024
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:274: actors[i].hit_1_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0025
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	a, (bc)
	inc	bc
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	inc	bc
;c
	ld	d, a
	ld	e, #0x00
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
	ld	(hl), a
	pop	de
	push	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:276: actors[i].hit_2_ptr.bank = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0027
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:277: actors[i].hit_2_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0028
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	a, (bc)
	inc	bc
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	inc	bc
;c
	ld	d, a
	ld	e, #0x00
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
	ld	(hl), a
	pop	de
	push	de
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:279: actors[i].hit_3_ptr.bank = *(data_ptr++);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x002a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:280: actors[i].hit_3_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x002b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	inc	hl
	ld	(hl), a
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	b, (hl)
	ld	c, #0x00
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:282: actors[i].movement_ctx = 0;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x002d
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:283: actors[i].script_control = FALSE;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001b
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/DataManager.c:238: for (i = 1; i != actors_len; i++) {
	ldhl	sp,	#9
	inc	(hl)
	jp	00117$
00108$:
;/tmp/_gbsbuild/src/core/DataManager.c:286: actors_active[0] = 0;
	ld	hl, #_actors_active
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/DataManager.c:287: actors_active_size = 1;
	ld	hl, #_actors_active_size
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/DataManager.c:290: for (i = 0; i != triggers_len; i++) {
	xor	a, a
	ldhl	sp,	#9
	ld	(hl), a
00120$:
;/tmp/_gbsbuild/src/core/DataManager.c:199: LoadImage((*(data_ptr++) * 256) + *(data_ptr++));
	pop	bc
	push	bc
	inc	bc
;/tmp/_gbsbuild/src/core/DataManager.c:290: for (i = 0; i != triggers_len; i++) {
	ld	a, (#_triggers_len)
	ldhl	sp,	#9
	sub	a, (hl)
	jp	Z,00109$
;/tmp/_gbsbuild/src/core/DataManager.c:291: triggers[i].x = *(data_ptr++);
	ldhl	sp,	#9
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_triggers
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	dec	hl
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;/tmp/_gbsbuild/src/core/DataManager.c:292: triggers[i].y = *(data_ptr++);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:293: triggers[i].w = *(data_ptr++);
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:294: triggers[i].h = *(data_ptr++);
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:295: data_ptr++;  // Trigger type
	inc	bc
;/tmp/_gbsbuild/src/core/DataManager.c:296: triggers[i].events_ptr.bank = *(data_ptr++);
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	inc	bc
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:297: triggers[i].events_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	d, #0x00
	ld	a, (bc)
	inc	hl
	ld	(hl), a
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	b, (hl)
	ld	a, #0x00
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/DataManager.c:290: for (i = 0; i != triggers_len; i++) {
	ldhl	sp,	#9
	inc	(hl)
	jp	00120$
00109$:
;/tmp/_gbsbuild/src/core/DataManager.c:302: InitScroll();
	push	bc
	call	_InitScroll
	pop	bc
;/tmp/_gbsbuild/src/core/DataManager.c:305: last_trigger_tx = 0xFF;
	ld	hl, #_last_trigger_tx
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/DataManager.c:306: last_trigger_ty = 0xFF;
	ld	hl, #_last_trigger_ty
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/DataManager.c:308: player.hit_1_ptr.bank = *(data_ptr++);
	pop	de
	push	de
	ld	a, (de)
	ld	(#(_actors + 0x0024)),a
;/tmp/_gbsbuild/src/core/DataManager.c:309: player.hit_1_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
	ld	a, (bc)
	inc	bc
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	inc	bc
;c
	ld	d, a
	ld	e, #0x00
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ld	de, #(_actors + 0x0025)
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:311: player.hit_2_ptr.bank = *(data_ptr++);
	ld	a, (bc)
	inc	bc
	ld	(#(_actors + 0x0027)),a
;/tmp/_gbsbuild/src/core/DataManager.c:312: player.hit_2_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
	ld	a, (bc)
	inc	bc
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	inc	bc
;c
	ld	d, a
	ld	e, #0x00
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ld	de, #(_actors + 0x0028)
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/DataManager.c:314: player.hit_3_ptr.bank = *(data_ptr++);
	ld	a, (bc)
	inc	bc
	ld	(#(_actors + 0x002a)),a
;/tmp/_gbsbuild/src/core/DataManager.c:315: player.hit_3_ptr.offset = *(data_ptr++) + (*(data_ptr++) * 256);
	ld	a, (bc)
	inc	bc
	ld	e, a
	ld	d, #0x00
	ld	a, (bc)
	ld	l, a
	ld	a, #0x00
	add	a, e
	ld	c, a
	ld	a, l
	adc	a, d
	ld	b, a
	ld	hl, #(_actors + 0x002b)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/DataManager.c:318: for (i = 1; i != actors_len; i++) {
	ld	b, #0x01
00123$:
	ld	a, (#_actors_len)
	sub	a, b
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/DataManager.c:319: if (actors[i].pinned) {
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_actors
	add	hl, de
	ld	de, #0x0016
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00124$
;/tmp/_gbsbuild/src/core/DataManager.c:320: ActivateActor(i);
	push	bc
	push	bc
	inc	sp
	call	_ActivateActor
	inc	sp
	pop	bc
00124$:
;/tmp/_gbsbuild/src/core/DataManager.c:318: for (i = 1; i != actors_len; i++) {
	inc	b
	jr	00123$
00112$:
;/tmp/_gbsbuild/src/core/DataManager.c:324: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/DataManager.c:325: }
	add	sp, #10
	ret
	.area _CODE
	.area _CABS (ABS)
