/// @description Heal

bh_update_player_health(BH_HEAL_AMOUNT);
healFrames = BH_HEAL_FLASH_TIME * 60;
// to stop heal frames being overriden
iframes = (BH_HEAL_FLASH_TIME * 60) - 2; 