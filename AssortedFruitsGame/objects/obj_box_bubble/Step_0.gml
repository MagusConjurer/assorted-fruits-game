/// @description 

// Inherit the parent event
event_inherited();

player_is_close = collision_circle(x,y,200,obj_player_ov, false, true);

if((!has_been_interacted || interact_repeatable) && player_is_close)
{
	has_been_interacted = true;
		
	// Do any action here
		
	set_game_state(DIALOGUE);
		
	// Remove popup if it is no longer needed
	if(!interact_repeatable)
	{
		instance_destroy(popup_id);
		instance_destroy();
	}
}

