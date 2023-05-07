/// @description 

// Inherit the parent event
event_inherited();

can_interact	= true;
interact_starts = true;
radius = AUTO_INTERACT_DISTANCE * 1.3;

image_blend = c_white;

if(check_level_completed(LEVEL_5_DINNER_BATTLE))
{
	instance_destroy();
}