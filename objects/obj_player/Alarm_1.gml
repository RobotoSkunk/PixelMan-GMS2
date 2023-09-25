/// @description Preparar modo pant_div
if(pant_div && !is_scnd_player){
	var scnd_player_id = instance_create(player_2[0], player_2[1], obj_player);
	scnd_player_id.is_scnd_player = true;
	scnd_player_id.pant_div = true;
	camera_id.pant_div = true;
	camera_id.player_id = [id, scnd_player_id];
	camera_id.new_x = [x, scnd_player_id.x];
	camera_id.new_y = [y, scnd_player_id.y];
	//touchpad_id.pant_div = true;
	//touchpad_id.player_id = [id, scnd_player_id];
} else if(is_scnd_player){
	randomize();
	scr_player_sprites(irandom(spr_max-1));
	image_blend = make_color_hsv(irandom(255), irandom(255), 235 + irandom(20));
	sprite_index = player_jump;
	image_index = image_number-1;
}
