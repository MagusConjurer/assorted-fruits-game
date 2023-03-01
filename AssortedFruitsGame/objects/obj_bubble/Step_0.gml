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

	if(bubble_health <= 0)
	{
		bh_bubble_destroyed();
		instance_destroy();
	}

	// Movement


	bubble_below = place_empty(x, y + ySpeed, obj_bubble);
	player_below = place_meeting(x,y + ySpeed, obj_player_bh);

	if (y > room_height - 250 || !bubble_below || player_below)
	{
		yDirection = 0;
	} 
	else 
	{
		yDirection = 1;
	}

	y += yDirection * ySpeed;
}



