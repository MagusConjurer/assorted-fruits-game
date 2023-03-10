/// @description Insert description here
// You can write your code in this editor

draw_self();
image_blend = box_tint;

// Draw Text
draw_set_font(fnt_dialogue);

draw_text_ext_color(text_x, text_y, current_text, text_height, text_max_width, 0,0,0,0,1);
