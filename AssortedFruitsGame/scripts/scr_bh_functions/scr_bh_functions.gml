/// @description Functions for the obj_game to handle bullet hell actions

function bh_update()
{
	if (global.game_state == BULLET_HELL && bh_active == true)
	{
		// Time in seconds
		dt = delta_time / 1000000;
		bh_time_spent += dt;
		
		if(bh_seq_paused)
		{
			bh_resume_sequences();
		}
		
		bh_update_progress_bar(dt * BH_TIME_PROGRESS_PERCENTAGE);
		
		bh_check_checkpoint();
		
		if(bh_start_seq != 0 && layer_sequence_is_finished(bh_start_seq))
		{
			layer_sequence_destroy(bh_start_seq);
			bh_start_seq = 0;
		}
		
		if(bh_boost_seq != 0 && layer_sequence_is_finished(bh_boost_seq))
		{
			layer_sequence_destroy(bh_boost_seq);
			bh_boost_seq = 0;
		}

		if(bh_player_health <= 0)
		{
			bh_lose_action();
			
			bh_cleanup();
		} 
		else if(bh_progress_bar.current_value >= 1)
		{
			bh_win_action(global.current_level);
			
			bh_cleanup();
		}
		else if(alarm_get(0) < 0) 
		{
			alarm_set(0,60 * bh_bubble_spawn_time);
		}
	}
	else if (global.game_state != BULLET_HELL && bh_active == true)
	{
		if(!bh_seq_paused)
		{
			bh_pause_sequences();
		}
	}
}

function bh_start(level){
	bh_active = true;

	bh_player = instance_create_layer(camera_x + (camera_width * 0.2), camera_y + (camera_height * 0.5), "Bullet_Hell", obj_player_bh);

	bubble_height = sprite_get_height(spr_wordbubble_combined) * 0.2;
	
	bh_start_value_init();
	
	possible_bubble_spots	= (camera_height - bubble_height) / bh_bubble_start;
	
	// UI
	if(global.bh_ability_one > 0)
	{
		instance_create_layer(BH_UI_MARGIN * 2, BH_UI_MARGIN * 2, "Bullet_Hell", obj_ability_one_button);
	}
	
	// Setup the dialogue for during the battle
	bh_dia_text = [];
	if(level == LEVEL_2_BUS_BATTLE)
	{
		bh_bubble_type = BH_BUBBLE_BUSGUY;
		bh_dia_text = get_bus_battle_dialogue();
	}
	else if(level == LEVEL_5_DINNER_BATTLE)
	{
		if(bh_player_attacks())
		{
			bh_bubble_start = BH_S_DINNER_BUBBLE_START;
			bh_bubbles_per_spawn = BH_S_DINNER_BUBBLE_PER_SPAWN;
			bh_bubble_max = BH_S_DINNER_BUBBLE_MAX;
			bh_bubble_spawn_time = BH_S_SECONDS_DINNER_SPAWNS;
		}
		else
		{
			bh_bubble_start = BH_NS_DINNER_BUBBLE_START;
			bh_bubbles_per_spawn = BH_NS_DINNER_BUBBLE_PER_SPAWN;
			bh_bubble_max = BH_NS_DINNER_BUBBLE_MAX;
			bh_bubble_spawn_time = BH_NS_SECONDS_DINNER_SPAWNS;
		}
		
		if(bh_dinner_choice == BH_BATTLE_MOM)
		{
			bh_bubble_type = BH_BUBBLE_MOM;
			bh_dia_text = get_mom_battle_dialogue();
		}
		else if(bh_dinner_choice == BH_BATTLE_DAD)
		{
			bh_bubble_type = BH_BUBBLE_DAD;
			bh_dia_text = get_dad_battle_dialogue();
		}
		else if(bh_dinner_choice == BH_BATTLE_UNCLE)
		{
			bh_bubble_type = BH_BUBBLE_UNCLE;
			bh_dia_text = get_uncle_battle_dialogue();
		}
	}
	
	bh_progress_bar = instance_create_layer(0, BH_UI_MARGIN, "Bullet_Hell", obj_progress_bar);
	bh_set_progress_icon();

	bh_setup_checkpoints();
	
	alarm[1] = BH_SECONDS_BEFORE_BOOST * 60; // seconds * FPS
	
	// First wall of bubbles
	bh_spawn_initial_bubbles();
	
	bh_run_start_seq();
}

function bh_start_value_init()
{
	if(bh_busstop_choice == BH_NO_RESPONSE)
	{
		bh_player.chose_to_fight_back = false;
		
		bh_bubble_max				= BH_NS_MAX_BUBBLES;
		bh_bubble_start				= BH_NS_NUM_STARTING_BUBBLES;
		bh_bubble_spawn_time		= BH_NS_SECONDS_BETWEEN_SPAWNS;
		bh_bubble_start_health		= BH_NS_STARTING_BUBBLE_HEALTH;
		bh_bubbles_per_spawn		= BH_NS_NUM_BUBBLES_PER_SPAWN;
		bh_bubble_projectiles		= BH_NS_NUM_BUBBLE_PROJECTILES;
		bh_bubble_projectiles_scale = BH_NS_BUBBLE_PROJECTILE_SCALE;
		bh_bubble_pop_time			= BH_NS_BUBBLE_TIME_BEFORE_POPPING;
		bh_bubble_move_speed		= BH_NS_BUBBLE_MOVE_SPEED;
	}
	else
	{
		bh_player.chose_to_fight_back = true;
		
		bh_bubble_max				= BH_S_MAX_BUBBLES;
		bh_bubble_start				= BH_S_NUM_STARTING_BUBBLES;
		bh_bubble_spawn_time		= BH_S_SECONDS_BETWEEN_SPAWNS;
		bh_bubble_start_health		= BH_S_STARTING_BUBBLE_HEALTH;
		bh_bubbles_per_spawn		= BH_S_NUM_BUBBLES_PER_SPAWN;
		bh_bubble_projectiles		= BH_S_NUM_BUBBLE_PROJECTILES;
		bh_bubble_projectiles_scale = BH_S_BUBBLE_PROJECTILE_SCALE;
		bh_bubble_pop_time			= BH_S_BUBBLE_TIME_BEFORE_POPPING;
		bh_bubble_move_speed		= BH_S_BUBBLE_MOVE_SPEED;
	}
	
	bh_time_spent = 0;
	bh_vignette_index = 0
	bh_vignette_target_index = 0;
	
	bh_bubbles_popped = 0;
	num_active_bubbles = 0;
	
	bh_dia_seq_created = false;
	bh_seq_paused = false;
	bh_dia_seq = 0;
	bh_start_seq = 0;
	bh_boost_seq = 0;
	
	bh_boost_available = false;
	bh_first_boost_used = false;
	
	// Player	
	bh_player_health = BH_PLAYER_HEALTH_DEFAULT;
}

#region BH PLAYER

function bh_update_player_health(change)
{
	with(obj_game)
	{
		if(bh_player_health + change < BH_PLAYER_HEALTH_DEFAULT)
		{
			bh_player_health = bh_player_health + change;
		}
		else
		{
			bh_player_health = BH_PLAYER_HEALTH_DEFAULT;
		}
		
		bh_update_vignette();
	}
}

function bh_get_player_health()
{
	with(obj_game)
	{
		return bh_player_health;
	}
}

function bh_update_vignette()
{
	with(obj_game)
	{
		status = BH_PLAYER_HEALTH_DEFAULT - bh_player_health;
		
		bh_vignette_target_index = BH_VIGNETTE_START_INDEX + (status * bh_vignette_changes_per);
		
		if(bh_vignette_target_index < BH_VIGNETTE_START_INDEX)
		{
			bh_vignette_target_index = BH_VIGNETTE_START_INDEX;
		}
		else if(bh_vignette_target_index > bh_vignette_levels_total)
		{
			bh_vignette_target_index = bh_vignette_levels_total;
		}
		
		if(bh_vignette_index != bh_vignette_target_index && alarm_get(3) < 0)
		{
			alarm_set(3, BH_VIGNETTE_DELAY_TIME * 60);
		}
	}
}

function bh_player_attacks()
{
	with(obj_game)
	{
		return bh_busstop_choice;
	}
}

function bh_player_ability_one_available()
{
	with(obj_game)
	{
		return global.bh_ability_one > 0;
	}
}
#endregion

#region BH SEQUENCES (Start, Dialogue, etc)

// Dialogue checkpoints
function bh_setup_checkpoints()
{
	with(obj_game)
	{
		bh_checkpoint_status = [];
		num_checkpoints = array_length(bh_dia_text);
		
		i = 0;
		repeat(num_checkpoints)
		{
			bh_checkpoint_status[i] = false;
			i++;
		}
		
		bh_checkpoint_size = 1.0 / num_checkpoints;
		bh_next_checkpoint = 0;
	}
}

function bh_check_checkpoint()
{
	with(obj_game)
	{
		current_progress = bh_progress_bar.current_value;
		
		if(bh_next_checkpoint < array_length(bh_dia_text) && current_progress > bh_next_checkpoint * bh_checkpoint_size)
		{
			if(bh_checkpoint_status[bh_next_checkpoint] == false)
			{
				if(!bh_dia_seq_created)
				{
					bh_checkpoint_status[bh_next_checkpoint] =  true;
				
					bh_show_dialogue(bh_dia_text[bh_next_checkpoint]);
				
					bh_next_checkpoint++;
				}
			}
		}
	}
}

function bh_show_dialogue(dialogue)
{
	with(obj_game)
	{		
		rand_y = irandom_range(-BH_DIALOGUE_VARIATION_FROM_CENTER, BH_DIALOGUE_VARIATION_FROM_CENTER);
		
		bh_dia_active_text = instance_create_layer(0, 0,"Bullet_Hell",obj_bh_text);
		bh_dia_active_text.bh_dialogue = dialogue;
		
		// Testing out custom sequence for variable y value
		my_seq = sequence_create();
		my_seq.length = 600;
		my_seq.playbackSpeed = 60;
		my_seq.xorigin = -960;
		my_seq.yorigin = -540;
		my_seq.name = "bh_dialogue_text_seq";
		
		tracks[0] = sequence_track_new(seqtracktype_instance);
		tracks[0].name = "obj_bh_text";
		inst_frames[0] = sequence_keyframe_new(seqtracktype_instance);
		inst_frames[0].frame = 0;
		inst_frames[0].length  = 600;
		inst_data[0] = sequence_keyframedata_new(seqtracktype_instance);
		inst_data[0].channel = 0;
		inst_data[0].objectIndex = obj_bh_text;
		inst_frames[0].channels = inst_data;
		tracks[0].keyframes = inst_frames;
		
		sub_tracks[0] = sequence_track_new(seqtracktype_real);
		sub_tracks[0].name = "position";
		sub_tracks[0].interpolation = 1;
		
		sub_keys[0] = sequence_keyframe_new(seqtracktype_real);
		sub_keys[0].frame = 0;
		sub_keys[0].length = 1;
		sub_keys[1] = sequence_keyframe_new(seqtracktype_real);
		sub_keys[1].frame = 599;
		sub_keys[1].length = 1;
	
		first_key_data[0] = sequence_keyframedata_new(seqtracktype_real);
		first_key_data[0].channel = 0;
		first_key_data[0].value = 1250;
		first_key_data[1] = sequence_keyframedata_new(seqtracktype_real);
		first_key_data[1].channel = 1;
		first_key_data[1].value = rand_y;
		
		second_key_data[0] = sequence_keyframedata_new(seqtracktype_real);
		second_key_data[0].channel = 0;
		second_key_data[0].value = -2500;
		second_key_data[1] = sequence_keyframedata_new(seqtracktype_real);
		second_key_data[1].channel = 1;
		second_key_data[1].value = rand_y;

		sub_keys[0].channels = first_key_data;
		sub_keys[1].channels = second_key_data;
				
		moment_key[0] = sequence_keyframe_new(seqtracktype_moment);
		moment_key[0].frame = 599;
		moment_key[0].length = 0;
		
		moment_data[0] = sequence_keyframedata_new(seqtracktype_moment);
		moment_data[0].channel = 0;
		moment_data[0].event = method(moment_data[0], bh_remove_dialogue);
		
		moment_key[0].channels = moment_data;
		
		sub_tracks[0].keyframes = sub_keys;
		tracks[0].tracks = sub_tracks;
		my_seq.tracks = tracks;
		my_seq.momentKeyframes = moment_key;
		
		bh_dia_seq = layer_sequence_create("Bullet_Hell",0,0,my_seq);
		_seq_inst  = layer_sequence_get_instance(bh_dia_seq);
		
		sequence_instance_override_object(_seq_inst, obj_bh_text, bh_dia_active_text);
		
		show_debug_message([bh_dia_active_text.x,bh_dia_active_text.y]);
		
		bh_dia_seq_created = true;
	}
}

// Called by the sequence moment above
function bh_remove_dialogue()
{
	with(obj_game)
	{
		instance_destroy(obj_bh_text);			
		layer_sequence_destroy(bh_dia_seq);
		bh_dia_seq_created = false;
		bh_dia_active_text = 0;
	}
}

function bh_dialogue_active()
{
	with(obj_game)
	{
		return bh_dia_active_text != 0;
	}
}

function bh_collides_with_dialogue(x_pos, y_pos)
{
	with(obj_game)
	{
		with(bh_dia_active_text)
		{			
			return point_in_rectangle(get_guix(x_pos), get_guiy(y_pos), left_x, top_y, right_x, bot_y);
		}
	}
}

function bh_run_start_seq()
{
	with(obj_game)
	{	
		bh_start_seq = layer_sequence_create("Bullet_Hell",0,0,seq_bh_start);
	}
}

function bh_run_boost_seq()
{
	with(obj_game)
	{
		bh_boost_seq = layer_sequence_create("Bullet_Hell",0,0,seq_bh_boost_hint);
	}
}

function bh_pause_sequences() 
{
	with(obj_game)
	{		
		if(bh_dia_seq != 0)
		{		
			layer_sequence_pause(bh_dia_seq);
		}
		
		if(bh_start_seq != 0)
		{
			layer_sequence_pause(bh_start_seq);
		}
		
		if(bh_boost_seq != 0)
		{
			layer_sequence_pause(bh_boost_seq);
		}
		
		bh_seq_paused = true;
	}
}

function bh_resume_sequences()
{
	with(obj_game)
	{
		if(bh_dia_seq != 0)
		{
			layer_sequence_play(bh_dia_seq);
		}
		
		if(bh_start_seq != 0)
		{
			layer_sequence_play(bh_start_seq);
		}
		
		if(bh_boost_seq != 0)
		{
			layer_sequence_play(bh_boost_seq);
		}
		
		bh_seq_paused = false;
	}
}

#endregion

#region PROGRESS BAR

function bh_update_progress_bar(increment)
{
	with(obj_game)
	{
		bh_progress_bar.current_value += increment;
	}
}

function bh_set_progress_icon()
{
	with(obj_game)
	{
		if(global.current_level == LEVEL_2_BUS_BATTLE)
		{
			bh_progress_bar.progress_icon = BH_BUS_ICON;
		}
		else if (global.current_level == LEVEL_5_DINNER_BATTLE)
		{
			bh_progress_bar.progress_icon = BH_BED_ICON;
		}
	}
}

#endregion

#region ABILIITIES

function bh_set_ability(ability)
{
	with(obj_game)
	{
		bh_ability_index = ability;
		switch(ability) {
			case BH_ABILITY_DASH:
				bh_ability_cooldown = BH_DASH_COOLDOWN_TIME * 60;
			break;
			case BH_ABILITY_SHIELD:
				bh_ability_cooldown = BH_SHIELD_COOLDOWN_TIME * 60;
			break;
			case BH_ABILITY_HEAL:
				bh_ability_cooldown = BH_HEAL_COOLDOWN_TIME * 60;
			break;
			default:
				bh_ability_index = 0;
				bh_ability_cooldown = 1;
			break;
		}
		
		if(global.bh_ability_one == 0)
		{
			global.bh_ability_one = ability;
		}
	}

}

function bh_ability(ability)
{
	with(obj_player_bh) {
		event_user(ability);
	}
}

function bh_reset_ability_one()
{
	with(obj_ability_one_button)
	{
		alarm_set(0, 1);
	}
}
#endregion

#region BUBBLES
function bh_spawn_bubble(y_index, is_first)
{
	with(obj_game)
	{
		x_pos = camera_x + (camera_width * 0.9);
		y_pos = camera_y + (0.5 * bubble_height) + (possible_bubble_spots * y_index);
		
		if(global.current_level == LEVEL_5_DINNER_BATTLE)
		{
			bubble_type = bh_get_dinner_type_to_spawn();
		}
		else
		{
			bubble_type = bh_bubble_type;
		}
		
		if(is_first)
		{
			// Returns a negative number when no instance is there
			if(instance_position(x_pos, y_pos, obj_bubble_parent) < 0)
			{
				_inst = instance_create_layer(x_pos, y_pos, "Bullet_Hell", bubble_type);
				_inst.image_xscale = 0.4;
				_inst.image_yscale = 0.4;

				num_active_bubbles++;
			}
			else
			{
				bh_spawn_random_bubble(is_first);
			}
		}
		else
		{
			_inst = instance_create_layer(x_pos, y_pos, "Bullet_Hell", bubble_type);
			_inst.image_xscale = 0.4;
			_inst.image_yscale = 0.4;

			num_active_bubbles++;
		}
	}
}


function bh_spawn_random_bubble(is_first){	
	with(obj_game)
	{
		if(num_active_bubbles <= bh_bubble_max && bh_active == true)
		{
			bubble_rand = irandom_range(0,bh_bubble_start);

			bh_spawn_bubble(bubble_rand, is_first);
		}
	}
}

function bh_spawn_initial_bubbles()
{
	with(obj_game)
	{
		repeat(bh_bubble_start)
		{
			bh_spawn_random_bubble(true);
		}
	}
}

function bh_get_dinner_type_to_spawn()
{
	pick = random(1);
	alt_prob = (1 - (BH_MAIN_BUBBLE_PERCENTAGE)) / 2;
	
	switch(bh_bubble_type)
	{
		case BH_BUBBLE_MOM:
			alt_type_1 = BH_BUBBLE_DAD;
			alt_type_2 = BH_BUBBLE_UNCLE;
		break;
		case BH_BUBBLE_DAD:
			alt_type_1 = BH_BUBBLE_MOM;
			alt_type_2 = BH_BUBBLE_UNCLE;
		break;
		case BH_BUBBLE_UNCLE:
			alt_type_1 = BH_BUBBLE_MOM;
			alt_type_2 = BH_BUBBLE_DAD;
		break;
	}
	
	if(pick < BH_MAIN_BUBBLE_PERCENTAGE)
	{
		return bh_bubble_type;
	}
	else if(pick < BH_MAIN_BUBBLE_PERCENTAGE + alt_prob)
	{
		return alt_type_1;
	}
	else
	{
		return alt_type_2;
	}
	
}

/// Called by the bubble objects
function bh_bubble_destroyed(by_player){
	play_sfx(AUDIO_BUBBLE_POP);
	
	with(obj_game)
	{
		num_active_bubbles--;
		bh_bubbles_popped++;
	}
	
	if(by_player)
	{
		loop_amount = BH_S_NUM_POPPED_PROJECTILES;
	}
	else
	{
		loop_amount = bh_get_num_projectiles();
	}
	
	repeat(loop_amount)
	{
		instance_create_layer(x,y,"Bullet_Hell",obj_bubble_projectile);
	}
}

function bh_get_bubble_pop_time()
{
	with(obj_game)
	{
		return bh_bubble_pop_time;
	}
}

function bh_get_bubble_move_speed(type)
{
	with(obj_game)
	{
		// Can add switch on which battle we are in
		if(bh_player_attacks())
		{
			switch(type)
			{
				case BH_BUBBLE_MOM:
					return BH_S_MOM_BUBBLE_MOVE_SPEED;
				case BH_BUBBLE_DAD:
					return BH_S_DAD_BUBBLE_MOVE_SPEED;
				case BH_BUBBLE_UNCLE:
					return BH_S_UNCLE_BUBBLE_MOVE_SPEED;
				default:
					return bh_bubble_move_speed;
			}
		}
		else
		{
			switch(type)
			{
				case BH_BUBBLE_MOM:
					return BH_NS_MOM_BUBBLE_MOVE_SPEED;
				case BH_BUBBLE_DAD:
					return BH_NS_DAD_BUBBLE_MOVE_SPEED;
				case BH_BUBBLE_UNCLE:
					return BH_NS_UNCLE_BUBBLE_MOVE_SPEED;
				default:
					return bh_bubble_move_speed;
			}
		}
		
	}
}

function bh_get_bubble_start_health()
{
	with(obj_game)
	{
		// Can add switch on which battle we are in
		return bh_bubble_start_health;
	}
}

function bh_get_bubble_projectile_scale()
{
	with(obj_game)
	{
		return bh_bubble_projectiles_scale;
	}
}

function bh_get_num_projectiles()
{
	with(obj_game)
	{
		return bh_bubble_projectiles;
	}
}

#endregion

#region BOOST

function bh_spawn_progress_boost()
{
	with(obj_game)
	{
		if(!bh_boost_available)
		{
			x_pos = camera_x + (BH_UI_MARGIN * 3);
			rand_y_pos = irandom_range(camera_y + BH_UI_MARGIN, camera_y + camera_height - BH_UI_MARGIN);
			
			instance_create_layer(x_pos,rand_y_pos,"Bullet_Hell",obj_bubble_boost);
			
			bh_boost_available = true;
			play_sfx(AUDIO_BOOST_AVAILABLE);
		
			if(!bh_first_boost_used)
			{
				bh_run_boost_seq();
			}
		}
	}
}

function bh_apply_progress_boost(grabbed)
{
	with(obj_game)
	{
		if(grabbed)
		{
			bh_update_progress_bar(BH_BOOST_PROGRESS);
		
			bh_progress_bar.progress_pulse_color = C_STELLA;
			bh_progress_bar.progress_pulse_frames = BH_BOOST_PULSE_TIME * 60;
			bh_first_boost_used = true;
		}
		
		bh_boost_available = false;
		alarm[1] = BH_SECONDS_BEFORE_BOOST * 60;
	}
}

#endregion

#region BOUNDS CHECKING
function bh_is_outside_bounds_x(new_x, spr_width)
{
	with(obj_game)
	{
		if(new_x + spr_width/2 > camera_x + camera_width || new_x - spr_width/2 < camera_x)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}

function bh_is_outside_bounds_y(new_y, spr_height)
{
	with(obj_game)
	{
		if(new_y + spr_height/2 > camera_y + camera_height || new_y - spr_height/2 < camera_y)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
#endregion

#region MANUAL DARKENING

function bh_darken_object_rect(x1, y1, x2, y2)
{
	// Draw dark transparent rectangle over it
	draw_set_color(c_black);
	draw_set_alpha(PERCENT_TO_DARKEN);
	draw_rectangle(x1,y1, x2, y2, false);
	// Reset the alpha value
	draw_set_alpha(1.0);
}

function bh_darken_object_circle(x1,y1,rad)
{
	// Draw dark transparent rectangle over it
	draw_set_color(c_black);
	draw_set_alpha(PERCENT_TO_DARKEN);
	draw_circle(x1,y1,rad,false);
	// Reset the alpha value
	draw_set_alpha(1.0);
}

#endregion

function bh_lose_action()
{
	play_sfx(AUDIO_GAME_OVER);
	
	if(!instance_exists(obj_transition_parent))
	{
		instance_create_layer(0,0,"Background",obj_bh_lose_transition);
	}
	
	if(alarm_get(2) < 0)
	{
		alarm_set(2, BH_AUTO_RESTART_SECONDS * 60);
	}
}

function bh_win_action(level)
{
	if(level == LEVEL_2_BUS_BATTLE)
	{
		level_completed[level] = true;
		global.current_level = LEVEL_3_CAFE;
		
		play_sfx(AUDIO_BUS_TRANSITION);
		
		bus_stop_win_text = "Ah, the bus! This is my chance to get the hell out of here.";
	
		dialogue_set_nonstandard_text(bus_stop_win_text);
		set_game_state_and_start(PRE_TRANSITION);
	}
	else if(level == LEVEL_5_DINNER_BATTLE)
	{
		level_completed[level] = true;
		global.current_level = LEVEL_6_BEDROOM;
		
		dinner_win_text = "Screw you guys. I'm going to my room.";
		
		dialogue_set_nonstandard_text(dinner_win_text);
		set_game_state_and_start(PRE_TRANSITION);
	}
}

// Destroys all BH instances
function bh_cleanup()
{
	with(obj_game)
	{
		instance_destroy(obj_player_bh);
		instance_destroy(obj_progress_bar);
		instance_destroy(obj_bh_parent);
	
		bh_active = false;
	
		// Stop all alarms that spawn bh stuff
		alarm[0] = -1;
		alarm[1] = -1;
	}
}