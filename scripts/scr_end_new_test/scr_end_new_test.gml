instance_destroy(obj_block);
instance_destroy(obj_player);
instance_destroy(obj_springboard);
instance_destroy(obj_power_gravity);
instance_destroy(obj_special_block_1);
instance_destroy(obj_saw);
instance_destroy(obj_saw_base);
instance_destroy(obj_killzone);
instance_destroy(obj_gun);
instance_destroy(obj_cannon);
instance_destroy(obj_spike);
instance_destroy(obj_laser_gun);
instance_destroy(obj_final_door);
instance_destroy(obj_switch);
instance_destroy(obj_platform);
instance_destroy(obj_gun_wall);
instance_destroy(obj_bomb);
instance_destroy(obj_letter);
instance_destroy(obj_bullet);
instance_destroy(obj_rocket);
instance_destroy(obj_touchpad);

var cam_editor_id = instance_create(x, y, obj_editor);
cam_editor_id.test = true;
cam_editor_id.xp1 = -1;
cam_editor_id.lvl_pass = lvl_pass;
cam_editor_id.xp2 = ideal_width+1;
cam_editor_id.player_path = player_path;
cam_editor_id.init_obj_id_arr = init_obj_id_arr;
cam_editor_id.obj_id_arr = obj_id_arr;
cam_editor_id.type = type;
instance_destroy();
for(var i = 0; i < snd_length; i++){
	if i == 1 continue;
	audio_stop_sound(aud[i]);
}
zm = 2;
