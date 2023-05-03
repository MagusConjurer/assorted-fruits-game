/// @description 

// Inherit the parent event
event_inherited();

bh_ui_type = BH_UI_CIRCLE;

ability = 0;
ability_image_active = -1;
ability_image_inactive = -1;
usable = true;

hotkey = global.hotkey_ability_one;

cooldown = obj_game.bh_ability_cooldown;
time_since_used = 0;
percentage_to_draw = 0;