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
		
		if(status > 0)
		{
			bh_vignette_increasing = true;
			// Check if it is less that the starting index plus the amount of change that should have taken place
			if(bh_vignette_index < BH_VIGNETTE_START_INDEX + (status * bh_vignette_changes_per))
			{
				if(alarm_get(3) < 0)
				{
					alarm_set(3, BH_VIGNETTE_DELAY_TIME * 60);
				}
			}
		}
		else if(status < 1 && bh_vignette_index > 0)
		{
			bh_vignette_increasing = false;
			
			if(alarm_get(3) < 0)
			{
				alarm_set(3, BH_VIGNETTE_DELAY_TIME * 60);
			}
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
		for(i = 0; i < num_checkpoints; i++)
		{
			bh_checkpoint_status[i] = false;
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
		bh_dia_seq = layer_sequence_create("Bullet_Hell",0,0,seq_bh_dialogue);
		_seq_inst  = layer_sequence_get_instance(bh_dia_seq);
	
		bh_dia_active_text = instance_create_layer(global.resolution_w * 1.25, 0,"Bullet_Hell",obj_bh_text);
		bh_dia_active_text.bh_dialogue = dialogue;
	
		sequence_instance_override_object(_seq_inst, obj_bh_text, bh_dia_active_text);
		
		bh_dia_seq_created = true;
	}
}

// Called by seq_bh_dialogue moment
function bh_remove_dialogue()
{
	if(sequence_exists(seq_bh_dialogue))
	{
		with(obj_game)
		{
			instance_destroy(obj_bh_text);			
			layer_sequence_destroy(bh_dia_seq);
			bh_dia_seq_created = false;
			bh_dia_active_text = 0;
		}
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
				bh_ability_cooldown = BH_DASH_COOLDOWN;
			break;
			case BH_ABILITY_SHIELD:
				bh_ability_cooldown = BH_SHIELD_COOLDOWN;
			break;
			case BH_ABILITY_HEAL:
				bh_ability_cooldown = BH_HEAL_COOLDOWN;
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

function bh_set_ability_one_duration(duration)
{
	with(obj_ability_one_button)
	{
		alarm_set(0, duration);
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
		
		if(is_first)
		{
			// Returns a negative number when no instance is there
			if(instance_position(x_pos, y_pos, obj_bubble_parent) < 0)
			{
				_inst = instance_create_layer(x_pos, y_pos, "Bullet_Hell", bh_bubble_type);
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
			_inst = instance_create_layer(x_pos, y_pos, "Bullet_Hell", bh_bubble_type);
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
			while(bubble_rand == bh_prev_bubble_rand)
			{
				bubble_rand = irandom_range(0,bh_bubble_start);
			}
			bh_prev_bubble_rand = bubble_rand;

			bh_spawn_bubble(bubble_rand, is_first);
		}
	}
}

function bh_spawn_initial_bubbles()
{
	with(obj_game)
	{
		for(i=0; i< bh_bubble_start; i++)
		{
			bh_spawn_random_bubble(true);
		}
	}
}

/// Called by the bubble objects
function bh_bubble_destroyed(by_player){
	play_sfx(AUDIO_BUBBLE_POP);
	
	loop_amount = bh_get_num_projectiles();
	for(i = 0; i < loop_amount; i++) {
		instance_create_layer(x,y,"Bullet_Hell",obj_bubble_projectile);
	}

	with(obj_game)
	{
		num_active_bubbles--;
		bh_bubbles_popped++;
		
		if(by_player)
		{
			bh_update_progress_bar(BH_BUBBLE_POP_PROGRESS);
		}
	}
	
}

function bh_get_bubble_pop_time()
{
	with(obj_game)
	{
		return bh_bubble_pop_time;
	}
}

function bh_get_bubble_move_speed()
{
	with(obj_game)
	{
		// Can add switch on which battle we are in
		return bh_bubble_move_speed;
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

function bh_apply_progress_boost()
{
	bh_update_progress_bar(BH_BOOST_PROGRESS);
	with(obj_game)
	{
		bh_progress_bar.progress_pulse_color = C_STELLA;
		bh_progress_bar.progress_pulse_frames = BH_BOOST_PULSE_TIME * 60;
		bh_first_boost_used = true;
		
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