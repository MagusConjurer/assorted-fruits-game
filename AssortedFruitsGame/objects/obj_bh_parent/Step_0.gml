/// @description 

if(global.game_state == active_state)
{	
	depth = BH_DEPTH;
	image_speed = animated_speed;
} 
else
{
	depth = DARKENING_DEPTH + 1;
	image_speed = 0;
}

