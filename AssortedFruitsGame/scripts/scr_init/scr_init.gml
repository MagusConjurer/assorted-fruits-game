// Runs immediately when the game is started.

// Enable to randomize the seed that is used each time the game is run
// to allow for more unique experiences where randomness is being used.
randomize();

global.debugging = true;

global.delta_factor = 1;

// Settings Variables
global.resolution_w = 1920;
global.resolution_h = 1080;
global.resize_enabled = false;
global.fullscreen_enabled = true;
global.music_enabled = true;
global.music_volume = 0.5;
global.sfx_enabled = true;
global.sfx_volume = 0.5;

if(global.debugging == true) 
{
	//show_debug_overlay(true);
	global.music_enabled = false;
	global.fullscreen_enabled = false;
}

window_set_fullscreen(global.fullscreen_enabled);

// Audio Variables
global.current_bg_track = 0;


// Hotkeys/Controls
global.hotkey_ability_one = vk_shift;
global.hotkey_attack = vk_space;
global.hotkey_interact = ord("E");
global.hotkey_menu = vk_escape;
global.hotkey_menu_interact = vk_space;

global.gamepad_id = -1;
global.gamepad_type = 0;

global.conversations = [];

// Resettable global variables.
global.current_level = LEVEL_0_BEDROOM;
global.current_room = ROOM_MENU;
global.room_before_main = ROOM_BEDROOM;
global.game_state = MENU;
global.prev_state = OVERWORLD;

global.bh_ability_one = 0;


// Catch rogue error as per https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Debugging/exception_unhandled_handler.htm

exception_unhandled_handler(function(_exception)
{
	// Print some messages to the output log
    show_debug_message( "--------------------------------------------------------------");
    show_debug_message( "Unhandled exception " + string(_exception) );
    show_debug_message( "--------------------------------------------------------------");

    // Write the exception struct to a file
    if file_exists("crash.txt") file_delete("crash.txt");
    var _f = file_text_open_write("crash.txt");
    file_text_write_string(_f, string(_exception));
    file_text_close(_f);

    // Show the error message (for debug purposes only)
    show_message(_exception.longMessage);

    return 0;
});
