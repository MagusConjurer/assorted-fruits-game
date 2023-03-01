/// @description 

event_inherited();

if (global.game_state == BULLET_HELL)
{
	xSpeed = xDirection * moveSpeed;
	ySpeed = yDirection * moveSpeed;

	x += xSpeed;
	y += ySpeed;
}
