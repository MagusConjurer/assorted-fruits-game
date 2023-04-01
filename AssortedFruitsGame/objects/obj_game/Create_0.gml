/// @description 

// Audio
// audio_stop_all();
// audio_play_sound(BG_MUSIC, 10, true);

// Camera/Viewport -- based on https://gamemaker.io/en/tutorials/cameras-and-views
camera_x = 0;
camera_y = 0;
camera_width = global.resolution_w * 0.5; // change 0.5 to a zoom percentage?
camera_height = global.resolution_h * 0.5;

view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = camera_width; 
view_hport[0] = camera_height; 

view_camera[0] = camera_create_view(0,0,view_wport[0], view_hport[0], 0, obj_player_ov, -1,-1,view_wport[0],view_hport[0]);

displayX = (global.resolution_w * 0.5) - camera_width;
displayY = (global.resolution_h * 0.5) - camera_height;
window_set_rectangle(displayX,displayY, camera_width, camera_height);

// surface_resize(application_surface, camera_width, camera_height);

// Pause Menu
pause_menu_visible = false;
pause_menu_buttons = [];

// Bullet Hell
bh_active = false;
bh_progress_bar = 0;
bh_player = 0;
bh_player_health = 0;

bh_ability_index = 0;
bh_ability_cooldown = 1;

bh_bubbles_popped = 0;
num_active_bubbles = 0;
bh_prev_bubble_rand = 0;
bubble_height = sprite_get_height(spr_wordbubble_combined) * 0.2;
possible_bubble_spots = (camera_height - bubble_height) / BH_NUM_STARTING_BUBBLES;
bubble_popped_time = 0;

bh_time_spent = 0;
bh_vignette_levels = sprite_get_number(spr_bh_vignette) - 1;

// Dialogue
dialogue_active = false;
dialogue_selection_visible = false;
dialogue_level = 1;
dialogue_in_person = true;
conversation_index = 1; // starts at 1 since data is index 0
conversation = [];
conversation_boxes = [];
dialogue_button = 0;
dialogue_left = 0;
dialogue_right = 0;
dialogue_selection_options   = [];
dialogue_selection_jumps     = [];
dialogue_selection_buttons   = [];
dialogue_selection_abilities = [];


