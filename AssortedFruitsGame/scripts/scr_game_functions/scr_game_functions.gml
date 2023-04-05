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

function update_camera_position()
{
	camera_x = camera_get_view_x(view_camera[0]);
	camera_y = camera_get_view_y(view_camera[0]);
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

function setup_viewport()
{
	with(obj_game)
	{
		// Camera/Viewport -- based on https://gamemaker.io/en/tutorials/cameras-and-views
		camera_x = 0;
		camera_y = 0;
		camera_width = global.resolution_w * 0.5; // change 0.5 to a zoom percentage?
		camera_height = global.resolution_h * 0.5;

		view_enabled = true;
		view_visible[0] = true;

		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = camera_width; 
		view_hport[0] = camera_height; 

		view_camera[0] = camera_create_view(0,0,view_wport[0], view_hport[0], 0, obj_player_ov, -1,-1,view_wport[0],view_hport[0]);

		displayX = (global.resolution_w * 0.5) - camera_width;
		displayY = (global.resolution_h * 0.5) - camera_height;
		window_set_rectangle(displayX,displayY, camera_width, camera_height);
		
		viewport_setup = true;
	}
}