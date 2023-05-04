/// @description 

// Calculates the proper delta value for 60 FPS
DELTA = delta_time/(1000000) * 60;

if(main_continue_pressed && transition_event_hit && room != ROOM_MENU)
{
	obj_player_ov.x = ov_player_x;
	obj_player_ov.y = ov_player_y;
}

if(viewport_setup == false && room != ROOM_MENU)
{
	// Should be called once when the player starts the game
	camera_target = obj_player_ov;
	setup_viewport();
}

update_camera_position();

if(main_continue_pressed && transition_event_hit && room != ROOM_MENU)
{
	main_continue_pressed = false;
	transition_event_hit  = false;

	set_game_state_and_start(state_before_main);
}

dialogue_update();

bh_update();

menu_input_update();

menu_update();