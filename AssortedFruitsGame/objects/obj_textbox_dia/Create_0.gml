/// @description 

// Inherit the parent event
event_inherited();

image_xscale = 0.5;
image_yscale = 0.5;

visible = false;

box_sprite = DIALOGUE_INPERSON_BOX_SPRITE;
box_tint = c_white; // white is no tint

box_width = sprite_get_width(box_sprite) * image_xscale;
box_height = sprite_get_height(box_sprite) * image_yscale;

current_alignment = align.centered;

current_text = "This is what text looks like. If you write a lot of text then it should wrap to the next line. That could mean that you need a lot of text. Or a bigger font. Or smaller boxes.";
current_name = "Name Here";

text_x = x + TEXTBOX_PADDING;
text_y = y + (TEXTBOX_PADDING*2);
text_max_width = box_width - (TEXTBOX_PADDING*2);
text_height = string_height("Just to get font text height.");

name_x = text_x;
name_y = y + TEXTBOX_PADDING;