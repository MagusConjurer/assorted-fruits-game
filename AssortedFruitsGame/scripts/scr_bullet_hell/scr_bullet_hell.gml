function start_bullet_hell(bubbleXPosition){
	instance_create_layer(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "Bullet_Hell", obj_player_bh);
	
	instance_create_layer(bubbleXPosition, room_height * 0.25, "Bullet_Hell", obj_bubble);
	
	obj_game.num_active_bubbles = 1;
}

function spawn_new_bubble(bubbleXPosition){
	if(obj_game.num_active_bubbles <= BH_MAX_BUBBLES && obj_game.bh_active == true)
	{
		variance = random_range(-100,100);

		instance_create_layer(bubbleXPosition + variance, room_height * 0.25, "Bullet_Hell", obj_bubble);
		obj_game.num_active_bubbles++;
	}
}

function bubble_destroyed(){
	for(i = 0; i < BH_NUM_BUBBLE_PROJECTILES; i++) {
		instance_create_layer(x,y,"Bullet_Hell",obj_bubble_projectile);
	}
	
	obj_game.num_active_bubbles--;
	obj_game.bubble_popped_time = obj_game.bh_time_spent;
}

function get_time_since_bubble_popped()
{
	return obj_game.bh_time_spent - obj_game.bubble_popped_time;
}

function update_player_health(change)
{
	obj_game.bh_player_health += change;
}

function bh_status_1()
{
	return obj_game.bh_player_health < BH_PLAYER_HEALTH_DEFAULT * .75 || get_time_since_bubble_popped() > 5;
}

function bh_status_2()
{
	return obj_game.bh_player_health < BH_PLAYER_HEALTH_DEFAULT * .5 || get_time_since_bubble_popped() > 10;
}

function bh_status_3()
{
	return obj_game.bh_player_health < BH_PLAYER_HEALTH_DEFAULT * .25 || get_time_since_bubble_popped() > 15;
}

// Destroys all BH instances and updates the game state back to the Overworld
function bh_cleanup()
{
	instance_destroy(obj_player_bh);
	instance_destroy(obj_bh_parent);
	
	global.prev_state = BULLET_HELL;
	global.game_state = OVERWORLD;
}