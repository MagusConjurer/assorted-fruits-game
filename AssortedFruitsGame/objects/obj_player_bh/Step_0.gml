/// @description 

event_inherited();

if (global.game_state == active_state) 
{
	if(keyboard_check_pressed(vk_space))
	{
		instance_create_layer(x,y,"Bullet_Hell",obj_player_projectile);
	}
	// May want to move all the movement checking to a script function for readability

	// Get x and y speed
	xSpeed = (key_right - key_left) * moveSpeed;
	ySpeed = (key_down - key_up) * moveSpeed;

	// Move the player -- this is after all the checks have been done above
	x += xSpeed;
	y += ySpeed;

	// Draws the player above the darkened area
	depth = BH_DEPTH;
}
