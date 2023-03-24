/// @description 

// Inherit the parent event
event_inherited();

if (global.game_state == BULLET_HELL)
{	
	if (usable) {
		image_index = ability*2;
		
		if(mouse_check_button_pressed(mb_left))
		{
			image_index = (ability*2)+1;
			alarm[0] = obj_game.bh_ability_cooldown;
			usable = false;
			bh_ability(ability);
		}
	}
}