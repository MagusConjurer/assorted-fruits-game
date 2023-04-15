
// #macro BG_MUSIC snd_bg_music_default

#macro DELTA global.delta_factor

#macro BUTTON_DEFAULT 0
#macro BUTTON_PRESSED 1
#macro BUTTON_HOVER 2
#macro BUTTON_DISABLED 3

#macro RESOLUTION_W 1920
#macro RESOLUTION_H 1080

#macro PERCENT_TO_DARKEN 0.8

// COLORS
#macro C_ALEX $014462
#macro C_STELLA c_purple

// GAME STATES
#macro OVERWORLD 0
#macro BULLET_HELL 1
#macro DIALOGUE 2
#macro PAUSED 3
#macro MENU 4

// Depths
#macro DARKENING_DEPTH -995
#macro BH_DEPTH DARKENING_DEPTH-1
#macro DIA_DEPTH BH_DEPTH
#macro PAUSED_DEPTH DIA_DEPTH - 1

// Controller
#macro PLAYSTATION 0
#macro XBOX 1
#macro AXIS_DEADZONE 0.2
#macro TRIGGER_DEADZONE 0.1
#macro MENU_INPUT_DELAY 0.25

// SETTINGS
#macro SETTINGS_BG_COLOR $5A9C6D // color in hex
#macro SETTINGS_FONT_COLOR c_black