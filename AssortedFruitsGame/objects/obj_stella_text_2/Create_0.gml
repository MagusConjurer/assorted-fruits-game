/// @description 

// Inherit the parent event
event_inherited();

can_interact = true;
interact_starts = true;

if(!check_level_completed(LEVEL_5_DINNER_BATTLE))
{
	instance_destroy();
}