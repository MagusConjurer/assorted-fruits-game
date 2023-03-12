/// @description 

// audio_stop_all();
// audio_play_sound(BG_MUSIC, 10, true);

pause_menu_visible = false;
pause_menu_buttons = [];



// Bullet Hell
bh_active = false;

bh_player_health = 0;

num_active_bubbles = 0;
bubble_x_pos = room_width - 250;
bubble_popped_time = 0;
bh_time_spent = 0;


// Dialogue
dialogue_active = false;
dialogue_level = 1;
conversation_index = 0;
conversation_boxes = [];
conversation_player_first = true;
dialogue_button = 0;
dialogue_player = 0;
dialogue_other = 0;
dialogue_selection_options = [];
dialogue_selection_buttons = [];
dialogue_selection_visible = false;
