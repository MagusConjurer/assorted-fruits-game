/// @description: Dash Ability

// Only activate if movement is happening
if(h_direction != 0 || v_direction != 0) {
	if(!dash_active)
	{
		dash_active = true;
		moveSpeed = BH_DASH_DISTANCE/BH_DASH_DURATION;
		bh_set_ability_one_duration(BH_DASH_DURATION);
	
		if(iframes < BH_DASH_DURATION * 60)
		{
			iframes = BH_DASH_DURATION * 60;
		}
	}
}
else {
	if(!dash_active)
	{
		// Reset ability button immediately if activated without movement.
		bh_set_ability_one_duration(1);
	}
}