/// @description 

// following details found in https://forum.gamemaker.io/index.php?threads/solved-how-a-button-in-drawgui-event-responds-to-mouse-events.33798/
// issue with the collision being placed incorrectly when using built in events

// Check if within the button with centered origin
function mouse_on_button()
{
	return point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x1, y1, x2, y2);
}

if(!is_gui_button && global.game_state == PAUSED)
{
	enabled = false;
}
else
{
	enabled = true;
}

if(enabled && visible)
{
	spr_width  = sprite_get_width(sprite);
	spr_height = sprite_get_height(sprite);
	
	x1 = x - (spr_width * 0.5);
	x2 = x + (spr_width * 0.5);
	y1 = y - (spr_height * 0.5);
	y2 = y + (spr_height * 0.5);
	
	if(menu_interact_released() && is_pressed)
	{
		is_pressed = false;

		image_index = BUTTON_DEFAULT;
		if((mouse_on_button() || selected == true) && layer_get_visible(layer_to_check) == true)
		{
			selected = false;
			event_user(0);
		}
	}
	
	// Mouse enters
	if(mouse_on_button() || selected == true)
	{
		if(menu_interact_pressed())
		{
			is_pressed = true;

			image_index = BUTTON_PRESSED;
		}
		else if(!is_pressed)
		{
			image_index = BUTTON_HOVER;
		}
	}
	else
	{
		// Mouse leave
		image_index = BUTTON_DEFAULT;
	}
}
else
{
	image_index = BUTTON_DISABLED;
}



