/// @description 

// Inherit the parent event
event_inherited();

if(x > room_width || x < 0 || y > room_height || y < 0)
{
	instance_destroy();
}
