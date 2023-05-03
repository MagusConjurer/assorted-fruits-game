/// @description 

// Inherit the parent event
event_inherited();

can_interact	= true;
interact_starts = true;
radius = AUTO_INTERACT_DISTANCE;

image_blend = c_white;

if(check_level_completed(LEVEL_3_CAFE))
{
	instance_destroy();
}