/// @description Propiedades del objeto
image_alpha = 1;
if (type > -1 && type < editor_obj_nmb) {
	if (type == 0){
		if (ID > -1 && ID < array_length_1d(block_array)) {
			sprite_index = block_array[ID];
			image_index = block_random;
		} else {
			sprite_index = spr_block_default;
		}
	} else if(type == 14){
		sprite_index = platform_array[tp];
	} else {
		sprite_index = obj_sprites[type];
	}
	can_chg = can_change[type];
	can_ang = can_angle[type];
	rz = resize[type];
	free_asp = free_aspect[type];
	wht_is = what_is[type];
} else if (type == -1) {
	sprite_index = spr_room_properties;
	can_chg = false;
	can_ang = false;
	rz = false;
	free_asp = false;
	wht_is = text[18];
	depth = -257;
}
if(start_in < 0) start_in = 0;
if(start_in > 2) start_in = 2;

solid = (type == 0 || type == 4 || type == 6);

_depth = depth;