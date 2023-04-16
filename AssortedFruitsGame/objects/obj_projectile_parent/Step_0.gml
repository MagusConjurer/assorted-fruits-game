/// @description 

event_inherited();

if (global.game_state == active_state)
{
	xSpeed = xDirection * moveSpeed * DELTA;
	ySpeed = yDirection * moveSpeed * DELTA;

	x += xSpeed;
	y += ySpeed;
}
