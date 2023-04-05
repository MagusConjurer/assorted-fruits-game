/// @description 

radius = 0; // set in step

has_been_interacted = false;
interact_repeatable = false;
interact_starts = true;

popup_id = instance_create_layer(x, y - 130, layer, obj_press_E);
popup_id.visible = false;