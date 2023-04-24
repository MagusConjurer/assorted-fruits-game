// Macros for Bullet Hell

#macro BH_AUTO_RESTART_SECONDS 5

#region UI

#macro BH_UI_MARGIN 20
#macro BH_UI_CIRCLE 0
#macro BH_UI_RECT   1
#macro BH_VIGNETTE_START_INDEX 5
#macro BH_VIGNETTE_DELAY_TIME 1

#macro BH_TIME_COLOR c_green
#macro BH_HOTKEY_COLOR c_white
// Text to show before the actual hotkey, which I will add before actually drawing it
#macro BH_HOTKEY_ATTACK_TEXT "Attack - "
#macro BH_HOTKEY_ABILITY_TEXT "Ability - "
#macro BH_HOTKEY_X 150
#macro BH_HOTKEY_ATTACK_Y 150
#macro BH_HOTKEY_ABILITY_Y 160
#macro BH_HOTKEY_VISIBLE_TIME 5

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
#macro BH_BUBBLE_POP_PROGRESS 0.008
#macro BH_BOOST_PROGRESS 0.08
#macro BH_BOOST_PULSE_TIME 2
#macro BH_BOOST_ICON_X global.resolution_w * 0.2
#macro BH_BUS_ICON spr_bus_icon
#macro BH_BED_ICON spr_bed_icon

#endregion

#region PLAYER

#macro BH_PLAYER_SPEED 40
#macro BH_PLAYER_PROJECTILE_SPEED 60
#macro BH_PLAYER_PROJECTILE_DAMAGE -1
#macro BH_PLAYER_PROJECTILE_DELAY 5
#macro BH_PLAYER_HEALTH_DEFAULT 8
#macro BH_PLAYER_NUM_IFRAMES 240 //Note: Game runs at 60 fps

#endregion

#region BUBBLES
// Shared values
#macro BH_BUBBLE_PROJECTILE_SPEED 30
#macro BH_BUBBLE_PROJECTILE_DAMAGE -1

// Non shooting values
#macro BH_NS_STARTING_BUBBLE_HEALTH		2
#macro BH_NS_NUM_STARTING_BUBBLES		10 
#macro BH_NS_NUM_BUBBLES_PER_SPAWN		12
#macro BH_NS_BUBBLE_TIME_BEFORE_POPPING	0.8
#macro BH_NS_MAX_BUBBLES				70
#macro BH_NS_NUM_BUBBLE_PROJECTILES		15
#macro BH_NS_BUBBLE_PROJECTILE_SCALE	0.015
#macro BH_NS_BUBBLE_MOVE_SPEED			50

// Shooting Values
#macro BH_S_STARTING_BUBBLE_HEALTH		2
#macro BH_S_NUM_STARTING_BUBBLES		8 
#macro BH_S_NUM_BUBBLES_PER_SPAWN		6
#macro BH_S_BUBBLE_TIME_BEFORE_POPPING	6
#macro BH_S_MAX_BUBBLES					70
#macro BH_S_NUM_BUBBLE_PROJECTILES		20
#macro BH_S_BUBBLE_PROJECTILE_SCALE		0.015
#macro BH_S_BUBBLE_MOVE_SPEED			9

// TYPES
#macro BH_BUBBLE_BUSGUY obj_bubble
#macro BH_BUBBLE_MOM obj_bubble_mom
#macro BH_BUBBLE_DAD obj_bubble_dad
#macro BH_BUBBLE_UNCLE obj_bubble_uncle

#endregion

#region BOOST
#macro BH_BOOST_MOVE_SPEED 0.9
#macro BH_BOOST_SCALING_FACTOR 0.05
#macro BH_SECONDS_BEFORE_BOOST 10

#endregion

#region ABILITIES

// DASH ability
#macro BH_ABILITY_DASH 1
#macro BH_DASH_DISTANCE 150
#macro BH_DASH_DURATION 8
#macro BH_DASH_COOLDOWN 120

// SHIELD ability
#macro BH_ABILITY_SHIELD 2
#macro BH_SHIELD_MAX_SCALE 1.2
#macro BH_SHIELD_MIN_SCALE 0.7
#macro BH_SHIELD_NUM_HITS 5
#macro BH_SHIELD_COOLDOWN 600

// HEAL ability
#macro BH_ABILITY_HEAL 3
#macro BH_HEAL_AMOUNT 1
#macro BH_HEAL_COOLDOWN 1000

#endregion
