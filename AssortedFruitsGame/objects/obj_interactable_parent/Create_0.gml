/// @description 

radius = PLAYER_INTERACT_DISTANCE;

can_interact = false;
interact_repeatable = false;
interact_starts = true;

popup_id = instance_create_layer(x, y - 130, layer, obj_popup);
popup_id.visible = false;