;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module Core_Main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _lcd_update
	.globl _vbl_update
	.globl _gbt_enable_channels
	.globl b_RefreshScroll_b
	.globl _RefreshScroll_b
	.globl _RefreshScroll
	.globl _ScriptRestoreCtx
	.globl _ScriptTimerUpdate
	.globl _ScriptStart
	.globl _ScriptRunnerInit
	.globl b_UpdateProjectiles_b
	.globl _UpdateProjectiles_b
	.globl _MusicUpdate
	.globl _HandleInputScripts
	.globl b_UIOnInteract_b
	.globl _UIOnInteract_b
	.globl b_UIUpdate_b
	.globl _UIUpdate_b
	.globl _UIUpdate
	.globl _UIInit
	.globl _FadeUpdate
	.globl _FadeOut
	.globl _FadeIn
	.globl _FadeInit
	.globl _LoadScene
	.globl _UpdateCamera
	.globl _PopBank
	.globl _PushBank
	.globl _ActorRunCollisionScripts
	.globl _UpdateActors
	.globl _ActorsInit
	.globl _initrand
	.globl _memset
	.globl _display_off
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _enable_interrupts
	.globl _joypad
	.globl _add_TIM
	.globl _add_LCD
	.globl _add_VBL
	.globl _cpu_fast
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _music_mute_frames
	.globl _old_scroll_y
	.globl _old_scroll_x
	.globl _vbl_count
	.globl _state_running
	.globl _current_state
	.globl _delta_time
	.globl _next_state
	.globl _seedRand
	.globl _game_time
	.globl _SetScene
	.globl _core_start
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_game_time::
	.ds 1
_seedRand::
	.ds 1
_next_state::
	.ds 2
_delta_time::
	.ds 1
_current_state::
	.ds 2
_state_running::
	.ds 1
_vbl_count::
	.ds 1
_old_scroll_x::
	.ds 2
_old_scroll_y::
	.ds 2
_music_mute_frames::
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
;/tmp/_gbsbuild/src/core/Core_Main.c:25: UBYTE game_time = 0;
	ld	hl, #_game_time
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:26: UBYTE seedRand = 2;
	ld	hl, #_seedRand
	ld	(hl), #0x02
;/tmp/_gbsbuild/src/core/Core_Main.c:30: UINT8 state_running = 0;
	ld	hl, #_state_running
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:31: UINT8 vbl_count = 0;
	ld	hl, #_vbl_count
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:33: UINT8 music_mute_frames = 0;
	ld	hl, #_music_mute_frames
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
;/tmp/_gbsbuild/src/core/Core_Main.c:37: void SetScene(UINT16 state) {
;	---------------------------------
; Function SetScene
; ---------------------------------
_SetScene::
;/tmp/_gbsbuild/src/core/Core_Main.c:38: state_running = 0;
	ld	hl, #_state_running
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:39: next_state = state;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_next_state
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Core_Main.c:40: }
	ret
;/tmp/_gbsbuild/src/core/Core_Main.c:42: void vbl_update() {
;	---------------------------------
; Function vbl_update
; ---------------------------------
_vbl_update::
;/tmp/_gbsbuild/src/core/Core_Main.c:43: vbl_count++;
	ld	hl, #_vbl_count
	inc	(hl)
;/tmp/_gbsbuild/src/core/Core_Main.c:47: SCX_REG = draw_scroll_x;
	ld	a, (#_draw_scroll_x)
	ldh	(_SCX_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:48: SCY_REG = draw_scroll_y;
	ld	a, (#_draw_scroll_y)
	ldh	(_SCY_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:51: if (palette_dirty) {
	ld	a, (#_palette_dirty)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/Core_Main.c:52: set_bkg_palette(0, 8, BkgPaletteBuffer);
	ld	hl, #_BkgPaletteBuffer
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
;/tmp/_gbsbuild/src/core/Core_Main.c:53: set_sprite_palette(0, 8, SprPaletteBuffer);
	ld	hl, #_SprPaletteBuffer
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_palette
	add	sp, #4
;/tmp/_gbsbuild/src/core/Core_Main.c:54: palette_dirty = FALSE;
	ld	hl, #_palette_dirty
	ld	(hl), #0x00
00102$:
;/tmp/_gbsbuild/src/core/Core_Main.c:58: if (music_mute_frames != 0) {
	ld	hl, #_music_mute_frames
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/Core_Main.c:59: music_mute_frames--;
;/tmp/_gbsbuild/src/core/Core_Main.c:60: if (music_mute_frames == 0) {
	dec	(hl)
	ld	a, (hl)
	jr	NZ, 00106$
;/tmp/_gbsbuild/src/core/Core_Main.c:61: gbt_enable_channels(0xF);
	ld	a, #0x0f
	push	af
	inc	sp
	call	_gbt_enable_channels
	inc	sp
00106$:
;/tmp/_gbsbuild/src/core/Core_Main.c:65: if (!hide_sprites) {
	ld	a, (#_hide_sprites)
	or	a, a
	ret	NZ
;/tmp/_gbsbuild/src/core/Core_Main.c:66: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:68: }
	ret
;/tmp/_gbsbuild/src/core/Core_Main.c:70: void lcd_update() {
;	---------------------------------
; Function lcd_update
; ---------------------------------
_lcd_update::
;/tmp/_gbsbuild/src/core/Core_Main.c:71: if (LYC_REG == 0x0) {
	ld	a, (#_LYC_REG)
	or	a, a
	jr	NZ, 00108$
;/tmp/_gbsbuild/src/core/Core_Main.c:72: if(WY_REG == 0x0) {
	ld	a, (#_WY_REG)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/Core_Main.c:73: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
00102$:
;/tmp/_gbsbuild/src/core/Core_Main.c:79: if (WY_REG != MENU_CLOSED_Y) {
	ldh	a, (_WY_REG+0)
	sub	a, #0x90
	ret	Z
;/tmp/_gbsbuild/src/core/Core_Main.c:80: LYC_REG = WY_REG;
	ldh	a, (_WY_REG+0)
	ldh	(_LYC_REG+0),a
	ret
00108$:
;/tmp/_gbsbuild/src/core/Core_Main.c:82: } else if (WX_REG == WIN_LEFT_X) {
	ldh	a, (_WX_REG+0)
	sub	a, #0x07
	ret	NZ
;/tmp/_gbsbuild/src/core/Core_Main.c:85: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:86: LYC_REG = 0x0;
	ld	a, #0x00
	ldh	(_LYC_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:88: }
	ret
;/tmp/_gbsbuild/src/core/Core_Main.c:90: int core_start() {
;	---------------------------------
; Function core_start
; ---------------------------------
_core_start::
;/tmp/_gbsbuild/src/core/Core_Main.c:93: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/Core_Main.c:94: cpu_fast();
	call	_cpu_fast
00102$:
;/tmp/_gbsbuild/src/core/Core_Main.c:98: display_off();
	call	_display_off
;/tmp/_gbsbuild/src/core/Core_Main.c:101: LCDC_REG = 0x67;
	ld	a, #0x67
	ldh	(_LCDC_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:104: add_VBL(vbl_update);
	ld	hl, #_vbl_update
	push	hl
	call	_add_VBL
	add	sp, #2
;/tmp/_gbsbuild/src/core/Core_Main.c:105: add_TIM(MusicUpdate);
	ld	hl, #_MusicUpdate
	push	hl
	call	_add_TIM
	add	sp, #2
;/tmp/_gbsbuild/src/core/Core_Main.c:106: add_LCD(lcd_update);
	ld	hl, #_lcd_update
	push	hl
	call	_add_LCD
	add	sp, #2
;/tmp/_gbsbuild/src/core/Core_Main.c:109: TMA_REG = _cpu == CGB_TYPE ? 120U : 0xBCU;
	ld	a, (#__cpu)
	sub	a, #0x11
	jr	NZ, 00139$
	ld	bc, #0x0078
	jr	00140$
00139$:
	ld	bc, #0x00bc
00140$:
	ld	a, c
	ldh	(_TMA_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:113: TAC_REG = 0x04U;
	ld	a, #0x04
	ldh	(_TAC_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:115: LYC_REG = 0x0;  // LCD interupt pos
	ld	a, #0x00
	ldh	(_LYC_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:117: set_interrupts(VBL_IFLAG | TIM_IFLAG | LCD_IFLAG);
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:118: enable_interrupts();
	call	_enable_interrupts
;/tmp/_gbsbuild/src/core/Core_Main.c:120: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:123: BGP_REG = OBP0_REG = 0xE4U;
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:124: OBP1_REG = 0xD2U;
	ld	a, #0xd2
	ldh	(_OBP1_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:126: SCX_REG = 0;
	ld	a, #0x00
	ldh	(_SCX_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:127: SCY_REG = 0;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:130: WX_REG = 7;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:131: WY_REG = MAXWNDPOSY + 1U;
	ld	a, #0x90
	ldh	(_WY_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:134: memset(&script_variables, 0, sizeof(script_variables));
	ld	hl, #0x01f4
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_script_variables
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:136: memset(&input_script_ptrs, 0, sizeof(input_script_ptrs));
	ld	hl, #0x0018
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_input_script_ptrs
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:138: memset(&scene_stack, 0, sizeof(scene_stack));
	ld	hl, #0x0008
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_scene_stack
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:139: memset(&script_cmd_args, 0, sizeof(script_cmd_args));
	ld	hl, #0x0007
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_script_cmd_args
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:140: memset(&script_stack, 0, sizeof(script_stack));
	ld	hl, #0x0010
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_script_stack
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:141: memset(&script_bank_stack, 0, sizeof(script_bank_stack));
	ld	hl, #0x0008
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_script_bank_stack
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:142: memset(&script_start_stack, 0, sizeof(script_bank_stack));
	ld	hl, #0x0008
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_script_start_stack
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:144: memset(&actors, 0, sizeof(actors));
	ld	hl, #0x0592
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_actors
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:145: memset(&active_script_ctx, 0, sizeof(active_script_ctx));
	ld	hl, #0x0018
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_active_script_ctx
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:146: memset(&script_ctxs, 0, sizeof(script_ctxs));
	ld	hl, #0x0120
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #_script_ctxs
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:148: memset(&SprPalette, 0, sizeof(SprPalette));
	ld	hl, #0x0040
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_SprPalette
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:149: memset(&BkgPalette, 0, sizeof(BkgPalette));
	ld	hl, #0x0040
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_BkgPalette
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:150: memset(&SprPaletteBuffer, 0, sizeof(SprPaletteBuffer));
	ld	hl, #0x0040
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_SprPaletteBuffer
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:151: memset(&BkgPaletteBuffer, 0, sizeof(BkgPaletteBuffer));
	ld	hl, #0x0040
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_BkgPaletteBuffer
	push	hl
	call	_memset
	add	sp, #6
;/tmp/_gbsbuild/src/core/Core_Main.c:154: player.sprite = 0;
	ld	hl, #(_actors + 0x0008)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:155: player.moving = TRUE;
	ld	hl, #(_actors + 0x0007)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Core_Main.c:156: player.frame = 0;
	ld	hl, #(_actors + 0x000f)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:157: player.frames_len = 2;
	ld	hl, #(_actors + 0x0010)
	ld	(hl), #0x02
;/tmp/_gbsbuild/src/core/Core_Main.c:158: map_next_pos.x = start_scene_x;
	ld	de, #_map_next_pos
	ld	hl, #_start_scene_x
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Core_Main.c:159: map_next_pos.y = start_scene_y;
	ld	de, #(_map_next_pos + 0x0002)
	ld	hl, #_start_scene_y
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Core_Main.c:160: map_next_dir.x = player.dir.x = start_scene_dir_x;
	ld	de, #(_actors + 0x0005)
	ld	hl, #_start_scene_dir_x
	ld	a, (hl)
	ld	(de), a
	ld	de, #_map_next_dir
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Core_Main.c:161: map_next_dir.y = player.dir.y = start_scene_dir_y;
	ld	de, #(_actors + 0x0006)
	ld	hl, #_start_scene_dir_y
	ld	a, (hl)
	ld	(de), a
	ld	de, #(_map_next_dir + 0x0001)
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Core_Main.c:162: map_next_sprite = start_player_sprite;
	ld	hl, #_start_player_sprite
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_map_next_sprite
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Core_Main.c:163: player.enabled = TRUE;
	ld	hl, #(_actors + 0x0012)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Core_Main.c:164: player.move_speed = start_player_move_speed;
	ld	de, #(_actors + 0x0004)
	ld	a, (#_start_player_move_speed)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Core_Main.c:165: player.anim_speed = start_player_anim_speed;
	ld	de, #(_actors + 0x0015)
	ld	a, (#_start_player_anim_speed)
	ld	(de), a
;/tmp/_gbsbuild/src/core/Core_Main.c:167: state_running = 0;
	ld	hl, #_state_running
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:168: next_state = start_scene_index;
	ld	hl, #_start_scene_index
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_next_state
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Core_Main.c:169: game_time = 0;
	ld	hl, #_game_time
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:170: scene_type = 0;
	ld	hl, #_scene_type
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:172: UIInit();
	call	_UIInit
;/tmp/_gbsbuild/src/core/Core_Main.c:173: FadeInit();
	call	_FadeInit
;/tmp/_gbsbuild/src/core/Core_Main.c:174: ScriptRunnerInit();
	call	_ScriptRunnerInit
;/tmp/_gbsbuild/src/core/Core_Main.c:175: ActorsInit();
	call	_ActorsInit
;/tmp/_gbsbuild/src/core/Core_Main.c:178: while (state_running) {
00121$:
	ld	a, (#_state_running)
	or	a, a
	jp	Z, 00123$
;/tmp/_gbsbuild/src/core/Core_Main.c:182: if (!vbl_count) {
	ld	a, (#_vbl_count)
	or	a, a
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/Core_Main.c:183: wait_vbl_done();
	call	_wait_vbl_done
00104$:
;/tmp/_gbsbuild/src/core/Core_Main.c:186: delta_time = vbl_count == 1u ? 0u : 1u;
	ld	a, (#_vbl_count)
	dec	a
	jr	NZ, 00141$
	ld	bc, #0x0000
	jr	00142$
00141$:
	ld	bc, #0x0001
00142$:
	ld	hl, #_delta_time
	ld	(hl), c
;/tmp/_gbsbuild/src/core/Core_Main.c:187: vbl_count = 0;
	ld	hl, #_vbl_count
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:189: last_joy = joy;
	ld	a, (#_joy)
	ld	(#_last_joy),a
;/tmp/_gbsbuild/src/core/Core_Main.c:190: joy = joypad();
	call	_joypad
	ld	hl, #_joy
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Core_Main.c:191: if ((joy & INPUT_DPAD) != (last_joy & INPUT_DPAD)) {
	ld	a, (hl)
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	hl, #_last_joy
	ld	a, (hl)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, c
	jr	NZ, 00244$
	ld	a, d
	sub	a, b
	jr	Z, 00106$
00244$:
;/tmp/_gbsbuild/src/core/Core_Main.c:192: recent_joy = joy & ~last_joy;
	ld	a, (hl)
	cpl
	ld	hl, #_joy
	and	a, (hl)
	ld	(#_recent_joy),a
00106$:
;/tmp/_gbsbuild/src/core/Core_Main.c:195: if (seedRand) {
	ld	hl, #_seedRand
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
;/tmp/_gbsbuild/src/core/Core_Main.c:196: if(seedRand == 2){
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/Core_Main.c:198: if (joy) {
	ld	a, (#_joy)
	or	a, a
	jr	Z, 00115$
;/tmp/_gbsbuild/src/core/Core_Main.c:199: seedRand--;
	ld	hl, #_seedRand
	dec	(hl)
;/tmp/_gbsbuild/src/core/Core_Main.c:200: initrand((DIV_REG*256)+game_time);
	ldh	a, (_DIV_REG+0)
	ld	b, a
	ld	c, #0x00
	ld	hl, #_game_time
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
	push	hl
	call	_initrand
	add	sp, #2
	jr	00115$
00112$:
;/tmp/_gbsbuild/src/core/Core_Main.c:204: if (!joy) {
	ld	a, (#_joy)
	or	a, a
	jr	NZ, 00115$
;/tmp/_gbsbuild/src/core/Core_Main.c:205: seedRand = FALSE;
	ld	hl, #_seedRand
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:206: initrand((DIV_REG*256)+game_time);
	ldh	a, (_DIV_REG+0)
	ld	b, a
	ld	c, #0x00
	ld	hl, #_game_time
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, bc
	push	hl
	call	_initrand
	add	sp, #2
00115$:
;/tmp/_gbsbuild/src/core/Core_Main.c:211: PUSH_BANK(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:213: UpdateCamera();
	call	_UpdateCamera
;/tmp/_gbsbuild/src/core/Core_Main.c:214: RefreshScroll_b();
	ld	e, #b_RefreshScroll_b
	ld	hl, #_RefreshScroll_b
	call	___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Core_Main.c:215: UpdateActors();
	call	_UpdateActors
;/tmp/_gbsbuild/src/core/Core_Main.c:216: UpdateProjectiles_b();
	ld	e, #b_UpdateProjectiles_b
	ld	hl, #_UpdateProjectiles_b
	call	___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Core_Main.c:217: UIOnInteract_b();
	ld	e, #b_UIOnInteract_b
	ld	hl, #_UIOnInteract_b
	call	___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Core_Main.c:218: UIUpdate_b();
	ld	e, #b_UIUpdate_b
	ld	hl, #_UIUpdate_b
	call	___sdcc_bcall_ehl
;/tmp/_gbsbuild/src/core/Core_Main.c:220: if (!script_ctxs[0].script_ptr_bank && !ui_block) {
	ld	a, (#(_script_ctxs + 0x000e) + 0)
	or	a, a
	jr	NZ, 00117$
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00117$
;/tmp/_gbsbuild/src/core/Core_Main.c:221: PUSH_BANK(stateBanks[scene_type]);
	ld	bc, #_stateBanks+0
	ld	a, c
	ld	hl, #_scene_type
	add	a, (hl)
	ld	c, a
	jr	NC, 00247$
	inc	b
00247$:
	ld	a, (bc)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:222: updateFuncs[scene_type]();
	ld	bc, #_updateFuncs+0
	ld	hl, #_scene_type
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	h, (hl)
	ld	l, c
	call	___sdcc_call_hl
;/tmp/_gbsbuild/src/core/Core_Main.c:223: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/Core_Main.c:224: HandleInputScripts();
	call	_HandleInputScripts
00117$:
;/tmp/_gbsbuild/src/core/Core_Main.c:227: ScriptTimerUpdate();
	call	_ScriptTimerUpdate
;/tmp/_gbsbuild/src/core/Core_Main.c:229: ScriptRestoreCtx(0);
	xor	a, a
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:231: if (!ui_block) {
	ld	a, (#_ui_block)
	or	a, a
	jr	NZ, 00120$
;/tmp/_gbsbuild/src/core/Core_Main.c:233: ScriptRestoreCtx(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:234: ScriptRestoreCtx(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:235: ScriptRestoreCtx(3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:236: ScriptRestoreCtx(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:237: ScriptRestoreCtx(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:238: ScriptRestoreCtx(6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:239: ScriptRestoreCtx(7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:240: ScriptRestoreCtx(8);
	ld	a, #0x08
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:241: ScriptRestoreCtx(9);
	ld	a, #0x09
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:242: ScriptRestoreCtx(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:243: ScriptRestoreCtx(11);
	ld	a, #0x0b
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:246: ActorRunCollisionScripts();
	call	_ActorRunCollisionScripts
00120$:
;/tmp/_gbsbuild/src/core/Core_Main.c:249: game_time++;
	ld	hl, #_game_time
	inc	(hl)
;/tmp/_gbsbuild/src/core/Core_Main.c:251: POP_BANK;
	call	_PopBank
	jp	00121$
00123$:
;/tmp/_gbsbuild/src/core/Core_Main.c:260: FadeOut();
	call	_FadeOut
;/tmp/_gbsbuild/src/core/Core_Main.c:261: while (fade_running) {
00124$:
	ld	a, (#_fade_running)
	or	a, a
	jr	Z, 00126$
;/tmp/_gbsbuild/src/core/Core_Main.c:262: wait_vbl_done();
	call	_wait_vbl_done
;/tmp/_gbsbuild/src/core/Core_Main.c:263: FadeUpdate();
	call	_FadeUpdate
	jr	00124$
00126$:
;/tmp/_gbsbuild/src/core/Core_Main.c:265: if (!fade_style)
	ld	a, (#_fade_style)
	or	a, a
	jr	NZ, 00128$
;/tmp/_gbsbuild/src/core/Core_Main.c:267: DISPLAY_OFF
	call	_display_off
00128$:
;/tmp/_gbsbuild/src/core/Core_Main.c:270: state_running = 1;
	ld	hl, #_state_running
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/Core_Main.c:271: current_state = next_state;
	ld	hl, #_next_state
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_current_state
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Core_Main.c:275: scroll_target = &camera_pos;
	ld	hl, #_scroll_target
	ld	(hl), #<(_camera_pos)
	inc	hl
	ld	(hl), #>(_camera_pos)
;/tmp/_gbsbuild/src/core/Core_Main.c:276: camera_settings = CAMERA_LOCK_FLAG;
	ld	hl, #_camera_settings
	ld	(hl), #0x10
;/tmp/_gbsbuild/src/core/Core_Main.c:279: timer_script_duration = 0;
	ld	hl, #_timer_script_duration
	ld	(hl), #0x00
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 0x0004)
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/Core_Main.c:288: script_stack_ptr = 0;
	ld	hl, #_script_stack_ptr
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:291: palette_update_mask = 0x3F;
	ld	hl, #_palette_update_mask
	ld	(hl), #0x3f
;/tmp/_gbsbuild/src/core/Core_Main.c:294: UIInit();
	call	_UIInit
;/tmp/_gbsbuild/src/core/Core_Main.c:295: LoadScene(current_state);
	ld	hl, #_current_state
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_LoadScene
	add	sp, #2
;/tmp/_gbsbuild/src/core/Core_Main.c:298: PUSH_BANK(stateBanks[scene_type]);
	ld	a, #<(_stateBanks)
	ld	hl, #_scene_type
	add	a, (hl)
	ld	c, a
	ld	a, #>(_stateBanks)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:299: startFuncs[scene_type]();
	ld	hl, #_scene_type
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	ld	de, #_startFuncs
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
;/tmp/_gbsbuild/src/core/Core_Main.c:300: POP_BANK;
	call	_PopBank
;/tmp/_gbsbuild/src/core/Core_Main.c:302: game_time = 0;
	ld	hl, #_game_time
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/Core_Main.c:303: old_scroll_x = scroll_x;
	ld	hl, #_scroll_x
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_old_scroll_x
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Core_Main.c:304: old_scroll_y = scroll_y;
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	e, (hl)
	ld	hl, #_old_scroll_y
	ld	(hl+), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/Core_Main.c:307: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;/tmp/_gbsbuild/src/core/Core_Main.c:308: FadeIn();
	call	_FadeIn
;/tmp/_gbsbuild/src/core/Core_Main.c:311: ScriptStart(&scene_events_start_ptr);
	ld	hl, #_scene_events_start_ptr
	push	hl
	call	_ScriptStart
	add	sp, #2
;/tmp/_gbsbuild/src/core/Core_Main.c:312: ScriptRestoreCtx(0);
	xor	a, a
	push	af
	inc	sp
	call	_ScriptRestoreCtx
	inc	sp
;/tmp/_gbsbuild/src/core/Core_Main.c:314: UpdateCamera();
	call	_UpdateCamera
;/tmp/_gbsbuild/src/core/Core_Main.c:315: RefreshScroll();
	call	_RefreshScroll
;/tmp/_gbsbuild/src/core/Core_Main.c:316: UpdateActors();
	call	_UpdateActors
;/tmp/_gbsbuild/src/core/Core_Main.c:317: UIUpdate();
	call	_UIUpdate
;/tmp/_gbsbuild/src/core/Core_Main.c:320: while (fade_running) {
00129$:
	ld	a, (#_fade_running)
	or	a, a
	jp	Z, 00121$
;/tmp/_gbsbuild/src/core/Core_Main.c:321: wait_vbl_done();
	call	_wait_vbl_done
;/tmp/_gbsbuild/src/core/Core_Main.c:322: FadeUpdate();
	call	_FadeUpdate
;/tmp/_gbsbuild/src/core/Core_Main.c:325: }
	jr	00129$
	.area _CODE
	.area _CABS (ABS)
