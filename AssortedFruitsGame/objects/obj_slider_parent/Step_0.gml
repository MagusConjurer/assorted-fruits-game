/// @description Check if selected and update the slider

if (mouse_check_button_pressed(mb_left))
{
	// Calculate where the button is
	button_x = x+sprite_width*value;
	button_y = y;
	button_radius = sprite_get_width(spr_slider_button) / 2;
	
	if (point_in_circle(mouse_x, mouse_y, button_x, button_y, button_radius))
	{
		selected = true;
	}
}

if (!mouse_check_button(mb_left))
{
	selected = false;
}

if (selected)
{
	value = clamp((mouse_x - x)/sprite_width, 0, max_value);
	
	event_user(0);
}