/// @description 

// Inherit the parent event
event_inherited();

if (global.game_state == BULLET_HELL)
{	
	if (usable) {
		if(ability != 0 && ability_image_active != (ability - 1)*2)
		{
			// Only update once
			ability_image_active = (ability - 1)*2;
			ability_image_inactive = ability_image_active + 1;
		}
		
		image_index = ability_image_active;
		
		if(ability_one_pressed() || mouse_check_button_pressed(mb_left))
		{
			image_index = ability_image_inactive;
			alarm[0] = cooldown;
			time_since_used = 0;
			usable = false;
			bh_ability(ability);
		}
	}
	else
	{
		time_since_used += DELTA;
		
		percentage_to_draw = time_since_used / cooldown;
	}
}