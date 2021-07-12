#pragma bank 5
#include "data_ptrs.h"
#include "banks.h"

#ifdef __EMSCRIPTEN__
const unsigned int bank_data_ptrs[] = {
0,0,0,0,0,0,&bank_6_data,&bank_7_data
};
#endif

const BankPtr tileset_bank_ptrs[] = {
{0x06,0x130D},{0x06,0x1D9E}
};

const BankPtr background_bank_ptrs[] = {
{0x06,0x259F},{0x06,0x3222},{0x06,0x338D},{0x06,0x34F8},{0x06,0x3663}
};

const BankPtr background_attr_bank_ptrs[] = {
{0x07,0x0C80},{0x07,0x0DE8},{0x07,0x0F50},{0x07,0x1BD0},{0x07,0x1D38}
};

const BankPtr palette_bank_ptrs[] = {
{0x06,0x24FF},{0x06,0x2507},{0x06,0x250F},{0x06,0x253F},{0x06,0x253F},{0x06,0x256F}
};

const BankPtr sprite_bank_ptrs[] = {
{0x06,0x37CE},{0x06,0x394F},{0x06,0x3990},{0x06,0x39D1}
};

const BankPtr scene_bank_ptrs[] = {
{0x07,0x1EA0},{0x07,0x1EB6},{0x07,0x1ECC},{0x07,0x1FB4},{0x07,0x1FCA}
};

const BankPtr collision_bank_ptrs[] = {
{0x06,0x3A52},{0x06,0x3BBA},{0x07,0x0000},{0x06,0x3D22},{0x06,0x3E8A}
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
unsigned char start_fade_style = 0;
unsigned char script_variables[500] = { 0 };
