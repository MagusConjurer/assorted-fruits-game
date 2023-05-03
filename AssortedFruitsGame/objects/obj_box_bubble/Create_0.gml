/// @description 

// Inherit the parent event
event_inherited();

can_interact	= true;
interact_starts = false;
radius = AUTO_INTERACT_DISTANCE;

if(check_level_completed(LEVEL_3_CAFE))
{
	instance_destroy();
}