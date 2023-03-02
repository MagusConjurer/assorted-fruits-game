// Runs immediately when the game is started.

// Enable to randomize the seed that is used each time the game is run
// to allow for more unique experiences where randomness is being used.
randomize();

// Settings Variables
global.resolution_w = 1920;
global.resolution_h = 1080;
global.fullscreen_enabled = false;
global.music_enabled = false;
global.sfx_enabled = false;

// Initialize global variables.
global.current_level = rm_level_one;
global.game_state = MENU;
global.prev_state = OVERWORLD;




