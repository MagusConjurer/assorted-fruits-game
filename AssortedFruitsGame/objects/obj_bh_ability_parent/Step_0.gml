/// @description 

// Inherit the parent event
event_inherited();

if (global.game_state == BULLET_HELL)
{
	if(mouse_check_button_pressed(mb_left))
	{
		image_index = 1;
		bh_ability(ability);
	}
	
	if(mouse_check_button_released(mb_left))
	{
		image_index = 0;
	}
}
