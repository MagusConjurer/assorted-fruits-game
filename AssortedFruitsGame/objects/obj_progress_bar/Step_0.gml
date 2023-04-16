/// @description 

// Inherit the parent event
event_inherited();

if(global.game_state == active_state)
{
	current_value = clamp(current_value, 0, max_value);
	
	// For drawing darkening
	left_x = x;
	right_x = x + (xWidth * percentToScale);
	top_y = y-sprite_get_yoffset(sprite_index);
	bot_y = y+sprite_get_yoffset(sprite_index);

	if(progress_pulse_frames > 0)
	{
		progress_pulse_frames--;
		if(progress_pulse_frames % 10 == 0) 
		{
			// switches the opacity back and forth every 10 frames
			pulse_toggle = !pulse_toggle;
		
			pulse_hue = color_get_hue(progress_pulse_color);
			pulse_value = color_get_value(progress_pulse_color);
		
			if(pulse_toggle) 
			{
				progress_blend_color = make_color_hsv(pulse_hue,200,pulse_value);
			}
			else
			{
				progress_blend_color = make_color_hsv(pulse_hue,100,pulse_value);
			}

		}
	}
	else
	{
		progress_blend_color = c_green;
	}
}
