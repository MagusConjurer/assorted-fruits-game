/// @description

draw_self();

// Show what the hotkey is
draw_set_color(c_white);
draw_text(x + text_xOffset, y + text_yOffset, chr(hotkey));

if(global.game_state == PAUSED)
{
	bh_darken_object(x-sprite_width, y - sprite_height, sprite_width, sprite_height);
}