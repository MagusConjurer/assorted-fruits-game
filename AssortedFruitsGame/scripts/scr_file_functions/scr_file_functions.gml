
function load_data()
{
	if( !directory_exists(working_directory + "Data\\"))
	{
		show_debug_message("Directory not found, now creating.");
	    directory_create("Data");
	}

	ini_open("Data\settings.ini");
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
	
	ini_open("Data\progress.ini");
	if(ini_read_real("Global Data","current_level",0) == 0)
	{
		show_debug_message(["CREATE", working_directory + "Data\progress.ini"]);
		create_progress_file();
	}
	else
	{
		show_debug_message(["LOAD", working_directory + "Data\progress.ini"]);
		load_progress_file();
	}
	ini_close();
}

#region Settings File
function create_settings_file()
{
	ini_write_real("Graphics","resolution_w",		RES_X);
	ini_write_real("Graphics","resolution_h",		RES_Y);
	ini_write_real("Graphics","fullscreen_enabled",	FULLSCREEN);
	ini_write_real("Audio","music_enabled",			MUSIC_ENABLED);
	ini_write_real("Audio","music_volume",			MUSIC_VOLUME);
	ini_write_real("Audio","sfx_enabled",			SFX_ENABLED);
	ini_write_real("Audio","sfx_volume",			SFX_VOLUME);
}

function load_settings()
{
	global.resolution_w			= ini_read_real("Graphics","resolution_w",		global.resolution_w);
	global.resolution_h			= ini_read_real("Graphics","resolution_h",		global.resolution_h);
	global.fullscreen_enabled	= ini_read_real("Graphics","fullscreen_enabled",global.fullscreen_enabled);
	global.music_enabled		= ini_read_real("Audio","music_enabled",		global.music_enabled);
	global.music_volume			= ini_read_real("Audio","music_volume",			global.music_volume);
	global.sfx_enabled			= ini_read_real("Audio","sfx_enabled",			global.sfx_enabled);
	global.sfx_volume			= ini_read_real("Audio","sfx_volume",			global.sfx_volume);
}

function update_settings_file()
{
	// TODO: Add a way to only update what has changed
	
	ini_open("Data\settings.ini");
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
	ini_write_real("Global Data","current_level",	DEFAULT_LEVEL);
	ini_write_real("Global Data","current_room",	DEFAULT_ROOM);
	ini_write_real("Global Data","bh_ability_one",	DEFAULT_ABILITY_ONE);
	ini_write_real("Global Data","game_state",		DEFAULT_STATE);
	ini_write_real("Global Data","prev_state",		DEFAULT_PREV);
	with(obj_game)
	{
		ini_write_real("Game Data","player_x",			0);
		ini_write_real("Game Data","player_y",			0);
		ini_write_real("Game Data","state_before_main", DEFAULT_BEFORE_MAIN);
		ini_write_real("Game Data","level_completed_0", 0);
		ini_write_real("Game Data","level_completed_1", 0);
		ini_write_real("Game Data","level_completed_2", 0);
		ini_write_real("Game Data","level_completed_3", 0);
		ini_write_real("Game Data","level_completed_4", 0);
		ini_write_real("Game Data","level_completed_5", 0);
		ini_write_real("Game Data","level_completed_6", 0);
		ini_write_real("Game Data","new_game_started" , 0);
		ini_write_real("Game Data","bus_choice",		DEFAULT_BUS_CHOICE);
		ini_write_real("Game Data","dinner_choice",		DEFAULT_DIN_CHOICE);
	}
}

function load_progress_file()
{
	global.current_level	= ini_read_real("Player Data","current_level",	global.current_level);
	global.current_room		= ini_read_real("Player Data","current_room",	global.current_room);
	global.game_state		= ini_read_real("Player Data","game_state",		global.game_state);
	global.prev_state		= ini_read_real("Player Data","prev_state",		global.prev_state);
	global.bh_ability_one	= ini_read_real("Player Data","bh_ability_one", global.bh_ability_one);
	with(obj_game)
	{
		ov_player_x			= ini_read_real("Game Data","player_x",			 0);
		ov_player_y			= ini_read_real("Game Data","player_y",			 0);
		state_before_main	= ini_read_real("Game Data","state_before_main", 0);
		level_completed[0]  = ini_read_real("Game Data","level_completed_0", 0);
		level_completed[1]  = ini_read_real("Game Data","level_completed_1", 0);
		level_completed[2]  = ini_read_real("Game Data","level_completed_2", 0);
		level_completed[3]  = ini_read_real("Game Data","level_completed_3", 0);
		level_completed[4]  = ini_read_real("Game Data","level_completed_4", 0);
		level_completed[5]  = ini_read_real("Game Data","level_completed_5", 0);
		level_completed[6]  = ini_read_real("Game Data","level_completed_6", 0);
		new_game_started    = ini_read_real("Game Data", "new_game_started", 0);
		bh_busstop_choice   = ini_read_real("Game Data","bus_choice",		 0);
		bh_dinner_choice    = ini_read_real("Game Data","dinner_choice",	 0);
	}
}

function update_progress_file()
{
	ini_open("Data\progress.ini");
		ini_write_real("Global Data","current_level",	global.current_level);
		ini_write_real("Global Data","current_room",	global.current_room);
		ini_write_real("Global Data","bh_ability_one",	global.bh_ability_one);
		ini_write_real("Global Data","game_state",		global.game_state);
		ini_write_real("Global Data","prev_state",		global.prev_state);
		with(obj_game)
		{
			ini_write_real("Game Data","player_x",			ov_player_x);
			ini_write_real("Game Data","player_y",			ov_player_y);
			ini_write_real("Game Data","state_before_main", state_before_main);
			ini_write_real("Game Data","level_completed_0", level_completed[0]);
			ini_write_real("Game Data","level_completed_1", level_completed[1]);
			ini_write_real("Game Data","level_completed_2", level_completed[2]);
			ini_write_real("Game Data","level_completed_3", level_completed[3]);
			ini_write_real("Game Data","level_completed_4", level_completed[4]);
			ini_write_real("Game Data","level_completed_5", level_completed[5]);
			ini_write_real("Game Data","level_completed_6", level_completed[6]);
			ini_write_real("Game Data","new_game_started" , new_game_started);
			ini_write_real("Game Data","bus_choice",		bh_busstop_choice);
			ini_write_real("Game Data","dinner_choice",		bh_dinner_choice);
		}
	ini_close();
}

function reset_progress_file()
{
	ini_open("Data\progress.ini");
		create_progress_file();
	ini_close();
}

#endregion