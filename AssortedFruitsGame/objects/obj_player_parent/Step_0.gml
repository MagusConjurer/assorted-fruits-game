/// @description

// Player Input
if(global.gamepad_id > -1)
{
	h_direction = gamepad_axis_value(global.gamepad_id, gp_axislh);
	v_direction = gamepad_axis_value(global.gamepad_id, gp_axislv);
}
else
{
	key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
	key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
	key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	
	h_direction = (key_right - key_left);
	v_direction = (key_down - key_up);
}
