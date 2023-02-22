/// @description

// Inherit the parent event
event_inherited();

global.game_state = global.prev_state;
global.prev_state = PAUSED;

