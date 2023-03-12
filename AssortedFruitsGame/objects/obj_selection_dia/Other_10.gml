
if(text == "Health")
{
	
}
else if(text == "Defense")
{
	bh_set_ability(BH_ABILITY_SHIELD);
}
else if(text == "Offense")
{
	bh_set_ability(BH_ABILITY_DASH);
}

/// After setting ability
complete_selection();