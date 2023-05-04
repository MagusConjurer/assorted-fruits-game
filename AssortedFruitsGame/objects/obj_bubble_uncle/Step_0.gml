/// @description 

event_inherited();

if(global.game_state == active_state)
{
	// Just update x_direction or y_direction here.
	// The parent end step will handle the rest of the movement/collision.
	
	time_since_switch += DELTA;
	
	if(time_since_switch > next_switch)
	{
		time_since_switch = 0;
		
		if(x_direction != 0)
		{
			x_direction = cos(rand_angle);
			y_direction = sin(rand_angle) * irandom_range(-1,1);
		}
		else
		{
			y_direction = sin(rand_angle);
			x_direction = cos(rand_angle) * irandom_range(-1,1);
		}
		
		next_switch = random_range (BH_UNCLE_BUBBLE_TURN_TIME_MIN * 60, 
									BH_UNCLE_BUBBLE_TURN_TIME_MAX * 60);
	}
}



