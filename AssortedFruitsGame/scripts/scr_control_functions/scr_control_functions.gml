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
function get_movement_h()
{
	if(global.gamepad_id > -1)
	{
		dpad_l = gamepad_button_check(global.gamepad_id,gp_padl);
		dpad_r = gamepad_button_check(global.gamepad_id,gp_padr);
		
		dpad_h = dpad_r - dpad_l;
		
		if(dpad_h != 0)
		{
			return dpad_h;
		}
		else
		{
			return gamepad_axis_value(global.gamepad_id, gp_axislh);
		}
	}
	else
	{
		key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
		key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
		
		return (key_right - key_left);
	}
}

function get_movement_v()
{
	if(global.gamepad_id > -1)
	{
		dpad_u = gamepad_button_check(global.gamepad_id,gp_padu);
		dpad_d = gamepad_button_check(global.gamepad_id,gp_padd);
		
		dpad_v = dpad_d - dpad_u;
		
		if(dpad_v != 0)
		{
			return dpad_v;
		}
		else
		{
			return gamepad_axis_value(global.gamepad_id, gp_axislv);
		}
	}
	else
	{
		key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
		key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
		
		return (key_down - key_up);
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

function ability_one_pressed()
{
	if(global.gamepad_id > -1)
	{
		// Press X (Xbox) or Square (Playstation)
		return gamepad_button_check_pressed(global.gamepad_id, gp_face3);
	}
	else
	{
		return keyboard_check_pressed(global.hotkey_ability_one);
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
		return gamepad_button_check_pressed(global.gamepad_id, gp_face1);
	}
	else
	{
		return mouse_check_button_pressed(mb_left) || keyboard_check_pressed(global.hotkey_menu_interact);
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