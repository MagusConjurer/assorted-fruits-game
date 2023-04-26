/// @description

event_inherited();

x_direction = -1;

sprites = obj_game.bh_bus_bubbles;
sprite_change_time = 0;
selected_index = 0;

bubble_speed = bh_get_bubble_move_speed(BH_BUBBLE_BUSGUY);
bubble_starting_health = bh_get_bubble_start_health();

bubble_current_health = bubble_starting_health;

bubble_color = c_red;
