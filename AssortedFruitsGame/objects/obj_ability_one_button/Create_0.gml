/// @description 

// Inherit the parent event
event_inherited();

ability = obj_game.bh_ability_index;

if(global.gamepad_id > -1)
{
	hotkey = get_ctrl_hotkey_ability_one();
}
else
{
	hotkey = chr(global.hotkey_ability_one);
}
