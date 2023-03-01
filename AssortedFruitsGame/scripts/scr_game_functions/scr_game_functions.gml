

function set_game_state(new_state)
{
	global.prev_state = global.game_state;
	global.game_state = new_state;
}

function return_to_prev_state(current_state)
{
	global.game_state = global.prev_state;
	global.prev_state = current_state;
}