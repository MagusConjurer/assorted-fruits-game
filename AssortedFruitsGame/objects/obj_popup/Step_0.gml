/// @description 

if(global.game_state == active_state)
{
	if(moving_up)
	{
		if(y > move_y_bound)
		{
			y -= 0.1;
		}
		else
		{
			moving_up = false;
		}
	}
	else
	{
		if(y < initial_y)
		{
			y += 0.1;
		}
		else
		{
			moving_up = true;
		}
	}
}