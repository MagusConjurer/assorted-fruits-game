/// @description Calculate Speed & Collision

if(global.game_state == active_state)
{
	if(object_index == BH_BUBBLE_BUSGUY)
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
			y_speed = y_speed * -1;
		}
	
		if(x_speed == 0)
		{
			bubble_time += delta_time / 1000000;
		}

		x = lerp(x, x + x_speed, 0.1);
		y = lerp(y, y + y_speed, 0.1);
	}
	else if(object_index == BH_BUBBLE_MOM)
	{
		if(counter_clockwise)
		{
			next_angle = current_angle - arctan(bubble_speed/radius);
		}
		else
		{
			next_angle = current_angle + arctan(bubble_speed/radius);
		}
		
		if(next_angle > 360)
		{
			next_angle -= 360;
		}
		else if(next_angle < -180)
		{
			next_angle += 360;
		}
		
		next_x = lengthdir_x(radius, next_angle) + center_x;
		next_y = lengthdir_y(radius, next_angle) + center_y;
		
		bubble_collision = place_meeting(next_x, next_y, obj_bubble_parent);
		player_collision = place_meeting(next_x, next_y, obj_player_bh);
		
		if(bh_is_outside_bounds_x(next_x, sprite_width) || bubble_collision || player_collision)
		{
			bubble_time += delta_time / 1000000;
		}
		else
		{
			current_angle = next_angle;
		}
		
		if(bh_is_outside_bounds_y(next_y, sprite_height) || bubble_collision || player_collision)
		{
			if(counter_clockwise)
			{
				if(next_angle < 0)
				{
					current_angle = -180 + (next_angle * -1);
				}
				else
				{
					current_angle = 0 + (180 - next_angle);
				}
				
				if(center_x < next_x)
				{
					center_x = center_x + radius + lengthdir_x(radius, next_angle);
				}
				else
				{
					center_x = center_x - radius - lengthdir_x(radius, next_angle);
				}
				
				show_debug_message(["AFTER:", "ANGLE:", next_angle, "CX", center_x]);
			}
			else
			{
				
			}
		}
		
		x = lerp(x,lengthdir_x(radius, current_angle) + center_x, 0.1);
		y = lerp(y,lengthdir_y(radius, current_angle) + center_y, 0.1);
	}
}
