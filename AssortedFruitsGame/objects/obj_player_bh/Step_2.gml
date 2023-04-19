/// @description Movement finalized

if(global.game_state == active_state)
{
	lerped_x = lerp(x, x + xSpeed, 0.1);
	lerped_y = lerp(y, y + ySpeed, 0.1);
	
	// Checks collision with bubbles with direction buffer
	if(place_meeting(lerped_x + h_direction, y, obj_bubble_parent))
	{
		xSpeed = 0;
	}
	if(place_meeting(x, lerped_y  + v_direction, obj_bubble_parent))
	{
		ySpeed = 0;
	}
	
	if(bh_is_outside_bounds_x(lerped_x, sprite_width * image_xscale))
	{
		xSpeed = 0;
	}

	if(bh_is_outside_bounds_y(lerped_y, sprite_height * image_yscale))
	{
		ySpeed = 0;
	}

	x = lerp(x, x + xSpeed, 0.1);
	y = lerp(y, y + ySpeed, 0.1);
}