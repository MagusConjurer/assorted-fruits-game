/// @description 

// audio_stop_all();
// audio_play_sound(BG_MUSIC, 10, true);

pause_menu_visible = false;
pause_menu_buttons = [];

// Bullet Hell
bh_active = false;

bh_player_health = 0;
bh_ability_index = 0;
bh_ability_cooldown = 1;
bh_bubbles_popped = 0;
num_active_bubbles = 0;
bh_prev_bubble_rand = 0;
bubble_height = sprite_get_height(spr_wordbubble_combined);
possible_bubble_spots = (room_height - bubble_height) / BH_NUM_STARTING_BUBBLES;
bubble_popped_time = 0;
bh_time_spent = 0;


// Dialogue
dialogue_active = false;
dialogue_selection_visible = false;
dialogue_level = 1;
conversation_index = 1; // starts at 1 since data is index 0
conversation = [];
conversation_boxes = [];
dialogue_button = 0;
dialogue_left = 0;
dialogue_right = 0;
dialogue_selection_options = [];
dialogue_selection_buttons = [];

