/// @description

draw_self();

// Show what the hotkey is
draw_set_color(c_white);
draw_text(x + text_xOffset, y + text_yOffset, hotkey);

if(global.game_state == PAUSED)
{
	bh_darken_object_circle(x, y, sprite_width * 0.5);
}