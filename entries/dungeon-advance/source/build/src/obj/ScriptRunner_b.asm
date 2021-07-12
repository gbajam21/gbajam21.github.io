;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (Linux)
;--------------------------------------------------------
	.module ScriptRunner_b
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ScriptUpdate_CamShake
	.globl _ScriptUpdate_MoveCamera
	.globl _ScriptUpdate_Emote
	.globl _ScriptUpdate_Wait
	.globl _ScriptUpdate_AwaitInputPres
	.globl _ScriptUpdate_AwaitUIAtDest
	.globl _ScriptUpdate_AwaitUIClosed
	.globl _ScriptUpdate_AwaitFade
	.globl _ScriptUpdate_MoveActorDiag
	.globl _ScriptUpdate_MoveActor
	.globl b_ScriptTimerUpdate_b
	.globl _ScriptTimerUpdate_b
	.globl _rand
	.globl _ProjectileLaunch
	.globl _WeaponAttack
	.globl _SetScene
	.globl _CheckCollisionInDirection
	.globl _DeactivateActor
	.globl _ActivateActor
	.globl _UIAtDest
	.globl _UIIsClosed
	.globl _UIShowMenu
	.globl _UIShowChoice
	.globl _UIShowText
	.globl _UIShowAvatar
	.globl _UISetColor
	.globl _UIMoveTo
	.globl _UISetPos
	.globl _LoadSprite
	.globl _LoadSpritePalette
	.globl _LoadUIPalette
	.globl _LoadPalette
	.globl _IsFading
	.globl _FadeSetSpeed
	.globl _ApplyPaletteChange
	.globl _FadeUpdate
	.globl _FadeOut
	.globl _FadeIn
	.globl _SoundPlayCrash
	.globl _SoundPlayBeep
	.globl _SoundStopTone
	.globl _SoundPlayTone
	.globl _MusicStop
	.globl _MusicPlay
	.globl _ScriptCtxPoolReturn
	.globl _ScriptStartBg
	.globl _Gt16
	.globl _Lt16
	.globl _SetBankedSpriteData
	.globl _tmp_actor
	.globl _after_lock_camera
	.globl _should_shake_y
	.globl _should_shake_x
	.globl _shake_time
	.globl _emote_timer
	.globl _scene_stack
	.globl _scene_stack_ptr
	.globl _RAMPtr
	.globl _script_cmds
	.globl _emote_offsets
	.globl _Script_Noop_b
	.globl _Script_End_b
	.globl _Script_Text_b
	.globl _Script_Goto_b
	.globl _Script_IfFlag_b
	.globl _Script_IfValue_b
	.globl _Script_SetFlag_b
	.globl _Script_ClearFlag_b
	.globl _Script_ActorSetDir_b
	.globl _Script_ActorActivate_b
	.globl _Script_CameraMoveTo_b
	.globl _Script_CameraLock_b
	.globl _ScriptHelper_ClampCamDest
	.globl _Script_Wait_b
	.globl _Script_FadeOut_b
	.globl _Script_FadeIn_b
	.globl _Script_LoadScene_b
	.globl _Script_ActorSetPos_b
	.globl _Script_ActorMoveTo_b
	.globl _ScriptHelper_CalcDest
	.globl _Script_ShowSprites_b
	.globl _Script_HideSprites_b
	.globl _Script_ActorShow_b
	.globl _Script_ActorHide_b
	.globl _Script_ActorSetCollisions_b
	.globl _Script_ActorSetEmote_b
	.globl _Script_CameraShake_b
	.globl _Script_ShowOverlay_b
	.globl _Script_HideOverlay_b
	.globl _Script_OverlaySetPos_b
	.globl _Script_OverlayMoveTo_b
	.globl _Script_AwaitInput_b
	.globl _Script_MusicPlay_b
	.globl _Script_MusicStop_b
	.globl _Script_ResetVariables_b
	.globl _Script_NextFrame_b
	.globl _Script_IncFlag_b
	.globl _Script_DecFlag_b
	.globl _Script_SetFlagValue_b
	.globl _Script_SetFlagProperty_b
	.globl _Script_IfInput_b
	.globl _Script_Choice_b
	.globl _Script_TextMenu_b
	.globl _Script_PlayerBounce_b
	.globl _Script_ActorSetSprite_b
	.globl _Script_PlayerSetSprite_b
	.globl _Script_ActorPush_b
	.globl _Script_IfActorPos_b
	.globl _Script_SaveData_b
	.globl _Script_LoadData_b
	.globl _Script_ClearData_b
	.globl _Script_IfSavedData_b
	.globl _Script_IfActorDirection_b
	.globl _Script_IfActorRelActor_b
	.globl _Script_SetFlagRandomValue_b
	.globl _Script_ActorGetPos_b
	.globl _Script_ActorSetPosToVal_b
	.globl _Script_ActorMoveToVal_b
	.globl _Script_ActorMoveRel_b
	.globl _Script_ActorSetPosRel_b
	.globl _Script_MathAdd_b
	.globl _Script_MathSub_b
	.globl _Script_MathMul_b
	.globl _Script_MathDiv_b
	.globl _Script_MathMod_b
	.globl _Script_MathAddVal_b
	.globl _Script_MathSubVal_b
	.globl _Script_MathMulVal_b
	.globl _Script_MathDivVal_b
	.globl _Script_MathModVal_b
	.globl _Script_CopyVal_b
	.globl _Script_IfValueCompare_b
	.globl _Script_LoadVectors_b
	.globl _Script_ActorSetMoveSpeed_b
	.globl _Script_ActorSetAnimSpeed_b
	.globl _Script_TextSetAnimSpeed_b
	.globl _Script_ActorInvoke_b
	.globl _Script_StackPush_b
	.globl b_Script_StackPop_b
	.globl _Script_StackPop_b
	.globl _Script_ScenePushState_b
	.globl _Script_ScenePopState_b
	.globl _Script_SceneResetStack_b
	.globl _Script_ScenePopAllState_b
	.globl _Script_SetInputScript_b
	.globl _Script_RemoveInputScript_b
	.globl _Script_ActorSetFrame_b
	.globl _Script_ActorSetFrameToVal_b
	.globl _Script_ActorSetFlip_b
	.globl _Script_TextMulti_b
	.globl _Script_VariableAddFlags_b
	.globl _Script_VariableClearFlags_b
	.globl _Script_SoundPlayTone_b
	.globl _Script_SoundStopTone_b
	.globl _Script_SoundPlayBeep_b
	.globl _Script_SoundPlayCrash_b
	.globl _Script_SetTimerScript_b
	.globl _Script_ResetTimer_b
	.globl _Script_RemoveTimerScript_b
	.globl _Script_TextWithAvatar_b
	.globl _Script_LaunchProjectile_b
	.globl _Script_WeaponAttack_b
	.globl _Script_PalSetBackground_b
	.globl _Script_PalSetSprite_b
	.globl _Script_PalSetUI_b
	.globl _Script_ActorStopUpdate_b
	.globl _Script_ActorSetAnimate_b
	.globl _Script_IfColorSupported_b
	.globl _Script_EngFieldSet_b
	.globl _Script_EngFieldSetWord_b
	.globl _Script_EngFieldSetVar_b
	.globl _Script_EngFieldSetWordVar_b
	.globl _Script_EngFieldStore_b
	.globl _Script_EngFieldStoreWord_b
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_RAMPtr::
	.ds 2
_scene_stack_ptr::
	.ds 1
_scene_stack::
	.ds 64
_emote_timer::
	.ds 1
_shake_time::
	.ds 1
_should_shake_x::
	.ds 1
_should_shake_y::
	.ds 1
_after_lock_camera::
	.ds 1
_tmp_actor::
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
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:37: UBYTE scene_stack_ptr = 0;
	ld	hl, #_scene_stack_ptr
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:39: UBYTE emote_timer = 0;
	ld	hl, #_emote_timer
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:40: UBYTE shake_time = 0;
	ld	hl, #_shake_time
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:41: UBYTE should_shake_x = FALSE;
	ld	hl, #_should_shake_x
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:42: UBYTE should_shake_y = FALSE;
	ld	hl, #_should_shake_y
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:43: UBYTE after_lock_camera = FALSE;
	ld	hl, #_after_lock_camera
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_4
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:165: void ScriptTimerUpdate_b() __banked {
;	---------------------------------
; Function ScriptTimerUpdate_b
; ---------------------------------
	b_ScriptTimerUpdate_b	= 4
_ScriptTimerUpdate_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:167: if (script_ctxs[0].script_ptr != 0) {
	ld	hl, #(_script_ctxs + 0x0008)
	ld	a, (hl+)
	or	a,(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:168: return;
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:172: if (timer_script_duration != 0) {
	ld	a, (#_timer_script_duration)
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:173: if (timer_script_time == 0) {
	ld	a, (#_timer_script_time)
	or	a, a
	jr	NZ, 00106$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:174: last_joy = last_joy & 0xF0;
	ld	hl, #_last_joy
	ld	a, (hl)
	and	a, #0xf0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:176: ScriptStartBg(&timer_script_ptr, 255);
	ld	a, #0xff
	push	af
	inc	sp
	ld	hl, #_timer_script_ptr
	push	hl
	call	_ScriptStartBg
	add	sp, #3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:179: timer_script_time = timer_script_duration;
	ld	a, (#_timer_script_duration)
	ld	(#_timer_script_time),a
	ret
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:182: if ((game_time & 0x0F) == 0x00) {
	ld	a, (#_game_time)
	and	a, #0x0f
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:183: --timer_script_time;
	ld	hl, #_timer_script_time
	dec	(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:187: }
	ret
_emote_offsets:
	.db #0x02	;  2
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0xfe	; -2
	.db #0xfd	; -3
	.db #0xfc	; -4
	.db #0xfb	; -5
	.db #0xfa	; -6
	.db #0xfb	; -5
	.db #0xfc	; -4
	.db #0xfd	; -3
	.db #0xfe	; -2
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
_script_cmds:
	.dw _Script_End_b
	.db #0x00	; 0
	.dw _Script_Text_b
	.db #0x03	; 3
	.dw _Script_Goto_b
	.db #0x02	; 2
	.dw _Script_IfFlag_b
	.db #0x04	; 4
	.dw _Script_Noop_b
	.db #0x00	; 0
	.dw _Script_SetFlag_b
	.db #0x02	; 2
	.dw _Script_ClearFlag_b
	.db #0x02	; 2
	.dw _Script_ActorSetDir_b
	.db #0x01	; 1
	.dw _Script_ActorActivate_b
	.db #0x01	; 1
	.dw _Script_CameraMoveTo_b
	.db #0x03	; 3
	.dw _Script_CameraLock_b
	.db #0x01	; 1
	.dw _Script_Wait_b
	.db #0x01	; 1
	.dw _Script_FadeOut_b
	.db #0x01	; 1
	.dw _Script_FadeIn_b
	.db #0x01	; 1
	.dw _Script_LoadScene_b
	.db #0x06	; 6
	.dw _Script_ActorSetPos_b
	.db #0x02	; 2
	.dw _Script_ActorMoveTo_b
	.db #0x04	; 4
	.dw _Script_ShowSprites_b
	.db #0x00	; 0
	.dw _Script_HideSprites_b
	.db #0x00	; 0
	.dw _Script_PlayerSetSprite_b
	.db #0x03	; 3
	.dw _Script_ActorShow_b
	.db #0x00	; 0
	.dw _Script_ActorHide_b
	.db #0x00	; 0
	.dw _Script_ActorSetEmote_b
	.db #0x01	; 1
	.dw _Script_CameraShake_b
	.db #0x03	; 3
	.dw _Script_Noop_b
	.db #0x00	; 0
	.dw _Script_ShowOverlay_b
	.db #0x03	; 3
	.dw _Script_HideOverlay_b
	.db #0x00	; 0
	.dw _Script_Noop_b
	.db #0x00	; 0
	.dw _Script_OverlayMoveTo_b
	.db #0x03	; 3
	.dw _Script_AwaitInput_b
	.db #0x01	; 1
	.dw _Script_MusicPlay_b
	.db #0x02	; 2
	.dw _Script_MusicStop_b
	.db #0x00	; 0
	.dw _Script_ResetVariables_b
	.db #0x00	; 0
	.dw _Script_NextFrame_b
	.db #0x00	; 0
	.dw _Script_IncFlag_b
	.db #0x02	; 2
	.dw _Script_DecFlag_b
	.db #0x02	; 2
	.dw _Script_SetFlagValue_b
	.db #0x03	; 3
	.dw _Script_IfValue_b
	.db #0x06	; 6
	.dw _Script_IfInput_b
	.db #0x03	; 3
	.dw _Script_Choice_b
	.db #0x05	; 5
	.dw _Script_ActorPush_b
	.db #0x01	; 1
	.dw _Script_IfActorPos_b
	.db #0x04	; 4
	.dw _Script_LoadData_b
	.db #0x00	; 0
	.dw _Script_SaveData_b
	.db #0x00	; 0
	.dw _Script_ClearData_b
	.db #0x00	; 0
	.dw _Script_IfSavedData_b
	.db #0x02	; 2
	.dw _Script_IfActorDirection_b
	.db #0x03	; 3
	.dw _Script_SetFlagRandomValue_b
	.db #0x04	; 4
	.dw _Script_ActorGetPos_b
	.db #0x00	; 0
	.dw _Script_ActorSetPosToVal_b
	.db #0x00	; 0
	.dw _Script_ActorMoveToVal_b
	.db #0x02	; 2
	.dw _Script_ActorMoveRel_b
	.db #0x06	; 6
	.dw _Script_ActorSetPosRel_b
	.db #0x04	; 4
	.dw _Script_MathAdd_b
	.db #0x03	; 3
	.dw _Script_MathSub_b
	.db #0x03	; 3
	.dw _Script_MathMul_b
	.db #0x03	; 3
	.dw _Script_MathDiv_b
	.db #0x03	; 3
	.dw _Script_MathMod_b
	.db #0x03	; 3
	.dw _Script_MathAddVal_b
	.db #0x01	; 1
	.dw _Script_MathSubVal_b
	.db #0x01	; 1
	.dw _Script_MathMulVal_b
	.db #0x00	; 0
	.dw _Script_MathDivVal_b
	.db #0x00	; 0
	.dw _Script_MathModVal_b
	.db #0x00	; 0
	.dw _Script_CopyVal_b
	.db #0x00	; 0
	.dw _Script_IfValueCompare_b
	.db #0x03	; 3
	.dw _Script_LoadVectors_b
	.db #0x04	; 4
	.dw _Script_ActorSetMoveSpeed_b
	.db #0x01	; 1
	.dw _Script_ActorSetAnimSpeed_b
	.db #0x01	; 1
	.dw _Script_TextSetAnimSpeed_b
	.db #0x04	; 4
	.dw _Script_ScenePushState_b
	.db #0x00	; 0
	.dw _Script_ScenePopState_b
	.db #0x01	; 1
	.dw _Script_ActorInvoke_b
	.db #0x00	; 0
	.dw _Script_StackPush_b
	.db #0x00	; 0
	.dw _Script_StackPop_b
	.db #0x00	; 0
	.dw _Script_SceneResetStack_b
	.db #0x00	; 0
	.dw _Script_ScenePopAllState_b
	.db #0x01	; 1
	.dw _Script_SetInputScript_b
	.db #0x05	; 5
	.dw _Script_RemoveInputScript_b
	.db #0x01	; 1
	.dw _Script_ActorSetFrame_b
	.db #0x01	; 1
	.dw _Script_ActorSetFlip_b
	.db #0x01	; 1
	.dw _Script_TextMulti_b
	.db #0x01	; 1
	.dw _Script_ActorSetFrameToVal_b
	.db #0x02	; 2
	.dw _Script_VariableAddFlags_b
	.db #0x03	; 3
	.dw _Script_VariableClearFlags_b
	.db #0x03	; 3
	.dw _Script_SoundPlayTone_b
	.db #0x03	; 3
	.dw _Script_SoundStopTone_b
	.db #0x00	; 0
	.dw _Script_SoundPlayBeep_b
	.db #0x01	; 1
	.dw _Script_SoundPlayCrash_b
	.db #0x00	; 0
	.dw _Script_SetTimerScript_b
	.db #0x04	; 4
	.dw _Script_ResetTimer_b
	.db #0x00	; 0
	.dw _Script_RemoveTimerScript_b
	.db #0x00	; 0
	.dw _Script_TextWithAvatar_b
	.db #0x04	; 4
	.dw _Script_TextMenu_b
	.db #0x07	; 7
	.dw _Script_ActorSetCollisions_b
	.db #0x01	; 1
	.dw _Script_LaunchProjectile_b
	.db #0x05	; 5
	.dw _Script_SetFlagProperty_b
	.db #0x04	; 4
	.dw _Script_ActorSetSprite_b
	.db #0x02	; 2
	.dw _Script_IfActorRelActor_b
	.db #0x04	; 4
	.dw _Script_PlayerBounce_b
	.db #0x01	; 1
	.dw _Script_WeaponAttack_b
	.db #0x03	; 3
	.dw _Script_PalSetBackground_b
	.db #0x03	; 3
	.dw _Script_PalSetSprite_b
	.db #0x02	; 2
	.dw _Script_PalSetUI_b
	.db #0x02	; 2
	.dw _Script_ActorStopUpdate_b
	.db #0x00	; 0
	.dw _Script_ActorSetAnimate_b
	.db #0x01	; 1
	.dw _Script_IfColorSupported_b
	.db #0x02	; 2
	.dw _Script_EngFieldSet_b
	.db #0x03	; 3
	.dw _Script_EngFieldSetWord_b
	.db #0x04	; 4
	.dw _Script_EngFieldSetVar_b
	.db #0x04	; 4
	.dw _Script_EngFieldSetWordVar_b
	.db #0x06	; 6
	.dw _Script_EngFieldStore_b
	.db #0x04	; 4
	.dw _Script_EngFieldStoreWord_b
	.db #0x06	; 6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:189: UBYTE ScriptUpdate_MoveActor() {
;	---------------------------------
; Function ScriptUpdate_MoveActor
; ---------------------------------
_ScriptUpdate_MoveActor::
	add	sp, #-8
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:190: BYTE new_dir_x = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:191: BYTE new_dir_y = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:193: tmp_actor = &actors[active_script_ctx.script_actor];
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	a, l
	ld	(_tmp_actor), a
	ld	a, h
	ld	(_tmp_actor + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:196: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #_active_script_ctx
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:197: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:198: (*tmp_actor).moving = FALSE;
;c
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:196: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00104$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:197: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00104$
	ld	a, h
	sub	a, b
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:198: (*tmp_actor).moving = FALSE;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:199: (*tmp_actor).script_control = FALSE;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001b
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:200: if (active_script_ctx.script_actor == 0) {
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:201: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:202: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:204: return TRUE;
	ld	e, #0x01
	jp	00129$
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:207: (*tmp_actor).moving = TRUE;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:196: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:210: if ( (*tmp_actor).pos.x != active_script_ctx.actor_move_dest_x &&
	ld	de, #_active_script_ctx
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00195$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00117$
00195$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:211: (!active_script_ctx.actor_move_type || ((*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y)) ) {
	ld	a, (#(_active_script_ctx + 0x0014) + 0)
	or	a, a
	jr	Z, 00116$
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00117$
	ld	a, h
	sub	a, b
	jr	NZ, 00117$
00116$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:212: if (Lt16((*tmp_actor).pos.x, active_script_ctx.actor_move_dest_x)) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:213: new_dir_x = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
	jp	00118$
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:214: } else if (Gt16((*tmp_actor).pos.x, active_script_ctx.actor_move_dest_x)) {
	ld	de, #_active_script_ctx
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00118$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:215: new_dir_x = -1;
	ldhl	sp,	#0
	ld	(hl), #0xff
	jr	00118$
00117$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:219: (*tmp_actor).dir.x = 0;
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:220: if (Lt16((*tmp_actor).pos.y, active_script_ctx.actor_move_dest_y)) {
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:221: new_dir_y = 1;
	ldhl	sp,	#1
	ld	(hl), #0x01
	jr	00118$
00114$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:222: } else if (Gt16((*tmp_actor).pos.y, active_script_ctx.actor_move_dest_y)) {
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00118$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:223: new_dir_y = -1;
	ldhl	sp,	#1
	ld	(hl), #0xff
00118$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:196: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:228: if(((*tmp_actor).dir.x != new_dir_x) ||
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00121$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:229: ((*tmp_actor).dir.y != new_dir_y) ) {
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	jr	Z, 00122$
00121$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:230: (*tmp_actor).rerender = TRUE;
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	ld	(hl), #0x01
00122$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:233: (*tmp_actor).dir.x = new_dir_x;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:234: (*tmp_actor).dir.y = new_dir_y;
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	c, a
	ld	d, (hl)
	ld	a, c
	add	a, #0x06
	ld	e, a
	jr	NC, 00201$
	inc	d
00201$:
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:196: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:237: if ((*tmp_actor).move_speed == 0) {
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c,l
	ld	b, (hl)
	ld	a, b
	or	a, a
	jr	NZ, 00127$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:239: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	rrca
	jp	C,00128$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:240: (*tmp_actor).pos.x += (WORD)new_dir_x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#0
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:196: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:197: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
	inc	bc
	inc	bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:241: (*tmp_actor).pos.y += (WORD)new_dir_y;
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;c
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jr	00128$
00127$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:244: (*tmp_actor).pos.x += (WORD)(new_dir_x * (*tmp_actor).move_speed);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	push	bc
	inc	sp
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	__muluschar
	add	sp, #2
;c
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:196: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:197: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:245: (*tmp_actor).pos.y += (WORD)(new_dir_y * (*tmp_actor).move_speed);        
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	push	af
	inc	sp
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	__muluschar
	add	sp, #2
;c
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00128$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:248: return FALSE;
	ld	e, #0x00
00129$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:249: }
	add	sp, #8
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:251: UBYTE ScriptUpdate_MoveActorDiag() {
;	---------------------------------
; Function ScriptUpdate_MoveActorDiag
; ---------------------------------
_ScriptUpdate_MoveActorDiag::
	add	sp, #-9
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:252: BYTE new_dir_x = 0;
	xor	a, a
	ldhl	sp,	#2
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:253: BYTE new_dir_y = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:255: tmp_actor = &actors[active_script_ctx.script_actor];
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	a, l
	ld	(_tmp_actor), a
	ld	a, h
	ld	(_tmp_actor + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #_active_script_ctx
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:259: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:260: (*tmp_actor).moving = FALSE;
;c
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00104$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:259: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00104$
	ld	a, h
	sub	a, b
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:260: (*tmp_actor).moving = FALSE;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:261: (*tmp_actor).script_control = FALSE;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001b
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:262: if (active_script_ctx.script_actor == 0) {
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:263: pl_vel_x = 0;
	ld	hl, #_pl_vel_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:264: pl_vel_y = 0;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:266: return TRUE;
	ld	e, #0x01
	jp	00128$
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:268: (*tmp_actor).moving = TRUE;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:271: if ((*tmp_actor).pos.x != active_script_ctx.actor_move_dest_x) {
	ld	de, #_active_script_ctx
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	e, c
	ld	d, b
	dec	hl
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00194$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00112$
00194$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:272: if (Lt16((*tmp_actor).pos.x, active_script_ctx.actor_move_dest_x)) {
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:273: new_dir_x = 1;
	ldhl	sp,	#2
	ld	(hl), #0x01
	jr	00112$
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:274: } else if (Gt16((*tmp_actor).pos.x, active_script_ctx.actor_move_dest_x)) {
	ld	de, #_active_script_ctx
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:275: new_dir_x = -1;
	ldhl	sp,	#2
	ld	(hl), #0xff
00112$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:259: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
	inc	bc
	inc	bc
	ld	h, b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:280: if ((*tmp_actor).pos.y != active_script_ctx.actor_move_dest_y) {
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #(_active_script_ctx + 0x0002)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	e, c
	ld	d, b
	dec	hl
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00195$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00119$
00195$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:281: if (Lt16((*tmp_actor).pos.y, active_script_ctx.actor_move_dest_y)) {
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:282: new_dir_y = 1;
	ldhl	sp,	#3
	ld	(hl), #0x01
	jr	00119$
00116$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:283: } else if (Gt16((*tmp_actor).pos.y, active_script_ctx.actor_move_dest_y)) {
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00119$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:284: new_dir_y = -1;
	ldhl	sp,	#3
	ld	(hl), #0xff
00119$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:289: if(((*tmp_actor).dir.x != new_dir_x) ||
	ld	hl, #0x0005
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00120$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:290: ((*tmp_actor).dir.y != new_dir_y)) {
	ld	hl, #0x0006
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, e
	jr	Z, 00121$
00120$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:291: (*tmp_actor).rerender = TRUE;
	ld	hl, #0x0014
	add	hl, bc
	ld	(hl), #0x01
00121$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:294: (*tmp_actor).dir.x = new_dir_x;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:295: (*tmp_actor).dir.y = new_dir_y;
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, a
	ld	b, (hl)
	ld	a, e
	add	a, #0x06
	ld	c, a
	jr	NC, 00199$
	inc	b
00199$:
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:298: if ((*tmp_actor).move_speed == 0) {
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#6
	ld	(hl), a
	or	a, a
	jr	NZ, 00126$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:300: if (IS_FRAME_2) {
	ld	a, (#_game_time)
	rrca
	jp	C,00127$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:301: (*tmp_actor).pos.x += (WORD)new_dir_x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:259: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:302: (*tmp_actor).pos.y += (WORD)new_dir_y;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00127$
00126$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:305: (*tmp_actor).pos.x += (WORD)(new_dir_x * (*tmp_actor).move_speed);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	__muluschar
	add	sp, #2
;c
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:258: if ((*tmp_actor).pos.x == active_script_ctx.actor_move_dest_x &&
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:259: (*tmp_actor).pos.y == active_script_ctx.actor_move_dest_y) {
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:306: (*tmp_actor).pos.y += (WORD)(new_dir_y * (*tmp_actor).move_speed);        
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	__muluschar
	add	sp, #2
;c
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00127$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:309: return FALSE;
	ld	e, #0x00
00128$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:310: }
	add	sp, #9
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:312: UBYTE ScriptUpdate_AwaitFade() {
;	---------------------------------
; Function ScriptUpdate_AwaitFade
; ---------------------------------
_ScriptUpdate_AwaitFade::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:313: FadeUpdate();
	call	_FadeUpdate
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:314: return !IsFading();
	call	_IsFading
	ld	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	e, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:315: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:317: UBYTE ScriptUpdate_AwaitUIClosed() {
;	---------------------------------
; Function ScriptUpdate_AwaitUIClosed
; ---------------------------------
_ScriptUpdate_AwaitUIClosed::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:318: return UIIsClosed();
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:319: }
	jp  _UIIsClosed
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:321: UBYTE ScriptUpdate_AwaitUIAtDest() {
;	---------------------------------
; Function ScriptUpdate_AwaitUIAtDest
; ---------------------------------
_ScriptUpdate_AwaitUIAtDest::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:322: return UIAtDest();
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:323: }
	jp  _UIAtDest
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:325: UBYTE ScriptUpdate_AwaitInputPres() {
;	---------------------------------
; Function ScriptUpdate_AwaitInputPres
; ---------------------------------
_ScriptUpdate_AwaitInputPres::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:326: return (joy != last_joy && joy & await_input) != 0;
	ld	a, (#_joy)
	ld	hl, #_last_joy
	sub	a, (hl)
	jr	Z, 00103$
	ld	a, (#_joy)
	ld	hl, #_await_input
	and	a,(hl)
	jr	NZ, 00104$
00103$:
	xor	a, a
	jr	00105$
00104$:
	ld	a, #0x01
00105$:
	xor	a, #0x01
	xor	a, #0x01
	ld	e, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:327: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:329: UBYTE ScriptUpdate_Wait() {
;	---------------------------------
; Function ScriptUpdate_Wait
; ---------------------------------
_ScriptUpdate_Wait::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:330: if (active_script_ctx.wait_time == 0) {
	ld	bc, #_active_script_ctx+15
	ld	a, (bc)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:331: return TRUE;
	ld	e, #0x01
	ret
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:333: active_script_ctx.wait_time--;
	dec	a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:334: return FALSE;
	ld	e, #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:335: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:337: UBYTE ScriptUpdate_Emote() {
;	---------------------------------
; Function ScriptUpdate_Emote
; ---------------------------------
_ScriptUpdate_Emote::
	add	sp, #-6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:341: if (emote_timer == BUBBLE_TOTAL_FRAMES) {
	ld	a, (#_emote_timer)
	sub	a, #0x3c
	jr	NZ, 00104$
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+4
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:344: return TRUE;
	ld	e, #0x01
	jp	00110$
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:346: screen_x = 8u + actors[active_script_ctx.script_actor].pos.x - scroll_x;
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0x08
	ld	hl, #_scroll_x
	ld	c, (hl)
	sub	a, c
	ld	c, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:347: screen_y = 8u + actors[active_script_ctx.script_actor].pos.y - scroll_y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	b, (hl)
	ld	e, a
;c
	ld	d, b
	ld	hl, #0x0008
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), e
	pop	de
	push	de
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:349: if (emote_timer < BUBBLE_ANIMATION_FRAMES) {
	ld	hl, #_emote_timer
	ld	a, (hl)
	sub	a, #0x0f
	jr	NC, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:350: screen_y += emote_offsets[emote_timer];
	ld	de, #_emote_offsets+0
	ld	a, e
	add	a, (hl)
	ld	e, a
	jr	NC, 00124$
	inc	d
00124$:
	ld	a, (de)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;c
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:353: move_sprite(0, screen_x, screen_y - 16u);
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0xf0
	ld	e, a
	ld	b, e
	inc	hl
	ld	(hl), c
	ld	c, (hl)
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:354: move_sprite(1, screen_x + 8u, screen_y - 16u);
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
;/tmp/_gbstools/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;/tmp/_gbstools/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:356: emote_timer++;
	ld	hl, #_emote_timer
	inc	(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:357: return FALSE;
	ld	e, #0x00
00110$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:359: }
	add	sp, #6
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:361: UBYTE ScriptUpdate_MoveCamera() {
;	---------------------------------
; Function ScriptUpdate_MoveCamera
; ---------------------------------
_ScriptUpdate_MoveCamera::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:362: if ((game_time & camera_speed) == 0) {
	ld	a, (#_game_time)
	ld	hl, #_camera_speed
	and	a,(hl)
	jp	NZ, 00112$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:363: if (camera_pos.x > camera_dest.x) {
	ld	hl, #_camera_pos
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_camera_dest
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00160$
	bit	7, d
	jr	NZ, 00161$
	cp	a, a
	jr	00161$
00160$:
	bit	7, d
	jr	Z, 00161$
	scf
00161$:
	jr	NC, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:364: camera_pos.x--;
	dec	bc
	ld	hl, #_camera_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00105$
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:365: } else if (camera_pos.x < camera_dest.x) {
	ldhl	sp,	#0
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00162$
	bit	7, d
	jr	NZ, 00163$
	cp	a, a
	jr	00163$
00162$:
	bit	7, d
	jr	Z, 00163$
	scf
00163$:
	jr	NC, 00105$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:366: camera_pos.x++;
	inc	bc
	ld	hl, #_camera_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:368: if (camera_pos.y > camera_dest.y) {
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 00164$
	bit	7, d
	jr	NZ, 00165$
	cp	a, a
	jr	00165$
00164$:
	bit	7, d
	jr	Z, 00165$
	scf
00165$:
	jr	NC, 00109$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:369: camera_pos.y--;
	dec	bc
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00112$
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:370: } else if (camera_pos.y < camera_dest.y) {
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00166$
	bit	7, d
	jr	NZ, 00167$
	cp	a, a
	jr	00167$
00166$:
	bit	7, d
	jr	Z, 00167$
	scf
00167$:
	jr	NC, 00112$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:371: camera_pos.y++;
	inc	bc
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00112$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:374: if ((camera_pos.x == camera_dest.x) && (camera_pos.y == camera_dest.y)) {
	ld	hl, #_camera_pos
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_camera_dest
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00116$
	ld	a, h
	sub	a, b
	jr	NZ, 00116$
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00116$
	ld	a, h
	sub	a, b
	jr	NZ, 00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:375: if (after_lock_camera) {
	ld	a, (#_after_lock_camera)
	or	a, a
	jr	Z, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:376: camera_settings = camera_settings | CAMERA_LOCK_FLAG;
	ld	hl, #_camera_settings
	ld	a, (hl)
	or	a, #0x10
	ld	(hl), a
00114$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:378: return TRUE;
	ld	e, #0x01
	jr	00118$
00116$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:381: return FALSE;
	ld	e, #0x00
00118$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:382: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:384: UBYTE ScriptUpdate_CamShake() {
;	---------------------------------
; Function ScriptUpdate_CamShake
; ---------------------------------
_ScriptUpdate_CamShake::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:385: if (shake_time == 0) {
	ld	a, (#_shake_time)
	or	a, a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:386: scroll_offset_x = 0;
	ld	hl, #_scroll_offset_x
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:387: scroll_offset_y = 0;
	ld	hl, #_scroll_offset_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:388: return TRUE;
	ld	e, #0x01
	ret
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:391: shake_time--;
	ld	hl, #_shake_time
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:394: if (shake_time != 0) {
	dec	(hl)
	jr	Z, 00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:396: scroll_offset_x = (INT16)(shake_time & 0x5) * 2 - 5;
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:395: if (should_shake_x)
	ld	a, (#_should_shake_x)
	or	a, a
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:396: scroll_offset_x = (INT16)(shake_time & 0x5) * 2 - 5;
	ld	a, c
	and	a, #0x05
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	a, e
	add	a, #0xfb
	ld	hl, #_scroll_offset_x
	ld	(hl), a
	ld	a, d
	adc	a, #0xff
	inc	hl
	ld	(hl), a
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:397: if (should_shake_y)
	ld	a, (#_should_shake_y)
	or	a, a
	jr	Z, 00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:398: scroll_offset_y = (INT16)(shake_time & 0xA) - 5;
	ld	a, c
	and	a, #0x0a
	ld	c, a
	ld	b, #0x00
	ld	a, c
	add	a, #0xfb
	ld	hl, #_scroll_offset_y
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:401: return FALSE;
	ld	e, #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:402: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:410: void Script_Noop_b() {}
;	---------------------------------
; Function Script_Noop_b
; ---------------------------------
_Script_Noop_b::
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:417: void Script_End_b() {
;	---------------------------------
; Function Script_End_b
; ---------------------------------
_Script_End_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:418: active_script_ctx.script_ptr_bank = 0;
	ld	hl, #(_active_script_ctx + 0x000e)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:419: active_script_ctx.script_ptr = 0;
	ld	hl, #(_active_script_ctx + 0x0008)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:420: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:430: void Script_Text_b() {
;	---------------------------------
; Function Script_Text_b
; ---------------------------------
_Script_Text_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:431: UIShowText(script_cmd_args[0], (script_cmd_args[1] * 256) + script_cmd_args[2]);
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	e, a
	ld	a, #0x00
	ld	hl, #_script_cmd_args + 2
	ld	c, (hl)
	ld	b, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	a, (#_script_cmd_args + 0)
	push	bc
	push	af
	inc	sp
	call	_UIShowText
	add	sp, #3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:432: active_script_ctx.script_update_fn = ScriptUpdate_AwaitUIClosed;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitUIClosed)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitUIClosed)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:433: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:443: void Script_Goto_b() {
;	---------------------------------
; Function Script_Goto_b
; ---------------------------------
_Script_Goto_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:444: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_script_cmd_args+0
	ld	a, (de)
	ld	h, a
	ld	l, #0x00
	add	hl, bc
	inc	de
	ld	a, (de)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:445: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:457: void Script_IfFlag_b() {
;	---------------------------------
; Function Script_IfFlag_b
; ---------------------------------
_Script_IfFlag_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:459: script_cmd_args[1]]) {  // True path, jump to position specified by ptr
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:458: if (script_variables[(script_cmd_args[0] * 256) +
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:459: script_cmd_args[1]]) {  // True path, jump to position specified by ptr
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #_script_variables
	add	hl, de
	ld	a, (hl)
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:460: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	e, a
	ld	l, #0x00
	ld	h, e
	add	hl, bc
	ld	bc, #_script_cmd_args + 3
	ld	a, (bc)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:462: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:477: void Script_IfValue_b() {
;	---------------------------------
; Function Script_IfValue_b
; ---------------------------------
_Script_IfValue_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:479: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:480: value = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	d, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:482: switch (script_cmd_args[2]) {
	ld	hl, #_script_cmd_args + 2
	ld	e, (hl)
	ld	a, #0x06
	sub	a, e
	jr	C, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:484: match = value == script_cmd_args[3];
	ld	bc, #_script_cmd_args + 3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:482: switch (script_cmd_args[2]) {
	push	de
	ld	d, #0x00
	ld	hl, #00123$
	add	hl, de
	add	hl, de
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:483: case OPERATOR_EQ:
	pop	de
	jp	(hl)
00123$:
	jr	00107$
	jr	00101$
	jr	00106$
	jr	00102$
	jr	00104$
	jr	00103$
	jr	00105$
00101$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:484: match = value == script_cmd_args[3];
	ld	a, (bc)
	ld	c, a
	ld	a, d
	sub	a, c
	jr	NZ, 00124$
	ld	a,#0x01
	jr	00108$
00124$:
	xor	a,a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:485: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:486: case OPERATOR_LT:
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:487: match = value < script_cmd_args[3];
	ld	a, (bc)
	ld	c, a
	ld	a, d
	sub	a, c
	ld	a, #0x00
	rla
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:488: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:489: case OPERATOR_LTE:
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:490: match = value <= script_cmd_args[3];
	ld	a, (bc)
	sub	a, d
	ld	a, #0x00
	rla
	xor	a, #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:491: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:492: case OPERATOR_GT:
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:493: match = value > script_cmd_args[3];
	ld	a, (bc)
	sub	a, d
	ld	a, #0x00
	rla
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:494: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:495: case OPERATOR_GTE:
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:496: match = value >= script_cmd_args[3];
	ld	a, (bc)
	ld	c, a
	ld	a, d
	sub	a, c
	ld	a, #0x00
	rla
	xor	a, #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:497: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:498: case OPERATOR_NE:
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:499: match = value != script_cmd_args[3];
	ld	a, (bc)
	ld	c, a
	ld	a, d
	sub	a, c
	ld	a, #0x01
	jr	Z, 00127$
	xor	a, a
00127$:
	xor	a, #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:500: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:501: default:
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:502: match = FALSE;
	xor	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:503: }
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:505: if (match) {  // True path, jump to position specified by ptr
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:506: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[4] * 256) + script_cmd_args[5];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0004) + 0)
	ld	e, a
	ld	l, #0x00
	ld	h, e
	add	hl, bc
	ld	bc, #_script_cmd_args + 5
	ld	a, (bc)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:508: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:518: void Script_SetFlag_b() {
;	---------------------------------
; Function Script_SetFlag_b
; ---------------------------------
_Script_SetFlag_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:519: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:520: script_variables[ptr] = TRUE;
	ld	bc,#_script_variables
	add	hl,bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:521: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:531: void Script_ClearFlag_b() {
;	---------------------------------
; Function Script_ClearFlag_b
; ---------------------------------
_Script_ClearFlag_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:532: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:533: script_variables[ptr] = FALSE;
	ld	bc,#_script_variables
	add	hl,bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:534: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:543: void Script_ActorSetDir_b() {
;	---------------------------------
; Function Script_ActorSetDir_b
; ---------------------------------
_Script_ActorSetDir_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:544: if (ACTOR_ON_TILE(active_script_ctx.script_actor)) {
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	and	a, #0x07
	jp	NZ,00104$
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a, (hl+)
	and	a, #0x07
	jp	NZ,00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:545: actors[active_script_ctx.script_actor].dir.x = script_cmd_args[0] == 2 ? -1 : script_cmd_args[0] == 4 ? 1 : 0;
;c
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (#_script_cmd_args + 0)
	cp	a, #0x02
	jr	NZ, 00106$
	ld	de, #0xffff
	jr	00107$
00106$:
	sub	a, #0x04
	jr	NZ, 00108$
	ld	de, #0x0001
	jr	00109$
00108$:
	ld	de, #0x0000
00109$:
00107$:
	ld	a, e
	ldhl	sp,	#2
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:546: actors[active_script_ctx.script_actor].dir.y = script_cmd_args[0] == 8 ? -1 : script_cmd_args[0] == 1 ? 1 : 0;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	e, l
	ld	d, h
;c
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
	ld	a, (#_script_cmd_args + 0)
	cp	a, #0x08
	jr	NZ, 00110$
	ld	de, #0xffff
	jr	00111$
00110$:
	dec	a
	jr	NZ, 00112$
	ld	de, #0x0001
	jr	00113$
00112$:
	ld	de, #0x0000
00113$:
00111$:
	ld	a, e
	ldhl	sp,	#2
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:547: actors[active_script_ctx.script_actor].rerender = TRUE;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	bc, #0x0014
	add	hl, bc
	ld	(hl), #0x01
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:549: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:558: void Script_ActorActivate_b() {
;	---------------------------------
; Function Script_ActorActivate_b
; ---------------------------------
_Script_ActorActivate_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:559: active_script_ctx.script_actor = script_cmd_args[0];
	ld	bc, #_active_script_ctx+17
	ld	a, (#_script_cmd_args + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:560: if (active_script_ctx_index == 0) {
	ld	a, (#_active_script_ctx_index)
	or	a, a
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:561: ActivateActor(active_script_ctx.script_actor);
	ld	a, (bc)
	push	af
	inc	sp
	call	_ActivateActor
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:563: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:574: void Script_CameraMoveTo_b() {
;	---------------------------------
; Function Script_CameraMoveTo_b
; ---------------------------------
_Script_CameraMoveTo_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:575: camera_dest.x = (script_cmd_args[0] * 8) + SCREEN_WIDTH_HALF;
	ld	a, (#_script_cmd_args + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0050
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #_camera_dest
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:576: camera_dest.y = (script_cmd_args[1] * 8) + SCREEN_HEIGHT_HALF;
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0048
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:578: camera_settings = (UBYTE)script_cmd_args[2] & ~CAMERA_LOCK_FLAG;
	ld	bc, #_script_cmd_args + 2
	ld	a, (bc)
	and	a, #0xef
	ld	(#_camera_settings),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:579: camera_speed = (UBYTE)script_cmd_args[2] & CAMERA_SPEED_MASK;
	ld	a, (bc)
	and	a, #0x0f
	ld	(#_camera_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:581: ScriptHelper_ClampCamDest();
	call	_ScriptHelper_ClampCamDest
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:583: if ((camera_settings & CAMERA_TRANSITION_FLAG) == CAMERA_TRANSITION_FLAG) {
	ld	a, (#_camera_settings)
	and	a, #0x20
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x20
	or	a, b
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:584: after_lock_camera = FALSE;
	ld	hl, #_after_lock_camera
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:585: active_script_ctx.script_update_fn = ScriptUpdate_MoveCamera;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveCamera)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveCamera)
	ret
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:587: camera_pos.x = camera_dest.x;
	ld	hl, #_camera_dest
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_camera_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:588: camera_pos.y = camera_dest.y;
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:590: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:599: void Script_CameraLock_b() {
;	---------------------------------
; Function Script_CameraLock_b
; ---------------------------------
_Script_CameraLock_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:600: camera_settings = script_cmd_args[0] & ~CAMERA_LOCK_FLAG;
	ld	bc, #_script_cmd_args+0
	ld	a, (bc)
	and	a, #0xef
	ld	(#_camera_settings),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:601: camera_speed = (UBYTE)script_cmd_args[0] & CAMERA_SPEED_MASK;
	ld	a, (bc)
	and	a, #0x0f
	ld	(#_camera_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:602: camera_dest.x = player.pos.x;
	ld	hl, #_actors
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_camera_dest
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:603: camera_dest.y = player.pos.y;
	ld	hl, #_actors + 2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:605: ScriptHelper_ClampCamDest();
	call	_ScriptHelper_ClampCamDest
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:607: if ((camera_settings & CAMERA_TRANSITION_FLAG) == CAMERA_TRANSITION_FLAG) {
	ld	a, (#_camera_settings)
	and	a, #0x20
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, #0x20
	or	a, b
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:608: after_lock_camera = TRUE;
	ld	hl, #_after_lock_camera
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:609: active_script_ctx.script_update_fn = ScriptUpdate_MoveCamera;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveCamera)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveCamera)
	ret
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:611: camera_pos.x = camera_dest.x;
	ld	hl, #_camera_dest
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_camera_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:612: camera_pos.y = camera_dest.y;
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:613: camera_settings = camera_settings | CAMERA_LOCK_FLAG;
	ld	hl, #_camera_settings
	ld	a, (hl)
	or	a, #0x10
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:615: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:617: void ScriptHelper_ClampCamDest() {
;	---------------------------------
; Function ScriptHelper_ClampCamDest
; ---------------------------------
_ScriptHelper_ClampCamDest::
	add	sp, #-6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:619: if (U_LESS_THAN(image_width - SCREEN_WIDTH_HALF, camera_pos.x)) {
	ld	hl, #_image_width + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0050
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ld	hl, #_camera_pos
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	de
	push	de
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	bit	7, (hl)
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:620: camera_pos.x = image_width - SCREEN_WIDTH_HALF;
	ld	de, #_camera_pos
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
	jr	00105$
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:621: } else if (U_LESS_THAN(camera_pos.x, SCREEN_WIDTH_HALF)) {
	ld	a, c
	add	a, #0xb0
	ld	a, b
	adc	a, #0xff
	bit	7, a
	jr	Z, 00105$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:622: camera_pos.x = SCREEN_WIDTH_HALF;
	ld	hl, #_camera_pos
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:626: if (U_LESS_THAN(image_height - SCREEN_HEIGHT_HALF, camera_pos.y)) {
	ld	hl, #_image_height
	ld	a, (hl)
	add	a, #0xb8
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	e, l
	ld	d, h
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	bit	7, a
	jr	Z, 00109$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:627: camera_pos.y = image_height - SCREEN_HEIGHT_HALF;
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00110$
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:628: } else if (U_LESS_THAN(camera_pos.y, SCREEN_HEIGHT_HALF)) {
	ld	a, l
	add	a, #0xb8
	ld	a, h
	adc	a, #0xff
	bit	7, a
	jr	Z, 00110$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:629: camera_pos.y = SCREEN_HEIGHT_HALF;
	ld	hl, #(_camera_pos + 0x0002)
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x00
00110$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:633: if (Gt16(camera_dest.x, image_width - SCREEN_WIDTH_HALF)) {
	ld	hl, #_image_width
	ld	a, (hl)
	add	a, #0xb0
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #_camera_dest
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:634: camera_dest.x = image_width - SCREEN_WIDTH_HALF;
	ld	hl, #_image_width
	ld	a, (hl)
	add	a, #0xb0
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #_camera_dest
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00115$
00114$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:635: } else if (Lt16(camera_dest.x, SCREEN_WIDTH_HALF)) {
	ld	hl, #_camera_dest
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0050
	push	hl
	push	bc
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00115$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:636: camera_dest.x = SCREEN_WIDTH_HALF;
	ld	hl, #_camera_dest
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
00115$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:638: if (Gt16(camera_dest.y, image_height - SCREEN_HEIGHT_HALF)) {
	ld	hl, #_image_height
	ld	a, (hl)
	add	a, #0xb8
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00119$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:639: camera_dest.y = image_height - SCREEN_HEIGHT_HALF;
	ld	hl, #_image_height
	ld	a, (hl)
	add	a, #0xb8
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00121$
00119$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:640: } else if (Lt16(camera_dest.y, SCREEN_HEIGHT_HALF)) {
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0048
	push	hl
	push	bc
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00121$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:641: camera_dest.y = SCREEN_HEIGHT_HALF;
	ld	hl, #(_camera_dest + 0x0002)
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x00
00121$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:643: }
	add	sp, #6
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:652: void Script_Wait_b() {
;	---------------------------------
; Function Script_Wait_b
; ---------------------------------
_Script_Wait_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:653: active_script_ctx.wait_time = script_cmd_args[0];
	ld	bc, #_active_script_ctx + 15
	ld	a, (#_script_cmd_args + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:654: active_script_ctx.script_update_fn = ScriptUpdate_Wait;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_Wait)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_Wait)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:655: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:664: void Script_FadeOut_b() {
;	---------------------------------
; Function Script_FadeOut_b
; ---------------------------------
_Script_FadeOut_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:665: FadeOut();
	call	_FadeOut
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:666: FadeSetSpeed(script_cmd_args[0]);
	ld	a, (#_script_cmd_args + 0)
	push	af
	inc	sp
	call	_FadeSetSpeed
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:667: active_script_ctx.script_update_fn = ScriptUpdate_AwaitFade;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitFade)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitFade)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:668: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:677: void Script_FadeIn_b() {
;	---------------------------------
; Function Script_FadeIn_b
; ---------------------------------
_Script_FadeIn_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:678: FadeIn();
	call	_FadeIn
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:679: FadeSetSpeed(script_cmd_args[0]);
	ld	a, (#_script_cmd_args + 0)
	push	af
	inc	sp
	call	_FadeSetSpeed
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:680: active_script_ctx.script_update_fn = ScriptUpdate_AwaitFade;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitFade)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitFade)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:681: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:695: void Script_LoadScene_b() {
;	---------------------------------
; Function Script_LoadScene_b
; ---------------------------------
_Script_LoadScene_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:696: UINT16 scene_next_index = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	a, #0x00
	ld	hl, #_script_cmd_args + 1
	ld	e, (hl)
	ld	d, #0x00
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	inc	sp
	inc	sp
	push	bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:698: map_next_pos.x = 0;  // @wtf-but-needed
	ld	hl, #_map_next_pos
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:699: map_next_pos.x = (script_cmd_args[2] * 8);
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_map_next_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:700: map_next_pos.y = 0;  // @wtf-but-needed
	ld	hl, #(_map_next_pos + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:701: map_next_pos.y = (script_cmd_args[3] * 8);
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #(_map_next_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:702: map_next_dir.x = script_cmd_args[4] == 2 ? -1 : script_cmd_args[4] == 4 ? 1 : 0;
	ld	bc, #_map_next_dir+0
	ld	a, (#(_script_cmd_args + 0x0004) + 0)
	cp	a, #0x02
	jr	NZ, 00103$
	ld	de, #0xffff
	jr	00104$
00103$:
	sub	a, #0x04
	jr	NZ, 00105$
	ld	de, #0x0001
	jr	00106$
00105$:
	ld	de, #0x0000
00106$:
00104$:
	ld	a, e
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:703: map_next_dir.y = script_cmd_args[4] == 8 ? -1 : script_cmd_args[4] == 1 ? 1 : 0;
	ld	a, (#(_script_cmd_args + 0x0004) + 0)
	cp	a, #0x08
	jr	NZ, 00107$
	ld	de, #0xffff
	jr	00108$
00107$:
	dec	a
	jr	NZ, 00109$
	ld	de, #0x0001
	jr	00110$
00109$:
	ld	de, #0x0000
00110$:
00108$:
	ld	a, e
	ld	(#(_map_next_dir + 0x0001)),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:705: SetScene(scene_next_index);
	pop	hl
	push	hl
	push	hl
	call	_SetScene
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:706: FadeSetSpeed(script_cmd_args[5]);
	ld	a, (#(_script_cmd_args + 0x0005) + 0)
	push	af
	inc	sp
	call	_FadeSetSpeed
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:708: active_script_ctx.script_update_fn = ScriptUpdate_AwaitFade;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitFade)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitFade)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:709: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:719: void Script_ActorSetPos_b() {
;	---------------------------------
; Function Script_ActorSetPos_b
; ---------------------------------
_Script_ActorSetPos_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:720: actors[active_script_ctx.script_actor].pos.x = script_cmd_args[0] * 8;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	ld	a, (#_script_cmd_args + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:721: actors[active_script_ctx.script_actor].pos.y = script_cmd_args[1] * 8;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:722: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:732: void Script_ActorMoveTo_b() {
;	---------------------------------
; Function Script_ActorMoveTo_b
; ---------------------------------
_Script_ActorMoveTo_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:733: tmp_actor = &actors[active_script_ctx.script_actor];
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	a, l
	ld	(_tmp_actor), a
	ld	a, h
	ld	(_tmp_actor + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:735: if ((*tmp_actor).script_control) {
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001b
	add	hl, bc
	ld	a, (hl)
	or	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:736: return;
	jr	NZ, 00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:739: active_script_ctx.actor_move_dest_x = 0;  // @wtf-but-needed
	ld	hl, #_active_script_ctx
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:740: active_script_ctx.actor_move_dest_x = (script_cmd_args[0] * 8);
	ld	a, (#_script_cmd_args + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_active_script_ctx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:741: active_script_ctx.actor_move_dest_y = 0;  // @wtf-but-needed
	ld	hl, #(_active_script_ctx + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:742: active_script_ctx.actor_move_dest_y = (script_cmd_args[1] * 8);
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:743: active_script_ctx.actor_move_cols = script_cmd_args[2];
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	de, #(_active_script_ctx + 0x0013)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:744: active_script_ctx.actor_move_type = script_cmd_args[3];
	ld	bc, #_active_script_ctx + 20
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:746: (*tmp_actor).script_control = TRUE; // @wtf Should already be true?
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001b
	add	hl, de
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:748: if (active_script_ctx.actor_move_cols) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:749: ScriptHelper_CalcDest();
	push	bc
	call	_ScriptHelper_CalcDest
	pop	bc
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:752: if (active_script_ctx.actor_move_type == MOVE_DIAGONAL) {
	ld	a, (bc)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:753: active_script_ctx.script_update_fn = ScriptUpdate_MoveActorDiag;
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:752: if (active_script_ctx.actor_move_type == MOVE_DIAGONAL) {
	ld	c, a
	sub	a, #0x02
	jr	NZ, 00106$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:753: active_script_ctx.script_update_fn = ScriptUpdate_MoveActorDiag;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveActorDiag)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveActorDiag)
	jr	00108$
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:755: active_script_ctx.script_update_fn = ScriptUpdate_MoveActor;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveActor)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveActor)
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:757: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:759: void ScriptHelper_CalcDest() {
;	---------------------------------
; Function ScriptHelper_CalcDest
; ---------------------------------
_ScriptHelper_CalcDest::
	add	sp, #-7
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:762: if (active_script_ctx.actor_move_type) {
	ld	a, (#(_active_script_ctx + 0x0014) + 0)
	ldhl	sp,	#4
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:763: if (active_script_ctx.actor_move_dest_y != (*tmp_actor).pos.y) {
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:762: if (active_script_ctx.actor_move_type) {
	ld	a, e
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00126$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:763: if (active_script_ctx.actor_move_dest_y != (*tmp_actor).pos.y) {
	ld	de, #(_active_script_ctx + 0x0002)
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;c
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
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
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00185$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00107$
00185$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:765: if (Lt16(active_script_ctx.actor_move_dest_y, (*tmp_actor).pos.y)) {
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Lt16
	add	sp, #4
	push	hl
	ldhl	sp,	#8
	ld	(hl), e
	pop	hl
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:766: check_dir = CHECK_DIR_UP;
	ldhl	sp,	#2
	ld	(hl), #0x03
	jr	00103$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:768: check_dir = CHECK_DIR_DOWN;
	ldhl	sp,	#2
	ld	(hl), #0x04
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:772: DIV_8(active_script_ctx.actor_move_dest_y), check_dir) *
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:763: if (active_script_ctx.actor_move_dest_y != (*tmp_actor).pos.y) {
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:771: DIV_8((*tmp_actor).pos.y),
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	a, (hl)
	ldhl	sp,	#4
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:770: new_dest = CheckCollisionInDirection(DIV_8((*tmp_actor).pos.x),
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_CheckCollisionInDirection
	add	sp, #4
	push	hl
	ldhl	sp,	#8
	ld	(hl), e
	pop	hl
	ldhl	sp,	#6
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x03
00186$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00186$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:774: if (new_dest != active_script_ctx.actor_move_dest_y) {
	ld	de, #(_active_script_ctx + 0x0002)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00187$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	Z, 00107$
00187$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:775: active_script_ctx.actor_move_dest_y = new_dest;
	ld	de, #(_active_script_ctx + 0x0002)
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:779: if (Lt16(active_script_ctx.actor_move_dest_x, (*tmp_actor).pos.x)) {
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_active_script_ctx
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:780: check_dir = CHECK_DIR_LEFT;
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:782: check_dir = CHECK_DIR_RIGHT;
	ld	c, #0x01
	jr	NZ, 00110$
	ld	c, #0x02
00110$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:786: DIV_8(active_script_ctx.actor_move_dest_x), check_dir) *
	ld	hl, #_active_script_ctx
	ld	a, (hl+)
	ld	b, a
	ld	l, (hl)
	ld	e, b
	ld	d, l
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ldhl	sp,	#4
	ld	(hl), e
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:785: CheckCollisionInDirection(DIV_8((*tmp_actor).pos.x), DIV_8(active_script_ctx.actor_move_dest_y),
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	b, a
	ld	h, (hl)
	ld	l, b
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	ld	b, l
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	ld	h, c
	push	hl
	inc	sp
	ldhl	sp,	#5
	ld	h, (hl)
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_CheckCollisionInDirection
	add	sp, #4
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:788: if (new_dest != active_script_ctx.actor_move_dest_x) {
	ld	hl, #_active_script_ctx
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00188$
	ld	a, h
	sub	a, b
	jp	Z,00128$
00188$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:789: active_script_ctx.actor_move_dest_x = new_dest;
	ld	hl, #_active_script_ctx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:790: return;
	jp	00128$
00126$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:794: if (active_script_ctx.actor_move_dest_x != (*tmp_actor).pos.x) {
	ld	de, #_active_script_ctx
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:770: new_dest = CheckCollisionInDirection(DIV_8((*tmp_actor).pos.x),
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:794: if (active_script_ctx.actor_move_dest_x != (*tmp_actor).pos.x) {
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00189$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00119$
00189$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:795: if (Lt16(active_script_ctx.actor_move_dest_x, (*tmp_actor).pos.x)) {
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:796: check_dir = CHECK_DIR_LEFT;
	ldhl	sp,	#4
	ld	(hl), #0x01
	jr	00115$
00114$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:798: check_dir = CHECK_DIR_RIGHT;
	ldhl	sp,	#4
	ld	(hl), #0x02
00115$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:802: DIV_8(active_script_ctx.actor_move_dest_x), check_dir) *
	ld	hl, #_active_script_ctx
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,	#5
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:763: if (active_script_ctx.actor_move_dest_y != (*tmp_actor).pos.y) {
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:801: DIV_8((*tmp_actor).pos.y),
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#6
	ld	(hl), e
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:800: new_dest = CheckCollisionInDirection(DIV_8((*tmp_actor).pos.x),
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	sra	c
	rr	b
	sra	c
	rr	b
	sra	c
	rr	b
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_CheckCollisionInDirection
	add	sp, #4
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:804: if (new_dest != active_script_ctx.actor_move_dest_x) {
	ld	hl, #_active_script_ctx
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00190$
	ld	a, h
	sub	a, b
	jr	Z, 00119$
00190$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:805: active_script_ctx.actor_move_dest_x = new_dest;
	ld	hl, #_active_script_ctx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00119$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:809: if (Lt16(active_script_ctx.actor_move_dest_y, (*tmp_actor).pos.y)) {
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00121$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:810: check_dir = CHECK_DIR_UP;
	ldhl	sp,	#5
	ld	(hl), #0x03
	jr	00122$
00121$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:812: check_dir = CHECK_DIR_DOWN;
	ldhl	sp,	#5
	ld	(hl), #0x04
00122$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:816: DIV_8(active_script_ctx.actor_move_dest_y), check_dir) *
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,	#6
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:815: CheckCollisionInDirection(DIV_8(active_script_ctx.actor_move_dest_x), DIV_8((*tmp_actor).pos.y),
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	hl, #_active_script_ctx
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	ld	a, l
	ldhl	sp,	#5
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
	push	hl
	inc	sp
	ld	h, c
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_CheckCollisionInDirection
	add	sp, #4
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:818: if (new_dest != active_script_ctx.actor_move_dest_y) {
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, (hl+)
	ld	h, (hl)
	sub	a, c
	jr	NZ, 00191$
	ld	a, h
	sub	a, b
	jr	Z, 00128$
00191$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:819: active_script_ctx.actor_move_dest_y = new_dest;
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:820: return;
00128$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:823: }
	add	sp, #7
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:830: void Script_ShowSprites_b() {
;	---------------------------------
; Function Script_ShowSprites_b
; ---------------------------------
_Script_ShowSprites_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:831: hide_sprites = FALSE;
	ld	hl, #_hide_sprites
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:832: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:833: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:840: void Script_HideSprites_b() {
;	---------------------------------
; Function Script_HideSprites_b
; ---------------------------------
_Script_HideSprites_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:841: hide_sprites = TRUE;
	ld	hl, #_hide_sprites
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:842: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:843: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:850: void Script_ActorShow_b() {
;	---------------------------------
; Function Script_ActorShow_b
; ---------------------------------
_Script_ActorShow_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:851: actors[active_script_ctx.script_actor].enabled = TRUE;
	ld	bc, #_active_script_ctx+17
	ld	a, (bc)
	ld	e, a
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
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:852: ActivateActor(active_script_ctx.script_actor);
	ld	a, (bc)
	push	af
	inc	sp
	call	_ActivateActor
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:853: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:860: void Script_ActorHide_b() {
;	---------------------------------
; Function Script_ActorHide_b
; ---------------------------------
_Script_ActorHide_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:861: actors[active_script_ctx.script_actor].enabled = FALSE;
	ld	bc, #_active_script_ctx+17
	ld	a, (bc)
	ld	e, a
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
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:862: DeactivateActor(active_script_ctx.script_actor);
	ld	a, (bc)
	push	af
	inc	sp
	call	_DeactivateActor
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:863: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:872: void Script_ActorSetCollisions_b() {
;	---------------------------------
; Function Script_ActorSetCollisions_b
; ---------------------------------
_Script_ActorSetCollisions_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:873: actors[active_script_ctx.script_actor].collisionsEnabled = script_cmd_args[0];
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	bc, #0x0017
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (#_script_cmd_args + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:874: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:883: void Script_ActorSetEmote_b() {
;	---------------------------------
; Function Script_ActorSetEmote_b
; ---------------------------------
_Script_ActorSetEmote_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:885: UBYTE palette = actors[active_script_ctx.script_actor].palette_index;
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	bc, #0x000a
	add	hl, bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:886: emote_timer = 1;
	ld	hl, #_emote_timer
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:887: active_script_ctx.script_update_fn = ScriptUpdate_Emote;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_Emote)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_Emote)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:890: emote_ptr + ((UWORD)script_cmd_args[0] * 64), EMOTES_SPRITE_BANK);
	ld	a, (#_script_cmd_args + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #0x4ea0
	add	hl, de
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:889: SetBankedSpriteData(EMOTE_SPRITE, 4,
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	push	hl
	ld	de, #0x047c
	push	de
	call	_SetBankedSpriteData
	add	sp, #5
	pop	bc
;/tmp/_gbstools/gbdk/include/gb/gb.h:1045: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 0x0003)
	ld	(hl), c
	ld	hl, #(_shadow_OAM + 0x0007)
	ld	(hl), c
;/tmp/_gbstools/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x7c
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x7e
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:894: set_sprite_tile(1, EMOTE_SPRITE + 2);
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:895: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:904: void Script_CameraShake_b() {
;	---------------------------------
; Function Script_CameraShake_b
; ---------------------------------
_Script_CameraShake_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:905: should_shake_x = script_cmd_args[0];
	ld	bc, #_script_cmd_args+0
	ld	a, (bc)
	ld	(#_should_shake_x),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:906: should_shake_y = script_cmd_args[1];
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	(#_should_shake_y),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:907: shake_time = script_cmd_args[2];
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	(#_shake_time),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:908: active_script_ctx.script_update_fn = ScriptUpdate_CamShake;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_CamShake)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_CamShake)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:909: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:916: void Script_ShowOverlay_b() {
;	---------------------------------
; Function Script_ShowOverlay_b
; ---------------------------------
_Script_ShowOverlay_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:917: UISetColor(script_cmd_args[0]);
	ld	a, (#_script_cmd_args + 0)
	push	af
	inc	sp
	call	_UISetColor
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:918: UISetPos(script_cmd_args[1] << 3, script_cmd_args[2] << 3);
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	add	a, a
	add	a, a
	add	a, a
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_UISetPos
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:919: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:926: void Script_HideOverlay_b() {
;	---------------------------------
; Function Script_HideOverlay_b
; ---------------------------------
_Script_HideOverlay_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:927: UISetPos(0, MENU_CLOSED_Y);
	ld	a, #0x90
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_UISetPos
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:928: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:935: void Script_OverlaySetPos_b() {
;	---------------------------------
; Function Script_OverlaySetPos_b
; ---------------------------------
_Script_OverlaySetPos_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:936: UISetPos(script_cmd_args[0] << 3, script_cmd_args[1] << 3);
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	a, (#_script_cmd_args + 0)
	add	a, a
	add	a, a
	add	a, a
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_UISetPos
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:937: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:944: void Script_OverlayMoveTo_b() {
;	---------------------------------
; Function Script_OverlayMoveTo_b
; ---------------------------------
_Script_OverlayMoveTo_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:945: UIMoveTo(script_cmd_args[0] << 3, script_cmd_args[1] << 3, script_cmd_args[2]);
	ld	hl, #_script_cmd_args + 2
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	add	a, a
	add	a, a
	add	a, a
	ld	hl, #_script_cmd_args
	ld	l, (hl)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	bc
	inc	sp
	push	af
	ld	a, l
	inc	sp
	push	af
	inc	sp
	call	_UIMoveTo
	add	sp, #3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:946: active_script_ctx.script_update_fn = ScriptUpdate_AwaitUIAtDest;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitUIAtDest)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitUIAtDest)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:947: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:954: void Script_AwaitInput_b() {
;	---------------------------------
; Function Script_AwaitInput_b
; ---------------------------------
_Script_AwaitInput_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:955: await_input = script_cmd_args[0];
	ld	a, (#_script_cmd_args + 0)
	ld	(#_await_input),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:956: active_script_ctx.script_update_fn = ScriptUpdate_AwaitInputPres;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitInputPres)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitInputPres)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:957: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:964: void Script_MusicPlay_b() {
;	---------------------------------
; Function Script_MusicPlay_b
; ---------------------------------
_Script_MusicPlay_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:965: MusicPlay(script_cmd_args[0], script_cmd_args[1], SCRIPT_RUNNER_BANK);
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	h, #0x04
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_MusicPlay
	add	sp, #3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:966: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:973: void Script_MusicStop_b() {
;	---------------------------------
; Function Script_MusicStop_b
; ---------------------------------
_Script_MusicStop_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:974: MusicStop(SCRIPT_RUNNER_BANK);
	ld	a, #0x04
	push	af
	inc	sp
	call	_MusicStop
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:975: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:982: void Script_ResetVariables_b() {
;	---------------------------------
; Function Script_ResetVariables_b
; ---------------------------------
_Script_ResetVariables_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:984: for (i = 0; i != NUM_VARIABLES; ++i) {
	ld	bc, #0x0000
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:985: script_variables[i] = FALSE;
	ld	hl, #_script_variables
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:984: for (i = 0; i != NUM_VARIABLES; ++i) {
	inc	bc
	ld	a, c
	sub	a, #0xf4
	jr	NZ, 00102$
	ld	a, b
	dec	a
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:987: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:994: void Script_NextFrame_b() {
;	---------------------------------
; Function Script_NextFrame_b
; ---------------------------------
_Script_NextFrame_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:995: active_script_ctx.script_await_next_frame = TRUE;
	ld	hl, #(_active_script_ctx + 0x0010)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:996: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1003: void Script_IncFlag_b() {
;	---------------------------------
; Function Script_IncFlag_b
; ---------------------------------
_Script_IncFlag_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1005: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1006: value = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	a, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1007: if (value != 255) {
	cp	a, #0xff
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1008: script_variables[ptr] = value + 1;
	inc	a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1010: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1017: void Script_DecFlag_b() {
;	---------------------------------
; Function Script_DecFlag_b
; ---------------------------------
_Script_DecFlag_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1019: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1020: value = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	a, (hl)
	ld	c, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1021: if (value != 0) {
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1022: script_variables[ptr] = value - 1;
	dec	c
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1024: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1031: void Script_SetFlagValue_b() {
;	---------------------------------
; Function Script_SetFlagValue_b
; ---------------------------------
_Script_SetFlagValue_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1032: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1033: script_variables[ptr] = script_cmd_args[2];
	ld	bc,#_script_variables
	add	hl,bc
	ld	bc, #_script_cmd_args + 2
	ld	a, (bc)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1034: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1041: void Script_SetFlagProperty_b() {
;	---------------------------------
; Function Script_SetFlagProperty_b
; ---------------------------------
_Script_SetFlagProperty_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1042: UBYTE value = 0;
	xor	a, a
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1043: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1045: switch (script_cmd_args[2]) {
	ld	hl, #_script_cmd_args + 2
	ld	c, (hl)
	ld	a, #0x05
	sub	a, c
	jp	C, 00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1048: value = actors[script_cmd_args[3]].pos.x >> 3;
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ld	e, a
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
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1045: switch (script_cmd_args[2]) {
	ld	b, #0x00
	ld	hl, #00139$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00139$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00113$
	jp	00114$
	jp	00115$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1046: case 0:
00101$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1048: value = actors[script_cmd_args[3]].pos.x >> 3;
	ld	bc, #_actors+0
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#3
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1049: break;
	jp	00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1050: case 1:
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1052: value = actors[script_cmd_args[3]].pos.y >> 3;
	ld	bc, #_actors+0
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#3
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1053: break;
	jr	00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1054: case 2:
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1056: if (actors[script_cmd_args[3]].dir.y == 1) {
	ld	bc, #_actors+0
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0005
	add	hl, bc
	ld	a, c
	add	a, #0x06
	ld	c, a
	jr	NC, 00140$
	inc	b
00140$:
	ld	a, (bc)
	dec	a
	jr	NZ, 00111$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1057: value = 1;
	ldhl	sp,	#3
	ld	(hl), #0x01
	jr	00116$
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1058: } else if (actors[script_cmd_args[3]].dir.x == -1) {
	ld	a, (hl)
	cp	a, #0xff
	jr	NZ, 00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1059: value = 2;
	ldhl	sp,	#3
	ld	(hl), #0x02
	jr	00116$
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1060: } else if (actors[script_cmd_args[3]].dir.x == 1) {
	dec	a
	jr	NZ, 00105$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1061: value = 4;
	ldhl	sp,	#3
	ld	(hl), #0x04
	jr	00116$
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1063: value = 8;
	ldhl	sp,	#3
	ld	(hl), #0x08
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1065: break;
	jr	00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1066: case 3:
00113$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1068: value = actors[script_cmd_args[3]].move_speed;
	ld	bc, #_actors+0
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1069: break;
	jr	00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1070: case 4:
00114$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1072: value = actors[script_cmd_args[3]].anim_speed;
	ld	bc, #_actors+0
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	bc,#0x0015
	add	hl,bc
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1073: break;
	jr	00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1074: case 5:
00115$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1076: value = actors[script_cmd_args[3]].frame;
	ld	bc, #_actors+0
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	bc,#0x000f
	add	hl,bc
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1078: }
00116$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1079: script_variables[ptr] = value;
	ld	bc, #_script_variables+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1080: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1087: void Script_IfInput_b() {
;	---------------------------------
; Function Script_IfInput_b
; ---------------------------------
_Script_IfInput_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1090: mask = script_cmd_args[0];
	ld	a, (#_script_cmd_args + 0)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1091: if ((joy & mask) != 0) {  // True path, jump to position specified by ptr
	ld	hl, #_joy
	and	a,(hl)
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1092: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[1] * 256) + script_cmd_args[2];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	e, a
	ld	l, #0x00
	ld	h, e
	add	hl, bc
	ld	bc, #_script_cmd_args + 2
	ld	a, (bc)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1094: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1101: void Script_Choice_b() {
;	---------------------------------
; Function Script_Choice_b
; ---------------------------------
_Script_Choice_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1103: (script_cmd_args[3] * 256) + script_cmd_args[4]);
	ld	hl, #_script_cmd_args + 3
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0004) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1102: UIShowChoice((script_cmd_args[0] * 256) + script_cmd_args[1], script_cmd_args[2],
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_script_cmd_args + 0)
	ld	d, a
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_UIShowChoice
	add	sp, #5
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1104: active_script_ctx.script_update_fn = ScriptUpdate_AwaitUIClosed;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitUIClosed)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitUIClosed)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1105: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1112: void Script_TextMenu_b() {
;	---------------------------------
; Function Script_TextMenu_b
; ---------------------------------
_Script_TextMenu_b::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1115: script_cmd_args[6]);
	ld	a, (#(_script_cmd_args + 0x0006) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1114: (script_cmd_args[3] * 256) + script_cmd_args[4], script_cmd_args[5],
	ld	a, (#(_script_cmd_args + 0x0005) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ld	b, a
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0004) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1113: UIShowMenu((script_cmd_args[0] * 256) + script_cmd_args[1], script_cmd_args[2],
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_script_cmd_args + 0)
	ld	d, a
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_UIShowMenu
	add	sp, #7
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1116: active_script_ctx.script_update_fn = ScriptUpdate_AwaitUIClosed;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitUIClosed)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitUIClosed)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1117: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1124: void Script_PlayerBounce_b() {
;	---------------------------------
; Function Script_PlayerBounce_b
; ---------------------------------
_Script_PlayerBounce_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1125: if (script_cmd_args[0] == 0) {
	ld	a, (#_script_cmd_args + 0)
	or	a, a
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1126: pl_vel_y = -0x2000;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0xe0
	ret
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1127: } else if (script_cmd_args[0] == 1) {
	cp	a, #0x01
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1128: pl_vel_y = -0x4000;
	ld	hl, #_pl_vel_y
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0xc0
	ret
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1129: } else if (script_cmd_args[0] == 2) {
	sub	a, #0x02
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1130: pl_vel_y = -0x6000;
	ld	hl, #_pl_vel_y
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1132: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1139: void Script_ActorSetSprite_b() {
;	---------------------------------
; Function Script_ActorSetSprite_b
; ---------------------------------
_Script_ActorSetSprite_b::
	add	sp, #-5
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1142: if (active_script_ctx.script_actor == 0) {
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1146: return;
	jp	Z,00103$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1149: sprite_frames = script_cmd_args[1];
	ld	bc, #_script_cmd_args+0
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1151: actors[active_script_ctx.script_actor].sprite = script_cmd_args[0];
	ldhl	sp,	#4
	ld	e, (hl)
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
	ld	de, #0x0008
	add	hl, de
	ld	a, (bc)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1152: actors[active_script_ctx.script_actor].frame = 0;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1153: actors[active_script_ctx.script_actor].sprite_type = sprite_frames == 6
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x0019
	add	hl,bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1154: ? SPRITE_ACTOR_ANIMATED
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x06
	ld	a, #0x01
	jr	Z, 00139$
	xor	a, a
00139$:
	ldhl	sp,	#1
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1155: : sprite_frames == 3 ? SPRITE_ACTOR : SPRITE_STATIC;
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00141$
	xor	a, a
00141$:
	ldhl	sp,	#2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1154: ? SPRITE_ACTOR_ANIMATED
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	ld	de, #0x0002
	jr	00106$
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1155: : sprite_frames == 3 ? SPRITE_ACTOR : SPRITE_STATIC;
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
	ld	de, #0x0001
	jr	00108$
00107$:
	ld	de, #0x0000
00108$:
00106$:
	ld	a, e
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1156: actors[active_script_ctx.script_actor].frames_len = sprite_frames == 6 ? 2 : sprite_frames == 3 ? 1 : sprite_frames;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	a, l
	add	a, #<(_actors)
	ld	c, a
	ld	a, h
	adc	a, #>(_actors)
	ld	b, a
	ld	hl, #0x0010
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
	ld	(hl), #0x02
	xor	a, a
	inc	hl
	ld	(hl), a
	jr	00110$
00109$:
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	dec	hl
	ld	(hl), #0x01
	xor	a, a
	inc	hl
	ld	(hl), a
	jr	00112$
00111$:
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
00112$:
00110$:
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1157: actors[active_script_ctx.script_actor].rerender = TRUE;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_actors
	add	hl, de
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
	ld	hl, #0x0014
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
	ld	(hl), #0x01
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1158: }
	add	sp, #5
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1165: void Script_PlayerSetSprite_b() {
;	---------------------------------
; Function Script_PlayerSetSprite_b
; ---------------------------------
_Script_PlayerSetSprite_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1170: sprite_index = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1172: sprite_frames = DIV_4(LoadSprite(sprite_index, 0));
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_LoadSprite
	add	sp, #3
	ld	a, e
	pop	bc
	rrca
	rrca
	and	a, #0x3f
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1174: player.sprite = 0;
	ld	hl, #(_actors + 0x0008)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1175: player.frame = 0;
	ld	hl, #(_actors + 0x000f)
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1179: player.sprite_type = SPRITE_STATIC;
	ld	de, #_actors + 25
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1180: player.frames_len = 6;
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1177: if (sprite_frames > 6) {
	ld	a, #0x06
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NC, 00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1179: player.sprite_type = SPRITE_STATIC;
	xor	a, a
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1180: player.frames_len = 6;
	ld	hl, #(_actors + 0x0010)
	ld	(hl), #0x06
	jr	00109$
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1181: } else if (sprite_frames == 6) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00105$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1182: player.sprite_type = SPRITE_ACTOR_ANIMATED;
	ld	a, #0x02
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1183: player.frames_len = 2;
	ld	hl, #(_actors + 0x0010)
	ld	(hl), #0x02
	jr	00109$
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1184: } else if (sprite_frames == 3) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1185: player.sprite_type = SPRITE_ACTOR;
	ld	a, #0x01
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1186: player.frames_len = 1;    
	ld	hl, #(_actors + 0x0010)
	ld	(hl), #0x01
	jr	00109$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1188: player.sprite_type = SPRITE_STATIC;
	xor	a, a
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1189: player.frames_len = sprite_frames;    
	ld	de, #(_actors + 0x0010)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1192: player.rerender = TRUE;
	ld	hl, #(_actors + 0x0014)
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1195: if (script_cmd_args[2]) {
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	or	a, a
	jr	Z, 00112$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1196: map_next_sprite = sprite_index;
	ld	hl, #_map_next_sprite
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00112$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1198: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1205: void Script_ActorPush_b() {
;	---------------------------------
; Function Script_ActorPush_b
; ---------------------------------
_Script_ActorPush_b::
	add	sp, #-6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1207: tmp_actor = &actors[active_script_ctx.script_actor];
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	a, l
	ld	(_tmp_actor), a
	ld	a, h
	ld	(_tmp_actor + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1209: if ((*tmp_actor).script_control) {
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1210: return;
	jp	NZ,00118$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1213: if (script_cmd_args[0]) {
	ld	hl, #_script_cmd_args
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1216: if (actors[0].dir.x < 0) {
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1223: if (actors[0].dir.y < 0) {
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1216: if (actors[0].dir.x < 0) {
	ld	a, (#(_actors + 0x0005) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1223: if (actors[0].dir.y < 0) {
	ld	a, (#(_actors + 0x0006) + 0)
	ldhl	sp,	#1
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1228: dest_y = (*tmp_actor).pos.y;
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1213: if (script_cmd_args[0]) {
	ld	a, c
	or	a, a
	jr	Z, 00116$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1216: if (actors[0].dir.x < 0) {
	ldhl	sp,	#0
	bit	7, (hl)
	jr	Z, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1217: dest_x = 0;
	xor	a, a
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), a
	jr	00108$
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1218: } else if (actors[0].dir.x > 0) {
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	xor	a, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00150$
	bit	7, d
	jr	NZ, 00151$
	cp	a, a
	jr	00151$
00150$:
	bit	7, d
	jr	Z, 00151$
	scf
00151$:
	jr	NC, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1219: dest_x = image_width;
	ld	hl, #_image_width
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), e
	jr	00108$
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1221: dest_x = (*tmp_actor).pos.x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1223: if (actors[0].dir.y < 0) {
	ldhl	sp,	#1
	bit	7, (hl)
	jr	Z, 00113$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1224: dest_y = 0;
	ld	bc, #0x0000
	jr	00117$
00113$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1225: } else if (actors[0].dir.y > 0) {
	ldhl	sp,	#1
	ld	e, (hl)
	ld	d, #0x00
	xor	a, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00152$
	bit	7, d
	jr	NZ, 00153$
	cp	a, a
	jr	00153$
00152$:
	bit	7, d
	jr	Z, 00153$
	scf
00153$:
	jr	NC, 00110$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1226: dest_y = image_height;
	ld	hl, #_image_height + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	jr	00117$
00110$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1228: dest_y = (*tmp_actor).pos.y;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	jr	00117$
00116$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1232: dest_x = (*tmp_actor).pos.x + (actors[0].dir.x * 16);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#0
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1233: dest_y = (*tmp_actor).pos.y + (actors[0].dir.y * 16);
	ld	a, b
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
00117$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1236: actor_move_settings |= ACTOR_MOVE_ENABLED;
	ld	hl, #_actor_move_settings
	ld	a, (hl)
	or	a, #0x80
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1237: actor_move_settings &= ~ACTOR_NOCLIP;
	ld	(hl), a
	and	a, #0xbf
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1238: active_script_ctx.actor_move_dest_x = 0;  // @wtf-but-needed
	ld	hl, #_active_script_ctx
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1239: active_script_ctx.actor_move_dest_x = dest_x;
	ld	de, #_active_script_ctx
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1240: active_script_ctx.actor_move_dest_y = 0;  // @wtf-but-needed
	ld	hl, #(_active_script_ctx + 0x0002)
	xor	a, a
	ld	(hl+), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1241: active_script_ctx.actor_move_dest_y = dest_y;
	ld	(hl-), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1242: (*tmp_actor).script_control = TRUE;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001b
	add	hl, bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1244: ScriptHelper_CalcDest();
	call	_ScriptHelper_CalcDest
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1246: active_script_ctx.script_update_fn = ScriptUpdate_MoveActor;
	ld	bc, #_active_script_ctx + 4
	ld	a, #<(_ScriptUpdate_MoveActor)
	ld	(bc), a
	inc	bc
	ld	a, #>(_ScriptUpdate_MoveActor)
	ld	(bc), a
00118$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1247: }
	add	sp, #6
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1260: void Script_IfActorPos_b() {
;	---------------------------------
; Function Script_IfActorPos_b
; ---------------------------------
_Script_IfActorPos_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1262: tile_x = actors[active_script_ctx.script_actor].pos.x >> 3;
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	c,l
	ld	b,h
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#0
	ld	(hl), e
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1263: tile_y = actors[active_script_ctx.script_actor].pos.y >> 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1264: if ((script_cmd_args[0] == tile_x) &&
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1265: (script_cmd_args[1] == tile_y)) {  // True path, jump to position specified by ptr
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	sub	a, c
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1266: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	e, a
	ld	l, #0x00
	ld	h, e
	add	hl, bc
	ld	bc, #_script_cmd_args + 3
	ld	a, (bc)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1268: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1275: void Script_SaveData_b() {
;	---------------------------------
; Function Script_SaveData_b
; ---------------------------------
_Script_SaveData_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1278: ENABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1280: RAMPtr = (UBYTE*)RAM_START_PTR;
	ld	hl, #_RAMPtr
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1281: RAMPtr[0] = TRUE;  // Flag to determine if data has been stored
	ld	hl, #0xa000
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1283: RAMPtr[1] = current_state >> 8;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, (#_current_state + 1)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1284: RAMPtr[2] = current_state & 0xFF;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (#_current_state)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1287: RAMPtr[3] = (player.pos.x >> 3) & 0xFF;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #_actors
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1288: RAMPtr[4] = (player.pos.y >> 3) & 0xFF;
	ld	hl, #_RAMPtr
	ld	a, (hl)
	add	a, #0x04
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ld	hl, #_actors + 2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1289: if (player.dir.x < 0) {
	ld	a, (#(_actors + 0x0005) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1290: RAMPtr[5] = 2;
	ld	hl, #_RAMPtr
	ld	a, (hl)
	add	a, #0x05
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1289: if (player.dir.x < 0) {
	ldhl	sp,	#0
	bit	7, (hl)
	jr	Z, 00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1290: RAMPtr[5] = 2;
	ld	a, #0x02
	ld	(bc), a
	jr	00109$
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1291: } else if (player.dir.x > 0) {
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	xor	a, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00141$
	bit	7, d
	jr	NZ, 00142$
	cp	a, a
	jr	00142$
00141$:
	bit	7, d
	jr	Z, 00142$
	scf
00142$:
	jr	NC, 00105$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1292: RAMPtr[5] = 4;
	ld	a, #0x04
	ld	(bc), a
	jr	00109$
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1293: } else if (player.dir.y < 0) {
	ld	hl, #(_actors + 0x0006)
	bit	7, (hl)
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1294: RAMPtr[5] = 8;
	ld	a, #0x08
	ld	(bc), a
	jr	00109$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1296: RAMPtr[5] = 1;
	ld	a, #0x01
	ld	(bc), a
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1300: RAMPtr[6] = map_next_sprite >> 8;
	ld	hl, #_RAMPtr
	ld	a, (hl)
	add	a, #0x06
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_map_next_sprite + 1)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1301: RAMPtr[7] = map_next_sprite & 0xFF;
	ld	hl, #_RAMPtr
	ld	a, (hl)
	add	a, #0x07
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	ld	a, (#_map_next_sprite)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1304: RAMPtr = (UBYTE*)RAM_START_VARS_PTR;
	ld	hl, #_RAMPtr
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1305: for (i = 0; i < NUM_VARIABLES; i++) {
	ld	bc, #0x0000
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1306: RAMPtr[i] = script_variables[i];
	ld	a, c
	ld	hl, #_RAMPtr
	add	a, (hl)
	ld	e, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	hl, #_script_variables
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1305: for (i = 0; i < NUM_VARIABLES; i++) {
	inc	bc
	ld	a, c
	sub	a, #0xf4
	ld	a, b
	sbc	a, #0x01
	jr	C, 00111$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1309: DISABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1310: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1317: void Script_LoadData_b() {
;	---------------------------------
; Function Script_LoadData_b
; ---------------------------------
_Script_LoadData_b::
	add	sp, #-4
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1321: ENABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1323: RAMPtr = (UBYTE*)RAM_START_PTR;
	ld	hl, #_RAMPtr
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1324: if (*RAMPtr == TRUE) {
	ld	a, (#0xa000)
	dec	a
	jp	NZ,00103$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1327: scene_next_index = (UWORD)((*(RAMPtr++)) * 256) + *RAMPtr;
	ld	hl, #0xa001
	ld	b, (hl)
	xor	a, a
	ld	c, #0x00
	ld	hl, #0xa002
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1330: RAMPtr++;
	ld	hl, #_RAMPtr
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1331: map_next_pos.x = 0;  // @wtf-but-needed
	ld	hl, #_map_next_pos
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1332: map_next_pos.x = (WORD)(*RAMPtr) * 8;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
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
	ld	(hl), a
	ld	de, #_map_next_pos
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1333: RAMPtr++;
	ld	hl, #_RAMPtr
	inc	(hl)
	jr	NZ, 00155$
	inc	hl
	inc	(hl)
00155$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1334: map_next_pos.y = 0;  // @wtf-but-needed
	ld	hl, #(_map_next_pos + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1335: map_next_pos.y = (WORD)(*RAMPtr) * 8;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
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
	ld	(hl), a
	ld	de, #(_map_next_pos + 0x0002)
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1336: RAMPtr++;
	ld	hl, #_RAMPtr
	inc	(hl)
	jr	NZ, 00157$
	inc	hl
	inc	(hl)
00157$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1337: map_next_dir.x = *RAMPtr == 2 ? -1 : *RAMPtr == 4 ? 1 : 0;
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1332: map_next_pos.x = (WORD)(*RAMPtr) * 8;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1337: map_next_dir.x = *RAMPtr == 2 ? -1 : *RAMPtr == 4 ? 1 : 0;
	ld	a, (de)
	cp	a, #0x02
	jr	NZ, 00108$
	ld	de, #0xffff
	jr	00109$
00108$:
	sub	a, #0x04
	jr	NZ, 00110$
	ld	de, #0x0001
	jr	00111$
00110$:
	ld	de, #0x0000
00111$:
00109$:
	ld	a, e
	ld	(#_map_next_dir),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1338: map_next_dir.y = *RAMPtr == 8 ? -1 : *RAMPtr == 1 ? 1 : 0;
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1332: map_next_pos.x = (WORD)(*RAMPtr) * 8;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1337: map_next_dir.x = *RAMPtr == 2 ? -1 : *RAMPtr == 4 ? 1 : 0;
	ld	a, (de)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1338: map_next_dir.y = *RAMPtr == 8 ? -1 : *RAMPtr == 1 ? 1 : 0;
	cp	a, #0x08
	jr	NZ, 00112$
	ld	de, #0xffff
	jr	00113$
00112$:
	dec	a
	jr	NZ, 00114$
	ld	de, #0x0001
	jr	00115$
00114$:
	ld	de, #0x0000
00115$:
00113$:
	ld	a, e
	ld	(#(_map_next_dir + 0x0001)),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1341: RAMPtr++;
	ld	hl, #_RAMPtr
	inc	(hl)
	jr	NZ, 00166$
	inc	hl
	inc	(hl)
00166$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1342: map_next_sprite = (UWORD)((*(RAMPtr++)) * 256) + *RAMPtr;
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	d, a
	dec	hl
	inc	(hl)
	jr	NZ, 00167$
	inc	hl
	inc	(hl)
00167$:
	ld	e, #0x00
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	hl, #_RAMPtr + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
;c
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, l
	ld	(_map_next_sprite), a
	ld	a, h
	ld	(_map_next_sprite + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1345: RAMPtr = (UBYTE*)RAM_START_VARS_PTR;
	ld	hl, #_RAMPtr
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1346: for (i = 0; i < NUM_VARIABLES; i++) {
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1347: script_variables[i] = RAMPtr[i];
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_script_variables
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_RAMPtr
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	pop	hl
	push	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1346: for (i = 0; i < NUM_VARIABLES; i++) {
	ldhl	sp,	#2
	inc	(hl)
	jr	NZ, 00168$
	inc	hl
	inc	(hl)
00168$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0xf4
	inc	hl
	ld	a, (hl)
	sbc	a, #0x01
	jr	C, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1351: SetScene(scene_next_index);
	push	bc
	call	_SetScene
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1352: FadeSetSpeed(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_FadeSetSpeed
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1354: active_script_ctx.script_update_fn = ScriptUpdate_AwaitFade;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitFade)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitFade)
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1357: DISABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1358: }
	add	sp, #4
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1365: void Script_ClearData_b() {
;	---------------------------------
; Function Script_ClearData_b
; ---------------------------------
_Script_ClearData_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1366: ENABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1367: RAMPtr = (UBYTE*)RAM_START_PTR;
	ld	hl, #_RAMPtr
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1368: RAMPtr[0] = FALSE;
	ld	hl, #0xa000
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1369: DISABLE_RAM;
	ld	h, l
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1370: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1380: void Script_IfSavedData_b() {
;	---------------------------------
; Function Script_IfSavedData_b
; ---------------------------------
_Script_IfSavedData_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1383: ENABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1384: RAMPtr = (UBYTE*)RAM_START_PTR;
	ld	hl, #_RAMPtr
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0xa0
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1386: jump = *RAMPtr == TRUE;
	ld	a, (#0xa000)
	dec	a
	ld	a, #0x01
	jr	Z, 00111$
	xor	a, a
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1387: DISABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1389: if (jump) {  // True path, jump to position specified by ptr
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1390: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_script_cmd_args+0
	ld	a, (de)
	ld	h, a
	ld	l, #0x00
	add	hl, bc
	inc	de
	ld	a, (de)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1392: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1404: void Script_IfActorDirection_b() {
;	---------------------------------
; Function Script_IfActorDirection_b
; ---------------------------------
_Script_IfActorDirection_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1405: if ((actors[active_script_ctx.script_actor].dir.x == 1 && script_cmd_args[0] == 4 ||
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00105$
	ld	a, (#_script_cmd_args + 0)
	sub	a, #0x04
	jr	Z, 00101$
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1406: actors[active_script_ctx.script_actor].dir.x == -1 && script_cmd_args[0] == 2) ||
	ldhl	sp,	#0
	ld	a, (hl)
	inc	a
	jr	NZ, 00109$
	ld	a, (#_script_cmd_args + 0)
	sub	a, #0x02
	jr	Z, 00101$
00109$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1407: (actors[active_script_ctx.script_actor].dir.y == 1 && script_cmd_args[0] == 1 ||
	ld	hl, #0x0006
	add	hl, bc
	ld	c, (hl)
	ld	a, c
	dec	a
	jr	NZ, 00108$
	ld	a, (#_script_cmd_args + 0)
	dec	a
	jr	Z, 00101$
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1408: actors[active_script_ctx.script_actor].dir.y == -1 &&
	inc	c
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1409: script_cmd_args[0] == 8)) {  // True path, jump to position specified by ptr
	ld	a, (#_script_cmd_args + 0)
	sub	a, #0x08
	jr	NZ, 00110$
00101$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1410: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[1] * 256) + script_cmd_args[2];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	e, a
	ld	l, #0x00
	ld	h, e
	add	hl, bc
	ld	bc, #_script_cmd_args + 2
	ld	a, (bc)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00110$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1412: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1425: void Script_IfActorRelActor_b() {
;	---------------------------------
; Function Script_IfActorRelActor_b
; ---------------------------------
_Script_IfActorRelActor_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1426: if (script_cmd_args[0] == 0) {  // Above
	ld	hl, #_script_cmd_args
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1427: if (Lt16(actors[active_script_ctx.script_actor].pos.y, actors[script_cmd_args[1]].pos.y)) {
	ld	de, #_script_cmd_args + 1
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1428: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[2] * 256) + script_cmd_args[3];
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1426: if (script_cmd_args[0] == 0) {  // Above
	ld	a, c
	or	a, a
	jr	NZ, 00118$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1427: if (Lt16(actors[active_script_ctx.script_actor].pos.y, actors[script_cmd_args[1]].pos.y)) {
	ld	a, (de)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1428: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	e, a
	ld	a, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ret
00118$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1430: } else if (script_cmd_args[0] == 1) {  // Down
	ld	a, c
	dec	a
	jr	NZ, 00115$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1431: if (Gt16(actors[active_script_ctx.script_actor].pos.y, actors[script_cmd_args[1]].pos.y)) {
	ld	a, (de)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1432: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	e, a
	ld	a, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ret
00115$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1434: } else if (script_cmd_args[0] == 2) {  // Left
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00112$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1435: if (Lt16(actors[active_script_ctx.script_actor].pos.x, actors[script_cmd_args[1]].pos.x)) {
	ld	a, (de)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Lt16
	add	sp, #4
	ld	a, e
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1436: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	e, a
	ld	a, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ret
00112$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1438: } else if (script_cmd_args[0] == 3) {  // Right
	ld	a, c
	sub	a, #0x03
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1439: if (Gt16(actors[active_script_ctx.script_actor].pos.x, actors[script_cmd_args[1]].pos.x)) {
	ld	a, (de)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	call	_Gt16
	add	sp, #4
	ld	a, e
	or	a, a
	ret	Z
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1440: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	e, a
	ld	a, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	add	a, c
	ld	c, a
	ld	a, #0x00
	adc	a, b
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1443: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1454: void Script_SetFlagRandomValue_b() {
;	---------------------------------
; Function Script_SetFlagRandomValue_b
; ---------------------------------
_Script_SetFlagRandomValue_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1458: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1459: rand_val = rand();
	push	hl
	call	_rand
	pop	bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1460: offset = script_cmd_args[2];
	ld	a, (#_script_cmd_args + 2)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1461: modulo = script_cmd_args[3] + 1;
	ld	hl, #_script_cmd_args + 3
	ld	d, (hl)
	inc	d
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1462: script_variables[ptr] = offset + (rand_val % modulo);
	ld	hl, #_script_variables
	add	hl, bc
	push	hl
	push	de
	call	__moduchar
	add	sp, #2
	ld	a, e
	pop	bc
	ldhl	sp,	#0
	add	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1463: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1470: void Script_ActorGetPos_b() {
;	---------------------------------
; Function Script_ActorGetPos_b
; ---------------------------------
_Script_ActorGetPos_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1471: script_variables[active_script_ctx.script_ptr_x] = actors[active_script_ctx.script_actor].pos.x >> 3;
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #<(_script_variables)
	ld	c, a
	ld	a, b
	adc	a, #>(_script_variables)
	ld	b, a
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1472: script_variables[active_script_ctx.script_ptr_y] = actors[active_script_ctx.script_actor].pos.y >> 3;
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #<(_script_variables)
	ld	c, a
	ld	a, b
	adc	a, #>(_script_variables)
	ld	b, a
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1473: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1480: void Script_ActorSetPosToVal_b() {
;	---------------------------------
; Function Script_ActorSetPosToVal_b
; ---------------------------------
_Script_ActorSetPosToVal_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1481: actors[active_script_ctx.script_actor].pos.x = 0;  // @wtf-but-needed
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1482: actors[active_script_ctx.script_actor].pos.x = script_variables[active_script_ctx.script_ptr_x] * 8;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1483: actors[active_script_ctx.script_actor].pos.y = 0;  // @wtf-but-needed
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1484: actors[active_script_ctx.script_actor].pos.y = script_variables[active_script_ctx.script_ptr_y] * 8;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1485: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1492: void Script_ActorMoveToVal_b() {  
;	---------------------------------
; Function Script_ActorMoveToVal_b
; ---------------------------------
_Script_ActorMoveToVal_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1493: tmp_actor = &actors[active_script_ctx.script_actor];
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	a, l
	ld	(_tmp_actor), a
	ld	a, h
	ld	(_tmp_actor + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1494: if (actors[active_script_ctx.script_actor].script_control) {
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	bc, #0x001b
	add	hl, bc
	ld	a, (hl)
	or	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1495: return;
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1497: actor_move_settings |= ACTOR_MOVE_ENABLED;
	ld	hl, #_actor_move_settings
	ld	a, (hl)
	or	a, #0x80
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1498: actor_move_settings |= ACTOR_NOCLIP;
	ld	(hl), a
	or	a, #0x40
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1499: active_script_ctx.actor_move_dest_x = 0;  // @wtf-but-needed
	ld	hl, #_active_script_ctx
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1500: active_script_ctx.actor_move_dest_x = script_variables[active_script_ctx.script_ptr_x] * 8;
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_script_variables
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_active_script_ctx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1501: active_script_ctx.actor_move_dest_y = 0;  // @wtf-but-needed
	ld	hl, #(_active_script_ctx + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1502: active_script_ctx.actor_move_dest_y = script_variables[active_script_ctx.script_ptr_y] * 8;
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_script_variables
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1503: active_script_ctx.actor_move_cols = script_cmd_args[0];
	ld	hl, #_script_cmd_args
	ld	c, (hl)
	ld	hl, #(_active_script_ctx + 0x0013)
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1504: active_script_ctx.actor_move_type = script_cmd_args[1];
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	(#(_active_script_ctx + 0x0014)),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1505: (*tmp_actor).script_control = TRUE; // @wtf should already be True?
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001b
	add	hl, de
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1507: if (active_script_ctx.actor_move_cols) {
	ld	a, c
	or	a, a
	jr	Z, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1508: ScriptHelper_CalcDest();
	call	_ScriptHelper_CalcDest
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1511: if (active_script_ctx.actor_move_type == MOVE_DIAGONAL) {
	ld	hl, #(_active_script_ctx + 0x0014)
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1512: active_script_ctx.script_update_fn = ScriptUpdate_MoveActorDiag;
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1511: if (active_script_ctx.actor_move_type == MOVE_DIAGONAL) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00106$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1512: active_script_ctx.script_update_fn = ScriptUpdate_MoveActorDiag;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveActorDiag)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveActorDiag)
	ret
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1514: active_script_ctx.script_update_fn = ScriptUpdate_MoveActor;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveActor)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveActor)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1516: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1526: void Script_ActorMoveRel_b() {
;	---------------------------------
; Function Script_ActorMoveRel_b
; ---------------------------------
_Script_ActorMoveRel_b::
	add	sp, #-8
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1527: tmp_actor = &actors[active_script_ctx.script_actor];  
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	a, l
	ld	(_tmp_actor), a
	ld	a, h
	ld	(_tmp_actor + 1), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1529: if ((*tmp_actor).script_control) {
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x001b
	add	hl, bc
	ld	a, (hl)
	or	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1530: return;
	jp	NZ,00132$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1533: actor_move_settings |= ACTOR_MOVE_ENABLED;
	ld	hl, #_actor_move_settings
	ld	a, (hl)
	or	a, #0x80
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1534: actor_move_settings |= ACTOR_NOCLIP;
	ld	(hl), a
	or	a, #0x40
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1535: active_script_ctx.actor_move_dest_x = 0;  // @wtf-but-needed
	ld	hl, #_active_script_ctx
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1536: active_script_ctx.actor_move_dest_x = (*tmp_actor).pos.x;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_active_script_ctx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1537: if (script_cmd_args[0] != 0) {
	ld	a, (#_script_cmd_args + 0)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jp	Z, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1538: if (script_cmd_args[1] == 1) {
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ldhl	sp,	#5
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1539: active_script_ctx.actor_move_dest_x = active_script_ctx.actor_move_dest_x - (script_cmd_args[0] * 8);
	ld	de, #_active_script_ctx
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#4
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1538: if (script_cmd_args[1] == 1) {
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	jr	NZ, 00111$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1539: active_script_ctx.actor_move_dest_x = active_script_ctx.actor_move_dest_x - (script_cmd_args[0] * 8);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	dec	hl
	dec	hl
	ld	(hl-), a
	ld	(hl), e
	ld	de, #_active_script_ctx
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1541: if (U_LESS_THAN((*tmp_actor).pos.x, active_script_ctx.actor_move_dest_x)) {
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_active_script_ctx
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	bit	7, a
	jr	Z, 00106$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1542: active_script_ctx.actor_move_dest_x = ACTOR_MIN_X;
	ld	hl, #_active_script_ctx
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00114$
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1543: } else if (U_LESS_THAN(active_script_ctx.actor_move_dest_x, ACTOR_MIN_X)) {
	ldhl	sp,	#7
	bit	7, (hl)
	jr	Z, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1544: active_script_ctx.actor_move_dest_x = ACTOR_MIN_X;
	ld	hl, #_active_script_ctx
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00114$
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1547: active_script_ctx.actor_move_dest_x = active_script_ctx.actor_move_dest_x + (script_cmd_args[0] * 8);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	de, #_active_script_ctx
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1549: if (active_script_ctx.actor_move_dest_x > image_width - 16) {
	ld	hl, #_image_width
	ld	a, (hl)
	add	a, #0xf0
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00114$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1550: active_script_ctx.actor_move_dest_x = image_width - 16;
	ld	hl, #_active_script_ctx
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00114$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1555: active_script_ctx.actor_move_dest_y = 0;  // @wtf-but-needed
	ld	hl, #(_active_script_ctx + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1556: active_script_ctx.actor_move_dest_y = (*tmp_actor).pos.y;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1557: if (script_cmd_args[2] != 0) {
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jp	Z, 00126$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1558: if (script_cmd_args[3] == 1) {
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1559: active_script_ctx.actor_move_dest_y = active_script_ctx.actor_move_dest_y - (script_cmd_args[2] * 8);
	ld	de, #(_active_script_ctx + 0x0002)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, #0x03
00203$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00203$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1558: if (script_cmd_args[3] == 1) {
	ldhl	sp,	#3
	ld	a, (hl)
	dec	a
	jr	NZ, 00123$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1559: active_script_ctx.actor_move_dest_y = active_script_ctx.actor_move_dest_y - (script_cmd_args[2] * 8);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	de, #(_active_script_ctx + 0x0002)
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1561: if (active_script_ctx.actor_move_dest_y > (*tmp_actor).pos.y) {
	ld	de, #(_active_script_ctx + 0x0002)
	ld	a, (de)
	inc	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_tmp_actor
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00118$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1562: active_script_ctx.actor_move_dest_y = ACTOR_MIN_Y;
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00126$
00118$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1563: } else if (active_script_ctx.actor_move_dest_y < ACTOR_MIN_Y) {
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x08
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00126$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1564: active_script_ctx.actor_move_dest_y = ACTOR_MIN_Y;
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00126$
00123$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1567: active_script_ctx.actor_move_dest_y = active_script_ctx.actor_move_dest_y + (script_cmd_args[2] * 8);
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	de, #(_active_script_ctx + 0x0002)
	dec	hl
	ld	a, (hl)
	ld	(de), a
	inc	de
	inc	hl
	ld	a, (hl)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1569: if (active_script_ctx.actor_move_dest_y > image_height - 8) {
	ld	hl, #_image_height
	ld	a, (hl)
	add	a, #0xf8
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00126$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1570: active_script_ctx.actor_move_dest_y = image_height - 8;
	ld	hl, #(_active_script_ctx + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00126$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1575: active_script_ctx.actor_move_cols = script_cmd_args[4];
	ld	hl, #(_script_cmd_args + 0x0004)
	ld	c, (hl)
	ld	hl, #(_active_script_ctx + 0x0013)
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1576: active_script_ctx.actor_move_type = script_cmd_args[5];
	ld	a, (#(_script_cmd_args + 0x0005) + 0)
	ld	(#(_active_script_ctx + 0x0014)),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1578: (*tmp_actor).script_control = TRUE;
	ld	hl, #_tmp_actor + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001b
	add	hl, de
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1580: if (active_script_ctx.actor_move_cols) {
	ld	a, c
	or	a, a
	jr	Z, 00128$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1581: ScriptHelper_CalcDest();
	call	_ScriptHelper_CalcDest
00128$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1584: if (active_script_ctx.actor_move_type == MOVE_DIAGONAL) {
	ld	hl, #(_active_script_ctx + 0x0014)
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1585: active_script_ctx.script_update_fn = ScriptUpdate_MoveActorDiag;
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1584: if (active_script_ctx.actor_move_type == MOVE_DIAGONAL) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00130$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1585: active_script_ctx.script_update_fn = ScriptUpdate_MoveActorDiag;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveActorDiag)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveActorDiag)
	jr	00132$
00130$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1587: active_script_ctx.script_update_fn = ScriptUpdate_MoveActor;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_MoveActor)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_MoveActor)
00132$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1589: }
	add	sp, #8
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1599: void Script_ActorSetPosRel_b() {
;	---------------------------------
; Function Script_ActorSetPosRel_b
; ---------------------------------
_Script_ActorSetPosRel_b::
	add	sp, #-6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1600: if (script_cmd_args[0] != 0) {
	ld	hl, #_script_cmd_args
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00105$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1601: if (script_cmd_args[1]) {
	ld	hl, #_script_cmd_args + 1
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1602: actors[active_script_ctx.script_actor].pos.x = actors[active_script_ctx.script_actor].pos.x - (script_cmd_args[0] * 8);
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1601: if (script_cmd_args[1]) {
	ld	a, e
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1602: actors[active_script_ctx.script_actor].pos.x = actors[active_script_ctx.script_actor].pos.x - (script_cmd_args[0] * 8);
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jr	00105$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1604: actors[active_script_ctx.script_actor].pos.x = actors[active_script_ctx.script_actor].pos.x + (script_cmd_args[0] * 8);
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1608: if (script_cmd_args[2] != 0) {
	ld	hl, #_script_cmd_args + 2
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	Z, 00111$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1609: if (script_cmd_args[3]) {
	ld	bc, #_script_cmd_args + 3
	ld	a, (bc)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1610: actors[active_script_ctx.script_actor].pos.y = actors[active_script_ctx.script_actor].pos.y - (script_cmd_args[2] * 8);
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1609: if (script_cmd_args[3]) {
	or	a, a
	jr	Z, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1610: actors[active_script_ctx.script_actor].pos.y = actors[active_script_ctx.script_actor].pos.y - (script_cmd_args[2] * 8);
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	e, a
	ld	a, #>(_actors)
	adc	a, h
	ld	d, a
	inc	de
	inc	de
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	a, l
	sub	a, c
	ld	c, a
	ld	a, h
	sbc	a, b
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00111$
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1612: actors[active_script_ctx.script_actor].pos.y = actors[active_script_ctx.script_actor].pos.y + (script_cmd_args[2] * 8);
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	e, a
	ld	a, #>(_actors)
	adc	a, h
	ld	d, a
	inc	de
	inc	de
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1615: }
	add	sp, #6
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1626: void Script_MathAdd_b() {
;	---------------------------------
; Function Script_MathAdd_b
; ---------------------------------
_Script_MathAdd_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1627: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1628: UBYTE a = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1629: UBYTE b = script_cmd_args[2];
	ld	de, #_script_cmd_args + 2
	ld	a, (de)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1630: script_variables[ptr] = a + b;
	add	a, c
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1631: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1642: void Script_MathSub_b() {
;	---------------------------------
; Function Script_MathSub_b
; ---------------------------------
_Script_MathSub_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1643: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1644: UBYTE a = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1645: UBYTE b = script_cmd_args[2];
	ld	de, #_script_cmd_args + 2
	ld	a, (de)
	ld	b, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1646: script_variables[ptr] = a - b;
	ld	a, c
	sub	a, b
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1647: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1658: void Script_MathMul_b() {
;	---------------------------------
; Function Script_MathMul_b
; ---------------------------------
_Script_MathMul_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1659: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	xor	a, a
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1660: UBYTE a = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1661: UBYTE b = script_cmd_args[2];
	ld	hl, #_script_cmd_args + 2
	ld	d, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1662: script_variables[ptr] = a * b;
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	__muluchar
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1663: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1674: void Script_MathDiv_b() {
;	---------------------------------
; Function Script_MathDiv_b
; ---------------------------------
_Script_MathDiv_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1675: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	xor	a, a
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1676: UBYTE a = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1677: UBYTE b = script_cmd_args[2];
	ld	hl, #_script_cmd_args + 2
	ld	d, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1678: script_variables[ptr] = a / b;
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	__divuchar
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1679: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1690: void Script_MathMod_b() {
;	---------------------------------
; Function Script_MathMod_b
; ---------------------------------
_Script_MathMod_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1691: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	xor	a, a
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1692: UBYTE a = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1693: UBYTE b = script_cmd_args[2];
	ld	hl, #_script_cmd_args + 2
	ld	d, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1694: script_variables[ptr] = a % b;
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	__moduchar
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1695: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1702: void Script_MathAddVal_b() {
;	---------------------------------
; Function Script_MathAddVal_b
; ---------------------------------
_Script_MathAddVal_b::
	add	sp, #-6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1703: UBYTE a = script_variables[active_script_ctx.script_ptr_x];
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_script_variables
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1704: UBYTE b = script_variables[active_script_ctx.script_ptr_y];
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_script_variables
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1705: UBYTE clamp = script_cmd_args[0];
	ld	a, (#_script_cmd_args + 0)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1707: if (!clamp || a < 255 - b) {
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	ld	a, #0xff
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	dec	hl
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00112$
	bit	7, d
	jr	NZ, 00113$
	cp	a, a
	jr	00113$
00112$:
	bit	7, d
	jr	Z, 00113$
	scf
00113$:
	jr	NC, 00102$
00101$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1708: script_variables[active_script_ctx.script_ptr_x] = a + b;
	ldhl	sp,	#2
	ld	a, (hl+)
	add	a, (hl)
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
	jr	00105$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1710: script_variables[active_script_ctx.script_ptr_x] = 255;
	pop	hl
	push	hl
	ld	(hl), #0xff
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1713: }
	add	sp, #6
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1720: void Script_MathSubVal_b() {
;	---------------------------------
; Function Script_MathSubVal_b
; ---------------------------------
_Script_MathSubVal_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1721: UBYTE a = script_variables[active_script_ctx.script_ptr_x];
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #<(_script_variables)
	ld	c, a
	ld	a, b
	adc	a, #>(_script_variables)
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1722: UBYTE b = script_variables[active_script_ctx.script_ptr_y];
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1723: UBYTE clamp = script_cmd_args[0];
	ld	a, (#_script_cmd_args + 0)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1725: if (!clamp || a > b) {
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#1
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00102$
00101$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1726: script_variables[active_script_ctx.script_ptr_x] = a - b;
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, (hl)
	ld	(bc), a
	jr	00105$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1728: script_variables[active_script_ctx.script_ptr_x] = 0;
	xor	a, a
	ld	(bc), a
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1730: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1737: void Script_MathMulVal_b() {
;	---------------------------------
; Function Script_MathMulVal_b
; ---------------------------------
_Script_MathMulVal_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1738: UBYTE a = script_variables[active_script_ctx.script_ptr_x];
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #<(_script_variables)
	ld	c, a
	ld	a, b
	adc	a, #>(_script_variables)
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1739: UBYTE b = script_variables[active_script_ctx.script_ptr_y];
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	a, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1740: script_variables[active_script_ctx.script_ptr_x] = a * b;
	push	bc
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	__muluchar
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1741: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1748: void Script_MathDivVal_b() {
;	---------------------------------
; Function Script_MathDivVal_b
; ---------------------------------
_Script_MathDivVal_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1749: UBYTE a = script_variables[active_script_ctx.script_ptr_x];
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #<(_script_variables)
	ld	c, a
	ld	a, b
	adc	a, #>(_script_variables)
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1750: UBYTE b = script_variables[active_script_ctx.script_ptr_y];
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	a, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1751: script_variables[active_script_ctx.script_ptr_x] = a / b;
	push	bc
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	__divuchar
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1752: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1759: void Script_MathModVal_b() {
;	---------------------------------
; Function Script_MathModVal_b
; ---------------------------------
_Script_MathModVal_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1760: UBYTE a = script_variables[active_script_ctx.script_ptr_x];
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #<(_script_variables)
	ld	c, a
	ld	a, b
	adc	a, #>(_script_variables)
	ld	b, a
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1761: UBYTE b = script_variables[active_script_ctx.script_ptr_y];
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	a, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1762: script_variables[active_script_ctx.script_ptr_x] = a % b;
	push	bc
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	__moduchar
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1763: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1770: void Script_CopyVal_b() {
;	---------------------------------
; Function Script_CopyVal_b
; ---------------------------------
_Script_CopyVal_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1771: UBYTE value = script_variables[active_script_ctx.script_ptr_y];
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_script_variables
	add	hl, bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1772: script_variables[active_script_ctx.script_ptr_x] = value;
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1773: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1785: void Script_IfValueCompare_b() {
;	---------------------------------
; Function Script_IfValueCompare_b
; ---------------------------------
_Script_IfValueCompare_b::
	dec	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1787: UBYTE a = script_variables[active_script_ctx.script_ptr_x];
	ld	hl, #_active_script_ctx + 10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_script_variables
	add	hl, bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1788: UBYTE b = script_variables[active_script_ctx.script_ptr_y];
	ld	hl, #_active_script_ctx + 12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	de, #_script_variables
	add	hl, de
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1790: switch (script_cmd_args[0]) {
	ld	a, (#_script_cmd_args + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, #0x06
	ldhl	sp,	#0
	sub	a, (hl)
	jr	C, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1792: match = a == b;
	ld	a, c
	sub	a, b
	ld	a, #0x01
	jr	Z, 00124$
	xor	a, a
00124$:
	ld	e, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1795: match = a < b;
	ld	a, c
	sub	a, b
	ld	a, #0x00
	rla
	ld	d, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1798: match = a <= b;
	ld	a, b
	sub	a, c
	ld	a, #0x00
	rla
	ld	c, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1790: switch (script_cmd_args[0]) {
	push	de
	ldhl	sp,	#2
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00125$
	add	hl, de
	add	hl, de
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1791: case OPERATOR_EQ:
	pop	de
	jp	(hl)
00125$:
	jr	00107$
	jr	00101$
	jr	00106$
	jr	00102$
	jr	00104$
	jr	00103$
	jr	00105$
00101$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1792: match = a == b;
	ld	a, e
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1793: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1794: case OPERATOR_LT:
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1795: match = a < b;
	ld	a, d
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1796: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1797: case OPERATOR_LTE:
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1798: match = a <= b;
	ld	a, c
	xor	a, #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1799: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1800: case OPERATOR_GT:
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1801: match = a > b;
	ld	a, c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1802: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1803: case OPERATOR_GTE:
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1804: match = a >= b;
	ld	a, d
	xor	a, #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1805: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1806: case OPERATOR_NE:
00106$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1807: match = a != b;
	ld	a, e
	xor	a, #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1808: break;
	jr	00108$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1809: default:
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1810: match = FALSE;
	xor	a, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1811: }
00108$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1813: if (match) {  // True path, jump to position specified by ptr
	or	a, a
	jr	Z, 00111$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1814: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[1] * 256) + script_cmd_args[2];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	e, a
	ld	l, #0x00
	ld	h, e
	add	hl, bc
	ld	bc, #_script_cmd_args + 2
	ld	a, (bc)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1816: }
	inc	sp
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1828: void Script_LoadVectors_b() {
;	---------------------------------
; Function Script_LoadVectors_b
; ---------------------------------
_Script_LoadVectors_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1829: active_script_ctx.script_ptr_x = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_active_script_ctx + 0x000a)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1830: active_script_ctx.script_ptr_y = (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_script_cmd_args + 2
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_active_script_ctx + 0x000c)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1831: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1840: void Script_ActorSetMoveSpeed_b() {
;	---------------------------------
; Function Script_ActorSetMoveSpeed_b
; ---------------------------------
_Script_ActorSetMoveSpeed_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1841: actors[active_script_ctx.script_actor].move_speed = script_cmd_args[0];
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (#_script_cmd_args + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1842: actors[active_script_ctx.script_actor].pos.x = actors[active_script_ctx.script_actor].pos.x & 0xFFFC;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	h, (hl)
	and	a, #0xfc
	ld	e, a
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1843: actors[active_script_ctx.script_actor].pos.y = actors[active_script_ctx.script_actor].pos.y & 0xFFFC;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	inc	hl
	inc	hl
	ld	c,l
	ld	b,h
	ld	a, (hl+)
	ld	h, (hl)
	and	a, #0xfc
	ld	e, a
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1844: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1853: void Script_ActorSetAnimSpeed_b() {
;	---------------------------------
; Function Script_ActorSetAnimSpeed_b
; ---------------------------------
_Script_ActorSetAnimSpeed_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1854: actors[active_script_ctx.script_actor].anim_speed = script_cmd_args[0];
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	bc, #0x0015
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (#_script_cmd_args + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1855: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1865: void Script_TextSetAnimSpeed_b() {
;	---------------------------------
; Function Script_TextSetAnimSpeed_b
; ---------------------------------
_Script_TextSetAnimSpeed_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1866: text_in_speed = script_cmd_args[0];
	ld	a, (#_script_cmd_args + 0)
	ld	(#_text_in_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1867: text_out_speed = script_cmd_args[1];
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	(#_text_out_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1868: text_draw_speed = script_cmd_args[2];
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	(#_text_draw_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1869: text_ff_joypad = script_cmd_args[3] ? (J_A | J_B) : 0;
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	or	a, a
	jr	Z, 00103$
	ld	bc, #0x0030
	jr	00104$
00103$:
	ld	bc, #0x0000
00104$:
	ld	hl, #_text_ff_joypad
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1870: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1877: void Script_ActorInvoke_b() {
;	---------------------------------
; Function Script_ActorInvoke_b
; ---------------------------------
_Script_ActorInvoke_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1880: Script_StackPush_b();
	call	_Script_StackPush_b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1882: events_ptr = &actors[active_script_ctx.script_actor].events_ptr;
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	bc, #0x001e
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1883: active_script_ctx.script_ptr_bank = events_ptr->bank;
	ld	de, #_active_script_ctx + 14
	ld	a, (bc)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1884: active_script_ctx.script_ptr = (BankDataPtr(script_ctxs[ctx].active_script_ctx.script_ptr_bank)) + events_ptr->offset;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
	add	a, #0x40
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1885: active_script_ctx.script_update_fn = FALSE;
	ld	hl, #(_active_script_ctx + 0x0004)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1886: active_script_ctx.script_start_ptr = active_script_ctx.script_ptr;
	ld	hl, #(_active_script_ctx + 0x0006)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1887: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1895: void Script_StackPush_b() {
;	---------------------------------
; Function Script_StackPush_b
; ---------------------------------
_Script_StackPush_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1896: script_bank_stack[script_stack_ptr] = active_script_ctx.script_ptr_bank;
	ld	bc, #_script_bank_stack+0
	ld	a, c
	ld	hl, #_script_stack_ptr
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (#(_active_script_ctx + 0x000e) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1897: script_stack[script_stack_ptr] = active_script_ctx.script_ptr;
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	ld	hl, #_script_stack
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_active_script_ctx + 8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1898: script_start_stack[script_stack_ptr] = active_script_ctx.script_start_ptr;
	ld	hl, #_script_stack_ptr
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	ld	hl, #_script_start_stack
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1899: script_stack[script_stack_ptr] += 1 + script_cmd_args_len;
	ld	hl, #_script_stack_ptr
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, a
	rl	b
	add	a, #<(_script_stack)
	ld	c, a
	ld	a, b
	adc	a, #>(_script_stack)
	ld	b, a
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_script_cmd_args_len
	ld	e, (hl)
	ld	d, #0x00
	inc	de
;c
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1900: script_stack_ptr++;
	ld	hl, #_script_stack_ptr
	inc	(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1901: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1909: void Script_StackPop_b() __banked {
;	---------------------------------
; Function Script_StackPop_b
; ---------------------------------
	b_Script_StackPop_b	= 4
_Script_StackPop_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1910: script_stack_ptr--;
	ld	hl, #_script_stack_ptr
	dec	(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1911: active_script_ctx.script_ptr_bank = script_bank_stack[script_stack_ptr];
	ld	bc, #_active_script_ctx + 14
	ld	de, #_script_bank_stack+0
	ld	a, e
	add	a, (hl)
	ld	e, a
	jr	NC, 00103$
	inc	d
00103$:
	ld	a, (de)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1912: active_script_ctx.script_ptr = script_stack[script_stack_ptr];
	ld	bc, #_script_stack+0
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1913: active_script_ctx.script_start_ptr = script_start_stack[script_stack_ptr];
	ld	bc, #_script_start_stack+0
	ld	hl, #_script_stack_ptr
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_active_script_ctx + 0x0006)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1914: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1921: void Script_ScenePushState_b() {
;	---------------------------------
; Function Script_ScenePushState_b
; ---------------------------------
_Script_ScenePushState_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1922: if (scene_stack_ptr < MAX_SCENE_STATES) {
	ld	hl, #_scene_stack_ptr
	ld	a, (hl)
	sub	a, #0x08
	ret	NC
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1923: scene_stack[scene_stack_ptr].scene_index = current_state;
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_scene_stack)
	ld	c, a
	ld	a, h
	adc	a, #>(_scene_stack)
	ld	b, a
	ld	hl, #_current_state
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1924: scene_stack[scene_stack_ptr].player_dir.x = actors[0].dir.x;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	bc, #0x0006
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (#(_actors + 0x0005) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1925: scene_stack[scene_stack_ptr].player_dir.y = actors[0].dir.y;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	bc, #0x0007
	add	hl, bc
	ld	bc, #_actors + 6
	ld	a, (bc)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1926: scene_stack[scene_stack_ptr].player_pos.x = 0;  // @wtf-but-needed
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1927: scene_stack[scene_stack_ptr].player_pos.x = actors[0].pos.x >> 3;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	hl, #_actors
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1928: scene_stack[scene_stack_ptr].player_pos.y = 0;  // @wtf-but-needed
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	bc, #0x0004
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1929: scene_stack[scene_stack_ptr].player_pos.y = actors[0].pos.y >> 3;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_scene_stack)
	ld	c, a
	ld	a, h
	adc	a, #>(_scene_stack)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	hl, #_actors + 2
	ld	a, (hl+)
	ld	h, (hl)
	ld	e, a
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1930: scene_stack_ptr++;
	ld	hl, #_scene_stack_ptr
	inc	(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1932: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1941: void Script_ScenePopState_b() {
;	---------------------------------
; Function Script_ScenePopState_b
; ---------------------------------
_Script_ScenePopState_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1944: if (scene_stack_ptr) {
	ld	hl, #_scene_stack_ptr
	ld	a, (hl)
	or	a, a
	jp	Z, 00103$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1945: scene_stack_ptr--;
	dec	(hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1947: scene_next_index = scene_stack[scene_stack_ptr].scene_index;
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1949: map_next_pos.x = 0;  // @wtf-but-needed
	ld	hl, #_map_next_pos
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1950: map_next_pos.x = scene_stack[scene_stack_ptr].player_pos.x * 8;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_map_next_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1951: map_next_pos.y = 0;  // @wtf-but-needed
	ld	hl, #(_map_next_pos + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1952: map_next_pos.y = scene_stack[scene_stack_ptr].player_pos.y * 8;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	bc, #0x0004
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #(_map_next_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1953: map_next_dir.x = scene_stack[scene_stack_ptr].player_dir.x;
	ld	bc, #_map_next_dir+0
	ld	hl, #_scene_stack_ptr
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	de, #0x0006
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1954: map_next_dir.y = scene_stack[scene_stack_ptr].player_dir.y;
	ld	bc, #_map_next_dir+1
	ld	hl, #_scene_stack_ptr
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	de, #0x0007
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1956: SetScene(scene_next_index);
	pop	hl
	push	hl
	push	hl
	call	_SetScene
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1957: FadeSetSpeed(script_cmd_args[0]);
	ld	a, (#_script_cmd_args + 0)
	push	af
	inc	sp
	call	_FadeSetSpeed
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1958: active_script_ctx.script_update_fn = ScriptUpdate_AwaitFade;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitFade)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitFade)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1960: return;
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1962: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1969: void Script_SceneResetStack_b() {
;	---------------------------------
; Function Script_SceneResetStack_b
; ---------------------------------
_Script_SceneResetStack_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1970: scene_stack_ptr = 0;
	ld	hl, #_scene_stack_ptr
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1971: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1978: void Script_ScenePopAllState_b() {
;	---------------------------------
; Function Script_ScenePopAllState_b
; ---------------------------------
_Script_ScenePopAllState_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1981: if (scene_stack_ptr) {
	ld	hl, #_scene_stack_ptr
	ld	a, (hl)
	or	a, a
	jp	Z, 00103$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1982: scene_stack_ptr = 0;
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1984: scene_next_index = scene_stack[scene_stack_ptr].scene_index;
	ld	de, #_scene_stack
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1986: map_next_pos.x = 0;  // @wtf-but-needed
	ld	hl, #_map_next_pos
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1987: map_next_pos.x = scene_stack[scene_stack_ptr].player_pos.x * 8;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_map_next_pos
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1988: map_next_pos.y = 0;  // @wtf-but-needed
	ld	hl, #(_map_next_pos + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1989: map_next_pos.y = scene_stack[scene_stack_ptr].player_pos.y * 8;
	ld	hl, #_scene_stack_ptr
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	bc, #0x0004
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #(_map_next_pos + 0x0002)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1990: map_next_dir.x = scene_stack[scene_stack_ptr].player_dir.x;
	ld	bc, #_map_next_dir+0
	ld	hl, #_scene_stack_ptr
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	de, #0x0006
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1991: map_next_dir.y = scene_stack[scene_stack_ptr].player_dir.y;
	ld	bc, #_map_next_dir+1
	ld	hl, #_scene_stack_ptr
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_scene_stack
	add	hl, de
	ld	de, #0x0007
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1993: SetScene(scene_next_index);
	pop	hl
	push	hl
	push	hl
	call	_SetScene
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1994: FadeSetSpeed(script_cmd_args[0]);
	ld	a, (#_script_cmd_args + 0)
	push	af
	inc	sp
	call	_FadeSetSpeed
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1995: active_script_ctx.script_update_fn = ScriptUpdate_AwaitFade;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitFade)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitFade)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1997: return;
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:1999: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2006: void Script_SetInputScript_b() {
;	---------------------------------
; Function Script_SetInputScript_b
; ---------------------------------
_Script_SetInputScript_b::
	add	sp, #-10
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2009: input = script_cmd_args[0];
	ld	a, (#_script_cmd_args + 0)
	ldhl	sp,	#8
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2011: if (script_cmd_args[1]) {
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2012: SET_BIT_MASK(input_script_persist, input);
	ld	a, (#_input_script_persist)
	ldhl	sp,	#8
	or	a, (hl)
	ld	(#_input_script_persist),a
	jr	00103$
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2014: UNSET_BIT_MASK(input_script_persist, input);
	ldhl	sp,	#8
	ld	a, (hl)
	cpl
	ld	hl, #_input_script_persist
	and	a, (hl)
	ld	(hl), a
00103$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2017: SET_BIT_MASK(input_override_default, input);
	ld	a, (#_input_override_default)
	ldhl	sp,	#8
	or	a, (hl)
	ld	(#_input_override_default),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2020: for (index = 0; index != 8; ++index) {
	xor	a, a
	ldhl	sp,	#9
	ld	(hl), a
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2021: if (input & 1) {
	ldhl	sp,	#8
	bit	0, (hl)
	jr	Z, 00105$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2022: input_script_ptrs[index].bank = script_cmd_args[2];
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_input_script_ptrs)
	ld	c, a
	ld	a, h
	adc	a, #>(_input_script_ptrs)
	ld	b, a
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2023: input_script_ptrs[index].offset = (script_cmd_args[3] * 256) + script_cmd_args[4];
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ld	c, a
	ldhl	sp,	#3
	ld	a, c
	ld	(hl-), a
	ld	(hl), #0x00
	ld	a, (#(_script_cmd_args + 0x0004) + 0)
	inc	hl
	inc	hl
	ld	(hl), a
	xor	a, a
	inc	hl
;c
	ld	(hl-), a
	dec	hl
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
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
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
00105$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2025: input = input >> 1;
	ldhl	sp,	#8
	ld	a, (hl)
	srl	a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2020: for (index = 0; index != 8; ++index) {
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2027: }
	add	sp, #10
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2034: void Script_RemoveInputScript_b() {
;	---------------------------------
; Function Script_RemoveInputScript_b
; ---------------------------------
_Script_RemoveInputScript_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2037: input = script_cmd_args[0];
	ld	hl, #_script_cmd_args
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2039: UNSET_BIT_MASK(input_override_default, input);
	ld	a, c
	cpl
	ld	hl, #_input_override_default
	and	a, (hl)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2042: for (index = 0; index != 8; ++index) {
	ld	b, #0x00
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2043: if (input & 1) {
	bit	0, c
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2044: input_script_ptrs[index].bank = 0;
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	ld	de, #_input_script_ptrs
	add	hl, de
	ld	(hl), #0x00
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2046: input = input >> 1;
	srl	c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2042: for (index = 0; index != 8; ++index) {
	inc	b
	ld	a, b
	sub	a, #0x08
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2048: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2055: void Script_ActorSetFrame_b() {
;	---------------------------------
; Function Script_ActorSetFrame_b
; ---------------------------------
_Script_ActorSetFrame_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2056: actors[active_script_ctx.script_actor].frame = 0;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2057: actors[active_script_ctx.script_actor].frame = script_cmd_args[0] % actors[active_script_ctx.script_actor].frames_len;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	ld	hl, #0x000f
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	de, #_script_cmd_args+0
	ld	a, (de)
	ld	d, a
	ld	hl, #0x0010
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	add	sp, #2
	ld	c, e
	pop	hl
	push	hl
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2058: actors[active_script_ctx.script_actor].rerender = TRUE;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x0014
	add	hl, bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2059: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2066: void Script_ActorSetFrameToVal_b() {
;	---------------------------------
; Function Script_ActorSetFrameToVal_b
; ---------------------------------
_Script_ActorSetFrameToVal_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2067: actors[active_script_ctx.script_actor].frame = 0;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2068: actors[active_script_ctx.script_actor].frame = script_variables[(script_cmd_args[0] * 256) + script_cmd_args[1]] %
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	a, #<(_actors)
	add	a, l
	ld	c, a
	ld	a, #>(_actors)
	adc	a, h
	ld	b, a
	ld	hl, #0x000f
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	de, #_script_cmd_args+0
	ld	a, (de)
	ld	h, a
	ld	l, #0x00
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	de, #_script_variables
	add	hl, de
	ld	d, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2069: actors[active_script_ctx.script_actor].frames_len;
	ld	hl, #0x0010
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	add	sp, #2
	ld	c, e
	pop	hl
	push	hl
	ld	(hl), c
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2070: actors[active_script_ctx.script_actor].rerender = TRUE;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x0014
	add	hl, bc
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2071: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2078: void Script_ActorSetFlip_b() { /* NOOP - This command has been removed */
;	---------------------------------
; Function Script_ActorSetFlip_b
; ---------------------------------
_Script_ActorSetFlip_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2079: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2090: void Script_TextMulti_b() {
;	---------------------------------
; Function Script_TextMulti_b
; ---------------------------------
_Script_TextMulti_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2092: mode = script_cmd_args[0];
	ld	hl, #_script_cmd_args
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2096: if (mode == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2097: tmp_text_out_speed = text_out_speed;
	ld	a, (#_text_out_speed)
	ld	(#_tmp_text_out_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2098: text_out_speed = 0;
	ld	hl, #_text_out_speed
	ld	(hl), #0x00
	ret
00110$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2099: } else if (mode == 1) {
	ld	a, c
	dec	a
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2100: tmp_text_in_speed = text_in_speed;
	ld	a, (#_text_in_speed)
	ld	(#_tmp_text_in_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2101: text_in_speed = 0;
	ld	hl, #_text_in_speed
	ld	(hl), #0x00
	ret
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2103: text_out_speed = tmp_text_out_speed;
	ld	hl, #_tmp_text_out_speed
	ld	b, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2102: } else if (mode == 2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2103: text_out_speed = tmp_text_out_speed;
	ld	hl, #_text_out_speed
	ld	(hl), b
	ret
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2104: } else if (mode == 3) {
	ld	a, c
	sub	a, #0x03
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2105: text_in_speed = tmp_text_in_speed;
	ld	a, (#_tmp_text_in_speed)
	ld	(#_text_in_speed),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2106: text_out_speed = tmp_text_out_speed;
	ld	hl, #_text_out_speed
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2110: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2119: void Script_VariableAddFlags_b() {
;	---------------------------------
; Function Script_VariableAddFlags_b
; ---------------------------------
_Script_VariableAddFlags_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2120: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2121: UBYTE a = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2122: UBYTE b = script_cmd_args[2];
	ld	de, #_script_cmd_args + 2
	ld	a, (de)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2123: script_variables[ptr] = a | b;
	or	a, c
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2124: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2133: void Script_VariableClearFlags_b() {
;	---------------------------------
; Function Script_VariableClearFlags_b
; ---------------------------------
_Script_VariableClearFlags_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2134: UWORD ptr = (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2135: UBYTE a = script_variables[ptr];
	ld	bc,#_script_variables
	add	hl,bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2136: UBYTE b = script_cmd_args[2];
	ld	de, #_script_cmd_args + 2
	ld	a, (de)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2137: script_variables[ptr] = a & ~b;
	cpl
	and	a, c
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2138: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2144: void Script_SoundPlayTone_b() {
;	---------------------------------
; Function Script_SoundPlayTone_b
; ---------------------------------
_Script_SoundPlayTone_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2145: SoundPlayTone((script_cmd_args[0] * 256) + script_cmd_args[1], script_cmd_args[2]);
	ld	hl, #_script_cmd_args + 2
	ld	b, (hl)
	ld	a, (#_script_cmd_args + 0)
	ld	d, a
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	bc
	inc	sp
	push	hl
	call	_SoundPlayTone
	add	sp, #3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2146: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2152: void Script_SoundStopTone_b() {
;	---------------------------------
; Function Script_SoundStopTone_b
; ---------------------------------
_Script_SoundStopTone_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2153: SoundStopTone();
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2154: }
	jp  _SoundStopTone
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2160: void Script_SoundPlayBeep_b() {
;	---------------------------------
; Function Script_SoundPlayBeep_b
; ---------------------------------
_Script_SoundPlayBeep_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2161: SoundPlayBeep(script_cmd_args[0]);
	ld	a, (#_script_cmd_args + 0)
	push	af
	inc	sp
	call	_SoundPlayBeep
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2162: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2168: void Script_SoundPlayCrash_b() {
;	---------------------------------
; Function Script_SoundPlayCrash_b
; ---------------------------------
_Script_SoundPlayCrash_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2169: SoundPlayCrash();
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2170: }
	jp  _SoundPlayCrash
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2177: void Script_SetTimerScript_b() {
;	---------------------------------
; Function Script_SetTimerScript_b
; ---------------------------------
_Script_SetTimerScript_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2178: timer_script_duration = script_cmd_args[0];
	ld	bc, #_script_cmd_args+0
	ld	a, (bc)
	ld	(#_timer_script_duration),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2179: timer_script_time = script_cmd_args[0];
	ld	a, (bc)
	ld	(#_timer_script_time),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2180: timer_script_ptr.bank = script_cmd_args[1];
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	(#_timer_script_ptr),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2181: timer_script_ptr.offset = (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	d, a
	ld	e, #0x00
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #(_timer_script_ptr + 0x0001)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2182: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2189: void Script_ResetTimer_b() {
;	---------------------------------
; Function Script_ResetTimer_b
; ---------------------------------
_Script_ResetTimer_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2190: timer_script_time = timer_script_duration;
	ld	a, (#_timer_script_duration)
	ld	(#_timer_script_time),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2191: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2198: void Script_RemoveTimerScript_b() {
;	---------------------------------
; Function Script_RemoveTimerScript_b
; ---------------------------------
_Script_RemoveTimerScript_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2199: timer_script_duration = 0;
	ld	hl, #_timer_script_duration
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2200: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2211: void Script_TextWithAvatar_b() {
;	---------------------------------
; Function Script_TextWithAvatar_b
; ---------------------------------
_Script_TextWithAvatar_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2212: avatar_enabled = TRUE;
	ld	hl, #_avatar_enabled
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2213: UIShowText(script_cmd_args[0], (script_cmd_args[1] * 256) + script_cmd_args[2]);
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	e, a
	ld	a, #0x00
	ld	hl, #_script_cmd_args + 2
	ld	c, (hl)
	ld	b, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	a, (#_script_cmd_args + 0)
	push	bc
	push	af
	inc	sp
	call	_UIShowText
	add	sp, #3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2214: UIShowAvatar(script_cmd_args[3]);
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	push	af
	inc	sp
	call	_UIShowAvatar
	inc	sp
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2215: active_script_ctx.script_update_fn = ScriptUpdate_AwaitUIClosed;
	ld	hl, #(_active_script_ctx + 0x0004)
	ld	(hl), #<(_ScriptUpdate_AwaitUIClosed)
	inc	hl
	ld	(hl), #>(_ScriptUpdate_AwaitUIClosed)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2216: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2218: void Script_LaunchProjectile_b() {
;	---------------------------------
; Function Script_LaunchProjectile_b
; ---------------------------------
_Script_LaunchProjectile_b::
	add	sp, #-10
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2221: UBYTE palette = actors[active_script_ctx.script_actor].palette_index;
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2223: dir_x = 0;
	xor	a, a
	ldhl	sp,	#1
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2224: dir_y = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2225: dir_value = script_variables[(script_cmd_args[1] * 256) + script_cmd_args[2]];
	ld	hl, #_script_cmd_args + 1
	ld	d, (hl)
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	de, #_script_variables
	add	hl, de
	ld	a, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2227: if (dir_value == 1) {
	cp	a, #0x01
	jr	NZ, 00110$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2228: dir_x = 0;
	xor	a, a
	ldhl	sp,	#1
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2229: dir_y = 1;
	ld	(hl+), a
	ld	(hl), #0x01
	jr	00111$
00110$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2230: } else if (dir_value == 2) {
	cp	a, #0x02
	jr	NZ, 00107$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2231: dir_x = -1;
	ldhl	sp,	#1
	ld	(hl), #0xff
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2232: dir_y = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
	jr	00111$
00107$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2233: } else if (dir_value == 4) {
	cp	a, #0x04
	jr	NZ, 00104$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2234: dir_x = 1;
	ldhl	sp,	#1
	ld	(hl), #0x01
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2235: dir_y = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
	jr	00111$
00104$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2236: } else if (dir_value == 8) {
	sub	a, #0x08
	jr	NZ, 00111$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2237: dir_x = 0;
	xor	a, a
	ldhl	sp,	#1
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2238: dir_y = -1;
	ld	(hl+), a
	ld	(hl), #0xff
00111$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2251: script_cmd_args[4] >> 4);                   // Collision mask
	ld	a, (#(_script_cmd_args + 0x0004) + 0)
	push	af
	swap	a
	and	a, #0x0f
	ldhl	sp,	#5
	ld	(hl), a
	pop	af
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2250: script_cmd_args[4] & 0xF,                   // Collision group
	and	a, #0x0f
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2248: script_cmd_args[3],                         // Move Speed
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ldhl	sp,	#5
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2244: actors[active_script_ctx.script_actor].pos.y + (dir_y * 16),  // Launch Y
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	a, e
	add	a, a
	rl	d
	add	a, a
	rl	d
	add	a, a
	rl	d
	add	a, a
	rl	d
;c
	ld	e, a
	ldhl	sp,	#6
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
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2243: actors[active_script_ctx.script_actor].pos.x + (dir_x * 16),  // Launch X
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2241: ProjectileLaunch(script_cmd_args[0],                         // Sprite
	ld	a, (#_script_cmd_args + 0)
	ldhl	sp,	#3
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#5
	ld	h, (hl)
	push	hl
	inc	sp
	ld	h, #0x3c
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	h, (hl)
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#15
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	push	hl
	push	bc
	ldhl	sp,	#11
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_ProjectileLaunch
	add	sp, #13
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2252: }
	add	sp, #10
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2254: void Script_WeaponAttack_b() {
;	---------------------------------
; Function Script_WeaponAttack_b
; ---------------------------------
_Script_WeaponAttack_b::
	add	sp, #-3
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2255: UBYTE palette = actors[active_script_ctx.script_actor].palette_index;
	ld	hl, #(_active_script_ctx + 0x0011)
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
	ld	de, #_actors
	add	hl, de
	ld	de, #0x000a
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2261: script_cmd_args[2] >> 4);  // Collision mask
	ld	de, #_script_cmd_args+0
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	push	af
	swap	a
	and	a, #0x0f
	ldhl	sp,	#3
	ld	(hl), a
	pop	af
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2260: script_cmd_args[2] & 0xF,  // Collision group
	and	a, #0x0f
	inc	hl
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2259: script_cmd_args[1],
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2256: WeaponAttack(script_cmd_args[0],  // Sprite
	push	af
	ld	a, (de)
	ld	e, a
	pop	af
	ldhl	sp,	#1
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	h, (hl)
	push	hl
	inc	sp
	ld	b, a
	push	bc
	ldhl	sp,	#4
	ld	d, (hl)
	push	de
	call	_WeaponAttack
	add	sp, #6
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2262: }
	add	sp, #3
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2264: void Script_PalSetBackground_b() {
;	---------------------------------
; Function Script_PalSetBackground_b
; ---------------------------------
_Script_PalSetBackground_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2265: palette_update_mask = script_cmd_args[0];
	ld	a, (#_script_cmd_args + 0)
	ld	(#_palette_update_mask),a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2266: LoadPalette((script_cmd_args[1] * 256) + script_cmd_args[2]);
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	c, a
	ld	a, #0x00
	ld	hl, #_script_cmd_args + 2
	ld	e, (hl)
	ld	d, #0x00
	ld	l, a
	ld	h, c
	add	hl, de
	push	hl
	call	_LoadPalette
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2267: ApplyPaletteChange();
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2268: }
	jp  _ApplyPaletteChange
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2270: void Script_PalSetSprite_b() {
;	---------------------------------
; Function Script_PalSetSprite_b
; ---------------------------------
_Script_PalSetSprite_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2271: LoadSpritePalette((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	push	hl
	call	_LoadSpritePalette
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2272: ApplyPaletteChange();  
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2273: }
	jp  _ApplyPaletteChange
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2275: void Script_PalSetUI_b() {
;	---------------------------------
; Function Script_PalSetUI_b
; ---------------------------------
_Script_PalSetUI_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2276: LoadUIPalette((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	push	hl
	call	_LoadUIPalette
	add	sp, #2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2277: ApplyPaletteChange();
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2278: }
	jp  _ApplyPaletteChange
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2280: void Script_ActorStopUpdate_b() {
;	---------------------------------
; Function Script_ActorStopUpdate_b
; ---------------------------------
_Script_ActorStopUpdate_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2281: actors[active_script_ctx.script_actor].moving = FALSE;
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x0007
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2282: if (actors[active_script_ctx.script_actor].movement_ctx) {
	ld	hl, #(_active_script_ctx + 0x0011)
	ld	b, (hl)
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
	ld	de, #0x002d
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2283: ScriptCtxPoolReturn(actors[active_script_ctx.script_actor].movement_ctx, active_script_ctx.script_actor);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_ScriptCtxPoolReturn
	add	sp, #2
00102$:
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2285: actors[active_script_ctx.script_actor].movement_ctx = 0; //@wtf fixes crash but still will not stop update script from same update script
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	c, a
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
	ld	de, #_actors
	add	hl, de
	ld	bc, #0x002d
	add	hl, bc
	ld	(hl), #0x00
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2286: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2288: void Script_ActorSetAnimate_b() {
;	---------------------------------
; Function Script_ActorSetAnimate_b
; ---------------------------------
_Script_ActorSetAnimate_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2289: actors[active_script_ctx.script_actor].animate = script_cmd_args[0];
	ld	bc, #_actors+0
	ld	a, (#(_active_script_ctx + 0x0011) + 0)
	ld	e, a
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
	add	hl, bc
	ld	bc, #0x0011
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (#_script_cmd_args + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2290: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2292: void Script_IfColorSupported_b() {
;	---------------------------------
; Function Script_IfColorSupported_b
; ---------------------------------
_Script_IfColorSupported_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2293: if (_cpu == CGB_TYPE) {
	ld	a, (#__cpu)
	sub	a, #0x11
	ret	NZ
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2294: active_script_ctx.script_ptr = active_script_ctx.script_start_ptr + (script_cmd_args[0] * 256) + script_cmd_args[1];
	ld	hl, #_active_script_ctx + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_script_cmd_args+0
	ld	a, (de)
	ld	h, a
	ld	l, #0x00
	add	hl, bc
	inc	de
	ld	a, (de)
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	hl, #(_active_script_ctx + 0x0008)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2296: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2298: void Script_EngFieldSet_b()
;	---------------------------------
; Function Script_EngFieldSet_b
; ---------------------------------
_Script_EngFieldSet_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2301: ptr = engine_fields_addr + ((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_engine_fields_addr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2302: *ptr = script_cmd_args[2];
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2303: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2305: void Script_EngFieldSetWord_b()
;	---------------------------------
; Function Script_EngFieldSetWord_b
; ---------------------------------
_Script_EngFieldSetWord_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2308: ptr = engine_fields_addr + ((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_engine_fields_addr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2309: *ptr = (script_cmd_args[2] * 256) + script_cmd_args[3];
	ld	hl, #_script_cmd_args + 2
	ld	d, (hl)
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2310: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2312: void Script_EngFieldSetVar_b()
;	---------------------------------
; Function Script_EngFieldSetVar_b
; ---------------------------------
_Script_EngFieldSetVar_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2316: ptr = engine_fields_addr + ((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_engine_fields_addr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2317: var_lo = script_variables[(script_cmd_args[2] * 256) + script_cmd_args[3]];
	ld	hl, #_script_cmd_args + 2
	ld	d, (hl)
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	de, #_script_variables
	add	hl, de
	ld	a, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2318: *ptr = var_lo;
	ld	(bc), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2319: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2321: void Script_EngFieldSetWordVar_b()
;	---------------------------------
; Function Script_EngFieldSetWordVar_b
; ---------------------------------
_Script_EngFieldSetWordVar_b::
	add	sp, #-2
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2325: ptr = engine_fields_addr + ((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_engine_fields_addr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	inc	sp
	inc	sp
	push	bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2326: var_hi = script_variables[(script_cmd_args[2] * 256) + script_cmd_args[3]];
	ld	a, (#(_script_cmd_args + 0x0002) + 0)
	ld	b, a
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0003) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	de, #_script_variables
	add	hl, de
	ld	e, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2327: var_lo = script_variables[(script_cmd_args[4] * 256) + script_cmd_args[5]];
	ld	hl, #_script_cmd_args + 4
	ld	b, (hl)
	ld	c, #0x00
	ld	hl, #_script_cmd_args + 5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	bc, #_script_variables
	add	hl, bc
	ld	c, (hl)
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2328: *ptr = (var_hi * 256) + var_lo;
	ld	a, #0x00
	ld	b, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2329: }
	add	sp, #2
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2331: void Script_EngFieldStore_b()
;	---------------------------------
; Function Script_EngFieldStore_b
; ---------------------------------
_Script_EngFieldStore_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2334: ptr = engine_fields_addr + ((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_engine_fields_addr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2335: script_variables[(script_cmd_args[2] * 256) + script_cmd_args[3]] = *ptr;
	ld	hl, #_script_cmd_args + 2
	ld	d, (hl)
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	de, #_script_variables
	add	hl, de
	ld	a, (bc)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2336: }
	ret
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2338: void Script_EngFieldStoreWord_b()
;	---------------------------------
; Function Script_EngFieldStoreWord_b
; ---------------------------------
_Script_EngFieldStoreWord_b::
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2341: ptr = engine_fields_addr + ((script_cmd_args[0] * 256) + script_cmd_args[1]);
	ld	hl, #_script_cmd_args
	ld	b, (hl)
	ld	c, #0x00
	ld	a, (#(_script_cmd_args + 0x0001) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_engine_fields_addr
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2342: script_variables[(script_cmd_args[2] * 256) + script_cmd_args[3]] = *ptr;
	ld	hl, #_script_cmd_args + 2
	ld	d, (hl)
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	a, #<(_script_variables)
	add	a, l
	ld	e, a
	ld	a, #>(_script_variables)
	adc	a, h
	ld	d, a
	ld	a, (bc)
	ld	(de), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2343: ptr += 1;
	inc	bc
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2344: script_variables[(script_cmd_args[4] * 256) + script_cmd_args[5]] = *ptr;
	ld	hl, #_script_cmd_args + 4
	ld	d, (hl)
	ld	e, #0x00
	ld	hl, #_script_cmd_args + 5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	de, #_script_variables
	add	hl, de
	ld	a, (bc)
	ld	(hl), a
;/tmp/_gbsbuild/src/core/ScriptRunner_b.c:2345: }
	ret
	.area _CODE_4
	.area _CABS (ABS)
