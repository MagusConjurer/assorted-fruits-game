/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

other_portrait = spr_player_dia_default;
image_index = 0;
image_blend = c_lime;

other_height = sprite_get_height(other_portrait);

x = global.resolution_w - PORTRAIT_MARGIN;
y = global.resolution_h - (other_height/2) - PORTRAIT_MARGIN;

textbox_color = c_green;
textbox_name = "Other";