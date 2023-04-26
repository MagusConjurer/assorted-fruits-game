/// @description

event_inherited();

rand_angle = irandom_range(BH_UNCLE_BUBBLE_MIN_ANGLE, BH_UNCLE_BUBBLE_MAX_ANGLE);

sprite_index = get_random_bubble_sprite_of_type(BH_BUBBLE_UNCLE);

x_direction = cos(rand_angle);
y_direction = sin(rand_angle);

bubble_speed = bh_get_bubble_move_speed(BH_BUBBLE_UNCLE);
bubble_starting_health = bh_get_bubble_start_health();
bubble_current_health = bubble_starting_health;

bubble_color = C_UNCLE;
