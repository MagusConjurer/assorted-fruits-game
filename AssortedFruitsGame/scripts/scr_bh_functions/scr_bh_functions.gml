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
		bh_time_spent += delta_time / 1000000;

		if(bh_player_health <= 0)
		{
			// Put any lose actions here
			// Let player reenter?
			bh_cleanup();
		} 
		else if(bh_bubbles_popped >= BH_NUM_BUBBLES_TO_POP)
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
	instance_create_layer(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "Bullet_Hell", obj_player_bh);
	
	// Ability Buttons
	instance_create_layer(50,RESOLUTION_H - 50, "Bullet_Hell", obj_ability_button);
	
	// First wall of bubbles
	bh_spawn_initial_bubbles();

}

function bh_set_ability(ability)
{
	obj_game.bh_ability_index = ability;
	switch(ability) {
		case BH_ABILITY_DASH:
			obj_game.bh_ability_cooldown = BH_DASH_COOLDOWN;
		break;
		case BH_ABILITY_SHIELD:
			obj_game.bh_ability_cooldown = BH_SHIELD_COOLDOWN;
		break;
		case BH_ABILITY_HEAL:
			obj_game.bh_ability_cooldown = BH_HEAL_COOLDOWN;
		break;
		default:
			obj_game.bh_ability_index = 0;
			obj_game.bh_ability_cooldown = 1;
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
	x_pos = room_width * 0.9;
	y_pos = (0.5 * bubble_height) + (possible_bubble_spots * y_index);
	
	show_debug_message(["Spawning new bubble at y = ", y_pos]);
	
	instance_create_layer(x_pos, y_pos, "Bullet_Hell", obj_bubble);

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
function bh_bubble_destroyed(){
	for(i = 0; i < BH_NUM_BUBBLE_PROJECTILES; i++) {
		instance_create_layer(x,y,"Bullet_Hell",obj_bubble_projectile);
	}
	
	obj_game.num_active_bubbles--;
	obj_game.bh_bubbles_popped++;
	obj_game.bubble_popped_time = obj_game.bh_time_spent;
}

function bh_time_since_bubble_popped()
{
	return obj_game.bh_time_spent - obj_game.bubble_popped_time;
}

function bh_update_player_health(change)
{
	obj_game.bh_player_health += change;
}

function bh_status_1()
{
	return obj_game.bh_player_health < BH_PLAYER_HEALTH_DEFAULT * .75 || bh_time_since_bubble_popped() > 5;
}

function bh_status_2()
{
	return obj_game.bh_player_health < BH_PLAYER_HEALTH_DEFAULT * .5 || bh_time_since_bubble_popped() > 10;
}

function bh_status_3()
{
	return obj_game.bh_player_health < BH_PLAYER_HEALTH_DEFAULT * .25 || bh_time_since_bubble_popped() > 15;
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