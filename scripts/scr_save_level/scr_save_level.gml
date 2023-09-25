var draggableCount = instance_number(obj_create_obj_editor);
var levelname = directory[0] + level_name;
var content = "";
var player_nmb = 0;

if (file_exists(levelname)){ //file_delete(levelname);
	file_copy(levelname, directory[3] + "Backup\\" + base64_encode(level_name));
	fast_file_key_crypt(levelname, levelname, 0, scr_blowfish(0));
	ini_open(levelname);
		ini_write_string("Level", "Content", "");
	ini_close();
} else {
	var levelname = directory[0] + scr_create_level("0");
	ini_open(levelname);
		ini_write_string("Level", "Content", "");
	ini_close();
}

for (var i = 0; i < draggableCount; i++){
	var instance = instance_find(obj_create_obj_editor, i);
	
	//Convertir instancias en un ds_map
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
	
	// convertir ds_map en JSON
	if(instance.is_scnd_player == false){
		var JsonInstance = json_encode(instanceMap);
		var content = content + JsonInstance + "|";
	}
	//file_text_write_string(saveFile, JsonInstance);
	//file_text_write_string(saveFile, "|");
	
	ds_map_destroy(instanceMap);
}
//file_text_close(saveFile);
ini_open(levelname);
	ini_write_string("Level", "Content", base64_encode(content));
	ini_write_string("Data", "Pant_div", (player_nmb > 1));
	
ini_close();
fast_file_key_crypt(levelname, levelname, 1, scr_blowfish(0));

file_delete(directory[3] + "Backup\\" + base64_encode(level_name));

return draggableCount;
