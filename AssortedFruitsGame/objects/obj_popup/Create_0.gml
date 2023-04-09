/// @description 

active_state = OVERWORLD;

image_speed = 0;
image_index = 0;

// Manual animation values
initial_y = y;
move_y_bound = y - 10;
moving_up = false;

popup_text = "";

if(global.gamepad_id > -1)
{
	popup_text = get_ctrl_hotkey_interact();
}
else
{
	popup_text = chr(global.hotkey_interact);
}