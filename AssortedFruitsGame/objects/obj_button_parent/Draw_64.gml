/// @description 

draw_self();
draw_set_font(fnt_button);

/// Allows it to update when the mouse has not entered/pressed it 
if(enabled && image_index == BUTTON_DISABLED)
{
	image_index = BUTTON_DEFAULT;
}
else if (!enabled)
{
	image_index = BUTTON_DISABLED;
}

// Set text alignment for this object
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, text);

// Reset the text alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
