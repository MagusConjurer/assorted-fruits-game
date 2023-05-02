/// @description

draw_self();

if(!usable)
{
	draw_sprite_part_ext(	spr_bh_ability,
							ability_image_active,
							x-sprite_width,
							y-sprite_height,
							sprite_get_width(spr_bh_ability),
							sprite_get_height(spr_bh_ability) * percentage_to_draw,
							x-(sprite_width*0.5),
							y-(sprite_height*0.5),
							BH_ABILITY_BUTTON_SCALE,
							BH_ABILITY_BUTTON_SCALE,
							c_white,
							1
					);
}