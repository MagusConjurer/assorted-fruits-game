/// @description 

// Inherit the parent event
event_inherited();

var _inst = instance_place(x,y,obj_bubble_parent);
if (_inst != noone)
{
	_inst.bubble_current_health += damage;
	instance_destroy();
}

if(bh_is_outside_bounds_x(x,sprite_width))
{
	instance_destroy();
}
