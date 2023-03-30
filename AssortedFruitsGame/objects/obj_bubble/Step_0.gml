/// @description 

event_inherited();

if(global.game_state == BULLET_HELL)
{
	// https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_place.htm
	var _inst = instance_place(x,y,obj_player_projectile);
	if (_inst != noone)
	{
		bubble_health += _inst.damage;
		instance_destroy(_inst);
	}
	
	if(xDirection == 0)
	{
		bubble_time += delta_time / 1000000;
	}


	if(bubble_health <= 0)
	{
		bh_bubble_destroyed(true);
		instance_destroy();
	}
	
	if(bubble_time >= BH_BUBBLE_TIME_BEFORE_POPPING)
	{
		bh_bubble_destroyed(false);
		instance_destroy();
	}
	
	// Change the color based on the state of the bubble
	health_percentage = bubble_health/BH_STARTING_BUBBLE_HEALTH;
	time_percentage = 1 - bubble_time/BH_BUBBLE_TIME_BEFORE_POPPING;
	if(health_percentage < time_percentage)
	{
		increment = 255 * health_percentage;
	}
	else
	{
		increment = 255 * time_percentage;
	}
	image_blend = make_color_rgb(255, increment, increment);
	

	// Movement
	bubble_below = place_empty(x - xSpeed, y, obj_bubble);
	player_below = place_meeting(x + xSpeed, y, obj_player_bh);

	if (x < 100 || !bubble_below || player_below)
	{
		xDirection = 0;
	} 
	else 
	{
		xDirection = -1;
	}

	x += xDirection * xSpeed;
}



