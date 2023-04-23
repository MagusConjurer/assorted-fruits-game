/// @description

// Inherit the parent event
event_inherited();

left_x = x;
top_y = y;
right_x = x + string_width(bh_dialogue);
bot_y = y + string_height(bh_dialogue);

if(global.game_state == active_state)
{
	text_color = c_white;
}
else
{
	text_color = c_gray;
}
