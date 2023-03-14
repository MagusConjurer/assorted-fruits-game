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
	bubble_below = place_empty(x + xSpeed, y, obj_bubble);
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



