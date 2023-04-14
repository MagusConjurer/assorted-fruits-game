/// @description

// Inherit the parent event
event_inherited();

if(sprite_index != box_sprite)
{
	if(current_alignment = align.centered)
	{
		image_xscale = 0.5;
		image_yscale = 0.5;
	} 
	else 
	{
		image_xscale = 0.25;
		image_yscale = 0.25;
	}
	
	sprite_index = box_sprite;
	box_width  = sprite_get_width(box_sprite) * image_xscale;
	box_height = sprite_get_height(box_sprite)* image_yscale;

	if(current_alignment = align.centered)
	{
		x = dialogue_get_midpoint() - (box_width * 0.5);
	}
	else if(current_alignment = align.left)
	{
		if(image_xscale > 0) 
		{
			image_xscale = image_xscale * -1;
		}
		
		x = dialogue_get_midpoint() - (box_width * 0.25);
	}
	else
	{
		if(image_xscale < 0) 
		{
			image_xscale = image_xscale * 1;
		}
		x = dialogue_get_midpoint() + (box_width * 0.25);
	}

	y = dialogue_get_bottom() - box_height - TEXTBOX_MARGIN;
	text_max_width = box_width - (TEXTBOX_PADDING*2);
}

// Allows the text to move up with the box when it is moved for multi-textbox
if(current_alignment == align.centered)
{
	text_x = x + TEXTBOX_PADDING;
	text_y = y + (TEXTBOX_PADDING*2);
}
else if(current_alignment == align.right)
{
	text_x = x + (box_width * 0.4) - (TEXTBOX_PADDING*2);
	text_y = y - (box_height * 0.4) + (TEXTBOX_PADDING*2);
}
else
{
	text_x = x - (box_width * 0.4) + (TEXTBOX_PADDING*2);
	text_y = y - (box_height * 0.4) + (TEXTBOX_PADDING*2);
}

name_x = text_x;
name_y = text_y - TEXTBOX_PADDING;
