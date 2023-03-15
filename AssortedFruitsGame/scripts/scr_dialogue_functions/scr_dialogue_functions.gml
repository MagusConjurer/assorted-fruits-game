conversation = [];

/// Called by obj_game to check for necessary dialogue updates
function dialogue_update()
{
	if (global.game_state == DIALOGUE && dialogue_active = false)
	{
		dialogue_active = true;
		conversation_index = 0;
		conversation_boxes = [];
		dialogue_selection_options = [];
		dialogue_selection_buttons = [];
		dialogue_start();
	}
	else if (global.game_state == DIALOGUE && dialogue_active = true)
	{
		if(is_in_selection())
		{
			if(dialogue_selection_visible == false)
			{
				show_options();
			}
		}
		if(keyboard_check_released(vk_space))
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
	dialogue_player = instance_create_layer(0, 0, "Dialogue", obj_player_dia);
	dialogue_button = instance_create_layer(0, 0, "Dialogue", obj_continue_dia);
	dialogue_button.text = CONTINUE_DIA_TEXT;
	
	load_conversation(dialogue_level);
	draw_textbox();
}

function set_textbox_properties(textbox)
{
	alternate = (obj_game.conversation_index + obj_game.conversation_player_first) mod 2;
	
	textbox.current_text = obj_game.conversation[obj_game.conversation_index];
				
	if(alternate == 1)
	{
		textbox.box_tint = obj_game.dialogue_player.textbox_color;
		textbox.current_name = obj_game.dialogue_player.textbox_name;
	}
	else
	{
		textbox.box_tint = obj_game.dialogue_other.textbox_color;
		textbox.current_name = obj_game.dialogue_other.textbox_name;
	}
}

function draw_textbox()
{
	obj_game.textbox_inst = instance_create_layer(0,0,"Dialogue",obj_textbox_dia);
	set_textbox_properties(obj_game.textbox_inst);
	
	obj_game.conversation_boxes[conversation_index] = textbox_inst;
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

/// May want to move the conversation elsewhere
/// Can create separate duplicate objects for each character to make it easier to swap out sprites/colors/names/etc
function load_conversation(level)
{
	switch(level)
	{
		case 1:
			dialogue_other = instance_create_layer(0, 0, "Dialogue", obj_other_dia);
			conversation_player_first = true;
			
			conversation[0] = "Eugh.";
			conversation[1] = "...";
			conversation[2] = "F@$%!t.";
			conversation[3] = "(internal) Did he seriously say that to me? I didn't even do anything to him! What should I do?";
			conversation[4] = SELECTION;
			conversation[5] = "...";
			conversation[6] = "What, can't even look at me when I'm talking to you?";
			conversation[7] = "....";
			conversation[8] = "Lookin' away ain't egonna do you any favors, kid.";
			conversation[9] = "Please stop."
			conversation[10] = "What, I'm just stating the obvious. You're practically screaming it to the entire town looking like that.";
			conversation[11] = "It's not a nice thing to say, though.";
			conversation[12] = "I don't gotta be nice to you."
			conversation[13] = "(internal) My heart's beating really fast.... I just wanna get away, but I have to catch this bus.";
			conversation[14] = "Hey! You deaf or something?";
			
			dialogue_selection_options[0] = "Health";
			dialogue_selection_options[1] = "Defense";
			dialogue_selection_options[2] = "Offense";
		break;
	}

}

function continue_conversation()
{
	if(obj_game.conversation_index < array_length(obj_game.conversation))
	{
		if(!ENABLE_MULTI_TEXTBOX)
		{
			obj_game.box = obj_game.conversation_boxes[0];
			set_textbox_properties(obj_game.box);
				
			obj_game.conversation_index++;
		}
		else
		{
			draw_multi_textbox()
		}
				
		if(obj_game.conversation_index == array_length(obj_game.conversation))
		{
			obj_game.dialogue_button.text = COMPLETE_DIA_TEXT;
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
	for(i = 0; i < array_length(dialogue_selection_options); i++)
	{
		if(!ENABLE_MULTI_TEXTBOX)
		{
			box = conversation_boxes[0];
		}
		else
		{
			box = conversation_boxes[conversation_index];
		}
		
		box.current_text = "";
		box.box_tint = c_gray;
		
		option_button = instance_create_layer(0, 0, "Dialogue", obj_selection_dia);
		option_button.text = dialogue_selection_options[i];
		option_button.x = box.x + ((box.sprite_width*0.25) * (i+1));
		option_button.y = box.y + (box.sprite_height*0.5);
		
		dialogue_selection_buttons[i] = option_button;
	}
	
	dialogue_button.enabled = false;
	dialogue_selection_visible = true;
}

function is_in_selection()
{
	if(conversation_index < array_length(conversation))
	{
		if(conversation[conversation_index] == SELECTION)
		{
			return true;
		}
	}
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
