/// @description Update animations

if(global.game_state == active_state)
{
	// Keeps the initial direction when moving diagonal
	if(v_direction == 0)
	{
		if(h_direction > 0)
		{
			facing_left = false;
			sprite_index = sprite[RIGHT];
			image_speed = WALK_ANIM_SPEED;
		}
		else if(h_direction < 0)
		{
			facing_left = true;
			sprite_index = sprite[LEFT];
			image_speed = WALK_ANIM_SPEED;
		}
	}
	// Check for being stuck on a wrong horizontal direction frame
	if(h_direction > 0 && sprite_index == sprite[LEFT])
	{
		facing_left = false;
		sprite_index = sprite[RIGHT];
		image_speed = WALK_ANIM_SPEED;
	}
	if(h_direction < 0 && sprite_index == sprite[RIGHT])
	{
		facing_left = true;
		sprite_index = sprite[LEFT];
		image_speed = WALK_ANIM_SPEED;
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
	
	// Check for being stuck on a wrong vertical direction frame
	if(v_direction > 0 && sprite_index == sprite[UP])
	{
		facing_forward = true;
		sprite_index = sprite[DOWN];
	}
	if(v_direction < 0 && sprite_index == sprite[DOWN])
	{
		facing_forward = false;
		sprite_index = sprite[UP];
	}

		
	if(h_direction == 0 && v_direction == 0)
	{
		image_speed = 0;
		if(facing_forward)
		{
			sprite_index = sprite[DOWN];
			
			// Update to use unique down sprites
			if(facing_left)
			{
				image_index = 1;
			}
			else
			{
				image_index = 0;
			}
		}
		else
		{
			sprite_index = sprite[UP];
			
			// We do not have unique back facing sprites
		}
		

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

