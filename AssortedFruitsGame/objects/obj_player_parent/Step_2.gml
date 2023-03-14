/// @description Check if they stayed within bounds


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