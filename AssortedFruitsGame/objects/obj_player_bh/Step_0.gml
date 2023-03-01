/// @description 

event_inherited();

if (global.game_state == active_state) 
{
	if(keyboard_check_pressed(vk_space))
	{
		instance_create_layer(x,y,"Bullet_Hell",obj_player_projectile);
	}
	
	// Check for collision with bubble projectiles
	var _inst = instance_place(x,y,obj_bubble_projectile);
	if (_inst != noone)
	{
		update_player_health(_inst.damage);
		instance_destroy(_inst);
	}
	
	// May want to move all the movement checking to a script function for readability

	// Get x and y speed
	xSpeed = (key_right - key_left) * moveSpeed;
	ySpeed = (key_down - key_up) * moveSpeed;
	
	if (!place_meeting(x, y + ySpeed, obj_bh_parent))
	{
		y += ySpeed;
	}
	
	if (!place_meeting(x + xSpeed, y, obj_bh_parent))
	{
		x += xSpeed;
	} 

	// Draws the player above the darkened area
	depth = BH_DEPTH;
}
