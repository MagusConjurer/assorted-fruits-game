/// @description Functions for the obj_game to handle bullet hell actions

function bh_update()
{
	if (global.game_state == BULLET_HELL && bh_active = false)
	{
		bh_active = true;
	
		bh_start();
	
		bh_time_spent = 0;
	}
	else if (global.game_state == BULLET_HELL && bh_active = true)
	{
		// Time in seconds
		dt = delta_time / 1000000;
		bh_time_spent += dt;
		
		bh_update_progress_bar(dt * BH_TIME_PROGRESS_PERCENTAGE);

		if(bh_player_health <= 0)
		{
			// Put any lose actions here
			// Let player reenter?
			bh_cleanup();
		} 
		else if(bh_progress_bar.current_value >= 1)
		{
			// Put any win actions here
			// Don't let player reenter?
			bh_cleanup();
		}
		else if(alarm_get(0) < 0) 
		{
			alarm_set(0,room_speed * 5);
		}
	}
}


function bh_start(){
	// Player	
	bh_player_health = BH_PLAYER_HEALTH_DEFAULT;
	bh_player = instance_create_layer(camera_x + (camera_width * 0.2), camera_y + (camera_height * 0.5), "Bullet_Hell", obj_player_bh);
	
	// Temporary fix for scaling issue
	bh_player.image_xscale = 0.2;
	bh_player.image_yscale = 0.2;
	
	bh_bubbles_popped = 0;
	num_active_bubbles = 0;
	bubble_height = sprite_get_height(spr_wordbubble_combined) * 0.2;
	possible_bubble_spots = (camera_height - bubble_height) / BH_NUM_STARTING_BUBBLES;
	
	// UI
	if(global.bh_ability_one > 0)
	{
		instance_create_layer(BH_UI_MARGIN * 2, BH_UI_MARGIN * 2, "Bullet_Hell", obj_ability_one_button);
	}
	
	bh_time_spent = 0;
	bh_progress_bar = instance_create_layer(0, BH_UI_MARGIN, "Bullet_Hell", obj_progress_bar);
	bh_set_progress_icon();
	
	bh_boost_available = false;
	alarm[1] = BH_SECONDS_BEFORE_BOOST * 60; // seconds * FPS
	
	// First wall of bubbles
	bh_spawn_initial_bubbles();
}

function bh_update_player_health(change)
{
	obj_game.bh_player_health += change;
}

function bh_status_index()
{
	with(obj_game)
	{
		return BH_PLAYER_HEALTH_DEFAULT - bh_player_health;
	}
}

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
		bh_progress_bar.progress_icon = BH_BUS_ICON;
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
#endregion

#region BUBBLES
function bh_spawn_bubble(y_index)
{
	x_pos = camera_x + (camera_width * 0.9);
	y_pos = camera_y + (0.5 * bubble_height) + (possible_bubble_spots * y_index);
	
	_inst = instance_create_layer(x_pos, y_pos, "Bullet_Hell", obj_bubble);
	_inst.image_xscale = 0.4;
	_inst.image_yscale = 0.4;

	num_active_bubbles++;
}


function bh_spawn_random_bubble(){	
	if(num_active_bubbles <= BH_MAX_BUBBLES && bh_active == true)
	{
		bubble_rand = irandom_range(0,BH_NUM_STARTING_BUBBLES);
		while(bubble_rand == bh_prev_bubble_rand)
		{
			bubble_rand = irandom_range(0,BH_NUM_STARTING_BUBBLES);
		}
		bh_prev_bubble_rand = bubble_rand;

		bh_spawn_bubble(bubble_rand);
	}
}

function bh_spawn_initial_bubbles()
{
	for(i=0; i< BH_NUM_STARTING_BUBBLES; i++)
	{
		bh_spawn_bubble(i);
	}
}

/// Called by the bubble objects
function bh_bubble_destroyed(by_player){
	for(i = 0; i < BH_NUM_BUBBLE_PROJECTILES; i++) {
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

#endregion

#region BOOST

function bh_spawn_progress_boost()
{
	with(obj_game)
	{
		if(!bh_boost_available)
		{
			x_pos = camera_x + BH_UI_MARGIN;
			rand_y_pos = irandom_range(camera_y + BH_UI_MARGIN, camera_y + camera_height - BH_UI_MARGIN);
			
			instance_create_layer(x_pos,rand_y_pos,"Bullet_Hell",obj_bubble_boost);
			
			bh_add_boost_available();
		}
	}
}

function bh_add_boost_available()
{
	with(obj_game)
	{
		bh_boost_available = true;
		instance_create_layer(BH_BOOST_ICON_X, BH_UI_MARGIN * 2, "Bullet_Hell",obj_boost_icon);
		play_sfx(AUDIO_BOOST_AVAILABLE);
	}
}

function bh_remove_boost_available()
{
	with(obj_game)
	{
		bh_boost_available = false;
		instance_destroy(obj_boost_icon);
		alarm[1] = BH_SECONDS_BEFORE_BOOST * 60;
	}
}

function bh_apply_progress_boost()
{
	bh_update_progress_bar(BH_BOOST_PROGRESS);
	with(obj_game)
	{
		bh_progress_bar.progress_pulse_color = C_STELLA;
		bh_progress_bar.progress_pulse_frames = BH_BOOST_PULSE_TIME * 60;
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

// Destroys all BH instances and updates the game state back to the Overworld
function bh_cleanup()
{
	with(obj_game)
	{
		instance_destroy(obj_player_bh);
		instance_destroy(obj_bh_parent);
	
		bh_active = false;
		set_game_state(OVERWORLD);
	
		// Stop all alarms
		alarm[0] = -1;
		alarm[1] = -1;
	}
}