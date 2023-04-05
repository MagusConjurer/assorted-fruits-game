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
		return gamepad_button_check(global.gamepad_id, gp_face1);
	}
	else
	{
		return keyboard_check(global.hotkey_interact);
	}
}