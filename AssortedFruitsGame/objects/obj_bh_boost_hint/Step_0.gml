/// @description

// Inherit the parent event
event_inherited();

if(global.game_state == active_state)
{
	text_color = BH_BOOST_SEQ_ACTIVE_COLOR;
}
else
{
	text_color = BH_BOOST_SEQ_PAUSED_COLOR;
}
