/// @description 

if(viewport_setup == false && global.game_state != MENU)
{
	// Should be called once when the player starts the game
	setup_viewport();
}

update_camera_position();

dialogue_update();

bh_update();

menu_update();






