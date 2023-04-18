/// @description 
room_goto(target_room);
	
with(obj_game)
{
	viewport_setup = false;
}

if(reversible)
{
	image_speed = -1;
}
else
{
	image_speed = 0;
	image_index = 0;
}