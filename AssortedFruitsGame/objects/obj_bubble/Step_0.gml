/// @description 

event_inherited();

// https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Instances/instance_place.htm
var _inst = instance_place(x,y,obj_player_projectile);
if (_inst != noone)
{
	bubble_health -= _inst.damage;
	instance_destroy(_inst);
}

if(bubble_health <= 0)
{
	bubble_destroyed();
	instance_destroy();
}

// Movement
if (y > room_height - 250 || place_meeting(x,y,obj_bubble))
{
	yDirection = 0;
} 
else 
{
	yDirection = 1;
}

y += yDirection * BH_BUBBLE_FALL_SPEED;

