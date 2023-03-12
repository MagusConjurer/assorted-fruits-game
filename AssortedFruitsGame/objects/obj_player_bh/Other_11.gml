/// @description: Dash Ability

moveSpeed = BH_DASH_DISTANCE/BH_DASH_DURATION;
xSpeed = (key_right - key_left) * moveSpeed;
ySpeed = (key_down - key_up) * moveSpeed;

alarm[1] = BH_DASH_DURATION;
