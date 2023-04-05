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

	// Depth -- allows player to be drawn below/above other sprites
	depth = -bbox_bottom;
}


