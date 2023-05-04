// Macros for Bullet Hell

#macro BH_AUTO_RESTART_SECONDS 5

#region BH DIALOGUE
#macro BH_DIALOGUE_HAS_COLLISION true
#macro BH_DIALOGUE_BG_SPRITE spr_dialogue
#macro BH_DIALOGUE_BG_PERCENT_LARGER 0.1

#endregion

#region UI

#macro BH_UI_MARGIN 25
#macro BH_UI_CIRCLE 0
#macro BH_UI_RECT   1

#macro BH_TIME_COLOR c_green

// Vignette
#macro BH_VIGNETTE_START_INDEX 5
#macro BH_VIGNETTE_DELAY_TIME 0.5

// Start of BH
#macro BH_START_MESSAGE "Survive until the end of conversation!"
#macro BH_START_SEQ_ACTIVE_COLOR c_white
#macro BH_START_SEQ_PAUSED_COLOR c_gray
// Text to show before the actual hotkey, which I will add before actually drawing it
#macro BH_HOTKEY_ATTACK_TEXT "Attack - "
#macro BH_HOTKEY_ABILITY_TEXT "Ability - "

#endregion

#region BATTLE IMPACT CHOICES

#macro BH_NO_RESPONSE   0
#macro BH_PLEASE_STOP   1

#macro BH_BATTLE_MOM	0
#macro BH_BATTLE_DAD	1
#macro BH_BATTLE_UNCLE  2

#endregion

#region PROGRESS BAR
#macro BH_TIME_PROGRESS_PERCENTAGE 0.01
#macro BH_BOOST_PROGRESS 0.08
#macro BH_BOOST_PULSE_TIME 2
#macro BH_BUS_ICON spr_bus_icon
#macro BH_BED_ICON spr_bed_icon

#endregion

#region PLAYER

#macro BH_PLAYER_SPEED 40
#macro BH_PLAYER_SCALE 0.2
#macro BH_PROJECTILE_SCALE 0.1
#macro BH_PLAYER_PROJECTILE_SPEED 60
#macro BH_PLAYER_PROJECTILE_DAMAGE -1
#macro BH_PLAYER_PROJECTILE_DELAY 5
#macro BH_PLAYER_HEALTH_DEFAULT 8
#macro BH_PLAYER_IFRAME_SECONDS 3

#endregion

#region BUBBLES
// Shared values
#macro BH_BUBBLE_PROJECTILE_SPEED 30
#macro BH_BUBBLE_PROJECTILE_DAMAGE -1

#macro BH_MAIN_BUBBLE_PERCENTAGE 0.75

// Non shooting values
#macro BH_NS_STARTING_BUBBLE_HEALTH		4
#macro BH_NS_SECONDS_BETWEEN_SPAWNS		5
#macro BH_NS_NUM_STARTING_BUBBLES		10
#macro BH_NS_NUM_BUBBLES_PER_SPAWN		14
#macro BH_NS_BUBBLE_TIME_BEFORE_POPPING	0.8
#macro BH_NS_MAX_BUBBLES				60
#macro BH_NS_NUM_BUBBLE_PROJECTILES		12
#macro BH_NS_BUBBLE_PROJECTILE_SCALE	0.015
#macro BH_NS_BUBBLE_MOVE_SPEED			35
#macro BH_NS_MOM_BUBBLE_MOVE_SPEED		35
#macro BH_NS_DAD_BUBBLE_MOVE_SPEED		35
#macro BH_NS_UNCLE_BUBBLE_MOVE_SPEED	35
#macro BH_NS_DINNER_BUBBLE_START		10
#macro BH_NS_DINNER_BUBBLE_PER_SPAWN	16
#macro BH_NS_DINNER_BUBBLE_MAX			70
#macro BH_NS_SECONDS_DINNER_SPAWNS		5

// Shooting Values
#macro BH_S_STARTING_BUBBLE_HEALTH		4
#macro BH_S_SECONDS_BETWEEN_SPAWNS		5
#macro BH_S_NUM_STARTING_BUBBLES		10
#macro BH_S_NUM_BUBBLES_PER_SPAWN		14
#macro BH_S_BUBBLE_TIME_BEFORE_POPPING	.8
#macro BH_S_MAX_BUBBLES					60
#macro BH_S_NUM_BUBBLE_PROJECTILES		12
#macro BH_S_NUM_POPPED_PROJECTILES		6
#macro BH_S_BUBBLE_PROJECTILE_SCALE		0.015
#macro BH_S_BUBBLE_MOVE_SPEED			9
#macro BH_S_MOM_BUBBLE_MOVE_SPEED		25
#macro BH_S_DAD_BUBBLE_MOVE_SPEED		45
#macro BH_S_UNCLE_BUBBLE_MOVE_SPEED		45
#macro BH_S_DINNER_BUBBLE_START			10
#macro BH_S_DINNER_BUBBLE_PER_SPAWN		16
#macro BH_S_DINNER_BUBBLE_MAX			70
#macro BH_S_SECONDS_DINNER_SPAWNS		5

// BUSGUY BUBBLES
#macro BH_BUS_SPRITE_CHANGE_SECONDS 0.1

// MOM BUBBLES
#macro BH_MOM_BUBBLE_RADIUS_MIN 25
#macro BH_MOM_BUBBLE_RADIUS_MAX 150
#macro BH_MOM_BUBBLE_ROT_SPEED 2

// DAD BUBBLES
#macro BH_DAD_BUBBLE_TURN_TIME_MIN 1
#macro BH_DAD_BUBBLE_TURN_TIME_MAX 2

// UNCLE BUBBLES
#macro BH_UNCLE_BUBBLE_MAX_ANGLE 100
#macro BH_UNCLE_BUBBLE_MIN_ANGLE 10
#macro BH_UNCLE_BUBBLE_TURN_TIME_MIN 1
#macro BH_UNCLE_BUBBLE_TURN_TIME_MAX 2

// TYPES
#macro BH_BUBBLE_BUSGUY obj_bubble
#macro BH_BUBBLE_MOM obj_bubble_mom
#macro BH_BUBBLE_DAD obj_bubble_dad
#macro BH_BUBBLE_UNCLE obj_bubble_uncle

#endregion

#region BOOST

#macro BH_BOOST_SEQ_ACTIVE_COLOR c_white
#macro BH_BOOST_SEQ_PAUSED_COLOR c_gray
#macro BH_BOOST_AVAILABLE_TEXT "Find the purple bubble for a progress boost!"
#macro BH_BOOST_MOVE_SPEED 0.9
#macro BH_BOOST_SCALING_FACTOR 0.10
#macro BH_SECONDS_BEFORE_BOOST 10

#endregion

#region ABILITIES

#macro BH_ABILITY_BUTTON_SCALE 0.05

// DASH ability
#macro BH_ABILITY_DASH 1
#macro BH_DASH_DISTANCE 50
#macro BH_DASH_DURATION 0.25
#macro BH_DASH_COOLDOWN_TIME 2

// SHIELD ability
#macro BH_ABILITY_SHIELD 2
#macro BH_SHIELD_MAX_SCALE 1.2
#macro BH_SHIELD_MIN_SCALE 0.7
#macro BH_SHIELD_NUM_HITS 10
#macro BH_SHIELD_COOLDOWN_TIME 10

// HEAL ability
#macro BH_ABILITY_HEAL			3
#macro BH_HEAL_AMOUNT			2
#macro BH_HEAL_FLASH_TIME		2
#macro BH_HEAL_COOLDOWN_TIME	15

#endregion
