/// @description

event_inherited();

x_direction = -1;

y_rand = irandom_range(-1,1);
while(y_rand == 0)
{
	y_rand = irandom_range(-1,1);
}

y_direction = y_rand;

bubble_speed = bh_get_bubble_move_speed(BH_BUBBLE_UNCLE);
bubble_starting_health = bh_get_bubble_start_health();
bubble_current_health = bubble_starting_health;

bubble_color = C_UNCLE;
