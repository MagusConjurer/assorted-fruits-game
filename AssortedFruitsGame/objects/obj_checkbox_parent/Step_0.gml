/// @description

if(menu_interact_pressed())
{
	if(global.gamepad_id > -1)
	{
		if(selected)
		{
			checked = !checked;
	
			event_user(0);
		}
	}
	else
	{
		// If not using a controller, only update if within that checkbox
		x1 = x + 0;
		x2 = x + sprite_width;
		y1 = y - sprite_height * 0.5;
		y2 = y + sprite_height * 0.5;
		if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x1, y1, x2, y2))
		{
			checked = !checked;
	
			event_user(0);
		}
	}

}

if(checked)
{
	if(selected)
	{
		image_index = 3;
	}
	else
	{
		image_index = 1;
	}
}
else
{
	if(selected)
	{
		image_index = 2;
	}
	else
	{
		image_index = 0;
	}
}
