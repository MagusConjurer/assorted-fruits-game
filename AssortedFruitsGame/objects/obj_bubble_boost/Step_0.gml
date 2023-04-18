/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 35D8C42A
/// @DnDArgument : "code" "/// @description $(13_10)$(13_10)event_inherited();$(13_10)$(13_10)if(global.game_state == BULLET_HELL)$(13_10){$(13_10)	if(instance_place(x,y,obj_player_bh))$(13_10)	{$(13_10)		bh_apply_progress_boost();$(13_10)		bh_remove_boost_available();$(13_10)		instance_destroy();$(13_10)	}$(13_10)	$(13_10)	// Movement$(13_10)	x += xDirection * xSpeed * DELTA;$(13_10)	$(13_10)	angle += 1 * DELTA;$(13_10)	image_angle = angle;$(13_10)	$(13_10)	$(13_10)	if(bh_is_outside_bounds_x(x,sprite_width))$(13_10)	{$(13_10)		bh_remove_boost_available();$(13_10)		instance_destroy();$(13_10)	}$(13_10)}$(13_10)$(13_10)$(13_10)$(13_10)"
/// @description 

event_inherited();

if(global.game_state == BULLET_HELL)
{
	if(instance_place(x,y,obj_player_bh))
	{
		bh_apply_progress_boost();
		bh_remove_boost_available();
		instance_destroy();
	}
	
	// Movement
	x += xDirection * xSpeed * DELTA;
	
	angle += 1 * DELTA;
	image_angle = angle;
	
	
	if(bh_is_outside_bounds_x(x,sprite_width))
	{
		bh_remove_boost_available();
		instance_destroy();
	}
}