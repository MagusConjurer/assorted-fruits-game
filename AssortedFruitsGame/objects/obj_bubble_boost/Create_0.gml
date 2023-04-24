/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2683D82A
/// @DnDArgument : "code" "/// @description$(13_10)$(13_10)event_inherited();$(13_10)$(13_10)xDirection = 1;$(13_10)xSpeed = BH_BOOST_MOVE_SPEED$(13_10)angle = image_angle;$(13_10)$(13_10)image_blend = c_purple;$(13_10)$(13_10)image_index = irandom(sprite_get_number(sprite_index));$(13_10)image_xscale = BH_BOOST_SCALING_FACTOR;$(13_10)image_yscale = BH_BOOST_SCALING_FACTOR;$(13_10)"
/// @description

event_inherited();

xDirection = 1;
xSpeed = BH_BOOST_MOVE_SPEED
angle = image_angle;

image_blend = c_purple;

image_index = irandom(sprite_get_number(sprite_index));
image_xscale = BH_BOOST_SCALING_FACTOR;
image_yscale = BH_BOOST_SCALING_FACTOR;