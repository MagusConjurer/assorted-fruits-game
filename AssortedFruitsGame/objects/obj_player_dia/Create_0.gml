/// @description 

// Inherit the parent event
event_inherited();

player_portrait = spr_player_dia_default;
image_index = 0;

player_height = sprite_get_height(player_portrait);

x = PORTRAIT_MARGIN;
y = global.resolution_h - (player_height/2) - PORTRAIT_MARGIN;

