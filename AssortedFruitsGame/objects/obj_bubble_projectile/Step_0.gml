/// @description 

// Inherit the parent event
event_inherited();

if(bh_is_outside_bounds_x(x,sprite_width * image_xscale) || bh_is_outside_bounds_y(y,sprite_height * image_yscale))
{
	instance_destroy();
}
