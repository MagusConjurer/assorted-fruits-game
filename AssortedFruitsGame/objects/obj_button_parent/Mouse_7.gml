/// @description 

if(enabled)
{
	image_index = BUTTON_DEFAULT;
}

if (enabled && layer_get_visible(layer_to_check) == true)
{
	event_user(0);
}
