/// @description 

event_inherited();

if(global.game_state == active_state)
{
	// Just update x_direction or y_direction here.
	// The parent end step will handle the rest of the movement/collision.
	
	sprite_change_time += DELTA;
	
	if(sprite_change_time > (BH_BUS_SPRITE_CHANGE_SECONDS * 60))
	{
		selected_index++;
		sprite_change_time = 0;
		
		if(selected_index > array_length(sprites) - 1)
		{
			selected_index = 0;
		}
		
		sprite_index = sprites[selected_index];
	}
}



