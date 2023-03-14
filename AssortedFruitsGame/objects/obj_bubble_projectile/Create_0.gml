/// @description 

event_inherited();

image_xscale = BH_STARTING_BUBBLE_PROJECTILE_SCALE;
image_yscale = BH_STARTING_BUBBLE_PROJECTILE_SCALE;

// Have it shoot out in a random direction
xDirection = random_range(-1, 1);
yDirection = random_range(-1, 1);

moveSpeed = BH_BUBBLE_PROJECTILE_SPEED;

damage = BH_BUBBLE_PROJECTILE_DAMAGE;