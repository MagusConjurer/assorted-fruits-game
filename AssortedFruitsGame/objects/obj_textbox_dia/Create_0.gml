/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

box_sprite = spr_dia_box_default;
box_tint = c_white; // white is no tint

box_width = sprite_get_width(box_sprite);
box_height = sprite_get_height(box_sprite);

x = (global.resolution_w - box_width) * 0.5;
y = global.resolution_h - box_height - TEXTBOX_MARGIN;

current_text = "This is what text looks like. If you write a lot of text then it should wrap to the next line. That could mean that you need a lot of text. Or a bigger font. Or smaller boxes.";
current_name = "Name Here";

text_x = x + TEXTBOX_PADDING;
text_y = y + (TEXTBOX_PADDING*2);
text_max_width = box_width - (TEXTBOX_PADDING*2);
text_height = string_height("Just to get font text height.");

name_x = text_x;
name_y = y + TEXTBOX_PADDING;