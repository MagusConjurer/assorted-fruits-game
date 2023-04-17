/// @description 

draw_self();
image_blend = box_tint;

// Draw Text
draw_set_font(fnt_dialogue);

if(current_alignment == align.right)
{
	draw_set_halign(fa_right);
}

draw_text(name_x, name_y, current_name);
draw_text_ext_color(text_x, text_y, current_text, text_height, text_max_width, 0,0,0,0,1);

// Reset to default
draw_set_halign(fa_left);