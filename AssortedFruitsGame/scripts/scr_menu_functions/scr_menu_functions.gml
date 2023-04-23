
function menu_update(){
	
	if (global.game_state != MENU && menu_toggle_pressed() && pause_menu_visible == false)
	{
		set_game_state(PAUSED);
	
		pause_menu_show();
	}
	
	if (global.game_state == MENU && main_menu_visible == false && settings_menu_visible == false)
	{
		with(obj_game)
		{
			// Reset all timers to 0
			alarm[0] = -1; 
			alarm[1] = -1; 
			alarm[2] = -1;
		}
		
		main_menu_show();
	}
	

	
	with(obj_game)
	{
		if (global.game_state == PAUSED) 
		{
			// This will basically pause the timer at it's current state so no obj_game alarms activate while paused
			alarm[0]++; 
			alarm[1]++; 
			alarm[2]++; 
		} 
		
		// Check for moving up or down on the menu
		if(menu_selection_up())
		{
			if(main_menu_visible)
			{
				main_menu_up();
			}
			else if(pause_menu_visible)
			{
				pause_menu_up();
			}
			else if(settings_menu_visible)
			{
				settings_menu_up();
			}
		}
		else if(menu_selection_down())
		{
			if(main_menu_visible)
			{
				main_menu_down();
			}
			else if(pause_menu_visible)
			{
				pause_menu_down();
			}
			else if(settings_menu_visible)
			{
				settings_menu_down();
			}
		}
	}
}

#region Main Menu
function main_menu_show()
{
	with(obj_game)
	{
		if(room == ROOM_MENU)
		{
			main_menu_visible = true;
			pause_background_music();
			
			_layer = layer_get_id("Background");
			_bg_id = layer_background_get_id(_layer);
			if(layer_background_get_sprite(_bg_id) != MAIN_MENU_BACKGROUND)
			{
				layer_background_sprite(_bg_id, MAIN_MENU_BACKGROUND);
			}
	
			mm_x = global.resolution_w * 0.5;
			mm_y = global.resolution_h * 0.5;
	
			main_menu_buttons[0] = instance_create_layer(mm_x, mm_y - 50, "Main_Menu", obj_new_button);
			main_menu_buttons[1] = instance_create_layer(mm_x, mm_y, "Main_Menu", obj_play_button);
			main_menu_buttons[2] = instance_create_layer(mm_x, mm_y + 50, "Main_Menu", obj_settings_button);
			main_menu_buttons[3] = instance_create_layer(mm_x, mm_y + 100, "Main_Menu", obj_main_quit_button);
			main_menu_buttons[3].layer_to_check = "Main_Menu"; // Needed due to using same button for two menus
	
			if(global.gamepad_id > -1)
			{
				main_menu_selected = 0;
				main_menu_buttons[main_menu_selected].selected = true;
			}
		}
	}
}

function main_menu_destroy()
{
	with(obj_game)
	{
		main_menu_visible = false ;
		settings_menu_visible = false;
		
		for(i = 0; i < array_length(main_menu_buttons); i++)
		{
			instance_destroy(main_menu_buttons[i]);
		}
	}
}

function main_menu_new()
{	
	reset_player_progress();
	
	main_menu_play();
}

function main_menu_continue()
{
	with(obj_game)
	{
		main_continue_pressed = true;
	}
	
	main_menu_play();
}

function main_menu_play()
{
	set_game_state(OVERWORLD);
	main_menu_destroy();
	play_background_music(BG_music);
	
	room_transition(global.current_level);
}

function main_menu_settings()
{
	with(obj_game)
	{
		main_menu_visible = false;
		
		for(i = 0; i < array_length(main_menu_buttons); i++)
		{
			main_menu_buttons[i].visible = false;
		}
		
		settings_menu_show();
	}
}

function main_menu_return()
{
	with(obj_game)
	{
		main_menu_visible = true;
		
		for(i = 0; i < array_length(main_menu_buttons); i++)
		{
			main_menu_buttons[i].visible = true;
		}
		
		settings_menu_destroy();
	}
}

function menu_quit()
{
	game_end();
}

function main_menu_up()
{
	main_menu_buttons[main_menu_selected].selected = false;
	if(main_menu_selected > 0)
	{
		main_menu_selected--;
	}
	else
	{
		main_menu_selected = array_length(main_menu_buttons) - 1;
	}
	main_menu_buttons[main_menu_selected].selected = true;
}

function main_menu_down()
{
	main_menu_buttons[main_menu_selected].selected = false;
	if(main_menu_selected < array_length(main_menu_buttons) - 1)
	{
		main_menu_selected++;
	}
	else
	{
		main_menu_selected = 0;
	}
	main_menu_buttons[main_menu_selected].selected = true;
}
#endregion

#region Pause Menu
function pause_menu_show()
{
	with(obj_game)
	{
		pause_menu_visible = true;
		pause_dialogue();
		pause_background_music();
	
		pm_x = global.resolution_w * 0.5;
		pm_y = global.resolution_h * 0.5;
	
		instance_create_layer(camera_x + (pm_x / 2), camera_y + (pm_y / 2), "Pause_Menu", obj_pause_background);
		pause_menu_buttons[0] = instance_create_layer(pm_x, pm_y - 175, "Pause_Menu", obj_continue_button);
		pause_menu_buttons[1] = instance_create_layer(pm_x, pm_y + 25, "Pause_Menu", obj_menu_button);
		pause_menu_buttons[2] = instance_create_layer(pm_x, pm_y + 225, "Pause_Menu", obj_pause_quit_button);
		pause_menu_buttons[2].layer_to_check = "Pause_Menu"; // Needed due to using same button for two menus
	
		if(global.gamepad_id > -1)
		{
			pause_menu_selected = 0;
			pause_menu_buttons[pause_menu_selected].selected = true;
		}
	}
}

function pause_menu_destroy()
{
	with(obj_game)
	{
		pause_menu_visible = false;
		resume_background_music();
	
		for(i = 0; i < array_length(pause_menu_buttons); i++)
		{
			instance_destroy(pause_menu_buttons[i]);
		}
		
		instance_destroy(obj_pause_background);
	}
}

function pause_menu_main()
{	
	pause_menu_destroy();

	with(obj_game)
	{	
		state_before_main = global.prev_state;
		ov_player_x = obj_player_ov.x;
		ov_player_y = obj_player_ov.y;
		
		// Makes sure that it is able to reinitialize if they exit during these	
		if(state_before_main == DIALOGUE)
		{
			dialogue_destroy();
		}
		else if(state_before_main == BULLET_HELL)
		{
			bh_cleanup();
		}
	}
	
	set_game_state(MENU);	
	room_transition(LEVEL_X_MENU);
}

function pause_menu_continue()
{
	pause_menu_destroy();
	return_to_prev_state(PAUSED);
	
	resume_dialogue();
}

function pause_menu_up()
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

function pause_menu_down()
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

#endregion

#region Settings
function settings_menu_show()
{
	settings_menu_visible = true;
	//background
	sbg_x = global.resolution_w * 0.5;
	sbg_y = global.resolution_h * 0.5;
	
	ui_padding = 50;
	
	settings_visuals[0] = instance_create_layer(sbg_x,sbg_y,"Settings_Menu",obj_settings_background);
	
	setting_x = sbg_x - obj_settings_background.sprite_width * 0.5;
	setting_y = sbg_y - obj_settings_background.sprite_height * 0.5;
	
	//checkbox
	settings_buttons[0] = instance_create_layer(setting_x + ui_padding, setting_y + ui_padding, "Settings_Menu", obj_cb_fullscreen);
	//checkbox
	settings_buttons[1] = instance_create_layer(setting_x + ui_padding, setting_y + ui_padding * 2, "Settings_Menu", obj_cb_music);
	//slider
	settings_buttons[2] = instance_create_layer(setting_x + ui_padding, setting_y + ui_padding * 3, "Settings_Menu", obj_slider_music);
	//checkbox
	settings_buttons[3] = instance_create_layer(setting_x + ui_padding, setting_y + ui_padding * 4, "Settings_Menu", obj_cb_sfx);
	//slider
	settings_buttons[4] = instance_create_layer(setting_x + ui_padding, setting_y + ui_padding * 5, "Settings_Menu", obj_slider_sfx);
	//return button
	settings_buttons[5] = instance_create_layer(sbg_x, setting_y + ui_padding * 6, "Settings_Menu", obj_return_button);
	
	if(global.gamepad_id > -1)
	{
		settings_selected = 0;
		settings_buttons[settings_selected].selected = true;
	}
}

function settings_menu_destroy()
{
	with(obj_game)
	{
		settings_menu_visible = false;
		
		for(i = 0; i < array_length(settings_buttons); i++)
		{
			instance_destroy(settings_buttons[i]);
		}
		
		for(j = 0; j < array_length(settings_visuals); j++)
		{
			instance_destroy(settings_visuals[j]);
		}
	}
}

function settings_cb_fullscreen()
{
	global.fullscreen_enabled = !global.fullscreen_enabled;
	window_set_fullscreen(global.fullscreen_enabled);
}

function settings_cb_music()
{
	global.music_enabled = !global.music_enabled;
}

function settings_cb_sfx()
{
	global.sfx_enabled = !global.sfx_enabled;
}

function settings_update_resolution(value)
{
	switch(value)
	{
		case "3840x2160":
			global.resolution_w = 3840;
			global.resolution_h = 2160;
			break;
		case "1920x1080":
			global.resolution_w = 1920;
			global.resolution_h = 1080;
			break;
		case "1366x768":
			global.resolution_w = 1366;
			global.resolution_h = 768;
			break;
		case "1280x1024":
			global.resolution_w = 1280;
			global.resolution_h = 1024;
			break;
	}
}

function settings_menu_up()
{
	settings_buttons[settings_selected].selected = false;
	if(settings_selected > 0)
	{
		settings_selected--;
	}
	else
	{
		settings_selected = array_length(settings_buttons) - 1;
	}
	settings_buttons[settings_selected].selected = true;
}

function settings_menu_down()
{
	settings_buttons[settings_selected].selected = false;
	if(settings_selected < array_length(settings_buttons) - 1)
	{
		settings_selected++;
	}
	else
	{
		settings_selected = 0;
	}
	settings_buttons[settings_selected].selected = true;
}
#endregion