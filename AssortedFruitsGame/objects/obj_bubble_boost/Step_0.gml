/// @description 

event_inherited();

if(global.game_state == BULLET_HELL)
{
	if(instance_place(x,y,obj_player_bh))
	{
		bh_apply_progress_boost(true);
		instance_destroy();
	}
	
	// Movement
	x += xDirection * xSpeed * DELTA;
	
	angle += 1 * DELTA;
	image_angle = angle;
	
	if(bh_is_outside_bounds_x(x,sprite_width))
	{
		bh_apply_progress_boost(false);
		instance_destroy();
	}
}