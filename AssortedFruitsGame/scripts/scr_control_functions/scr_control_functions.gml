function menu_input_update()
{
	with(obj_game)
	{
		if(global.gamepad_id > -1)
		{
			time_since_menu_input += delta_time/1000000;
			if(time_since_menu_input > MENU_INPUT_DELAY)
			{
				menu_input_active = true;
			}
			else
			{
				menu_input_active = false;
			}
		}
	}
}

function set_controller_type()
{
	if(global.gamepad_id > -1)
	{		
		gamepad_set_axis_deadzone(global.gamepad_id, AXIS_DEADZONE);
		gamepad_set_button_threshold(global.gamepad_id, TRIGGER_DEADZONE);
		
		controller_type = gamepad_get_description(global.gamepad_id);
		show_debug_message(controller_type);
		if(string_count("STANDARD GAMEPAD",controller_type) > 0 || string_count("Xbox",controller_type) > 0)
		{
			global.gamepad_type = XBOX;
		}
		else if (string_count("PS4",controller_type) > 0 || string_count("PS5",controller_type) > 0)
		{
			global.gamepad_type = PLAYSTATION;
		}
		
		gamepad_set_color(global.gamepad_id, C_ALEX);
	}
}

function get_ctrl_hotkey_interact()
{
	switch(global.gamepad_type)
	{
		case XBOX:
			return "A";
		break;
		case PLAYSTATION:
			return "X";
		break;
	}
}

function get_ctrl_hotkey_ability_one()
{
	switch(global.gamepad_type)
	{
		case XBOX:
			return "X";
		break;
		case PLAYSTATION:
			return "[]";
		break;
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
	if(!instance_exists(obj_transition_parent))
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
	with(obj_game)
	{
		if(global.gamepad_id > -1 && menu_input_active)
		{
			// Press DPad or  Up
			if(get_movement_v() < 0)
			{
				time_since_menu_input = 0;
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}

function menu_selection_down()
{
	with(obj_game)
	{
		if(global.gamepad_id > -1 && menu_input_active)
		{
			// Press DPad or  Up
			if(get_movement_v() > 0)
			{
				time_since_menu_input = 0;
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}

function menu_selection_left()
{
	with(obj_game)
	{
		if(global.gamepad_id > -1 && menu_input_active)
		{
			// Press DPad or  Up
			if(get_movement_h() < 0)
			{
				time_since_menu_input = 0;
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}

function menu_selection_right()
{
	with(obj_game)
	{
		if(global.gamepad_id > -1 && menu_input_active)
		{
			// Press DPad or  Up
			if(get_movement_h() > 0)
			{
				time_since_menu_input = 0;
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}

#region CONTROL DESCRIPTIONS
function get_attack_hotkey()
{
	if(global.gamepad_id > -1)
	{
		return "RT/LT";
	}
	else
	{
		return "SPACE";
	}
}

function get_ability_one_hotkey()
{
	if(global.gamepad_id > -1)
	{
		if(global.gamepad_type == XBOX)
		{
			return "X";
		}
		else if(global.gamepad_type == PLAYSTATION)
		{
			return "\u025A1";
		}
	}
	else
	{
		return "L SHIFT";
	}
}
#endregion