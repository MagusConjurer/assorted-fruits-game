/// @description 

if(interact_item > 0)
{
	item_dialogue = get_environmental_dialogue(interact_item);
	
	dialogue_set_nonstandard_text(item_dialogue);
	set_game_state_and_start(ENVIRONMENTAL);
}
