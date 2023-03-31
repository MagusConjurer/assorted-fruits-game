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

function darken_background(depth_value)
{
	depth = depth_value;
	
	// Darken the screen
	draw_set_color(c_black);
	draw_set_alpha(PERCENT_TO_DARKEN);
	draw_rectangle(0,0, RESOLUTION_W, RESOLUTION_H, false);
	// Reset the alpha value
	draw_set_alpha(1.0);
}

function room_transition(level)
{
	switch(level)
	{
		case BEDROOM:
			global.current_level = BEDROOM;
			//global.current_level = ;
		break;
		case BUS_STOP:
			global.current_level = BUS_STOP;
			global.current_room = rm_level_one;
		break;
		case CAFE:
			global.current_level = CAFE;
			//global.current_room = ;
		break;
		case DINNER:
			global.current_level = DINNER;
			//global.current_level = ;
		break;
	}
	
	// run transition
	room_goto(global.current_room);
}