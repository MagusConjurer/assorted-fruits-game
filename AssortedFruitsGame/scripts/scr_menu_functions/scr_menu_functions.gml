
function menu_update(){
	
	if (global.game_state != MENU && menu_toggle_pressed() && pause_menu_visible == false)
	{
		set_game_state(PAUSED);
	
		pause_menu_show();
	}
	
	if (global.game_state == MENU && main_menu_visible == false && settings_menu_visible == false)
	{
		main_menu_show();
	}
	
	if (global.game_state == PAUSED || global.game_state == MENU) 
	{
		// This will pause the timer so no obj_game alarms activate while paused
		obj_game.alarm[0]++; 
	}
	
	if(pause_menu_visible || main_menu_visible)
	{
		if(menu_selection_up())
		{
			menu_buttons[menu_selected].selected = false;
			if(menu_selected > 0)
			{
				menu_selected--;
			}
			else
			{
				menu_selected = array_length(menu_buttons) - 1;
			}
			menu_buttons[menu_selected].selected = true;
		}
		else if(menu_selection_down())
		{
			menu_buttons[menu_selected].selected = false;
			if(menu_selected < array_length(menu_buttons) - 1)
			{
				menu_selected++;
			}
			else
			{
				menu_selected = 0;
			}
			menu_buttons[menu_selected].selected = true;
		}
	}
	else if(settings_menu_visible)
	{
		if(menu_selection_up())
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
		else if(menu_selection_down())
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
	}
}

#region Main Menu
function main_menu_show()
{
	main_menu_visible = true;
	pause_background_music();
	
	mm_x = global.resolution_w * 0.5;
	mm_y = global.resolution_h * 0.5;
	
	menu_buttons[0] = instance_create_layer(mm_x, mm_y - 50, "Main_Menu", obj_play_button);
	menu_buttons[1] = instance_create_layer(mm_x, mm_y, "Main_Menu", obj_settings_button);
	menu_buttons[2] = instance_create_layer(mm_x, mm_y + 50, "Main_Menu", obj_quit_button);
	menu_buttons[2].layer_to_check = "Main_Menu"; // Needed due to using same button for two menus
	
	if(global.gamepad_id > -1)
	{
		menu_selected = 0;
		menu_buttons[menu_selected].selected = true;
	}
}

function main_menu_destroy()
{
	with(obj_game)
	{
		main_menu_visible = false;
		
		for(i = 0; i < array_length(menu_buttons); i++)
		{
			instance_destroy(menu_buttons[i]);
		}
	}
}

function main_menu_play()
{
	main_menu_destroy();
	set_game_state(OVERWORLD);
	play_background_music(BG_music);

	room_transition(global.current_level);
}

function main_menu_settings()
{
	with(obj_game)
	{
		main_menu_visible = false;
		
		for(i = 0; i < array_length(menu_buttons); i++)
		{
			menu_buttons[i].visible = false;
		}
		
		settings_menu_show();
	}
}

function main_menu_return()
{
	with(obj_game)
	{
		main_menu_visible = true;
		
		for(i = 0; i < array_length(menu_buttons); i++)
		{
			menu_buttons[i].visible = true;
		}
		
		settings_menu_destroy();
	}
}

function menu_quit()
{
	game_end();
}
#endregion

#region Pause Menu
function pause_menu_show()
{
	pause_menu_visible = true;
	pause_dialogue();
	pause_background_music();
	
	pm_x = global.resolution_w * 0.5;
	pm_y = global.resolution_h * 0.5;
	
	menu_buttons[0] = instance_create_layer(pm_x, pm_y - 50, "Pause_Menu", obj_menu_button);
	menu_buttons[1] = instance_create_layer(pm_x, pm_y, "Pause_Menu", obj_continue_button);
	menu_buttons[2] = instance_create_layer(pm_x, pm_y + 50, "Pause_Menu", obj_quit_button);
	menu_buttons[2].layer_to_check = "Pause_Menu"; // Needed due to using same button for two menus
	
	if(global.gamepad_id > -1)
	{
		menu_selected = 0;
		menu_buttons[menu_selected].selected = true;
	}
}

function pause_menu_destroy()
{
	with(obj_game)
	{
		pause_menu_visible = false;
		resume_background_music();
	
		for(i = 0; i < array_length(menu_buttons); i++)
		{
			instance_destroy(menu_buttons[i]);
		}
	}
}

function pause_menu_main()
{	
	pause_menu_destroy();

	with(obj_game)
	{
		viewport_setup = false;
		
		// Makes sure that it is able to reinitialize if they exit during these
		dialogue_active = false;
		bh_active = false;
	}
	
	room_goto(rm_menu);
	set_game_state(MENU);
}

function pause_menu_continue()
{
	pause_menu_destroy();
	return_to_prev_state(PAUSED);
	
	resume_dialogue();
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
#endregion