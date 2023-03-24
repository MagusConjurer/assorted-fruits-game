// Runs immediately when the game is started.

// Enable to randomize the seed that is used each time the game is run
// to allow for more unique experiences where randomness is being used.
randomize();

global.debugging = false;

// Settings Variables
global.resolution_w = 1920;
global.resolution_h = 1080;
global.resize_enabled = false;
global.fullscreen_enabled = true;
global.music_enabled = true;
global.music_volume = 0.5;
global.sfx_enabled = true;
global.sfx_volume = 0.3;

window_set_fullscreen(global.fullscreen_enabled);

// Audio Variables
global.current_bg_track = 0;

// Initialize global variables.
global.current_level = rm_level_one;
global.game_state = MENU;
global.prev_state = OVERWORLD;

global.bh_ability_one = 0;

global.conversations = [];



