/// @description Change Room

room_goto(target_room);

with(obj_game)
{
	viewport_setup = false;
	transition_event_hit = true;
}
