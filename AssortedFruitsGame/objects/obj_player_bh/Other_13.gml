/// @description Heal
/// Does not exceed max health

if(obj_game.bh_player_health + BH_HEAL_AMOUNT < BH_PLAYER_HEALTH_DEFAULT)
	bh_update_player_health(BH_HEAL_AMOUNT);
else
	obj_game.bh_player_health = BH_PLAYER_HEALTH_DEFAULT;
