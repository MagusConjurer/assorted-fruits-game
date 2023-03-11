conversation = [];

/// Called by obj_game to check for necessary dialogue updates
function dialogue_update()
{
	if (global.game_state == DIALOGUE && dialogue_active = false)
	{
		dialogue_active = true;
		conversation_index = 0;
		conversation_boxes = [];
		dialogue_start();
	}
	else if (global.game_state == DIALOGUE && dialogue_active = true)
	{
		if(keyboard_check_released(vk_space))
		{
			continue_conversation();
			
			if(conversation_index == array_length(conversation) + 1)
			{
				end_conversation()
			}
		}
	}
}

function dialogue_start()
{
	instance_create_layer(0, 0, "Dialogue", obj_player_dia);
	instance_create_layer(0, 0, "Dialogue", obj_other_dia);
	dialogue_button = instance_create_layer(0, 0, "Dialogue", obj_continue_dia);
	dialogue_button.text = CONTINUE_DIA_TEXT;
	
	load_conversation(dialogue_level);
	draw_textbox();
}

function get_textbox_color(index)
{
	color_decision = index mod 2;
				
	if(color_decision == 0)
	{
		return c_aqua;
	}
	else
	{
		return c_green;
	}
}

function draw_textbox()
{
	obj_game.textbox_inst = instance_create_layer(0,0,"Dialogue",obj_textbox_dia);
	obj_game.textbox_inst.box_tint = get_textbox_color(obj_game.conversation_index);
	obj_game.textbox_inst.current_text = obj_game.conversation[obj_game.conversation_index];
	
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

function load_conversation(level)
{
	switch(level)
	{
		case 1:
			conversation[0] = "First";
			conversation[1] = "Second";
			conversation[2] = "Third";
			conversation[3] = "Fourth";
			conversation[4] = "Fifth";
			conversation[5] = "Sixth";
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
			obj_game.box.current_text = obj_game.conversation[obj_game.conversation_index];
			obj_game.box.box_tint = get_textbox_color(obj_game.conversation_index);
				
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