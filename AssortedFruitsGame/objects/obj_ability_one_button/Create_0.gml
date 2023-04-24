/// @description 

// Inherit the parent event
event_inherited();

ability = obj_game.bh_ability_index;
image_index = ability;

image_xscale = BH_ABILITY_BUTTON_SCALE;
image_yscale = BH_ABILITY_BUTTON_SCALE;

if(global.gamepad_id > -1)
{
	hotkey = get_ctrl_hotkey_ability_one();
}
else
{
	hotkey = chr(global.hotkey_ability_one);
}
