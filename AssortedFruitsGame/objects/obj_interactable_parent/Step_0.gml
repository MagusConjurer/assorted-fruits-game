/// @description 

if(interact_starts)
{
	radius = PLAYER_INTERACT_DISTANCE;
}
else
{
	radius = AUTO_INTERACT_DISTANCE;
}

if(!has_been_interacted || interact_repeatable)
{
	if(global.game_state == OVERWORLD && collision_circle(x, y, radius, obj_player_ov, false, false) )
	{
		if(!interact_starts)
		{
			has_been_interacted = true;
			event_user(0);
		}
		else
		{
			popup_id.visible = true;
			
			if(interact_pressed() && interact_starts)
			{
				has_been_interacted = true;
		
				event_user(0);
		
				// Remove popup if it is no longer needed
				if(!interact_repeatable)
				{
					instance_destroy(popup_id);
					instance_destroy();
				}
			}
		}
	} 
	else 
	{
		popup_id.visible = false;
	}
}