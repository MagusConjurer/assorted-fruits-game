/// @description 

event_inherited();

if (global.game_state == active_state)
{
	xSpeed = xDirection * moveSpeed * DELTA;
	ySpeed = yDirection * moveSpeed * DELTA;

	x = lerp(x, x + xSpeed, 0.1);
	y = lerp(y, y + ySpeed, 0.1);
}
