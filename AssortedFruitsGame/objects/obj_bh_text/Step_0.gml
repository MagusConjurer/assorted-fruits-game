/// @description

// Inherit the parent event
event_inherited();

if(global.game_state == active_state)
{
	text_color = c_white;
	
	if(BH_DIALOGUE_HAS_COLLISION)
	{
		left_x = x;
		right_x = x + string_width(bh_dialogue);
		
		top_y = y;
		bot_y = y + string_height(bh_dialogue);
	}
}
else
{
	text_color = c_gray;
}
