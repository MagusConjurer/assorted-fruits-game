/// @description 

if ((check_level_completed(LEVEL_0_BEDROOM) && global.current_room == ROOM_BEDROOM) ||
	(check_level_completed(LEVEL_3_CAFE) && global.current_room == ROOM_CAFE))
{
	room_transition(LEVEL_1_BUS_STOP);
}

