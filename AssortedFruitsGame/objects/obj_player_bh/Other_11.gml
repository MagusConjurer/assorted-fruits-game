/// @description: Dash Ability

// Only activate if movement is happening
if(key_right || key_left || key_down || key_up) {
	moveSpeed = BH_DASH_DISTANCE/BH_DASH_DURATION;
	xSpeed = (key_right - key_left) * moveSpeed;
	ySpeed = (key_down - key_up) * moveSpeed;
	alarm[1] = BH_DASH_DURATION;
}
else {
	// Reset ability button immediately if activated without movement.
	obj_ability_button.alarm[0] = 1;
}