/// @description 

// Inherit the parent event
event_inherited();

if(bh_is_outside_bounds_x(x,sprite_width))
{
	instance_destroy();
}
