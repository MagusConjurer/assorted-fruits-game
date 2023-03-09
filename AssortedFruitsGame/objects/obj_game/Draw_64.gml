/// @description Draw sprites or details on the GUI level

if (bh_active)
{

	image_speed = 0.05;
	
	draw_set_color(c_green);
	
	if(bh_status_1())
	{
		draw_set_color(c_yellow);
		vignette_sprite = spr_bh_vignette_1;
		
		if (bh_status_2())
		{
			draw_set_color(c_orange);
			vignette_sprite = spr_bh_vignette_2;
		}
		
		if (bh_status_3())
		{
			draw_set_color(c_red);
			vignette_sprite = spr_bh_vignette_3;
		}
		
		draw_sprite(vignette_sprite,image_index,0,0);
	}
	
	
	draw_text(200,200,bh_time_spent);
	draw_set_color(c_black);
}