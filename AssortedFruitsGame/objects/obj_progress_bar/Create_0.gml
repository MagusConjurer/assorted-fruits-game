/// @description 

// Inherit the parent event
event_inherited();


// Using similar setup as the slider_parent
current_value = 0;
max_value = 1;
image_speed = 0;
image_index = 0;

xWidth = sprite_get_width(sprite_index);
percentToScale = (global.resolution_w * 0.75) / xWidth;
image_xscale = percentToScale;
x = x - (xWidth * percentToScale * 0.5)