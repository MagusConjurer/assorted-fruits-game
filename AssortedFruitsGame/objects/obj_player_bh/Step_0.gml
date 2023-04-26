/// @description 

event_inherited();

if (global.game_state == active_state) 
{
	if(!dash_active)
	{
		h_direction = get_movement_h();
		v_direction = get_movement_v();
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
	else
	{
		image_index = current_frame;
	}

	xSpeed = h_direction * moveSpeed * DELTA;
	ySpeed = v_direction * moveSpeed * DELTA;
	
	// Draws the player above the darkened area
	depth = BH_DEPTH;
}
