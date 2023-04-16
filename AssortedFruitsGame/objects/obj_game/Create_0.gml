/// @description 

// Audio
// audio_stop_all();
// audio_play_sound(BG_MUSIC, 10, true);

// Controller
time_since_menu_input = 0;
menu_input_active = false;

// Camera
camera_x = 0;
camera_y = 0;
camera_width = 0; 
camera_height = 0;
displayX = 0;
displayY = 0;
viewport_setup = false;

// surface_resize(application_surface, camera_width, camera_height);

// Menus
main_menu_visible = false
pause_menu_visible = false;
settings_menu_visible = false;
menu_buttons = [];
menu_selected = 0;
settings_buttons = [];
settings_visuals = [];
settings_selected = 0;

// Bullet Hell
bh_active = false;
bh_progress_bar = 0;
bh_dia_seq = 0;
bh_dia_paused = false;
bh_player = 0;
bh_player_health = 0;

bh_ability_index = 0;
bh_ability_cooldown = 1;

bh_bubbles_popped = 0;
num_active_bubbles = 0;
bh_prev_bubble_rand = 0;
bubble_height = 0;
possible_bubble_spots = 0;

bh_boost_available = false;

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
dia_btn_enabled_state = true; // used when pausing
dialogue_left = 0;
dialogue_right = 0;
dialogue_selection = 0;
dialogue_selection_options   = [];
dialogue_selection_jumps     = [];
dialogue_selection_buttons   = [];
dialogue_selection_abilities = [];


