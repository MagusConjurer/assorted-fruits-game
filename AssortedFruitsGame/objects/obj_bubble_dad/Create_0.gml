/// @description

event_inherited();

x_direction = -1;

sprite_index = get_random_bubble_sprite_of_type(BH_BUBBLE_DAD);

bubble_speed = bh_get_bubble_move_speed(BH_BUBBLE_DAD);
bubble_starting_health = bh_get_bubble_start_health();
bubble_current_health = bubble_starting_health;

bubble_color = C_DAD;

time_since_switch = 0;
next_switch = random_range (BH_DAD_BUBBLE_TURN_TIME_MIN * 60, 
							BH_DAD_BUBBLE_TURN_TIME_MAX * 60);
