// Main Menu
function main_menu_play()
{
	set_game_state(OVERWORLD);

	room_goto(global.current_level);
}

function main_menu_settings()
{
	layer_set_visible("Settings_Menu", true);
	layer_set_visible("Main_Menu", false);
}

function main_menu_return()
{
	layer_set_visible("Settings_Menu", false);
	layer_set_visible("Main_Menu", true);
}

function menu_quit()
{
	game_end();
}

// Settings
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


// Pause Menu
function pause_menu_main()
{
	set_game_state(MENU);

	room_goto(rm_menu);
}

function pause_menu_continue()
{
	return_to_prev_state(PAUSED);
}