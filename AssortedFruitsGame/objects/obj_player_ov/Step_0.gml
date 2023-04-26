/// @description

if(global.game_state == active_state) 
{	
	h_direction = get_movement_h();
	v_direction = get_movement_v();
	
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
else if (global.game_state == DIALOGUE || global.game_state == BULLET_HELL)
{
	depth = DARKENING_DEPTH + 1;
	
	if(global.current_room == ROOM_OUTSIDE)
	{
		if(global.current_level == LEVEL_1_BUS_STOP)
		{
			if (x != OV_BUSSTOP_ALEX_X)
			{
				x = lerp(x,OV_BUSSTOP_ALEX_X,0.1);
			}
		
			if (y != OV_BUSSTOP_ALEX_Y)
			{
				y = lerp(y,OV_BUSSTOP_ALEX_Y,0.1);
			}
		
			if (x <= OV_BUSSTOP_ALEX_X + OV_POS_TOLERANCE  && 
				y <= OV_BUSSTOP_ALEX_Y + OV_POS_TOLERANCE)
			{
				sprite_index = Alex_sit_normal;
			}
		}
		else if(global.current_level == LEVEL_2_BUS_BATTLE)
		{
			if(bh_player_attacks())
			{
				sprite_index = Alex_sit_WTF;
			}
			else
			{
				sprite_index = Alex_sit_angry;
			}
		}
	}
	else if(global.current_room == ROOM_CAFE)
	{
		if(global.current_level == LEVEL_3_CAFE)
		{
			if (x != OV_CAFE_ALEX_X)
			{
				x = lerp(x,OV_CAFE_ALEX_X,0.1);
			}
		
			if (y != OV_CAFE_ALEX_Y)
			{
				y = lerp(y,OV_CAFE_ALEX_Y,0.1);
			}
		
			if (x <= OV_CAFE_ALEX_X + OV_POS_TOLERANCE  && 
				y <= OV_CAFE_ALEX_Y + OV_POS_TOLERANCE)
			{
				sprite_index = Alex_sit_normal;
			}
		}
	}
	else if(global.current_room == ROOM_DINNER)
	{
		if(global.current_level == LEVEL_4_DINNER)
		{
			if (x != OV_DINNER_ALEX_X)
			{
				x = lerp(x,OV_DINNER_ALEX_X,0.1);
			}
		
			if (y != OV_DINNER_ALEX_Y)
			{
				y = lerp(y,OV_DINNER_ALEX_Y,0.1);
			}
		
			if (x <= OV_DINNER_ALEX_X + OV_POS_TOLERANCE  && 
				y <= OV_DINNER_ALEX_Y + OV_POS_TOLERANCE)
			{
				sprite_index = Alex_sit_normal;
			}
		}
		else if (global.current_level == LEVEL_5_DINNER_BATTLE)
		{
			if(bh_player_attacks())
			{
				sprite_index = Alex_sit_WTF;
			}
			else
			{
				sprite_index = Alex_sit_angry;
			}
		}
	}
}
else
{
	depth = DARKENING_DEPTH + 1;
}

