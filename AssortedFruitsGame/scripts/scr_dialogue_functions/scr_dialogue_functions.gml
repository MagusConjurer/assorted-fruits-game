/// Called by obj_game to check for necessary dialogue updates
function dialogue_update()
{
	if (is_type_of_dialogue() && dialogue_active = true)
	{
		if(global.gamepad_id > -1)
		{
			if(dialogue_selection_visible)
			{
				if (menu_selection_left())
				{
					dialogue_selection_buttons[dialogue_selection].selected = false;
					if(dialogue_selection > 0)
					{
						dialogue_selection--;
					}
					else
					{
						dialogue_selection = array_length(dialogue_selection_buttons) - 1;
					}
					
					play_sfx(AUDIO_MENU_CLICK);
					dialogue_selection_buttons[dialogue_selection].selected = true;
				}
				else if (menu_selection_right())
				{
					dialogue_selection_buttons[dialogue_selection].selected = false;
					if(dialogue_selection < array_length(dialogue_selection_buttons) - 1)
					{
						dialogue_selection++;
					}
					else
					{
						dialogue_selection = 0;
					}
					
					play_sfx(AUDIO_MENU_CLICK);
					dialogue_selection_buttons[dialogue_selection].selected = true;
				}
			}
			else
			{
				dialogue_button.selected = true;
			}
		}
	}
}

// Resets all dialogue variables
function dialogue_init()
{
	dialogue_active = true;
	dialogue_selection_visible = false;
	dialogue_selection = 0;
	dialogue_in_person = true;
	dialogue_multi_opt = false;
	dialogue_current_left  = 0;
	dialogue_current_right = 0;
	dialogue_prev_left_index  = 0;
	dialogue_prev_right_index = 0;
	dialogue_left  = [];
	dialogue_right = [];
	conversation_index = 1; // starts at 1 since data is index 0
	conversation					= [];
	conversation_boxes				= [];
	dialogue_selection_options		= [];
	dialogue_selection_descriptions	= [];
	dialogue_selection_jumps		= [];
	dialogue_selection_buttons		= [];
	dialogue_selection_choices		= [];
}

function dialogue_start(dialogue_level)
{	
	with(obj_game)
	{
		dialogue_init();
	
		switch(dialogue_level)
		{
			case LEVEL_0_BEDROOM:
				load_conversation(PHONE_DIALOGUE);
			break;
			case LEVEL_1_BUS_STOP:
				load_conversation(BUS_STOP_DIALOGUE);
			break;
			case LEVEL_3_CAFE:
				load_conversation(CAFE_DIALOGUE);
			break;
			case LEVEL_4_DINNER:
				load_conversation(DINNER_DIALOGUE);
			break;
			case LEVEL_6_BEDROOM:
				load_conversation(FINAL_DIALOGUE);
			break;
		}
	
		dialogue_set_portraits();
		check_if_in_person(conversation[conversation_index]);
		draw_textbox(DIALOGUE_STANDARD);
	
		if(!dialogue_in_person)
		{
			phone_x = camera_x + (camera_width * 0.5);
			phone_y = camera_y + (camera_height * 0.5);
			dialogue_phone = instance_create_layer(phone_x,phone_y,"Dialogue",obj_phone_dia);
			
			// Don't let it play a audio if it switches from text to internal dialogue
			dialogue_l_has_spoken[0] = true;
			dialogue_r_has_spoken[0] = true;
		}
		else
		{
			// Index is updated when drawing the textbox, so we have to check the previous one for the first line
			dialogue_play_first_sound(conversation[conversation_index-1].on_the_left, conversation[conversation_index-1].speaker);
		}
	
		dialogue_button_init(DIALOGUE_STANDARD);
	}
}

function dialogue_set_nonstandard_text(dialogue_text)
{
	with(obj_game)
	{
		environmental_text = dialogue_text;
	}
}

function dialogue_environmental()
{	
	with(obj_game)
	{
		dialogue_init();
		dialogue_in_person = true;
		draw_textbox(DIALOGUE_ENVIRONMENTAL);
		conversation_boxes[0].current_text = environmental_text;
		conversation_boxes[0].current_name = "Alex";
		
		dialogue_button_init(DIALOGUE_ENVIRONMENTAL);
	}
}

function dialogue_pre_transition()
{
	with(obj_game)
	{
		dialogue_init();
		dialogue_in_person = true;
		draw_textbox(DIALOGUE_TRANSITION);
		conversation_boxes[0].current_text = environmental_text;
		conversation_boxes[0].current_name = "Alex";
		
		dialogue_button_init(DIALOGUE_TRANSITION);
	}
}

function dialogue_button_init(type)
{
	cont_x = global.resolution_w * 0.7;
	cont_y = global.resolution_h * 0.9;
	if(type != DIALOGUE_TRANSITION)
	{
		dialogue_button = instance_create_layer(cont_x, cont_y, "Dialogue", obj_continue_dia);
	}
	else
	{
		dialogue_button = instance_create_layer(cont_x, cont_y, "Dialogue", obj_transition_dia);
	}
	dialogue_button.text = CONTINUE_DIA_TEXT;
}

// used in the continue button
function dialogue_next()
{
	with(obj_game)
	{
		if(!dialogue_selection_visible)
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

function dialogue_set_bus_stop_choice(choice)
{
	with(obj_game)
	{
		bh_busstop_choice = choice;
	}
}

function dialogue_set_dinner_choice(choice)
{
	with(obj_game)
	{
		bh_dinner_choice  = choice;
	}
}

#region TEXTBOX
function set_textbox_properties(textbox, type)
{
	with(obj_game)
	{
		if(type == DIALOGUE_STANDARD)
		{
			current_line = conversation[conversation_index];
	
			if(dialogue_in_person)
			{
				textbox.box_sprite = DIALOGUE_INPERSON_BOX_SPRITE;
				textbox.current_alignment = align.centered;
				
				if(current_line.on_the_left)
				{
					textbox.current_name = dialogue_current_left.textbox_name;
					dialogue_current_left.image_index = current_line.emotion;
				}
				else
				{
					textbox.current_name = dialogue_current_right.textbox_name;
					dialogue_current_right.image_index = current_line.emotion;
				}
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
				
				dialogue_current_left.visible = false;
				dialogue_current_right.visible = false;
			}
	
			textbox.current_text = current_line.text;
			if(current_line.on_the_left)
			{
				textbox.box_tint = dialogue_current_left.textbox_color;
			}
			else
			{
				textbox.box_tint = dialogue_current_right.textbox_color;
			}
		}
		else if(type == DIALOGUE_ENVIRONMENTAL || type == DIALOGUE_TRANSITION)
		{
			textbox.box_sprite			= DIALOGUE_INPERSON_BOX_SPRITE;
			textbox.current_alignment	= align.centered;
			textbox.box_tint			= C_ALEX;
		}
	}
}

function draw_textbox(type)
{
	with(obj_game)
	{
		if(dialogue_in_person)
		{
			spr_width  = (sprite_get_width(DIALOGUE_INPERSON_BOX_SPRITE) - sprite_get_xoffset(DIALOGUE_INPERSON_BOX_SPRITE)) * 0.4;
			spr_height = (sprite_get_height(DIALOGUE_INPERSON_BOX_SPRITE) - sprite_get_yoffset(DIALOGUE_INPERSON_BOX_SPRITE)) * 0.4;
		}
		else
		{
			spr_width  = sprite_get_width(DIALOGUE_TEXTMSG_BOX_SPRITE) * 0.5;
			spr_height = sprite_get_height(DIALOGUE_TEXTMSG_BOX_SPRITE) * 0.5;
		}
		
		tb_x = camera_x + (camera_width - spr_width) * 0.5;
		tb_y = camera_y + (camera_height - spr_height - TEXTBOX_MARGIN);
	
		textbox_inst = instance_create_layer(tb_x,tb_y,"Dialogue",obj_textbox_dia);
		set_textbox_properties(textbox_inst, type);
		
		conversation_boxes[conversation_index-1] = textbox_inst;
		conversation_index++;
	}
}

function draw_multi_textbox()
{
	with(obj_game)
	{
		for(i = 0; i < array_length(conversation_boxes); i++)
		{
			if(instance_exists(conversation_boxes[i]))
			{
				box = conversation_boxes[i];
				box.y -= box.sprite_height + TEXTBOX_MARGIN;
			}
		}
	}
				
	draw_textbox(DIALOGUE_STANDARD);
}

function dialogue_multi_max_height(current_y)
{
	with(obj_game)
	{
		if(current_y < dialogue_phone.y - (dialogue_phone.sprite_height * 0.3))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}

function remove_multi_boxes()
{
	with(obj_game)
	{
		for(i = 1; i < array_length(conversation_boxes); i++)
		{
			if(instance_exists(conversation_boxes[i]))
			{
				instance_destroy(conversation_boxes[i]);
			}
			
			if(instance_exists(obj_phone_dia))
			{
				instance_destroy(obj_phone_dia);
			}
		}
		draw_textbox(DIALOGUE_STANDARD);
	}
}

function dialogue_get_midpoint()
{
	with(obj_game)
	{
		return camera_x + (camera_width * 0.5);
	}
}

function dialogue_get_bottom()
{
	with(obj_game)
	{
		return camera_y + camera_height;
	}
}

#endregion

function load_conversation(level)
{
	if(level == 2)
	{
		get_convo_two();
	}
	
	conversation_data = global.conversations[level];
	
	with(obj_game)
	{
		// Get and create all possible speakers
		l_speaker_data = conversation_data[0].left_speaker;
		r_speaker_data = conversation_data[0].right_speaker;
		for(l = 0; l < array_length(l_speaker_data); l++)
		{
			dialogue_left[l] = instance_create_layer(0,0, "Dialogue", l_speaker_data[l]);
			dialogue_left[l].visible = false;
			dialogue_l_has_spoken[l] = false;
		}
		
		for(r = 0; r < array_length(r_speaker_data); r++)
		{
			dialogue_right[r] = instance_create_layer(0,0, "Dialogue", r_speaker_data[r]);
			dialogue_right[r].visible = false;
			dialogue_r_has_spoken[r] = false;
		}

		// Only display the first speakers
		dialogue_current_left = dialogue_left[0];
		dialogue_current_left.visible = true;
		dialogue_current_right = dialogue_right[0];
		dialogue_current_right.visible = true;
		
		// Setup conversation and options
		dialogue_multi_opt = conversation_data[0].multiple_options;
	
		for(i = 1; i < array_length(conversation_data); i++)
		{
			conversation[i] = conversation_data[i];
			current_conversation = conversation[i];
			if(current_conversation.type == "selection")
			{				
				if(dialogue_multi_opt)
				{
					for(j = 0; j < array_length(conversation[i].option_descriptions); j++)
					{
						dialogue_selection_options[i][j]		= current_conversation.options[j];
						dialogue_selection_descriptions[i][j]	= current_conversation.option_descriptions[j];
						dialogue_selection_jumps[i][j]			= current_conversation.option_jump_index[j];
						dialogue_selection_choices[i][j]		= current_conversation.option_choice_index[j];
					}
				}
				else
				{
					for(j = 0; j < array_length(conversation[i].option_descriptions); j++)
					{
						dialogue_selection_options[j]		= current_conversation.options[j];
						dialogue_selection_descriptions[j]  = current_conversation.option_descriptions[j];
						dialogue_selection_jumps[j]			= current_conversation.option_jump_index[j];
						dialogue_selection_choices[j]		= current_conversation.option_choice_index[j];
					}
				}
			}
		}
	}

}

function dialogue_set_portraits()
{
	with(obj_game)
	{		
		dialogue_current_left.image_xscale = -PORTRAIT_SCALE;
		dialogue_current_left.image_yscale = PORTRAIT_SCALE;
		dialogue_current_left.x = camera_x + dialogue_current_left.mid_xwidth + PORTRAIT_MARGIN;
		dialogue_current_left.y = camera_y  + camera_height - dialogue_current_left.mid_yheight;

		dialogue_current_right.image_xscale = PORTRAIT_SCALE;
		dialogue_current_right.image_yscale = PORTRAIT_SCALE;
		dialogue_current_right.x = camera_x + camera_width  - dialogue_current_right.mid_xwidth  - PORTRAIT_MARGIN;
		dialogue_current_right.y = camera_y + camera_height - dialogue_current_right.mid_yheight;
	}
}

function dialogue_update_portraits()
{
	with(obj_game)
	{
		speaker_index = conversation[conversation_index].speaker;
		
		if(conversation[conversation_index].on_the_left)
		{			
			if(dialogue_prev_left_index != speaker_index)
			{
				dialogue_current_left.visible = false;
				dialogue_current_left = dialogue_left[speaker_index];
				dialogue_current_left.visible = true;
				
				dialogue_prev_left_index = speaker_index;
			}
			
			dialogue_play_first_sound(true, speaker_index);
		}
		else
		{			
			if(dialogue_prev_right_index != speaker_index)
			{
				dialogue_current_right.visible = false;
				dialogue_current_right = dialogue_right[speaker_index];
				dialogue_current_right.visible = true;
				
				dialogue_prev_right_index = speaker_index;
			}
			
			dialogue_play_first_sound(false, speaker_index);
		}
		
		dialogue_set_portraits();
	}
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

function dialogue_play_first_sound(on_left, speaker_index)
{
	if(global.game_state == DIALOGUE)
	{
		if(on_left)
		{
			if(dialogue_l_has_spoken[speaker_index] == false)
			{
				play_sfx(dialogue_current_left.speak_audio);
				dialogue_l_has_spoken[speaker_index] = true;
			}
		}
		else
		{
			if(dialogue_r_has_spoken[speaker_index] == false)
			{
				play_sfx(dialogue_current_right.speak_audio);
				dialogue_r_has_spoken[speaker_index] = true;
			}
		}
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
					dialogue_update_portraits();
					set_textbox_properties(box, DIALOGUE_STANDARD);
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
	with(obj_game)
	{
		dialogue_destroy();
		
		if(global.game_state == DIALOGUE)
		{			
			level_completed[global.current_level] = true;
			
			if (global.current_level == LEVEL_0_BEDROOM ||
				global.current_level == LEVEL_3_CAFE	|| 
				global.current_level == LEVEL_6_BEDROOM)
			{
				global.current_level += 1;
				set_game_state(OVERWORLD);
			}			
			else 
			{
				global.current_level += 1;
				set_game_state_and_start(BULLET_HELL);
			}
		}
		else
		{
			set_game_state(OVERWORLD);
		}
	}
}

function dialogue_destroy()
{
	instance_destroy(obj_dialogue_parent);
	
	with(obj_game)
	{
		instance_destroy(dialogue_button);
	
		dialogue_active = false;
	}
}

function show_options()
{
	with(obj_game)
	{	
		if(dialogue_multi_opt)
		{
			options		= dialogue_selection_options[conversation_index];
			descriptions= dialogue_selection_descriptions[conversation_index];	
			jumps		= dialogue_selection_jumps[conversation_index];
			choices		= dialogue_selection_choices[conversation_index];
		}
		else
		{
			options		= dialogue_selection_options;
			descriptions= dialogue_selection_descriptions;
			jumps		= dialogue_selection_jumps;
			choices		= dialogue_selection_choices;
		}
		
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
			box.box_tint	 = current_selection.color;
			box.current_name = "";
		
			option_button = instance_create_layer(0, 0, "Dialogue", obj_selection_dia);
			
			option_button.text				= options[i];
			option_button.description		= descriptions[i];
			option_button.jump_index		= jumps[i];
			option_button.choice_index		= choices[i];
		
			
			box_left_guix = get_guix(box.x);
			box_top_guiy  = get_guiy(box.y);
			
			if(num_options == 3)
			{
				spacing = 0.4;
			}
			else if(num_options == 2)
			{
				spacing = 0.6
			}
			
			option_button.x = box_left_guix + ((box.box_width*spacing) * (i+1));
			option_button.y = box_top_guiy  + (box.box_height * DIALOGUE_SELECT_BTN_Y_OFFSET_PERCENT);
		
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

function pause_dialogue()
{
	if(global.prev_state == DIALOGUE || global.prev_state == ENVIRONMENTAL)
	{
		with(obj_game)
		{
			if(dialogue_active)
			{
				dia_btn_enabled_state = dialogue_button.enabled;
			
				dialogue_button.enabled = false;
			
				if(dialogue_selection_visible)
				{
					for(i = 0; i < array_length(dialogue_selection_buttons); i++)
					{
						dialogue_selection_buttons[i].enabled = false;
					}
				}
			}
		}
	}
}

function resume_dialogue()
{
	if(global.game_state == DIALOGUE || global.game_state == ENVIRONMENTAL)
	{
		with(obj_game)
		{
			dialogue_button.enabled = dia_btn_enabled_state;
			
			if(dialogue_selection_visible)
			{
				for(i = 0; i < array_length(dialogue_selection_buttons); i++)
				{
					dialogue_selection_buttons[i].enabled = true;
				}
			}
		}
	}
}