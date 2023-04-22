// Macros for Diaglogue

#region TEXXTBOX
#macro DIALOGUE_INPERSON_BOX_SPRITE spr_dialogue
#macro DIALOGUE_TEXTMSG_BOX_SPRITE spr_text_bubble

#macro DIALOGUE_TM_LEFT_LARGE  0
#macro DIALOGUE_TM_RIGHT_LARGE 1
#macro DIALOGUE_TM_LEFT_SMALL  2
#macro DIALOGUE_TM_RIGHT_SMALL 3

#macro TEXTBOX_PADDING 16
#macro TEXTBOX_MARGIN 10
#macro TEXTBOX_OFFSET_PERCENT 0.45
#macro DIALOGUE_SELECT_BTN_Y_OFFSET_PERCENT 0.8
#macro DIALOGUE_SELECT_DESCRIPTION_OFFEST   -30

// Used for text box alignment (mostly during text messaging)
enum align{
	centered,
	left,
	right
}

#endregion

#region PORTRAITS
#macro PORTRAIT_SCALE 0.2
#macro PORTRAIT_MARGIN 256
#macro PORTRAIT_HEIGHT 1000
#endregion

// Controls type of dialogue box and other details
#macro DIALOGUE_STANDARD		0
#macro DIALOGUE_ENVIRONMENTAL	1
#macro DIALOGUE_TRANSITION		2

#macro CONTINUE_DIA_TEXT "Continue"
#macro COMPLETE_DIA_TEXT "Leave"

/// Conversations
#macro PHONE_DIALOGUE 0
#macro BUS_STOP_DIALOGUE 1
#macro CAFE_DIALOGUE 2

/// Emotions
#macro ALEX_NEUTRAL 0
#macro ALEX_AFRAID 1
#macro ALEX_SHOCKED 2
#macro ALEX_LOOKAWAY 3
#macro ALEX_HAPPY 4
#macro ALEX_ANGRY 5
#macro ALEX_ANXIOUS 6
#macro ALEX_DEPRESSED 7
#macro ALEX_CONFUSED 8
#macro ALEX_SIGH 9

#macro STELLA_NEUTRAL 0
#macro STELLA_DISGUST 1
#macro STELLA_INLOVE 2
#macro STELLA_HAPPY 3
#macro STELLA_THINKING 4
#macro STELLA_LOOKAWAY 5
#macro STELLA_UNIMPRESSED 6
#macro STELLA_SHOCKED 7
#macro STELLA_JOKING 8
#macro STELLA_NERVOUS 9

#macro BUS_GUY_RUDE 0

