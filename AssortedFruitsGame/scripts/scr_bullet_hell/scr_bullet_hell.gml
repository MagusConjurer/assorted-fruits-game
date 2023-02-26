// 
function start_bullet_hell(bubbleXPosition){
	bh_objects[0] = instance_create_layer(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "Bullet_Hell", obj_player_bh);
	
	instance_create_layer(bubbleXPosition, room_height * 0.25, "Bullet_Hell", obj_bubble);
	
	global.num_active_bubbles = 1;
}

function spawn_new_bubble(bubbleXPosition){
	if(global.num_active_bubbles <= BH_MAX_BUBBLES)
	{
		variance = random_range(-100,100);

		instance_create_layer(bubbleXPosition + variance, room_height * 0.25, "Bullet_Hell", obj_bubble);
		global.num_active_bubbles++;
	}
}

function bubble_destroyed(){
	for(i = 0; i < BH_NUM_BUBBLE_PROJECTILES; i++) {
		instance_create_layer(x,y,"Bullet_Hell",obj_bubble_projectile);
	}
	
	global.num_active_bubbles--;
}