/// @description Handles manual darkening


if(global.game_state == PAUSED)
{
	if(bh_ui_type == BH_UI_CIRCLE)
	{
		bh_darken_object_circle(x, y, sprite_width * 0.5);
	}
	else if(bh_ui_type == BH_UI_RECT)
	{
		bh_darken_object_rect(left_x, top_y, 
							  right_x, bot_y);
	}
}