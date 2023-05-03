/// @description 

if (global.game_state == active_state) 
{
	if(!dash_active)
	{
		h_direction = get_movement_h();
		v_direction = get_movement_v();
	}
	else
	{
		dash_time_active += DELTA;
		
		if(dash_time_active > BH_DASH_DURATION * 60)
		{
			dash_active = false;
			moveSpeed = BH_PLAYER_SPEED;
		}
	}
	
	if(attack_pressed() && chose_to_fight_back)
	{
		if(alarm[0] < 0)
		{
			alarm[0] = BH_PLAYER_PROJECTILE_DELAY;
		}
	}
	
	if(iframes > 0)
	{
		iframes--;
		healFrames = 0; // don't allow it to show healing anymore
		if(iframes % 10 == 0) 
		{
			// switches sprite back and forth every 10 frames
			toggle = !toggle;
			
			if(toggle) 
			{
				image_index = current_frame;
			}
			else
			{
				image_index = current_frame + 1;
			}
		}
	}
	else if(healFrames > 0)
	{
		healFrames--;
		if(healFrames % 10 == 0)
		{
			toggle = !toggle;
			
			if(toggle) 
			{
				image_index = current_frame;
			}
			else
			{
				image_index = current_frame + 2;
			}
		}
	}
	else
	{
		image_index = current_frame;
	}

	xSpeed = h_direction * moveSpeed * DELTA;
	ySpeed = v_direction * moveSpeed * DELTA;
	
	// Draws the player above the darkened area
	depth = BH_DEPTH;
}
