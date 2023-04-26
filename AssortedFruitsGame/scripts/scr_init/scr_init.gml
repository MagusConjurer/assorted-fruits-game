// Runs immediately when the game is started.

// Enable to randomize the seed that is used each time the game is run
// to allow for more unique experiences where randomness is being used.
randomize();

global.debugging = true;

global.delta_factor = 1;

// Settings Variables
global.resolution_w			= RES_X;
global.resolution_h			= RES_Y;
global.resize_enabled		= false;
global.fullscreen_enabled	= FULLSCREEN;
global.music_enabled		= MUSIC_ENABLED;
global.music_volume			= MUSIC_VOLUME;
global.sfx_enabled			= SFX_ENABLED;
global.sfx_volume			= SFX_VOLUME;

if(global.debugging == true) 
{
	global.music_enabled = false;
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
global.current_level	= DEFAULT_LEVEL;
global.current_room		= DEFAULT_ROOM;
global.game_state		= DEFAULT_STATE;
global.prev_state		= DEFAULT_PREV;

global.bh_ability_one	= DEFAULT_ABILITY_ONE;



