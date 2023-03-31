/// @description Update animations

// Inherit the parent event
event_inherited();

if(global.game_state == active_state)
{
	// Keeps the initial direction when moving diagonal
	if(yDirection == 0)
	{
		if(xDirection > 0)
		{
			facing_left = false;
			sprite_index = sprite[RIGHT];
		}
		else if(xSpeed < 0)
		{
			facing_left = true;
			sprite_index = sprite[LEFT];
		}
	}
	
	if(xDirection == 0)
	{
		if(yDirection > 0)
		{
			facing_forward = true;
			sprite_index = sprite[DOWN];
		}
		else if(yDirection < 0)
		{
			facing_forward = false;
			sprite_index = sprite[UP];
		}
	}

		
	if(xDirection == 0 && yDirection == 0)
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
}

