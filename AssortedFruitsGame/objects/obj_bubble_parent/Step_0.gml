/// @description 

event_inherited();

if(global.game_state == active_state)
{
	// https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_place.htm
	var _inst = instance_place(x,y,obj_player_projectile);
	if (_inst != noone)
	{
		bubble_current_health += _inst.damage;
		instance_destroy(_inst);
	}

	if(bubble_current_health <= 0)
	{
		part_emitter_burst(global.P_system_pop,obj_bubble.x,obj_bubble.y,global.P_system_pop_T);
		bh_bubble_destroyed(true);
		instance_destroy();
		
	}
	
	bubble_pop_time = bh_get_bubble_pop_time();
	
	if(bubble_time >= bubble_pop_time)
	{
		bh_bubble_destroyed(false);
		instance_destroy();
	}
	
	// Change the color based on the state of the bubble
	health_percentage = 1.0 - bubble_current_health/bubble_starting_health;
	time_percentage = bubble_time/bubble_pop_time;
	
	if(health_percentage > time_percentage)
	{
		bubble_saturation = 255 * health_percentage;
	}
	else
	{
		bubble_saturation = 255 * time_percentage;
	}

	image_blend = make_color_hsv(color_get_hue(bubble_color),bubble_saturation,color_get_value(bubble_color));
}



