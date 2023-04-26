/// @description 

xSpeed = 0;
ySpeed = 0;
h_direction = 0;
v_direction = 0;

moveSpeed = WALKING_SPEED;
active_state = OVERWORLD;

image_speed = 0;

sprite[UP] = Alex_stand_B;
sprite[DOWN] = Alex_stand_R;
sprite[LEFT] = Alex_walk_L;
sprite[RIGHT] = Alex_walk_R;

facing_forward = true;
facing_left = true;

if(room == ROOM_OUTSIDE && check_level_completed(LEVEL_3_CAFE))
{
	x = 160;
	y = 900;
}
else if(room == ROOM_DINNER)
{
	x = 500;
	y = 650;
}
else if(room == ROOM_BEDROOM && check_level_completed(LEVEL_5_DINNER_BATTLE))
{
	x = 560;
	y = 850;
}