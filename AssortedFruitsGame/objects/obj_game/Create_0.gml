/// @description 

// Audio
// audio_stop_all();
// audio_play_sound(BG_MUSIC, 10, true);


// Battles Completed
level_2_complete = false;
level_5_complete = false;

// Controller
time_since_menu_input = 0;
menu_input_active = false;

// Camera
camera = 0;
camera_target = 0;
camera_x = 0;
camera_y = 0;
camera_width = 0; 
camera_height = 0;
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
bh_dia_seq = 0;
bh_dia_paused = false;
bh_dia_seq_created = false;
bh_dia_text = [];
bh_player = 0;
bh_player_health = 0;

bh_ability_index = 0;
bh_ability_cooldown = 1;

bh_bubble_max = 0;
bh_bubble_start = 0;
bh_bubble_start_health = 0;
bh_bubbles_per_spawn = 0;
bh_bubble_projectiles = 0;
bh_bubble_projectiles_scale = 0;
bh_bubble_pop_time = 0;
bh_bubble_move_speed = 0;

bh_bubbles_popped = 0;
num_active_bubbles = 0;
bh_prev_bubble_rand = 0;
bubble_height = 0;
possible_bubble_spots = 0;

bh_boost_available = false;
bh_busstop_choice = BH_NO_RESPONSE;
bh_dinner_choice = BH_BATTLE_MOM;

bh_progress_bar = 0;
bh_next_checkpoint = 0;
bh_checkpoint_size = 0;
bh_checkpoint_status = [];
bh_time_spent = 0;
bh_vignette_levels = sprite_get_number(spr_bh_vignette) - 1;

// Dialogue
dialogue_active = false;
dialogue_selection_visible = false;
dialogue_in_person = true;
dialogue_phone = 0;
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
dialogue_selection_choices   = [];


