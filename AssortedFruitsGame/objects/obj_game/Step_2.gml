/// @description 

if (keyboard_check_pressed(vk_escape) && pause_menu_visible == false)
{
	global.prev_state = global.game_state;
	global.game_state = PAUSED;
	
	pause_menu_visible = true;
	
	// TODO: Check if the position needs to be adjusted to work correctly with viewport instead of room size
	pause_menu_buttons[0] = instance_create_layer(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 - 50, "Pause_Menu", obj_menu_button);
	pause_menu_buttons[1] = instance_create_layer(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "Pause_Menu", obj_continue_button);
	pause_menu_buttons[2] = instance_create_layer(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 50, "Pause_Menu", obj_quit_button);
}

if (global.game_state != PAUSED && pause_menu_visible == true)
{
	pause_menu_visible = false;
	
	for(i = 0; i < array_length(pause_menu_buttons); i++)
	{
		instance_destroy(pause_menu_buttons[i]);
	}
}

if (global.game_state == BULLET_HELL && bh_active = false)
{
	bh_active = true;
	
	start_bullet_hell(bubbleXPosition);
}
else if (global.game_state == BULLET_HELL && bh_active = true)
{
	if(alarm_get(0) < 0) 
	{
		alarm_set(0,room_speed * 5);
	}
}