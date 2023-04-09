/// @description 

// Added based on https://gamemaker.io/en/tutorials/coffee-break-tutorials-setting-up-and-using-gamepads-gml
if(global.debugging)
{
	show_debug_message("Event = " + async_load[? "event_type"]);
	show_debug_message("Pad   = " + string(async_load[? "pad_index"])); 
}

if(window_has_focus())
{
	switch(async_load[? "event_type"])
	{
		case "gamepad discovered": // gamepad plugged in (probably need to move into obj_game as async-system event
			var pad = async_load[? "pad_index"];
			if(global.gamepad_id == -1)
			{
				window_set_cursor(cr_none);
				
				global.gamepad_id = pad;
				set_controller_type();
			}
		break;
		case "gamepad lost": // gamepad removed
			var pad = async_load[? "pad_index"];
			if(global.gamepad_id == pad)
			{
				window_set_cursor(cr_default);				
				
				global.gamepad_id = -1;
			}
		break;
	}
}