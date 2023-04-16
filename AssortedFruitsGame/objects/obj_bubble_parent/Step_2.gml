/// @description Calculate Speed & Collision

if(global.game_state == active_state)
{
	// Movement
	x_speed = x_direction * bubble_speed * DELTA;
	y_speed = y_direction * bubble_speed * DELTA;
	
	bubble_collision = place_meeting(x + x_speed, y + y_speed, obj_bubble_parent);
	player_collision = place_meeting(x + x_speed, y + y_speed, obj_player_bh);

	if(bh_is_outside_bounds_x(x + x_speed, sprite_width) || bubble_collision || player_collision)
	{
		x_speed = 0;
	}
		
	if(bh_is_outside_bounds_y(y + y_speed, sprite_height) || bubble_collision || player_collision)
	{
		y_speed = 0;
	}
	
	if(x_speed == 0)
	{
		bubble_time += delta_time / 1000000;
	}

	x += x_speed;
	y += y_speed;
}
