/// @description Movement finalized


// Checks collision with bubbles
if(place_meeting(x + xSpeed, y, obj_bubble))
{
	xSpeed = 0;
}
if(place_meeting(x, y + ySpeed, obj_bubble))
{
	ySpeed = 0;
}

if(global.game_state == active_state)
{
	if(bh_is_outside_bounds_x(x + xSpeed, sprite_width * image_xscale))
	{
		xSpeed = 0;
	}

	if(bh_is_outside_bounds_y(y + ySpeed, sprite_height * image_yscale))
	{
		ySpeed = 0;
	}

	y += ySpeed;
	x += xSpeed;
}