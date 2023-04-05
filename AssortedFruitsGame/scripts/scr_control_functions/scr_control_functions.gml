function check_for_controller()
{
	for(var i = 0; i < 12; i++)
	{
		if(gamepad_is_connected(i))
		{
			global.gamepad_id = i;
			gamepad_set_axis_deadzone(global.gamepad_id, 0.2);
		
			break;
		}
	}
}

function attack_pressed()
{
	if(global.gamepad_id > -1)
	{
		// Press either trigger
		return gamepad_button_check(global.gamepad_id, gp_shoulderlb) || gamepad_button_check(global.gamepad_id, gp_shoulderrb);
	}
	else
	{
		return keyboard_check(global.hotkey_attack);
	}
}

function interact_pressed()
{
	if(global.gamepad_id > -1)
	{
		// Press A (Xbox) or X (Playstation)
		return gamepad_button_check_pressed(global.gamepad_id, gp_face1);
	}
	else
	{
		return keyboard_check_pressed(global.hotkey_interact);
	}
}

function menu_toggle_pressed()
{
	if(global.gamepad_id > -1)
	{
		// Press Start (Xbox)/Options (Playstation
		return gamepad_button_check_pressed(global.gamepad_id, gp_start);
	}
	else
	{
		return keyboard_check_pressed(global.hotkey_menu);
	}
}

function menu_interact_pressed()
{
	if(global.gamepad_id > -1)
	{
		// Press A (Xbox) or X (Playstation
		return gamepad_button_check(global.gamepad_id, gp_face1);
	}
	else
	{
		return mouse_check_button_pressed(mb_left);
	}
}

function menu_interact_released()
{
	if(global.gamepad_id > -1)
	{
		// Press A (Xbox) or X (Playstation
		return gamepad_button_check(global.gamepad_id, gp_face1);
	}
	else
	{
		return mouse_check_button_released(mb_left);
	}
}

function menu_selection_up()
{
	if(global.gamepad_id > -1)
	{
		// Press DPad Up
		return gamepad_button_check_pressed(global.gamepad_id, gp_padu);
	}
}

function menu_selection_down()
{
	if(global.gamepad_id > -1)
	{
		// Press DPad Down
		return gamepad_button_check_pressed(global.gamepad_id, gp_padd);
	}
}

function menu_selection_left()
{
	if(global.gamepad_id > -1)
	{
		// Press DPad Left
		return gamepad_button_check_pressed(global.gamepad_id, gp_padl);
	}
}

function menu_selection_right()
{
	if(global.gamepad_id > -1)
	{
		// Press DPad Right
		return gamepad_button_check_pressed(global.gamepad_id, gp_padr);
	}
}