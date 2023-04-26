/// @description 

event_inherited();

if(global.game_state == active_state)
{
	if(bubble_current_health <= 0)
	{
		bh_bubble_destroyed(true);
		instance_destroy();
	}
	
	bubble_pop_time = bh_get_bubble_pop_time();
	
	if(bubble_time >= bubble_pop_time)
	{
		bh_bubble_destroyed(false);
		instance_destroy();
	}
	
	// Change the color based on the state of the bubble
	health_percentage = 1.0 - bubble_current_health/bubble_starting_health;
	time_percentage = bubble_time/bubble_pop_time;
	
	if(health_percentage > time_percentage)
	{
		bubble_saturation = 255 * health_percentage;
	}
	else
	{
		bubble_saturation = 255 * time_percentage;
	}

	image_blend = make_color_hsv(color_get_hue(bubble_color),bubble_saturation,color_get_value(bubble_color));
	
	sprite_change_time += DELTA;
	
	if(sprite_change_time > (BH_BUS_SPRITE_CHANGE_SECONDS * 60))
	{
		selected_index++;
		sprite_change_time = 0;
		
		if(selected_index > array_length(sprites) - 1)
		{
			selected_index = 0;
		}
		
		sprite_index = sprites[selected_index];
	}
}



