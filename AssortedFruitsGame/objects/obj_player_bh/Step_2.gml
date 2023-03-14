/// @description Movement finalized


// Checks collision with bubbles
if(place_meeting(x + xSpeed, y, obj_bubble))
{
	xSpeed = 0;
}
if(place_meeting(x, y + ySpeed, obj_bubble))
{
	ySpeed = 0;
}

// Inherit the parent event (bounding box check, and final movement.
event_inherited();

