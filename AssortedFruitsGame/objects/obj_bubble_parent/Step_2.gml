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
	
		if(x_speed == 0)
		{
			bubble_time += delta_time / 1000000;
		}

		x = lerp(x, x + x_speed, 0.1);
		y = lerp(y, y + y_speed, 0.1);
	}
	else if(object_index == BH_BUBBLE_MOM)
	{
		next_angle = current_angle + (rot_direction * arctan(BH_MOM_BUBBLE_ROT_SPEED/radius));
		next_x = center_x + (radius * cos(next_angle));
		next_y = center_y + (radius * sin(next_angle));
		
		moving = true;
		
		if(center_x < BH_UI_MARGIN || next_x < BH_UI_MARGIN)
		{
			moving = false;
		}
		else
		{
			variant_bubble_collision = (place_meeting(next_x, next_y, obj_bubble_dad) || place_meeting(next_x, next_y, obj_bubble_uncle));
			match_bubble_collision = place_meeting(next_x, next_y, obj_bubble_mom);
			player_collision = place_meeting(next_x, next_y, obj_player_bh);
				
			if(bh_is_outside_bounds_y(next_y, sprite_height) || player_collision || match_bubble_collision)
			{
				
			}
			else if(variant_bubble_collision)
			{
				moving = false;
			}

			if(moving)
			{
				center_x = lerp(center_x, center_x - (bubble_speed * DELTA * 0.5), 0.1);
				
				next_x = center_x + (radius * cos(next_angle));
				next_y = center_y + (radius * sin(next_angle));
				
				if(!bh_is_outside_bounds_x(next_x, sprite_width) && !player_collision)
				{
					x = next_x;
					y = next_y;
					
					current_angle = next_angle;
				}
				else
				{
					moving = false;
				}
			}
		}
		
		if(!moving)
		{
			bubble_time += delta_time / 1000000;
		}
	}
	else if(object_index == BH_BUBBLE_DAD)
	{
		x_speed = x_direction * bubble_speed * DELTA;
		y_speed = y_direction * bubble_speed * DELTA;
	
		variation_bubble_collision = place_meeting(x + x_speed, y + y_speed, obj_bubble_mom) ||
									 place_meeting(x + x_speed, y + y_speed, obj_bubble_uncle);
		player_collision = place_meeting(x + x_speed, y + y_speed, obj_player_bh);

		if(bh_is_outside_bounds_x(x + x_speed, sprite_width) || variation_bubble_collision || player_collision)
		{
			x_speed = 0;
			y_speed = 0;
		}
		
		if(bh_is_outside_bounds_y(y + y_speed, sprite_height))
		{
			y_direction *= -1;
			y_speed		*= -1;
		}
	
		if(x_speed == 0 && y_speed == 0)
		{
			bubble_time += delta_time / 1000000;
		}

		x = lerp(x, x + x_speed, 0.1);
		y = lerp(y, y + y_speed, 0.1);
	}
	else
	{
		x_speed = x_direction * bubble_speed * DELTA;
		y_speed = y_direction * bubble_speed * DELTA;
	
		variation_bubble_collision = place_meeting(x + x_speed, y + y_speed, obj_bubble_mom) ||
									 place_meeting(x + x_speed, y + y_speed, obj_bubble_dad);
		player_collision = place_meeting(x + x_speed, y + y_speed, obj_player_bh);

		if(bh_is_outside_bounds_x(x + x_speed, sprite_width) || variation_bubble_collision || player_collision)
		{
			x_speed = 0;
			y_speed = 0;
		}
		
		if(bh_is_outside_bounds_y(y + y_speed, sprite_height))
		{
			y_direction *= -1;
			y_speed		*= -1;
		}
	
		if(x_speed == 0 && y_speed == 0)
		{
			bubble_time += delta_time / 1000000;
		}

		x = lerp(x, x + x_speed, 0.1);
		y = lerp(y, y + y_speed, 0.1);
	}
}
