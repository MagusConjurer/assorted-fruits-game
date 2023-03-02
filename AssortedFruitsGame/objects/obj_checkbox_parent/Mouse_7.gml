/// @description 

if(layer_get_visible("Settings_Menu") == true)
{
	checked = !checked;
	
	script = script_to_run;
	script_execute(script);
}
