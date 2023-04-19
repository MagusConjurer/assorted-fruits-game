/// @description 

// Calculates the proper delta value for 60 FPS
DELTA = delta_time/(1000000) * 60;

if(viewport_setup == false && room != ROOM_MENU)
{
	// Should be called once when the player starts the game
	camera_target = obj_player_ov;
	setup_viewport();
}

update_camera_position();

dialogue_update();

bh_update();

menu_input_update();

menu_update();






