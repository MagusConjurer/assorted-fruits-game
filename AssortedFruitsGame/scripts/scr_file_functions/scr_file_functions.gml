
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