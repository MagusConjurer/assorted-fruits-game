/// Called by obj_game to check for necessary dialogue updates
function dialogue_update()
{
	if (global.game_state == DIALOGUE && dialogue_active = false)
	{
		dialogue_start();
		dialogue_active = true;
	}
	else if (global.game_state == DIALOGUE && dialogue_active = true)
	{

	}
}

function dialogue_start()
{
	instance_create_layer(0,0,"Dialogue",obj_textbox_dia);
	instance_create_layer(0,0,"Dialogue",obj_player_dia);
	instance_create_layer(0,0,"Dialogue",obj_other_dia);
}