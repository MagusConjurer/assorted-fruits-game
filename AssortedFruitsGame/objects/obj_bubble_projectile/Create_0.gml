/// @description 

event_inherited();

image_xscale = bh_get_bubble_projectile_scale();
image_yscale = bh_get_bubble_projectile_scale();

// Have it shoot out in a random direction
xDirection = random_range(-1, 1);
yDirection = random_range(-1, 1);

moveSpeed = BH_BUBBLE_PROJECTILE_SPEED;

damage = BH_BUBBLE_PROJECTILE_DAMAGE;