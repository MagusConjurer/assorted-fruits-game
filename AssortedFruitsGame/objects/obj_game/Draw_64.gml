/// @description Draw sprites or details on the GUI level

if (bh_active)
{
	draw_set_color(c_green);
	
	index = bh_status_index();
	
	if(index <= bh_vignette_levels)
	{
		if(index > 0)
		{
			draw_sprite(spr_bh_vignette, index + BH_VIGNETTE_START_INDEX, bh_player.x, bh_player.y);
		}
		else
		{
			draw_sprite(spr_bh_vignette, 0, bh_player.x, bh_player.y);
		}
		
	}
	else
	{
		draw_sprite(spr_bh_vignette, bh_vignette_levels, bh_player.x, bh_player.y);
	}
	
	
	draw_text(150, BH_UI_MARGIN * 0.5,bh_time_spent);
	draw_set_color(c_black);
}