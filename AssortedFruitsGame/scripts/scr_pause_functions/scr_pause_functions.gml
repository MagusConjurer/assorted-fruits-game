
/// Called by obj_game to handle the pause menu and paused functionality
function pause_menu_update(){
	
	if (global.game_state != PAUSED && pause_menu_visible == true)
	{
		pause_menu_destroy();
	}
	
	if (global.game_state != MENU && menu_toggle_pressed() && pause_menu_visible == false)
	{
		set_game_state(PAUSED);
	
		pause_menu_show();
	}
	
	if (global.game_state == PAUSED) 
	{
		// This will pause the timer so no obj_game alarms activate while paused
		obj_game.alarm[0]++; 
	}
	
	if(pause_menu_visible)
	{
		if(menu_selection_up())
		{
			pause_menu_buttons[pause_menu_selected].selected = false;
			if(pause_menu_selected > 0)
			{
				pause_menu_selected--;
			}
			else
			{
				pause_menu_selected = array_length(pause_menu_buttons) - 1;
			}
			pause_menu_buttons[pause_menu_selected].selected = true;
		}
		else if(menu_selection_down())
		{
			pause_menu_buttons[pause_menu_selected].selected = false;
			if(pause_menu_selected < array_length(pause_menu_buttons) - 1)
			{
				pause_menu_selected++;
			}
			else
			{
				pause_menu_selected = 0;
			}
			pause_menu_buttons[pause_menu_selected].selected = true;
		}
	}
}

function pause_menu_show()
{
	pause_menu_visible = true;
	pause_background_music();
	
	pm_x = global.resolution_w * 0.5;
	pm_y = global.resolution_h * 0.5;
	
	pause_menu_buttons[0] = instance_create_layer(pm_x, pm_y - 50, "Pause_Menu", obj_menu_button);
	pause_menu_buttons[1] = instance_create_layer(pm_x, pm_y, "Pause_Menu", obj_continue_button);
	pause_menu_buttons[2] = instance_create_layer(pm_x, pm_y + 50, "Pause_Menu", obj_quit_button);
	pause_menu_buttons[2].layer_to_check = "Pause_Menu"; // Needed due to using same button for two menus
	
	if(global.gamepad_id > -1)
	{
		pause_menu_selected = 0;
		pause_menu_buttons[pause_menu_selected].selected = true;
	}
}

function pause_menu_destroy()
{
	pause_menu_visible = false;
	resume_background_music();
	
	for(i = 0; i < array_length(pause_menu_buttons); i++)
	{
		instance_destroy(pause_menu_buttons[i]);
	}
}

// Pause Menu
function pause_menu_main()
{	
	set_game_state(MENU);

	with(obj_game)
	{
		viewport_setup = false;
	}
	
	room_goto(rm_menu);
}

function pause_menu_continue()
{
	return_to_prev_state(PAUSED);
}