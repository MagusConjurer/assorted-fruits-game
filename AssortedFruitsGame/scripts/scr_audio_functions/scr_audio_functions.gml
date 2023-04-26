function set_music_percentage(value)
{
	global.music_volume = value;
}

function set_sfx_percentage(value)
{
	global.sfx_volume = value;
}


function play_background_music(track_name)
{
	if(global.current_bg_track != track_name)
	{
		audio_stop_sound(global.current_bg_track);
		
		global.current_bg_track = track_name;
		if(global.music_enabled)
		{
			// Stores the index of the specific track
			global.current_bg_track = audio_play_sound(global.current_bg_track, 10, true, global.music_volume);
		}
	}
}

function pause_background_music()
{
	if(global.music_enabled)
	{
		audio_pause_sound(global.current_bg_track);
	}
}

function resume_background_music()
{
	if(global.music_enabled)
	{
		audio_resume_sound(global.current_bg_track);
	}
}

function play_sfx(sound_name)
{
	if(global.sfx_enabled)
	{
		audio_play_sound(sound_name, 9, false, global.sfx_volume);
	}
}