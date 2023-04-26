/// @description

event_inherited();

x_direction = -1;

sprites = [spr_mom__1_,
			spr_mom__2_,
			spr_mom__3_,
			spr_mom__4_];

bubble_speed = bh_get_bubble_move_speed(BH_BUBBLE_MOM);
bubble_starting_health = bh_get_bubble_start_health();
bubble_current_health = bubble_starting_health;

bubble_color = C_MOM;

radius = irandom_range(BH_MOM_BUBBLE_RADIUS_MIN, BH_MOM_BUBBLE_RADIUS_MAX);
counter_clockwise = irandom(1);
current_angle = 0;
rot_direction = 0;

if(counter_clockwise)
{
	rot_direction = -1;
}
else
{
	rot_direction = 1;
}

center_x = x - radius;
center_y = y;
