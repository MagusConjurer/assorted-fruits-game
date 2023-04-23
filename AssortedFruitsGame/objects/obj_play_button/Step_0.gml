/// @description Only continue started game

if(obj_game.new_game_started == false)
{
	enabled = false;
}
else
{
	enabled = true;
}

// Inherit the parent event
event_inherited();

