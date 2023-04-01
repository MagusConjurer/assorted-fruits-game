/// Called by obj_game to check for necessary dialogue updates
function dialogue_update()
{
	if (global.game_state == DIALOGUE && dialogue_active = false)
	{
		dialogue_active = true;
		conversation_index = 1;
		conversation = [];
		conversation_boxes = [];
		dialogue_selection_options = [];
		dialogue_selection_buttons = [];
		dialogue_start();
	}
	else if (global.game_state == DIALOGUE && dialogue_active = true)
	{
		if(!dialogue_selection_visible && keyboard_check_released(vk_space))
		{
			if(conversation_index >= array_length(conversation))
			{
				end_conversation()
			}
			else
			{
				continue_conversation();
			}
		}
	}
}

function dialogue_start()
{
	load_conversation(dialogue_level);
	set_portrait_positions();
	check_if_in_person(conversation[conversation_index]);
	draw_textbox();
	
	start_box = conversation_boxes[0];
	cont_x = start_box.x + start_box.box_width * 1.9;
	cont_y = start_box.y + start_box.box_height - TEXTBOX_MARGIN * 3;
	dialogue_button = instance_create_layer(cont_x, cont_y, "Dialogue", obj_continue_dia);
	dialogue_button.text = CONTINUE_DIA_TEXT;
}

function set_textbox_properties(textbox)
{
	current_line = obj_game.conversation[obj_game.conversation_index];
	
	if(obj_game.dialogue_in_person)
	{
		textbox.box_sprite = DIALOGUE_INPERSON_BOX_SPRITE;
		textbox.current_alignment = align.centered;
	} 
	else 
	{
		textbox.box_sprite = DIALOGUE_TEXTMSG_BOX_SPRITE;
		if(current_line.on_the_left)
		{
			textbox.current_alignment = align.left;
		}
		else
		{
			textbox.current_alignment = align.right;
		}
	}
	
	textbox.current_text = current_line.text;
	if(current_line.on_the_left)
	{
		textbox.box_tint = obj_game.dialogue_left.textbox_color;
		textbox.current_name = obj_game.dialogue_left.textbox_name;
		obj_game.dialogue_left.image_index = current_line.emotion;
	}
	else
	{
		textbox.box_tint = obj_game.dialogue_right.textbox_color;
		textbox.current_name = obj_game.dialogue_right.textbox_name;
		obj_game.dialogue_right.image_index = current_line.emotion;
	}
}

function draw_textbox()
{
	spr_width = sprite_get_width(spr_dia_box_default) * 0.5;
	spr_height = sprite_get_height(spr_dia_box_default) * 0.5;
	
	tb_x = camera_x + (camera_width - spr_width) * 0.5;
	tb_y = camera_y + (camera_height - spr_height - TEXTBOX_MARGIN);
	
	obj_game.textbox_inst = instance_create_layer(tb_x,tb_y,"Dialogue",obj_textbox_dia);
	set_textbox_properties(obj_game.textbox_inst);
	
	obj_game.conversation_boxes[obj_game.conversation_index-1] = obj_game.textbox_inst;
	obj_game.conversation_index++;
}

function draw_multi_textbox()
{
	for(i = 0; i < array_length(obj_game.conversation_boxes); i++)
	{
		if(instance_exists(obj_game.conversation_boxes[i]))
		{
			obj_game.box = obj_game.conversation_boxes[i];
			obj_game.box.y -= obj_game.box.sprite_height + TEXTBOX_MARGIN;
		}
	}
				
	draw_textbox();
}

function remove_multi_boxes()
{
	for(i = 1; i < array_length(obj_game.conversation_boxes); i++)
	{
		if(instance_exists(obj_game.conversation_boxes[i]))
		{
			instance_destroy(obj_game.conversation_boxes[i]);
		}
	}
	obj_game.conversation_boxes[0] = instance_create_layer(0,0,"Dialogue",obj_textbox_dia);
}

function load_conversation(level)
{
	conversation_data = global.conversations[level];
	
	with(obj_game)
	{
		dialogue_left  = instance_create_layer(0,0, "Dialogue", conversation_data[0].left_speaker);
		dialogue_right = instance_create_layer(0,0, "Dialogue", conversation_data[0].right_speaker);
	
		for(i = 1; i < array_length(conversation_data); i++)
		{
			conversation[i] = conversation_data[i];
			current_conversation = conversation[i];
			if(current_conversation.type == "selection")
			{
				for(j = 0; j < array_length(conversation[i].option_descriptions); j++)
				{
					dialogue_selection_options[j]   = current_conversation.option_descriptions[j];
					dialogue_selection_jumps[j]     = current_conversation.option_jump_index[j];
					dialogue_selection_abilities[j] = current_conversation.option_ability_index[j];
				}
			}
		}
	}

}

function set_portrait_positions()
{
	dialogue_left.image_xscale = 0.2;
	dialogue_left.image_yscale = 0.2;
	dialogue_left.x = camera_x + PORTRAIT_MARGIN * 0.2;
	dialogue_left.y = camera_y + camera_height - (PORTRAIT_HEIGHT * 0.2 /2);

	
	dialogue_right.image_xscale = 0.2;
	dialogue_right.image_yscale = 0.2;
	dialogue_right.x = camera_x + camera_width - PORTRAIT_MARGIN * 0.2;
	dialogue_right.y = camera_y + camera_height - (PORTRAIT_HEIGHT * 0.2 /2);
}

function check_if_in_person(line)
{
	if(line.type == "line")
	{
		if(obj_game.dialogue_in_person == false)
		{
			obj_game.dialogue_in_person = true;
			remove_multi_boxes();
		}
	}
	else if(line.type == "message")
	{
		obj_game.dialogue_in_person = false;
	}
}

function continue_conversation()
{
	with(obj_game)
	{
		if(conversation_index < array_length(conversation))
		{
			current_line = conversation[conversation_index];
			check_if_in_person(current_line);
		
			if(dialogue_in_person)
			{
				box = conversation_boxes[0];
				if(current_line.type == "line")
				{
					set_textbox_properties(box);
					if(current_line.jump_to > 0)
					{
						conversation_index = current_line.jump_to;
					}
				
					conversation_index++;
				}
				else
				{
					if(dialogue_selection_visible == false)
					{
						show_options();
					}
				}
			}
			else
			{
				draw_multi_textbox();
			}	
		}
	
		// allows it to update directly after final line
		if(conversation_index == array_length(conversation))
		{
			dialogue_button.text = COMPLETE_DIA_TEXT;
		}
	}
	
}

function end_conversation()
{
	instance_destroy(obj_dialogue_parent);
	instance_destroy(obj_game.dialogue_button);
	
	obj_game.dialogue_active = false;
	set_game_state(OVERWORLD);
}

function show_options()
{
	with(obj_game)
	{
		options = dialogue_selection_options;
		jumps   = dialogue_selection_jumps;
		abilities = dialogue_selection_abilities;
		num_options = array_length(options);
		for(i = 0; i < num_options; i++)
		{
			if(dialogue_in_person)
			{
				box = conversation_boxes[0];
			}
			else
			{
				box = conversation_boxes[conversation_index-1];
			}
		
			current_selection = conversation[conversation_index];
		
			box.current_text = current_selection.text_to_show;
			box.box_tint = current_selection.color;
		
			option_button = instance_create_layer(0, 0, "Dialogue", obj_selection_dia);
			option_button.text = options[i];
			option_button.jump_index = jumps[i];
			option_button.ability_index  = abilities[i];
		
			spacing = 1;
			if(num_options == 3)
			{
				spacing = 0.5;
			}
			else if(num_options == 2)
			{
				spacing = 0.75
			}
		
			option_button.x = box.x + ((box.box_width*spacing) * (i+1));
			option_button.y = box.y + (box.box_height*0.5);
		
			dialogue_selection_buttons[i] = option_button;
		}
	
		dialogue_button.enabled = false;
		dialogue_selection_visible = true;
	}
	
}

function dialogue_jump_to(index)
{
	obj_game.conversation_index = index;
}

function complete_selection()
{
	for(i = 0; i < array_length(obj_game.dialogue_selection_buttons); i++)
	{
		instance_destroy(obj_game.dialogue_selection_buttons[i]);
	}
	
	obj_game.dialogue_button.enabled = true;
	obj_game.dialogue_selection_visible = false;
		
	obj_game.conversation_index++;
	continue_conversation();
}
