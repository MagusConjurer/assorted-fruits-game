
#macro DELTA global.delta_factor

#region CAMERA

#macro CAMERA_SPEED 0.1

#endregion

#region MENUS

#macro MAIN_MENU_BACKGROUND spr_title_screen_DRAFT 

#endregion


#region LEVELS & ROOMS
#macro ROOM_MENU	rm_menu
#macro ROOM_BEDROOM rm_bedroom
#macro ROOM_OUTSIDE rm_bus_stop
#macro ROOM_CAFE	rm_cafe
// #macro ROOM_DINNER dinner

#macro LEVEL_0_BEDROOM		 0 
#macro LEVEL_1_BUS_STOP		 1 
#macro LEVEL_2_BUS_BATTLE	 2 
#macro LEVEL_3_CAFE			 3 
#macro LEVEL_4_DINNER		 4
#macro LEVEL_5_DINNER_BATTLE 5
#macro LEVEL_6_BEDROOM		 6
#endregion

#macro BUTTON_DEFAULT 0
#macro BUTTON_PRESSED 1
#macro BUTTON_HOVER 2
#macro BUTTON_DISABLED 3

#macro RESOLUTION_W 1920
#macro RESOLUTION_H 1080

#macro PERCENT_TO_DARKEN 0.8

// COLORS
#macro C_BUTTON_TEXT c_black
#macro C_ALEX	c_yellow
#macro C_STELLA make_color_rgb(241, 178, 255)
#macro C_MOM c_fuchsia
#macro C_DAD c_blue
#macro C_UNCLE c_green

// GAME STATES
#macro OVERWORLD 0
#macro BULLET_HELL 1
#macro DIALOGUE 2
#macro PAUSED 3
#macro MENU 4

// Depths
#macro DARKENING_DEPTH -990
#macro BH_DEPTH DARKENING_DEPTH - 1
#macro DIA_DEPTH BH_DEPTH - 1
#macro PAUSED_DEPTH DIA_DEPTH - 1

// Controller
#macro PLAYSTATION 0
#macro XBOX 1
#macro AXIS_DEADZONE 0.2
#macro TRIGGER_DEADZONE 0.1
#macro MENU_INPUT_DELAY 0.25