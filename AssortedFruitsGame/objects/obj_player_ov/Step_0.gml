/// @description

event_inherited();

if(global.game_state == active_state) 
{	
	// Set x and y speed
	xSpeed = h_direction * moveSpeed;
	ySpeed = v_direction * moveSpeed;
	
	// Check collision
	if (place_meeting(x + xSpeed, y, obj_wall))
	{
		xSpeed = 0;
	}
	if (place_meeting(x, y + ySpeed, obj_wall))
	{
		ySpeed = 0;
	}
	
	if ((global.current_level == LEVEL_2_BUS_BATTLE && !check_level_completed(LEVEL_2_BUS_BATTLE)) ||
		(global.current_level == LEVEL_5_DINNER_BATTLE && !check_level_completed(LEVEL_5_DINNER_BATTLE)) ||
		instance_exists(obj_transition_parent))
	{
		xSpeed = 0;
		ySpeed = 0;
		v_direction = 0;
		h_direction = 0;
	}

	// Depth -- allows player to be drawn below/above other sprites
	depth = -bbox_bottom;
}
else
{
	depth = DARKENING_DEPTH + 1;
}


