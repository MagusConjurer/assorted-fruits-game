/// @description

// Inherit the parent event
event_inherited();

if(sprite_index != box_sprite)
{
	sprite_index = box_sprite;
	box_width = sprite_get_width(box_sprite);
	box_height = sprite_get_height(box_sprite);

	if(current_alignment = align.centered)
	{
		x = (global.resolution_w - box_width) * 0.5;
	}
	else if(current_alignment = align.left)
	{
		image_xscale = -1;
		x = (global.resolution_w * 0.5) - (box_width * 0.25);
	}
	else
	{
		image_xscale = 1;
		x = (global.resolution_w * 0.5) + (box_width * 0.25);
	}

	y = global.resolution_h - box_height - TEXTBOX_MARGIN;
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
