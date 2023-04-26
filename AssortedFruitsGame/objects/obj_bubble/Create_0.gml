/// @description

event_inherited();

x_direction = -1;

sprites = [spr_bus_bubble_0,
			spr_bus_bubble_1,
			spr_bus_bubble_2,
			spr_bus_bubble_3,
			spr_bus_bubble_4];

bubble_speed = bh_get_bubble_move_speed(BH_BUBBLE_BUSGUY);
bubble_starting_health = bh_get_bubble_start_health();

bubble_current_health = bubble_starting_health;

bubble_color = c_red;
