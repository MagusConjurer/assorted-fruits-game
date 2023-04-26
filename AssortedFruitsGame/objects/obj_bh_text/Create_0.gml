/// @description 

// Inherit the parent event
event_inherited();

text_color = c_white;

if(global.current_level == LEVEL_2_BUS_BATTLE)
{
	bg_color = c_red;
}
else
{
	switch(obj_game.bh_dinner_choice)
	{
		case BH_BATTLE_MOM:
			bg_color = C_MOM;
		break;
		case BH_BATTLE_DAD:
			bg_color = C_DAD;
		break;
		case BH_BATTLE_UNCLE:
			bg_color = C_UNCLE;
		break;
	}
}

bh_dialogue = "DEFAULT TEXT IS HERE FOR TESTING";

spr_width = sprite_get_width(BH_DIALOGUE_BG_SPRITE);
spr_height = sprite_get_height(BH_DIALOGUE_BG_SPRITE);
spr_offset_x = sprite_get_xoffset(BH_DIALOGUE_BG_SPRITE);
spr_scale_x = 0;
spr_scale_y = 0;



txt_width = 0;
txt_height = 0;
left_x = 0;
right_x = 0;
top_y = 0;
bot_y = 0;

