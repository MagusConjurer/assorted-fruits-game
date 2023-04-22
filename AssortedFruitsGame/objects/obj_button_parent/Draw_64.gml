/// @description 

draw_sprite(sprite,image_index,x,y);
draw_set_font(fnt_button);

// Set text alignment for this object
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(text != "")
{
	draw_text(x, y, text);
}

if(description != "")
{
	draw_text(x, y + DIALOGUE_SELECT_DESCRIPTION_OFFEST, description);
}

// Reset the text alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
