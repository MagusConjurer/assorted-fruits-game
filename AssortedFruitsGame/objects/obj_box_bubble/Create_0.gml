/// @description 

// Inherit the parent event
event_inherited();

can_interact	= true;
interact_starts = false;
radius = AUTO_INTERACT_DISTANCE;

if(check_level_completed(LEVEL_3_CAFE))
{
	layer_set_visible("Assets_1", false);
	instance_destroy();
}