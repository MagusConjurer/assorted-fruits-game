/// @description 

active_state = (global.game_state == DIALOGUE || 
				global.game_state == ENVIRONMENTAL ||
				global.game_state == PRE_TRANSITION);
				
if(active_state)
{	
	depth = DIA_DEPTH;
}
