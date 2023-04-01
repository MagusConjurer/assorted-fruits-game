/// @description Draw sprites or details on the GUI level

if (bh_active)
{
	draw_set_color(c_green);
	
	index = bh_status_index();
	
	if(index <= bh_vignette_levels)
	{
		// Since it is drawGUI, the position is based on resolution rather than room
		vx_pos = bh_player.x - camera_x;
		vx_pos = vx_pos*(room_width/camera_width);
		vy_pos = bh_player.y - camera_y;
		vy_pos = vy_pos*(room_height/camera_height);
		if(index > 0)
		{
			draw_sprite(spr_bh_vignette, index + BH_VIGNETTE_START_INDEX, vx_pos, vy_pos);
		}
		else
		{
			draw_sprite(spr_bh_vignette, 0, vx_pos, bh_player.y);
		}
		
	}
	else
	{
		draw_sprite(spr_bh_vignette, bh_vignette_levels, bh_player.x, bh_player.y);
	}
	
	
	draw_text(150, BH_UI_MARGIN * 0.5,bh_time_spent);
	draw_set_color(c_black);
}