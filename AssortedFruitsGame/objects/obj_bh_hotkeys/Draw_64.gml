/// @description 

// Only need to do anything here if one of the text strings was set
if(text_height > 0)
{
	draw_set_font(fnt_BH_text);
	draw_set_color(text_color);
	
	if(hotkey_text[0] != "")
	{
		draw_text(x,y,hotkey_text[0]);
	}
	
	if(hotkey_text[1] != "")
	{
		draw_text(x,y + text_height,hotkey_text[1]);
	}

	draw_set_color(c_black);
}