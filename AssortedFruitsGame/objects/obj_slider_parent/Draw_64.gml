/// @description Draw the slider

draw_self();
draw_sprite_part(sprite_index, 1, 
				0, 0, 
				sprite_width * value, sprite_height, 
				x, y-sprite_get_yoffset(sprite_index));

draw_sprite(spr_slider_button, button_index, x+sprite_width * value, y);

event_inherited(); // draw description text