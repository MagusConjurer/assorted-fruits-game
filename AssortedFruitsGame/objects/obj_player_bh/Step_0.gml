/// @description 

event_inherited();

if (global.game_state == active_state) 
{
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
				image_index = 0;
			}
			else
			{
				image_index = image_index + 1;
			}

		}
	}
	else
	{
		image_index = 0;
	}
	
	// May want to move all the movement checking to a script function for readability

	if(alarm[1] < 0) {
		// Get x and y speed if not dashing
		xSpeed = h_direction * moveSpeed * DELTA;
		ySpeed = v_direction * moveSpeed * DELTA;
	}
	
	// Draws the player above the darkened area
	depth = BH_DEPTH;
}
