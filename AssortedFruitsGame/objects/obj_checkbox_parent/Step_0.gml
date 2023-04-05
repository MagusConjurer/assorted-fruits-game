/// @description

if(menu_interact_pressed() && selected)
{
	checked = !checked;
	
	event_user(0);
}

if(checked)
{
	if(selected)
	{
		image_index = 3;
	}
	else
	{
		image_index = 1;
	}
}
else
{
	if(selected)
	{
		image_index = 2;
	}
	else
	{
		image_index = 0;
	}
}
