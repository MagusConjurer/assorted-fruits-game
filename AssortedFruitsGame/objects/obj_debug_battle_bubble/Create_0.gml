/// @description 

// Inherit the parent event
event_inherited();

can_interact	= true;
interact_starts = true;
radius = AUTO_INTERACT_DISTANCE * 2;

global.current_level = LEVEL_5_DINNER_BATTLE;
bh_set_ability(BH_ABILITY_SHIELD);

image_blend = C_MOM;
