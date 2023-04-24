/// @description 

// Inherit the parent event
event_inherited();

bh_ui_type = BH_UI_RECT;
icon_blend_color = c_white;

// Using similar setup as the slider_parent
current_value = 0;
max_value = 1;
image_speed = 0;
image_index = 0;

progress_icon = spr_slider_button;
progress_pulse_color = c_white; // Update this to change the color
progress_blend_color = c_green; // Color used to blend with actual sprite
progress_pulse_frames = 0;
pulse_toggle = false;


xWidth = sprite_get_width(sprite_index);
percentToScale = (global.resolution_w / 2) / xWidth;
image_xscale = percentToScale;

x = (global.resolution_w - (xWidth * percentToScale)) / 2;

