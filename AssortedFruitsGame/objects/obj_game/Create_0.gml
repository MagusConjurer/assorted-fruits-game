/// @description 

// Audio
// audio_stop_all();
// audio_play_sound(BG_MUSIC, 10, true);

#region Controller
time_since_menu_input = 0;
menu_input_active = false;
#endregion

#region Player Progress

level_completed = [false, false, false, false, false, false, false];
new_game_started = false;
main_continue_pressed = false;
transition_event_hit  = false;
state_before_main     = 0;

// OV Player Position
ov_player_x = 0;
ov_player_y = 0;

#endregion

#region Camera
camera = 0;
camera_target = 0;
camera_x = 0;
camera_y = 0;
camera_width = 0; 
camera_height = 0;
viewport_setup = false;
#endregion

#region Menus
main_menu_visible = false;
main_menu_buttons = [];
main_menu_selected = 0;

pause_menu_visible = false;
pause_menu_buttons = [];
pause_menu_selected = 0;

settings_menu_visible = false;
settings_buttons = [];
settings_visuals = [];
settings_selected = 0;
#endregion

#region Bullet Hell
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
#endregion

#region Dialogue
dialogue_active = false;
dialogue_selection_visible = false;
dialogue_in_person = true;
dialogue_multi_opt = false;
dialogue_phone = 0;
conversation_index = 1; // starts at 1 since data is index 0
conversation = [];
current_conversation = 0;
conversation_boxes = [];
dialogue_button = 0;
dia_btn_enabled_state = true; // used when pausing
dialogue_current_left  = 0;
dialogue_current_right = 0;
dialogue_prev_left_index  = 0;
dialogue_prev_right_index = 0;
dialogue_left  = [];
dialogue_right = [];
dialogue_selection = 0;
dialogue_selection_options		= [];
dialogue_selection_descriptions	= [];
dialogue_selection_jumps		= [];
dialogue_selection_buttons		= [];
dialogue_selection_choices		= [];

environmental_text = "";
#endregion