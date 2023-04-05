/// @description Draw the screen darkening

if (global.game_state != OVERWORLD && global.game_state != MENU)
{		
	if(global.game_state == PAUSED)
	{
		darken_background(PAUSED_DEPTH);
	}
	else
	{
		darken_background(DARKENING_DEPTH);
	}
}