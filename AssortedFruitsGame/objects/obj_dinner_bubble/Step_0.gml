/// @description 

if(global.debugging)
{
	global.current_level = LEVEL_4_DINNER;
	
	event_inherited();
}
else
{
	if(!check_level_completed(LEVEL_4_DINNER))
	{
		// Inherit the parent event
		event_inherited();
	}
}

