/// @description Draw sprites or details on the GUI level

if (bh_active)
{
	draw_set_color(c_green);
	
	index = bh_status_index();
	if(index <= bh_vignette_levels)
	{
		draw_sprite(spr_bh_vignette,index,0,0);
	}
	else
	{
		draw_sprite(spr_bh_vignette,bh_vignette_levels,0,0);
	}
	
	
	draw_text(100,BH_UI_MARGIN,bh_time_spent);
	draw_set_color(c_black);
}