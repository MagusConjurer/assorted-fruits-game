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
		// Could also add a button press to check for
		if(keyboard_check_released(vk_space))
		{
			show_debug_message("Pressed space");
			if(conversation_index < array_length(conversation))
			{
				for(i = 0; i < array_length(conversation_boxes); i++)
				{
					if(instance_exists(conversation_boxes[i]))
					{
						box = conversation_boxes[i];
						box.y -= box.sprite_height + TEXTBOX_MARGIN;
					}
				}
				
				color_decision = conversation_index mod 2;
				
				if(color_decision == 0)
				{
					box_tint = c_aqua;
				}
				else
				{
					box_tint = c_fuchsia;
				}
				
				draw_textbox(conversation[conversation_index], box_tint);
			}

		}
	}
}

function dialogue_start()
{
	instance_create_layer(0,0,"Dialogue",obj_player_dia);
	instance_create_layer(0,0,"Dialogue",obj_other_dia);
	
	load_conversation(dialogue_level);
	draw_textbox(conversation[0], c_aqua);
}

function draw_textbox(text, color)
{
	textbox_inst = instance_create_layer(0,0,"Dialogue",obj_textbox_dia);
	textbox_inst.box_tint = color;
	textbox_inst.current_text = text;
	
	conversation_boxes[conversation_index] = textbox_inst;
	conversation_index++;
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