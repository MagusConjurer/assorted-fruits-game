/// @description 

draw_self();

draw_text(x + (sprite_width/2 - string_width(options[option_selected])/2), 
		  y - string_height(options[option_selected])/2, 
		  options[option_selected]);

if(selected && global.resize_enabled)
{			
	for(i = 1; i <= array_length(options); i++)
	{
		new_y = y + yIncrement*i;
		new_x = x + (sprite_width/2 - string_width(options[i-1])/2)
		draw_sprite(spr_dropdown_default,0,x,new_y);
		draw_text(new_x, new_y - string_height(options[i-1])/2, options[i-1]);
		
		top_y = y + yIncrement*i - sprite_height/2;
		bot_y = y + yIncrement*i + sprite_height/2;
		
		if(mouse_y > top_y && mouse_y < bot_y)
		{
			option_hovered = i-1;
			draw_rectangle( x+5,
							top_y+5,
							x + sprite_width-5, 
							bot_y-5,
							true);
		} 
	}


}

event_inherited();

