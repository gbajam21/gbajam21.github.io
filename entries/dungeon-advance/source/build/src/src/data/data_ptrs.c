#pragma bank 5
#include "data_ptrs.h"
#include "banks.h"

#ifdef __EMSCRIPTEN__
const unsigned int bank_data_ptrs[] = {
0,0,0,0,0,0,&bank_6_data,&bank_7_data
};
#endif

const BankPtr tileset_bank_ptrs[] = {
{0x06,0x1220},{0x06,0x1CB1}
};

const BankPtr background_bank_ptrs[] = {
{0x06,0x24B2},{0x06,0x3135},{0x06,0x32A0},{0x06,0x340B},{0x06,0x3576}
};

const BankPtr background_attr_bank_ptrs[] = {
{0x06,0x3E43},{0x07,0x0C80},{0x07,0x0DE8},{0x07,0x1A68},{0x07,0x1BD0}
};

const BankPtr palette_bank_ptrs[] = {
{0x06,0x2412},{0x06,0x241A},{0x06,0x2422},{0x06,0x2452},{0x06,0x2452},{0x06,0x2482}
};

const BankPtr sprite_bank_ptrs[] = {
{0x06,0x36E1},{0x06,0x3862}
};

const BankPtr scene_bank_ptrs[] = {
{0x06,0x3FAB},{0x06,0x3FC1},{0x07,0x1D38},{0x06,0x3FD7},{0x07,0x1DCE}
};

const BankPtr collision_bank_ptrs[] = {
{0x06,0x38A3},{0x06,0x3A0B},{0x07,0x0000},{0x06,0x3B73},{0x06,0x3CDB}
};

const BankPtr avatar_bank_ptrs[] = {
{0x00,0x0000}
};

const unsigned int music_tracks[] = {
0x5B47, 0x5B51, 0x5B5B, 0x5B6F, 0
};

const unsigned char music_banks[] = {
8, 8, 8, 8, 0
};

unsigned int start_scene_index = 0x0000;
int start_scene_x = 0x0000;
int start_scene_y = 0x0000;

char start_scene_dir_x = 1;
char start_scene_dir_y = 0;
unsigned int start_player_sprite = 0;
unsigned char start_player_move_speed = 1;
unsigned char start_player_anim_speed = 3;
WORD plat_min_vel = 304;
WORD plat_walk_vel = 6400;
WORD plat_run_vel = 6400;
WORD plat_walk_acc = 152;
WORD plat_run_acc = 152;
WORD plat_dec = 208;
WORD plat_jump_vel = 16384;
WORD plat_grav = 1792;
WORD plat_hold_grav = 512;
WORD plat_max_fall_vel = 20000;
UBYTE topdown_grid = 8;
UBYTE fade_style;
UBYTE *engine_fields_addr = &plat_min_vel;

unsigned char script_variables[500] = { 0 };
