/// @description

event_inherited();

if(global.game_state == active_state) 
{
	// Get direction separately, so it can be used for animations
	xDirection = (key_right - key_left);
	yDirection = (key_down - key_up);
	
	// Set x and y speed
	xSpeed = xDirection * moveSpeed;
	ySpeed = yDirection * moveSpeed;
	
	// Check collision
	if (place_meeting(x + xSpeed, y, obj_wall))
	{
		xSpeed = 0;
	}
	if (place_meeting(x, y + ySpeed, obj_wall))
	{
		ySpeed = 0;
	}

	// Depth -- allows player to be drawn below/above other sprites
	depth = -bbox_bottom;
}


