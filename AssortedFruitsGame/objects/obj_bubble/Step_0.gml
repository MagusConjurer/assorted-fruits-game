/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2B694176
/// @DnDArgument : "code" "/// @description $(13_10)$(13_10)event_inherited();$(13_10)$(13_10)if(global.game_state == active_state)$(13_10){$(13_10)	// Just update x_direction or y_direction here.$(13_10)	// The parent end step will handle the rest of the movement/collision.$(13_10)}$(13_10)$(13_10)$(13_10)$(13_10)"
/// @description 

event_inherited();

if(global.game_state == active_state)
{
	// Just update x_direction or y_direction here.
	// The parent end step will handle the rest of the movement/collision.
}

/// @DnDAction : YoYo Games.Particles.Part_Emit_Emit
/// @DnDVersion : 1
/// @DnDHash : 491DBDA2
/// @DnDArgument : "system" "global.P_system_pop"
/// @DnDArgument : "emitter" "global.emitter"
/// @DnDArgument : "type" "global.P_system_interac_T"
/// @DnDArgument : "number" "100"
part_emitter_burst(global.P_system_pop, global.emitter, global.P_system_interac_T, 100);

/// @DnDAction : YoYo Games.Particles.Refresh_Particles
/// @DnDVersion : 1.1
/// @DnDHash : 26C90F24
/// @DnDArgument : "system" "global.P_system_pop"
part_system_update(global.P_system_pop);