/// @description Stay at player location

event_inherited();

x = obj_player_bh.x;
y = obj_player_bh.y;

var _inst = instance_place(x,y,obj_bubble_projectile);
if (_inst != noone)
{
	instance_destroy(_inst);
	shield_scale -= decrement;
	
	if(shield_scale <= BH_SHIELD_MIN_SCALE)
	{
		instance_destroy();
	}
}

image_xscale = shield_scale;
image_yscale = shield_scale;