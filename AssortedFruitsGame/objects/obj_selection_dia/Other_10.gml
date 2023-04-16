if(global.current_level == LEVEL_1_BUS_STOP)
{
	dialogue_set_bus_stop_choice(choice_index);
}
else if(global.current_level == LEVEL_3_CAFE)
{
	bh_set_ability(choice_index);
}
else if(global.current_level == LEVEL_4_DINNER)
{
	dialogue_set_dinner_choice(choice_index);
}

dialogue_jump_to(jump_index);

/// After setting ability
complete_selection();