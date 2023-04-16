/// @description

draw_self();

// Show what the hotkey is
draw_set_color(c_white);
draw_text(x + text_xOffset, y + text_yOffset, hotkey);

event_inherited();