/// @description 

// Inherit the parent event
event_inherited();

text_color = BH_START_SEQ_ACTIVE_COLOR;

hotkey_text = ["",""];

text_height = 0;

if(bh_player_attacks())
{
	hotkey_text[0] = BH_HOTKEY_ATTACK_TEXT + get_attack_hotkey();
	text_height = string_height(hotkey_text[0]);
}

if(bh_player_ability_one_available())
{
	hotkey_text[1] = BH_HOTKEY_ABILITY_TEXT + get_ability_one_hotkey();
	text_height = string_height(hotkey_text[1]);
}
