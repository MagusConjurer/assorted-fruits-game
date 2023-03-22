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
	dialogue_button = instance_create_layer(0, 0, "Dialogue", obj_continue_dia);
	dialogue_button.text = CONTINUE_DIA_TEXT;
	
	load_conversation(dialogue_level);
	set_portrait_positions();
	check_if_in_person(conversation[conversation_index]);
	draw_textbox();
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
	obj_game.textbox_inst = instance_create_layer(0,0,"Dialogue",obj_textbox_dia);
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
	
	obj_game.dialogue_left  = instance_create_layer(0,0, "Dialogue", conversation_data[0].left_speaker);
	obj_game.dialogue_right = instance_create_layer(0,0, "Dialogue", conversation_data[0].right_speaker);
	
	for(i = 1; i < array_length(conversation_data); i++)
	{
		obj_game.conversation[i] = conversation_data[i];
		current_conversation = obj_game.conversation[i];
		if(current_conversation.type == "selection")
		{
			for(j = 0; j < array_length(conversation[i].option_descriptions); j++)
			{
				obj_game.dialogue_selection_options[j] = current_conversation.option_descriptions[j];
				obj_game.dialogue_selection_jumps[j]   = current_conversation.option_jump_index[j];
			}
		}
	}
}

function set_portrait_positions()
{
	dialogue_left.x = PORTRAIT_MARGIN;
	dialogue_left.y =  global.resolution_h - (PORTRAIT_HEIGHT/2);
	
	dialogue_right.x = global.resolution_w - PORTRAIT_MARGIN;
	dialogue_right.y = global.resolution_h - (PORTRAIT_HEIGHT/2);
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
	if(obj_game.conversation_index < array_length(obj_game.conversation))
	{
		current_line = obj_game.conversation[obj_game.conversation_index];
		check_if_in_person(current_line);
		
		if(obj_game.dialogue_in_person)
		{
			obj_game.box = obj_game.conversation_boxes[0];
			if(current_line.type == "line")
			{
				set_textbox_properties(obj_game.box);
				if(current_line.jump_to > 0)
				{
					obj_game.conversation_index = current_line.jump_to;
				}
				
				obj_game.conversation_index++;
			}
			else
			{
				if(obj_game.dialogue_selection_visible == false)
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
	if(obj_game.conversation_index == array_length(obj_game.conversation))
	{
		obj_game.dialogue_button.text = COMPLETE_DIA_TEXT;
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
	options = obj_game.dialogue_selection_options;
	jumps   = obj_game.dialogue_selection_jumps;
	num_options = array_length(options);
	for(i = 0; i < num_options; i++)
	{
		if(!obj_game.dialogue_in_person)
		{
			box = obj_game.conversation_boxes[0];
		}
		else
		{
			box = obj_game.conversation_boxes[obj_game.conversation_index-1];
		}
		
		current_selection = obj_game.conversation[obj_game.conversation_index];
		
		box.current_text = current_selection.text_to_show;
		box.box_tint = current_selection.color;
		
		option_button = instance_create_layer(0, 0, "Dialogue", obj_selection_dia);
		option_button.text = options[i];
		option_button.jump_index = jumps[i];
		
		spacing = 1;
		if(num_options == 3)
		{
			spacing = 0.25;
		}
		else if(num_options == 2)
		{
			spacing = 0.3
		}
		
		option_button.x = box.x + ((box.sprite_width*spacing) * (i+1));
		option_button.y = box.y + (box.sprite_height*0.5);
		
		obj_game.dialogue_selection_buttons[i] = option_button;
	}
	
	obj_game.dialogue_button.enabled = false;
	obj_game.dialogue_selection_visible = true;
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
