/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2F80D5CD
/// @DnDArgument : "code" "/// @description $(13_10)$(13_10)// Audio$(13_10)// audio_stop_all();$(13_10)// audio_play_sound(BG_MUSIC, 10, true);$(13_10)$(13_10)$(13_10)// Battles Completed$(13_10)level_2_complete = false;$(13_10)level_5_complete = false;$(13_10)$(13_10)// Controller$(13_10)time_since_menu_input = 0;$(13_10)menu_input_active = false;$(13_10)$(13_10)// Camera$(13_10)camera = 0;$(13_10)camera_target = 0;$(13_10)camera_x = 0;$(13_10)camera_y = 0;$(13_10)camera_width = 0; $(13_10)camera_height = 0;$(13_10)viewport_setup = false;$(13_10)$(13_10)// surface_resize(application_surface, camera_width, camera_height);$(13_10)$(13_10)// Menus$(13_10)main_menu_visible = false$(13_10)pause_menu_visible = false;$(13_10)settings_menu_visible = false;$(13_10)menu_buttons = [];$(13_10)menu_selected = 0;$(13_10)settings_buttons = [];$(13_10)settings_visuals = [];$(13_10)settings_selected = 0;$(13_10)$(13_10)// Bullet Hell$(13_10)bh_active = false;$(13_10)bh_dia_seq = 0;$(13_10)bh_dia_paused = false;$(13_10)bh_dia_seq_created = false;$(13_10)bh_dia_text = [];$(13_10)bh_player = 0;$(13_10)bh_player_health = 0;$(13_10)$(13_10)bh_ability_index = 0;$(13_10)bh_ability_cooldown = 1;$(13_10)$(13_10)bh_bubble_max = 0;$(13_10)bh_bubble_start = 0;$(13_10)bh_bubble_start_health = 0;$(13_10)bh_bubbles_per_spawn = 0;$(13_10)bh_bubble_projectiles = 0;$(13_10)bh_bubble_projectiles_scale = 0;$(13_10)bh_bubble_pop_time = 0;$(13_10)bh_bubble_move_speed = 0;$(13_10)$(13_10)bh_bubbles_popped = 0;$(13_10)num_active_bubbles = 0;$(13_10)bh_prev_bubble_rand = 0;$(13_10)bubble_height = 0;$(13_10)possible_bubble_spots = 0;$(13_10)$(13_10)bh_boost_available = false;$(13_10)bh_busstop_choice = BH_NO_RESPONSE;$(13_10)bh_dinner_choice = BH_BATTLE_MOM;$(13_10)$(13_10)bh_progress_bar = 0;$(13_10)bh_next_checkpoint = 0;$(13_10)bh_checkpoint_size = 0;$(13_10)bh_checkpoint_status = [];$(13_10)bh_time_spent = 0;$(13_10)bh_vignette_levels = sprite_get_number(spr_bh_vignette) - 1;$(13_10)$(13_10)// Dialogue$(13_10)dialogue_active = false;$(13_10)dialogue_selection_visible = false;$(13_10)dialogue_in_person = true;$(13_10)dialogue_multi_opt = false;$(13_10)dialogue_phone = 0;$(13_10)conversation_index = 1; // starts at 1 since data is index 0$(13_10)conversation = [];$(13_10)current_conversation = 0;$(13_10)conversation_boxes = [];$(13_10)dialogue_button = 0;$(13_10)dia_btn_enabled_state = true; // used when pausing$(13_10)dialogue_current_left  = 0;$(13_10)dialogue_current_right = 0;$(13_10)dialogue_prev_left_index  = 0;$(13_10)dialogue_prev_right_index = 0;$(13_10)dialogue_left  = [];$(13_10)dialogue_right = [];$(13_10)dialogue_selection = 0;$(13_10)dialogue_selection_options		= [];$(13_10)dialogue_selection_descriptions	= [];$(13_10)dialogue_selection_jumps		= [];$(13_10)dialogue_selection_buttons		= [];$(13_10)dialogue_selection_choices		= [];$(13_10)"
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

/// @DnDAction : YoYo Games.Particles.Part_Syst_Create
/// @DnDVersion : 1.2
/// @DnDHash : 6DEF11AA
/// @DnDArgument : "var" "global.P_system_Stella"
/// @DnDArgument : "layer" ""Particles""
/// @DnDArgument : "partsys" "PS_stella_boost"
/// @DnDSaveInfo : "partsys" "PS_stella_boost"
global.P_system_Stella = part_system_create_layer("Particles", 0, PS_stella_boost);

/// @DnDAction : YoYo Games.Particles.Part_Syst_Create
/// @DnDVersion : 1.2
/// @DnDHash : 27003151
/// @DnDArgument : "var" "global.P_system_pop"
/// @DnDArgument : "layer" ""Particles""
/// @DnDArgument : "partsys" "PS_ballon_pop"
/// @DnDSaveInfo : "partsys" "PS_ballon_pop"
global.P_system_pop = part_system_create_layer("Particles", 0, PS_ballon_pop);

/// @DnDAction : YoYo Games.Particles.Part_Syst_Create
/// @DnDVersion : 1.2
/// @DnDHash : 4A00E93B
/// @DnDArgument : "var" "global.P_system_interact"
/// @DnDArgument : "layer" ""Particles""
/// @DnDArgument : "partsys" "PS_underbuttoninteractable"
/// @DnDSaveInfo : "partsys" "PS_underbuttoninteractable"
global.P_system_interact = part_system_create_layer("Particles", 0, PS_underbuttoninteractable);

/// @DnDAction : YoYo Games.Particles.Part_Type_Create
/// @DnDVersion : 1.1
/// @DnDHash : 679AC680
/// @DnDArgument : "var" "global.P_system_pop_T"
/// @DnDArgument : "blend" "1"
global.P_system_pop_T = part_type_create();
part_type_blend(global.P_system_pop_T, true);

/// @DnDAction : YoYo Games.Particles.Part_Type_Create
/// @DnDVersion : 1.1
/// @DnDHash : 1ADE4A76
/// @DnDArgument : "var" "global.P_system_interac_T"
/// @DnDArgument : "blend" "1"
global.P_system_interac_T = part_type_create();
part_type_blend(global.P_system_interac_T, true);

/// @DnDAction : YoYo Games.Particles.Part_Type_Create
/// @DnDVersion : 1.1
/// @DnDHash : 3C348D99
/// @DnDArgument : "var" "global.P_system_interac_T"
/// @DnDArgument : "blend" "1"
global.P_system_interac_T = part_type_create();
part_type_blend(global.P_system_interac_T, true);

/// @DnDAction : YoYo Games.Particles.Part_Emit_Create
/// @DnDVersion : 1
/// @DnDHash : 3B6CBA50
/// @DnDArgument : "var" "global.emitter"
/// @DnDArgument : "system" "global.P_system_pop"
global.emitter = part_emitter_create(global.P_system_pop);

/// @DnDAction : YoYo Games.Particles.Part_Emit_Create
/// @DnDVersion : 1
/// @DnDHash : 0CF66C2D
/// @DnDDisabled : 1
/// @DnDArgument : "var" "global.P_system_pop.emitter_1"
/// @DnDArgument : "system" "global.P_system_pop"


/// @DnDAction : YoYo Games.Particles.Part_Emit_Create
/// @DnDVersion : 1
/// @DnDHash : 43ABA196
/// @DnDDisabled : 1
/// @DnDArgument : "var" "global.P_system_pop.emitter_1_1"
/// @DnDArgument : "system" "global.P_system_pop"