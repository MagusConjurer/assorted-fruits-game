/// @description 

event_inherited();

if (global.game_state == active_state) 
{
	if(keyboard_check(vk_space))
	{
		if(alarm[0] < 0)
		{
			alarm[0] = BH_PLAYER_PROJECTILE_DELAY;
		}
	}
	
	// Check for collision with bubble projectiles
	var _inst = instance_place(x,y,obj_bubble_projectile);
	if (_inst != noone)
	{
		bh_update_player_health(_inst.damage);
		instance_destroy(_inst);
	}
	
	// May want to move all the movement checking to a script function for readability

	if(alarm[1] < 0) {
		// Get x and y speed if not dashing
		xSpeed = (key_right - key_left) * moveSpeed;
		ySpeed = (key_down - key_up) * moveSpeed;
	}
	
	if(place_meeting(x + xSpeed, y, obj_bubble))
	{
		xSpeed = 0;
	}
	if(place_meeting(x, y + ySpeed, obj_bubble))
	{
		ySpeed = 0;
	}
	
	y += ySpeed;
	x += xSpeed;
	
	// Draws the player above the darkened area
	depth = BH_DEPTH;
}
