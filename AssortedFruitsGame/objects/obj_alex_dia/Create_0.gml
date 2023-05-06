/// @description

// Inherit the parent event
event_inherited();

textbox_color = C_ALEX; // The can be a c_"color" or the $FFCC11 hex based color
textbox_name = "Alex";

switch(global.current_level)
{
	case LEVEL_1_BUS_STOP:
		speak_audio = AUDIO_DIA_ALEX_BUS;
	break;
	case LEVEL_3_CAFE:
		speak_audio = AUDIO_DIA_ALEX_CAFE;
	break;
	case LEVEL_4_DINNER:
		speak_audio = AUDIO_DIA_ALEX_DINNER;
	break;
}