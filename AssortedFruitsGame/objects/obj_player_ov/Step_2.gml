/// @description Update animations

// Inherit the parent event
event_inherited();

if(global.game_state == active_state)
{
	// Keeps the initial direction when moving diagonal
	if(v_direction == 0)
	{
		if(h_direction > 0)
		{
			facing_left = false;
			sprite_index = sprite[RIGHT];
		}
		else if(h_direction < 0)
		{
			facing_left = true;
			sprite_index = sprite[LEFT];
		}
	}
	
	if(h_direction == 0)
	{
		if(v_direction > 0)
		{
			facing_forward = true;
			sprite_index = sprite[DOWN];
		}
		else if(v_direction < 0)
		{
			facing_forward = false;
			sprite_index = sprite[UP];
		}
	}

		
	if(h_direction == 0 && v_direction == 0)
	{
		if(facing_forward)
		{
			sprite_index = sprite[DOWN];
		}
		else
		{
			sprite_index = sprite[UP];
		}
		
		// Temporary until we have updated sprites with actual animations for each direction
		image_index = facing_left;
	}
	
	// Final check for going out of the room bounds before moving the player
	if(x + xSpeed + sprite_width/2 > room_width || x + xSpeed - sprite_width/2 < 0)
	{
		xSpeed = 0;
	}

	if(y + ySpeed + sprite_height/2 > room_height || y + ySpeed - sprite_height/2< 0)
	{
		ySpeed = 0;
	}

	y += ySpeed;
	x += xSpeed;
}

