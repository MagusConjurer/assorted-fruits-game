
function load_data()
{
	show_debug_message("Checking for Data");
	if( !directory_exists(working_directory + "Data/"))
	{
		show_debug_message("Directory not found, now creating.");
	    directory_create("Data");
	}

	ini_open("Data/settings.ini");
	// Check if the settings file exists
	if(ini_read_real("Graphics","resolution_w",0) == 0)
	{
		create_settings_file();
	}
	else
	{
		load_settings();
	}
	ini_close();
	
	ini_open("Data/progress.ini");
	if(ini_read_string("Player Data","current_level","") == "")
	{
		create_progress_file();
	}
	else
	{
		load_progress_file();
	}
	ini_close();
}

#region Settings File
function create_settings_file()
{
	ini_write_real("Graphics","resolution_w",global.resolution_w);
	ini_write_real("Graphics","resolution_h",global.resolution_h);
	ini_write_real("Graphics","fullscreen_enabled",global.fullscreen_enabled);
	ini_write_real("Audio","music_enabled",global.music_enabled);
	ini_write_real("Audio","music_volume",global.music_volume);
	ini_write_real("Audio","sfx_enabled",global.sfx_enabled);
	ini_write_real("Audio","sfx_volume",global.sfx_volume);
}

function load_settings()
{
	global.resolution_w			= ini_read_real("Graphics","resolution_w",global.resolution_w);
	global.resolution_h			= ini_read_real("Graphics","resolution_h",global.resolution_h);
	global.fullscreen_enabled	= ini_read_real("Graphics","fullscreen_enabled",global.fullscreen_enabled);
	global.music_enabled		= ini_read_real("Audio","music_enabled",global.music_enabled);
	global.music_volume			= ini_read_real("Audio","music_volume",global.music_volume);
	global.sfx_enabled			= ini_read_real("Audio","sfx_enabled",global.sfx_enabled);
	global.sfx_volume			= ini_read_real("Audio","sfx_volume",global.sfx_volume);
}

function update_settings_file()
{
	// TODO: Add a way to only update what has changed
	
	ini_open("Data/settings.ini");
	ini_write_real("Graphics","resolution_w",global.resolution_w);
	ini_write_real("Graphics","resolution_h",global.resolution_h);
	ini_write_real("Graphics","fullscreen_enabled",global.fullscreen_enabled);
	ini_write_real("Audio","music_enabled",global.music_enabled);
	ini_write_real("Audio","music_volume",global.music_volume);
	ini_write_real("Audio","sfx_enabled",global.sfx_enabled);
	ini_write_real("Audio","sfx_volume",global.sfx_volume);
	ini_close();
}
#endregion

#region Progress File

function create_progress_file()
{
	ini_write_real("Global Data","current_level", global.current_level);
	ini_write_real("Global Data","current_room", global.current_room);
	ini_write_real("Global Data","bh_ability_one", global.bh_ability_one);
	ini_write_real("Global Data","game_state", global.game_state);
	ini_write_real("Global Data","prev_state", global.prev_state);
	with(obj_game)
	{
		ini_write_real("Game Data","player_x", ov_player_x);
		ini_write_real("Game Data","player_y", ov_player_y);
		ini_write_real("Game Data","state_before_main", state_before_main);
	}
}

function load_progress_file()
{
	global.current_level	= ini_read_real("Player Data","current_level", global.current_level);
	global.current_room		= ini_read_real("Player Data","current_room", global.current_room);
	global.game_state		= ini_read_real("Player Data","game_state", global.game_state);
	global.prev_state		= ini_read_real("Player Data","prev_state", global.prev_state);
	global.bh_ability_one	= ini_read_real("Player Data","bh_ability_one", global.bh_ability_one);
	with(obj_game)
	{
		ov_player_x			= ini_read_real("Game Data","player_x", ov_player_x);
		ov_player_y			= ini_read_real("Game Data","player_y", ov_player_y);
		state_before_main	= ini_read_real("Game Data","state_before_main", state_before_main);
	}
}

function update_progress_file()
{
	ini_open("Data/progress.ini");
	ini_write_real("Global Data","current_level", global.current_level);
	ini_write_real("Global Data","current_room", global.current_room);
	ini_write_real("Global Data","bh_ability_one", global.bh_ability_one);
	ini_write_real("Global Data","game_state", global.game_state);
	ini_write_real("Global Data","prev_state", global.prev_state);
	with(obj_game)
	{
		ini_write_real("Game Data","player_x", ov_player_x);
		ini_write_real("Game Data","player_y", ov_player_y);
		ini_write_real("Game Data","state_before_main", state_before_main);
	}
	ini_close();
}

#endregion