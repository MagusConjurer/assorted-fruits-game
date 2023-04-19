/// @description

draw_self();
draw_sprite_part_ext(spr_progress_bar, 1, 
					0, 0, 
					xWidth * current_value, sprite_height, 
					x, y-sprite_get_yoffset(sprite_index),
					percentToScale,1,
					progress_blend_color,1);
				
// draw_sprite(progress_icon, 0, x + sprite_width * current_value, y);

draw_sprite_ext(progress_icon, 0, x + sprite_width * current_value, y, 
			    0.2, 0.2, 0, c_white, 1);
				
event_inherited();
