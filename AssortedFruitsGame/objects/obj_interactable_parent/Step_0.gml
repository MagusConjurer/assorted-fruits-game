/// @description 

if(interact_starts)
{
	radius = PLAYER_INTERACT_DISTANCE;
}
else
{
	radius = AUTO_INTERACT_DISTANCE;
}

if(!has_been_interacted || interact_repeatable)
{
	if(global.game_state == OVERWORLD && collision_circle(x, y, radius, obj_player_ov, false, false) )
	{
		popup_id.visible = true;
	} 
	else 
	{
		popup_id.visible = false;
	}
}