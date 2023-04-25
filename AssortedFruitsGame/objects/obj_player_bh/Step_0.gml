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
	
	// Only check collisions with bubbles if not in iframes
	if(iframes <= 0) 
	{
		var _inst = instance_place(x,y,obj_bubble_projectile);
		if (_inst != noone)
		{
			bh_update_player_health(_inst.damage);
			play_sfx(AUDIO_DAMAGE);
			
			ph = bh_get_player_health();
			if(ph > 6)
			{
				current_frame = 0;
			} 
			else if(ph > 4)
			{
				current_frame = 2;
			}
			else if(ph > 2)
			{
				current_frame = 4;
			}
			else
			{
				current_frame = 6;
			}
			
			instance_destroy(_inst);
			iframes = BH_PLAYER_NUM_IFRAMES;
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
