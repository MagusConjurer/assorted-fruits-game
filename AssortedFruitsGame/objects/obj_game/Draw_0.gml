/// @description Draw the screen darkening

depth = DARKENING_DEPTH;

if (global.game_state != OVERWORLD)
{
	// Darken the screen
	draw_set_color(c_black);
	draw_set_alpha(PERCENT_TO_DARKEN);
	draw_rectangle(0,0, RESOLUTION_W, RESOLUTION_H, false);
	// Reset the alpha value
	draw_set_alpha(1.0);
}