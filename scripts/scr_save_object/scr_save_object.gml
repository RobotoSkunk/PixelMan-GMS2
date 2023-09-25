for(var i = 0; i <= force_cpu; i++){
	if(instance_exists(obj_temp_vars)){
		var id_arr = obj_temp_vars.obj_id_arr;
		
		if(obj_nmb < array_length_1d(id_arr)){
			var instance = id_arr[obj_nmb];
			//instance_activate_object(instance);
			var dir = directory[0] + level_name + "Level\\" + base64_encode(md5_string_unicode(obj_nmb)) + ".pmol";
			var saveFile = file_text_open_write(dir);
			
			var instanceMap = ds_map_create();
			ds_map_add(instanceMap, "x", instance.x);
			ds_map_add(instanceMap, "y", instance.y);
			ds_map_add(instanceMap, "obj_type", instance.type);
			if(instance.type != 1 && instance.type != -1){
				ds_map_add(instanceMap, "image_xscale", instance.image_xscale);
				ds_map_add(instanceMap, "image_yscale", instance.image_yscale);
				ds_map_add(instanceMap, "image_angle", instance.image_angle);
				ds_map_add(instanceMap, "depth", instance._depth);
			}
			if(instance.type == 3 || instance.type == 8 || instance.type == 9 || instance.type == 16) ds_map_add(instanceMap, "time", instance.time);
			if(instance.type == 0) ds_map_add(instanceMap, "ID", instance.ID);
			if(instance.type == 6) ds_map_add(instanceMap, "spawn_saw", instance.spawn_saw);
			if(instance.type == 14) ds_map_add(instanceMap, "tp", instance.tp);
			if(instance.type == 14 || instance.type == 15) ds_map_add(instanceMap, "obj_speed", instance.obj_speed);
			if(instance.type == 14 || instance.type == 15) ds_map_add(instanceMap, "start_in", instance.start_in);
			if(instance.type == 16) ds_map_add(instanceMap, "start_time", instance.start_time);
			if(instance.type == 18) ds_map_add(instanceMap, "symbol", instance.symbol);
			if(instance.type == 1  || instance.type == 14 || instance.type == 15) ds_map_add(instanceMap, "gr", instance.gr);
			if(instance.type == 1){
				if(instance.is_scnd_player == false){
					ds_map_add(instanceMap, "player_2_x", player_2[0]);
					ds_map_add(instanceMap, "player_2_y", player_2[1]);
					ds_map_add(instanceMap, "pant_div", player_2[2]);
				}
				player_nmb++;
			}

			if(instance.is_scnd_player == false){
				var JsonInstance = json_encode(instanceMap);
				file_text_write_string(saveFile, JsonInstance);
				file_text_close(saveFile);
				fast_file_key_crypt(dir, dir, 1, scr_blowfish(0) + lvl_pass);
				var file_bin = file_bin_open(dir, 0);
				file_size += file_bin_size(file_bin);
				file_bin_close(file_bin);
			} else {
				file_text_close(saveFile);
				file_delete(dir);
			}
			ds_map_destroy(instanceMap);
			
		}
		
	} else {
		tt = "ERROR";
	}
	obj_nmb++;
}
