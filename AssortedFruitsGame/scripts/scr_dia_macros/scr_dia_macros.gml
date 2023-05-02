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
#macro PORTRAIT_MARGIN 10
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
#macro DINNER_DIALOGUE 3
#macro FINAL_DIALOGUE 4

#macro DIA_MOM 0
#macro DIA_DAD 1
#macro DIA_UNCLE 2

#region EMOTIONS

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

#macro MOM_NEUTRAL 0
#macro MOM_HAPPY 1
#macro MOM_ANXIOUS 2
#macro MOM_ANGRY 4
#macro MOM_ANNOYED 5

#macro DAD_UNIMPRESSED 0
#macro DAD_IRRITATED 1
#macro DAD_PREACHING 2
#macro DAD_ANGRY 3

#macro UNCLE_NEUTRAL 0
#macro UNCLE_UNIMPRESSED 1
#macro UNCLE_PRAYING 2
#macro UNCLE_ANGRY 3

#macro BUS_GUY_GRIMACE		0
#macro BUS_GUY_ARMSCROSS	0
#macro BUS_GUY_SMOKING		0

#endregion

