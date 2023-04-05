/// @description: Dash Ability

// Only activate if movement is happening
if(h_direction != 0 || v_direction != 0) {
	moveSpeed = BH_DASH_DISTANCE/BH_DASH_DURATION;
	xSpeed = h_direction * moveSpeed;
	ySpeed = v_direction * moveSpeed;
	alarm[1] = BH_DASH_DURATION;
}
else {
	// Reset ability button immediately if activated without movement.
	obj_ability_one_button.alarm[0] = 1;
}