/// @description

// Inherit the parent event
event_inherited();

if(sprite_index != box_sprite)
{
	if(current_alignment = align.centered)
	{
		image_xscale = 0.4;
		image_yscale = 0.4;
		
		sprite_index = box_sprite;
		box_width  = sprite_get_width(box_sprite) * image_xscale;
		box_height = (sprite_get_height(box_sprite) - sprite_get_yoffset(sprite_index)) * image_yscale;
		
		x = dialogue_get_midpoint() - (box_width * 0.5);
		y = dialogue_get_bottom() - box_height - TEXTBOX_MARGIN;
	} 
	else 
	{	
		sprite_index = box_sprite;
		box_width  = sprite_get_width(box_sprite) * image_xscale;
		box_height = sprite_get_height(box_sprite) * image_yscale;
		
		if(current_alignment = align.left)
		{
			image_index = DIALOGUE_TM_LEFT_LARGE;
		
			x = dialogue_get_midpoint() - (box_width * 0.1);
		}
		else
		{
			image_index = DIALOGUE_TM_RIGHT_LARGE;
			
			x = dialogue_get_midpoint() + (box_width * 0.1);
		}
		
		y = dialogue_get_bottom() - (box_height * 1.5) - TEXTBOX_MARGIN;
	}

}

// Allows the text to move up with the box when it is moved for multi-textbox
if(current_alignment == align.centered)
{
	image_xscale = 0.4;
	image_yscale = 0.4;
	
	box_width  = sprite_get_width(box_sprite) * image_xscale;
		
	text_x = x + TEXTBOX_PADDING;
	text_y = y + (TEXTBOX_PADDING*2);
	
	text_max_width = (box_width * 0.95) - (TEXTBOX_PADDING*2);
	
	if(visible == false)
	{
		visible = true;
	}
}
else
{
	if(dialogue_multi_max_height(y))
	{
		visible = false;
	}
	else
	{
		text_max_width = (box_width * 0.9) - (TEXTBOX_PADDING*2);
		full_text_height = string_height_ext(current_text, -1, text_max_width);

		if(full_text_height < box_height / 2)
		{
			if(image_index == 0)
			{
				image_index = 2;
			}
			else if(image_index == 1)
			{
				image_index = 3;
			}
		}
		
		adjusted_text_offset = box_height * ((full_text_height / 2 / box_height));
		
		text_y = y - (adjusted_text_offset);
	
		if(current_alignment == align.right)
		{
			text_x = x + (box_width  * TEXTBOX_OFFSET_PERCENT) - (TEXTBOX_PADDING*2);
		}
		else
		{
			text_x = x - (box_width  * TEXTBOX_OFFSET_PERCENT) + (TEXTBOX_PADDING*2);
		}
		
		if(visible == false)
		{
			visible = true;
		}
	}
}

name_x = text_x;
name_y = text_y - TEXTBOX_PADDING;
