/// @description 

// Inherit the parent event
event_inherited();

var _inst = instance_place(x,y,obj_player_bh);
if (_inst != noone)
{
	// Only check collisions with bubbles if not in iframes
	if(_inst.iframes <= 0) 
	{
		bh_update_player_health(damage);
		play_sfx(AUDIO_DAMAGE);
			
		ph = bh_get_player_health();
		if(ph > 6)
		{
			_inst.current_frame = 0;
		} 
		else if(ph > 4)
		{
			_inst.current_frame = 2;
		}
		else if(ph > 2)
		{
			_inst.current_frame = 4;
		}
		else
		{
			_inst.current_frame = 6;
		}
	
		_inst.iframes = BH_PLAYER_NUM_IFRAMES;
		
		instance_destroy();
	}
} 



if(bh_is_outside_bounds_x(x,sprite_width * image_xscale) || bh_is_outside_bounds_y(y,sprite_height * image_yscale))
{
	instance_destroy();
}
