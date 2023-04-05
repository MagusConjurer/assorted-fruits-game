// Main Menu
function main_menu_play()
{
	set_game_state(OVERWORLD);
	play_background_music(BG_music);

	room_transition(global.current_level);
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