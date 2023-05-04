/// @description

// Inherit the parent event
event_inherited();

if(global.game_state == active_state)
{
	text_color = c_white;
	
	if(BH_DIALOGUE_HAS_COLLISION)
	{
		if(txt_width = 0 || spr_scale_x == 0)
		{
			txt_width = string_width(bh_dialogue);
			spr_scale_x = (txt_width / spr_width) + BH_DIALOGUE_BG_PERCENT_LARGER;
		}
		
		if(txt_height = 0 || spr_scale_y == 0)
		{
			txt_height = string_height(bh_dialogue);
			spr_scale_y = (txt_height / spr_height) + BH_DIALOGUE_BG_PERCENT_LARGER;
		}
		
		left_x = x - (spr_offset_x * spr_scale_x);
		right_x = x + (spr_width * spr_scale_x);
		
		top_y = y - ((spr_height * spr_scale_y) * 0.1);
		bot_y = y + (spr_height * spr_scale_y);
	}
}
else
{
	text_color = c_gray;
}