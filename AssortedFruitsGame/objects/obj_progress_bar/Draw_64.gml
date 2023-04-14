/// @description

draw_self();
draw_sprite_part_ext(spr_progress_bar, 1, 
					0, 0, 
					xWidth * current_value, sprite_height, 
					x, y-sprite_get_yoffset(sprite_index),
					percentToScale,1,
					c_white,1);
				
draw_sprite(progress_icon, 0, x + sprite_width * current_value, y);
				
if(global.game_state == PAUSED)
{
	bh_darken_object_rect(x, y-sprite_get_yoffset(sprite_index), 
						  x + (xWidth * percentToScale), y+sprite_get_yoffset(sprite_index));
}
