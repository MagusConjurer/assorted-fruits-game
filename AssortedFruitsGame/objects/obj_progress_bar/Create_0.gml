/// @description 

// Inherit the parent event
event_inherited();


// Using similar setup as the slider_parent
current_value = 0;
max_value = 1;
image_speed = 0;
image_index = 0;

progress_icon = spr_slider_button;

xWidth = sprite_get_width(sprite_index);
percentToScale = (obj_game.camera_width) / xWidth;
image_xscale = percentToScale;
x = obj_game.camera_x + (xWidth * percentToScale * 0.5)