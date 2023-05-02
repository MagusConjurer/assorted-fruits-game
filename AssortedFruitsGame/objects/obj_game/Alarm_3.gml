/// @description Vignette helper

if(bh_active)
{
	if(bh_vignette_index < bh_vignette_target_index)
	{
		if(bh_vignette_index < bh_vignette_levels_total)
		{
			bh_vignette_index += 0.5;
		}
	}
	else if(bh_vignette_index > bh_vignette_target_index)
	{
		if(bh_vignette_index > BH_VIGNETTE_START_INDEX)
		{
			bh_vignette_index -= 0.5;
		}
	}
}
