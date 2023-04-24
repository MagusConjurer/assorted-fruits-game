/// @description Vignette helper

if(bh_active)
{
	if(bh_vignette_increasing && bh_vignette_index < bh_vignette_levels_total)
	{
		bh_vignette_index++;
	}
	else if (!bh_vignette_increasing && bh_vignette_index > 0)
	{
		bh_vignette_index--;
	}
}
