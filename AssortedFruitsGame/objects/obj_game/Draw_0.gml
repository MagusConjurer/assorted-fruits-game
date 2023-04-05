/// @description Draw the screen darkening

if (global.game_state != OVERWORLD && global.game_state != MENU)
{		
	darken_background(DARKENING_DEPTH);
}