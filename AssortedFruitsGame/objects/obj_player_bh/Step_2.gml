/// @description Movement finalized

if(global.game_state == active_state)
{
	// Checks collision with bubbles with direction buffer
	if(place_meeting(x + xSpeed + h_direction, y, obj_bubble_parent))
	{
		xSpeed = 0;
	}
	if(place_meeting(x, y + ySpeed + v_direction, obj_bubble_parent))
	{
		ySpeed = 0;
	}
	
	if(bh_is_outside_bounds_x(x + xSpeed, sprite_width * image_xscale))
	{
		xSpeed = 0;
	}

	if(bh_is_outside_bounds_y(y + ySpeed, sprite_height * image_yscale))
	{
		ySpeed = 0;
	}

	x = lerp(x, x + xSpeed, 0.1);
	y = lerp(y, y + ySpeed, 0.1);
}