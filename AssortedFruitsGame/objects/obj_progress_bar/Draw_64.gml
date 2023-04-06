/// @description

draw_self();
draw_sprite_part(sprite_index, 1, 
				0, 0, 
				sprite_width * current_value, sprite_height, 
				x, y-sprite_get_yoffset(sprite_index));
				
if(global.game_state == PAUSED)
{
	bh_darken_object_rect(x, y-sprite_get_yoffset(sprite_index), 
						  x + (xWidth * percentToScale), y+sprite_get_yoffset(sprite_index));
}
