/// @description 

if(sprite_index >= 0)
{
	draw_self();
}

if(global.debugging && can_interact)
{
	draw_circle_color(x,y,radius,c_black,c_red,true);
}

