/// @description 

draw_self();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x, y, boost_text);

// Reset draw values
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

event_inherited();