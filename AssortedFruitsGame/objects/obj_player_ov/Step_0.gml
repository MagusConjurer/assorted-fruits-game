/// @description

if (global.game_state == OVERWORLD) 
{
	key_up = keyboard_check(vk_up);
	key_down = keyboard_check(vk_down);
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);

	// May want to move all the movement checking to a script function for readability

	// Get x and y speed
	xSpeed = (key_right - key_left) * moveSpeed;
	ySpeed = (key_down - key_up) * moveSpeed;
	
	// Check collision
	if (place_meeting(x + xSpeed, y, obj_wall))
	{
		xSpeed = 0;
	}
	if (place_meeting(x, y + ySpeed, obj_wall))
	{
		ySpeed = 0;
	}

	// Move the player -- this is after all the checks have been done above
	x += xSpeed;
	y += ySpeed;
	
	// Depth -- allows player to be drawn below/above other sprites
	depth = -bbox_bottom;
}


