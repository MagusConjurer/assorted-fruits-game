
/// Called by obj_game to handle the pause menu and paused functionality
function pause_menu_update(){
	if (keyboard_check_pressed(vk_escape) && pause_menu_visible == false)
	{
		set_game_state(PAUSED);
	
		pause_menu_show();
	}

	if (global.game_state != PAUSED && pause_menu_visible == true)
	{
		pause_menu_destroy();
	}

	if (global.game_state == PAUSED) 
	{
		// This will pause the timer so no obj_game alarms activate while paused
		obj_game.alarm[0]++; 
	}
}

function pause_menu_show()
{
	pause_menu_visible = true;
	pause_background_music();
	
	pm_x = global.resolution_w * 0.5;
	pm_y = global.resolution_h * 0.5;
	
	pause_menu_buttons[0] = instance_create_layer(pm_x, pm_y - 50, "Pause_Menu", obj_menu_button);
	pause_menu_buttons[1] = instance_create_layer(pm_x, pm_y, "Pause_Menu", obj_continue_button);
	pause_menu_buttons[2] = instance_create_layer(pm_x, pm_y + 50, "Pause_Menu", obj_quit_button);
	pause_menu_buttons[2].layer_to_check = "Pause_Menu";
}

function pause_menu_destroy()
{
	pause_menu_visible = false;
	resume_background_music();
	
	for(i = 0; i < array_length(pause_menu_buttons); i++)
	{
		instance_destroy(pause_menu_buttons[i]);
	}
}