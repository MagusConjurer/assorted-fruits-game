/// @description 

draw_set_font(fnt_BH_text);

if(BH_DIALOGUE_HAS_COLLISION)
{
	draw_sprite_ext(BH_DIALOGUE_BG_SPRITE,0,
					left_x, top_y + 10, 
					spr_scale_x, spr_scale_y, 
					0, bg_color, 1);
}

draw_set_color(text_color);
draw_text(x,y,bh_dialogue);

draw_set_color(c_black);