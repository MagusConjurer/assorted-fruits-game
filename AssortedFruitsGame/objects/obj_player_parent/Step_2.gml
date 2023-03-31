/// @description Check if they stayed within bounds

if(global.game_state == active_state)
{
	if(x + xSpeed + sprite_width/2 > room_width || x + xSpeed - sprite_width/2 < 0)
	{
		xSpeed = 0;
	}

	if(y + ySpeed + sprite_height/2 > room_height || y + ySpeed - sprite_height/2< 0)
	{
		ySpeed = 0;
	}

	y += ySpeed;
	x += xSpeed;
}