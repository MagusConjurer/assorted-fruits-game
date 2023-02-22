/// @description 

// Inherit the parent event
event_inherited();

if((!has_been_interacted || INTERACT_REPEATABLE) && keyboard_check(ord(INTERACT_KEY)))
{
	if(collision_circle(x,y,radius,obj_player_ov, false, true))
	{
		has_been_interacted = true;
		
		// Do any action here
		
		global.game_state = BULLET_HELL;
		global.prev_state = OVERWORLD;
		
		// Remove popup if it is no longer needed
		if(!INTERACT_REPEATABLE)
		{
			instance_destroy(popup_id);
		}
	}
}

