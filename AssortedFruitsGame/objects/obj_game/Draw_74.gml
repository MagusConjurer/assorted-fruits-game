/// @description Draw sprites or details on the GUI level

if(global.game_state == CREDITS)
{
	draw_sprite(spr_credits, 0, global.resolution_w / 2, global.resolution_h / 2);
}

if (bh_active)
{
	bh_update_vignette();
	
	if(bh_vignette_index <= bh_vignette_levels_total)
	{
		// Since it is drawGUI, the position is based on resolution rather than room
		vx_pos = bh_player.x - camera_x;
		vx_pos = vx_pos*(room_width/camera_width);
		vy_pos = bh_player.y - camera_y;
		vy_pos = vy_pos*(room_height/camera_height);
		
		if(bh_vignette_index > 0)
		{
			draw_sprite(spr_bh_vignette, bh_vignette_index, vx_pos, vy_pos);
		}
		else
		{
			draw_sprite(spr_bh_vignette, 0, vx_pos, bh_player.y);
		}
		
	}
	else
	{
		draw_sprite(spr_bh_vignette, bh_vignette_levels_total, bh_player.x, bh_player.y);
	}
	
	draw_set_color(BH_TIME_COLOR);
	draw_text(150, BH_UI_MARGIN * 0.5,bh_time_spent);	
	
	draw_set_color(c_black);
}