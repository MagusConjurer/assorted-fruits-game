function set_game_state(new_state)
{	
	state_change_transition(new_state);
	global.prev_state = global.game_state;
	global.game_state = new_state;
}

function return_to_prev_state(current_state)
{
	global.game_state = global.prev_state;
	global.prev_state = current_state;
}

function state_change_transition(state)
{
	if(state == BULLET_HELL)
	{
		// TODO: BH Transition
	}
	else if(state == DIALOGUE)
	{
		// TODO: DIA Transition
	}
	else if(state == OVERWORLD)
	{
		// TODO: OV Transition
	}
	else
	{
		// TODO: MENU Transition
	}
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

// CANNOT BE USED TO GO TO MENU 
function room_transition(level)
{
	global.current_level = level;
	
	switch(level)
	{
		case LEVEL_0_BEDROOM:
			global.current_room = ROOM_BEDROOM;
		break;
		case LEVEL_1_BUS_STOP:
			global.current_room = ROOM_OUTSIDE;
		break;
		case LEVEL_3_CAFE:
			global.current_room = ROOM_CAFE;
		break;
		case LEVEL_4_DINNER:
			//global.current_room = ;
		break;
		case LEVEL_6_BEDROOM:
			global.current_room = ROOM_BEDROOM;
		break;
	}
	
	// TODO: run room transition
	room_goto(global.current_room);
	
	with(obj_game)
	{
		viewport_setup = false;
	}
}

#region CAMERA/VIEWPORT

function setup_viewport()
{
	with(obj_game)
	{
		// Camera/Viewport -- based on https://gamemaker.io/en/tutorials/cameras-and-views
		// Updated based on https://www.youtube.com/watch?v=1VcCwtHszVY
		
		camera_width = global.resolution_w * 0.5; // change 0.5 to a zoom percentage?
		camera_height = global.resolution_h * 0.5;
		
		if(global.game_state != MENU)
		{
			camera_x = camera_target.x - (camera_width / 2);
			camera_y = camera_target.y - (camera_height / 2);
		}
		else
		{
			camera_x = 0;
			camera_y = 0;
		}

		view_enabled = true;
		view_visible[0] = true;

		//view_camera[0] = camera_create_view(0,0,view_wport[0], view_hport[0], 0, obj_player_ov, -1,-1,view_wport[0],view_hport[0]);
		camera = camera_create_view(camera_x, camera_y, camera_width, camera_height);
		view_set_camera(0, camera);

		//displayX = (global.resolution_w * 0.5) - camera_width;
		//displayY = (global.resolution_h * 0.5) - camera_height;
		//window_set_rectangle(displayX,displayY, camera_width, camera_height);
		window_set_size(global.resolution_w, global.resolution_h);
		surface_resize(application_surface, global.resolution_w, global.resolution_h);

		viewport_setup = true;
	}
}

function update_camera_position()
{
	with(obj_game)
	{
		camera_x = camera_get_view_x(camera);
		camera_y = camera_get_view_y(camera);
		
		if(global.game_state == OVERWORLD)
		{
			target_x = camera_target.x - (camera_width / 2);
			target_y = camera_target.y - (camera_height / 2);
		
			// Keep the camera inside the room
			target_x = clamp(target_x, 0, room_width  - camera_width);
			target_y = clamp(target_y, 0, room_height - camera_height);
		
			// Smooth movement
			camera_x = lerp(camera_x, target_x, CAMERA_SPEED);
			camera_y = lerp(camera_y, target_y, CAMERA_SPEED);
		}
		
		camera_set_view_pos(camera, camera_x, camera_y);
	}
}

#endregion