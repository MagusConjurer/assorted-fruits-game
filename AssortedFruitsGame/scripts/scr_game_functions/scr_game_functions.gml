#region ROOM & GAME STATE CHANGES
function set_game_state(new_state)
{
	if(global.game_state != PAUSED)
	{
		global.prev_state = global.game_state;
	}
	
	global.game_state = new_state;
	
	game_state_music_swap();
}

function set_game_state_and_start(new_state)
{	
	state_change_transition(new_state);
	
	if(global.game_state != PAUSED)
	{
		global.prev_state = global.game_state;
		global.game_state = new_state;
		with(obj_game)
		{
			// Only reenter the dialogue or bh if the level is not completed
			if(new_state == DIALOGUE && !level_completed[global.current_level])
			{
				dialogue_start(global.current_level);
			}
			else if(new_state == BULLET_HELL && !level_completed[global.current_level])
			{
				bh_start(global.current_level);
			}
			else if(new_state == ENVIRONMENTAL)
			{
				dialogue_environmental();
			}
			else if (new_state == PRE_TRANSITION)
			{
				dialogue_pre_transition();
			}
			else
			{
				global.game_state = OVERWORLD;
			}
		}
		
		game_state_music_swap();
	}
}

function return_to_prev_state(current_state)
{
	global.game_state = global.prev_state;

	if(current_state != PAUSED)
	{
		global.prev_state = current_state;
	}
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

function room_transition(level)
{
	with(obj_game)
	{
		if(level != LEVEL_X_MENU && !level_completed[level])
		{
			global.current_level = level;
		}
	
		if(level == LEVEL_X_MENU)
		{
			global.current_room = ROOM_MENU;
		}
		else if(level == LEVEL_0_BEDROOM || level == LEVEL_6_BEDROOM)
		{
			global.current_room = ROOM_BEDROOM;
		}
		else if(level == LEVEL_1_BUS_STOP || level == LEVEL_2_BUS_BATTLE)
		{
			global.current_room = ROOM_OUTSIDE;
		}
		else if(level == LEVEL_3_CAFE)
		{
			global.current_room = ROOM_CAFE;
		}
		else if(level == LEVEL_4_DINNER || level == LEVEL_5_DINNER_BATTLE)
		{
			//global.current_room = ROOM_DINNER;
		}
	
		if(!instance_exists(obj_transition_parent))
		{
			instance_create_layer(0,0,"Background",obj_basic_transition);
		}
	}
}

function is_type_of_dialogue()
{
	return (global.game_state == DIALOGUE || global.game_state == ENVIRONMENTAL || global.game_state == PRE_TRANSITION);
}

function game_state_music_swap()
{
	if(global.game_state == OVERWORLD)
	{
		play_background_music(AUDIO_OV_MUSIC);
	}
	else if(global.game_state == BULLET_HELL)
	{
		if(!check_level_completed(LEVEL_2_BUS_BATTLE))
		{
			play_background_music(AUDIO_BH_MUSIC_SIMPLE);
		}
		else
		{
			play_background_music(AUDIO_BH_MUSIC_FULL);
		}
	}
	else if(global.game_state == MENU)
	{
		pause_background_music();
	}
}
#endregion

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
 
function check_level_completed(level)
{
	with(obj_game)
	{
		return level_completed[level];
	}
}

function reset_player_progress()
{
	global.current_level = LEVEL_0_BEDROOM;
	global.current_room = ROOM_MENU;
	global.game_state = MENU;
	global.prev_state = OVERWORLD;

	global.bh_ability_one = 0;
	
	with(obj_game)
	{
		level_completed = [false, false, false, false, false, false, false];
		new_game_started = false;
		ov_player_x = 0;
		ov_player_y = 0;
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
		
		camera_target = obj_player_ov;
		camera_x = get_target_x();
		camera_y = get_target_y();
		
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
		
		if(global.game_state == OVERWORLD && camera_target != 0 && room != ROOM_MENU)
		{
			target_x = get_target_x();
			target_y = get_target_y();
		
			// Smooth movement
			camera_x = lerp(camera_x, target_x, CAMERA_SPEED);
			camera_y = lerp(camera_y, target_y, CAMERA_SPEED);
		}
		
		camera_set_view_pos(camera, camera_x, camera_y);
	}
}

function get_target_x()
{
	target_x = camera_target.x - (camera_width / 2);
	target_x = clamp(target_x, 0, room_width  - camera_width);
	
	return target_x;
}

function get_target_y()
{
	target_y = camera_target.y - (camera_height / 2);
	target_y = clamp(target_y, 0, room_height - camera_height);
	
	return target_y;
}

function get_guix(room_x)
{
	with(obj_game)
	{
		normalized_x = (room_x - camera_x) / camera_width;
		guix = normalized_x * global.resolution_w;
		
		return guix;
	}
}

function get_guiy(room_y)
{
	with(obj_game)
	{
		normalized_y = (room_y - camera_y) / camera_height;
		guiy = normalized_y * global.resolution_h;
		
		return guiy;
	}
}

#endregion