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
	draw_textbox();
}

function set_textbox_properties(textbox)
{
	current_line = obj_game.conversation[obj_game.conversation_index];
	
	textbox.current_text = current_line.text;
	if(current_line.on_the_left)
	{
		textbox.box_tint = obj_game.dialogue_left.textbox_color;
		textbox.current_name = obj_game.dialogue_left.textbox_name;
	}
	else
	{
		textbox.box_tint = obj_game.dialogue_right.textbox_color;
		textbox.current_name = obj_game.dialogue_right.textbox_name;
	}
}

function draw_textbox()
{
	obj_game.textbox_inst = instance_create_layer(0,0,"Dialogue",obj_textbox_dia);
	set_textbox_properties(obj_game.textbox_inst);
	
	obj_game.conversation_boxes[conversation_index-1] = textbox_inst;
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

function load_conversation(level)
{
	conversation_data = global.conversations[level];
	
	obj_game.dialogue_left  = instance_create_layer(0,0, "Dialogue", conversation_data[0].left_speaker);
	obj_game.dialogue_right = instance_create_layer(0,0, "Dialogue", conversation_data[0].right_speaker);
	
	for(i = 1; i < array_length(conversation_data); i++)
	{
		obj_game.conversation[i] = conversation_data[i];
		if(obj_game.conversation[i].type == "selection")
		{
			for(j = 0; j < array_length(conversation[i].option_descriptions); j++)
			{
				obj_game.dialogue_selection_options[j] = obj_game.conversation[i].option_descriptions[j];
			}
		}
	}
}

function continue_conversation()
{
	if(obj_game.conversation_index < array_length(obj_game.conversation))
	{
		if(!ENABLE_MULTI_TEXTBOX)
		{
			obj_game.box = obj_game.conversation_boxes[0];
			if(obj_game.conversation[obj_game.conversation_index].type == "line")
			{
				set_textbox_properties(obj_game.box);
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
			draw_multi_textbox()
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
	num_options = array_length(options);
	for(i = 0; i < num_options; i++)
	{
		if(!ENABLE_MULTI_TEXTBOX)
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
