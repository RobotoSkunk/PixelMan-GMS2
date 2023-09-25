var draggableCount = instance_number(obj_create_obj_editor), content = [], icounter = 0;

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
	if(instance.type == 1) {
		var cam_test = instance_create(instance.x, instance.y, obj_camera);
		variable_instance_set(cam_test.id, "obj_id_arr", obj_id_arr);
		variable_instance_set(cam_test.id, "init_obj_id_arr", init_obj_id_arr);
		variable_instance_set(cam_test.id, "type", type);
		variable_instance_set(cam_test.id, "lvl_pass", lvl_pass);
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
	if(instance.type == 1 && instance.is_scnd_player == false){
		ds_map_add(instanceMap, "player_2_x", player_2[0]);
		ds_map_add(instanceMap, "player_2_y", player_2[1]);
		ds_map_add(instanceMap, "pant_div", player_2[2]);
	}
	
	// convertir ds_map en JSON
	if(instance.is_scnd_player == false){
		var JsonInstance = json_encode(instanceMap);
		//var content = content + JsonInstance + "|";
		content[icounter] = JsonInstance;
		icounter++;
	}
	
	ds_map_destroy(instanceMap);
}
//cam_test.test_lvl = content;
//var wordArray = scr_string_split(content, "|");
var wordArray = content, draggableCount = array_length_1d(wordArray);

for (var i = 0; i < draggableCount; i++){
	var draggableJson = wordArray[i], draggableMap = json_decode(draggableJson);
	
	var _x = ds_map_find_value(draggableMap, "x");
	var _y = ds_map_find_value(draggableMap, "y");
	var _imageXscale = ds_map_find_value(draggableMap, "image_xscale");
	var _imageYscale = ds_map_find_value(draggableMap, "image_yscale");
	var _imageAngle = ds_map_find_value(draggableMap, "image_angle");
	var obj_type = ds_map_find_value(draggableMap, "obj_type");
	var _time = ds_map_find_value(draggableMap, "time");
	var _ID = ds_map_find_value(draggableMap, "ID");
	var _spawn_saw = ds_map_find_value(draggableMap, "spawn_saw");
	if(ds_map_exists(draggableMap, "depth")){
		var _depth = ds_map_find_value(draggableMap, "depth");
	} else {
		if(obj_type != -1){
			var _depth = dp[obj_type];
		} else {
			var _depth = -257;
		}
	}
	var _tp = ds_map_find_value(draggableMap, "tp");
	var _start_in = ds_map_find_value(draggableMap, "start_in");
	var _start_time = ds_map_find_value(draggableMap, "start_time");
	var _symbol = ds_map_find_value(draggableMap, "symbol");
	var _gr = ds_map_find_value(draggableMap, "gr");
	var _obj_speed = ds_map_find_value(draggableMap, "obj_speed");
	if(obj_type == 1){
		if(ds_map_exists(draggableMap, "pant_div")){
			var player_2_x = ds_map_find_value(draggableMap, "player_2_x");
			var player_2_y = ds_map_find_value(draggableMap, "player_2_y");
			var pant_div = ds_map_find_value(draggableMap, "pant_div");
		} else {
			var player_2_x = 0;
			var player_2_y = 0;
			var pant_div = 0;
		}
	}
	
	var obj = scr_detect_object(obj_type);
	
	var new_inst = instance_create_depth(_x, _y, _depth, obj);
	if(obj_type != 1 && obj_type != -1){
		new_inst.image_xscale = _imageXscale;
		new_inst.image_yscale = _imageYscale;
		new_inst.image_angle = _imageAngle;
		new_inst.depth = _depth;
	}
	if(obj_type == -1){
		room_width = _x;
		room_height = _y;
	}
	if(obj_type == 0){
		new_inst.ID = _ID;
	}
	if(obj_type == 1){
		new_inst.grav = _gr;
		new_inst.player_2 = [player_2_x, player_2_y];
		new_inst.pant_div = pant_div;
		new_inst.camera_id = cam_test;
	}
	if(obj_type == 3 || obj_type == 8 || obj_type == 9  || obj_type == 16){
		new_inst.time = _time;
	}
	if(obj_type == 6){
		new_inst.spawn_saw = _spawn_saw;
	}
	if(obj_type == 14){
		new_inst.tp = _tp;
	}
	if(obj_type == 14 || obj_type == 15){
		new_inst.obj_speed = _obj_speed;
	}
	if(obj_type == 14 || obj_type == 15){
		new_inst.start_in = _start_in;
	}
	if(obj_type == 16){
		new_inst.start_time = _start_time;
	}
	if(obj_type == 18){
		new_inst.symbol = _symbol;
	}
	if(obj_type == 14 || obj_type == 15){
		new_inst.gr = _gr;
	}
	
	ds_map_destroy(draggableMap);
}

//instance_destroy(obj_create_obj_editor);
instance_destroy();
