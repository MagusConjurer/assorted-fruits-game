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
	bh_player = instance_create_layer(camera_x + (camera_width * 0.2), camera_y + (camera_height * 0.5), "Bullet_Hell", obj_player_bh);
	
	// Temporary fix for scaling issue
	bh_player.image_xscale = 0.2;
	bh_player.image_yscale = 0.2;
	
	// UI
	if(global.bh_ability_one > 0)
	{
		instance_create_layer(camera_x + BH_UI_MARGIN, camera_y + BH_UI_MARGIN, "Bullet_Hell", obj_ability_one_button);
	}
	
	bh_progress_bar = instance_create_layer(0, BH_UI_MARGIN, "Bullet_Hell", obj_progress_bar);
	
	// First wall of bubbles
	bh_spawn_initial_bubbles();
}

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

function bh_spawn_bubble(y_index)
{
	x_pos = camera_x + (camera_width * 0.9);
	y_pos = camera_y + (0.5 * bubble_height) + (possible_bubble_spots * y_index);
	
	_inst = instance_create_layer(x_pos, y_pos, "Bullet_Hell", obj_bubble);
	_inst.image_xscale = 0.2;
	_inst.image_yscale = 0.2;

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
		bubble_popped_time = bh_time_spent;
		
		if(by_player)
		{
			bh_update_progress_bar(BH_PLAYER_POP_PROGRESS);
		}
	}
	
}

function bh_update_player_health(change)
{
	obj_game.bh_player_health += change;
}

function bh_update_progress_bar(increment)
{
	obj_game.bh_progress_bar.current_value += increment;
}

function bh_status_index()
{
	with(obj_game)
	{
		return BH_PLAYER_HEALTH_DEFAULT - bh_player_health;
	}
}

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

// Destroys all BH instances and updates the game state back to the Overworld
function bh_cleanup()
{
	instance_destroy(obj_player_bh);
	instance_destroy(obj_bh_parent);
	
	bh_active = false;
	set_game_state(OVERWORLD);
	
	obj_game.alarm[0] = -1;
}