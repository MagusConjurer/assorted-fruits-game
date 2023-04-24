/// @description 

draw_set_font(fnt_BH_text);

draw_set_color(text_color);
draw_text(x,y,bh_dialogue);

if(BH_DIALOGUE_HAS_COLLISION)
{
	draw_rectangle(left_x, top_y, right_x, bot_y, text_color);
}

draw_set_color(c_black);