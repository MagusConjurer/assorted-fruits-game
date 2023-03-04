/// @description 

if(global.resize_enabled && mouse_check_button_pressed(mb_left))
{
	if(selected)
	{
		option_selected = option_hovered;
		settings_update_resolution(options[option_selected]);
	}
	
	if(position_meeting(mouse_x, mouse_y, self))
	{
		selected = true;
	}
	else
	{
		selected = false;
	}
}

