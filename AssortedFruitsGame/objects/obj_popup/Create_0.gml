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
	// Could change to check gamepad description to display Xbox vs Playstation buttons
	popup_text = "X";
}
else
{
	popup_text = chr(global.hotkey_interact);
}