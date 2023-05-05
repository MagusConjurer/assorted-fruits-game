/// @description Only continue started game

if(obj_game.new_game_started == false || global.current_level > LEVEL_6_BEDROOM)
{
	enabled = false;
}
else
{
	enabled = true;
}

// Inherit the parent event
event_inherited();

