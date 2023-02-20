/// @description 

if(!has_been_interacted || INTERACT_REPEATABLE)
{
	if(collision_circle(x, y, radius, obj_player_ov, false, false))
	{
		popup_id.visible = true;
	} 
	else 
	{
		popup_id.visible = false;
	}
}