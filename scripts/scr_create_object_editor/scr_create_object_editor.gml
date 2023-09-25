for(var i = 0; i <= force_cpu; i++){
	var dir = directory[0] + level_name + "Level\\" + base64_encode(md5_string_unicode(obj_nmb)) + ".pmol";
	if(file_exists(dir)){
		var draggableJson = fast_file_string_key_crypt(dir, scr_blowfish(0) + lvl_pass);;
		var draggableMap = json_decode(draggableJson);
		
		if(ds_map_exists(draggableMap, "x")){
			var _x = draggableMap[? "x"];
			var _y = draggableMap[? "y"];
			var _imageXscale = draggableMap[? "image_xscale"];
			var _imageYscale = draggableMap[? "image_yscale"];
			var _imageAngle = draggableMap[? "image_angle"];
			var obj_type = draggableMap[? "obj_type"];
			if(ds_map_exists(draggableMap, "time")){
				var _time = draggableMap[? "time"];
			} else {
				var _time;
				if(obj_type == 1) _time = 1;
				else if(obj_type == 8) _time = 0.7;
				else if(obj_type == 9) _time = 2;
				else if(obj_type == 16) _time = 2;
				else _time = 1;
			}
			var _ID = draggableMap[? "ID"];
			var _spawn_saw = draggableMap[? "spawn_saw"];
			if(ds_map_exists(draggableMap, "depth")){
				var _depth = draggableMap[? "depth"];
			} else {
				if(obj_type != -1){
					var _depth = dp[obj_type];
				} else {
					var _depth = -257;
				}
			}
			var _tp = draggableMap[? "tp"];
			var _start_in = draggableMap[? "start_in"];
			var _start_time = draggableMap[? "start_time"];
			var _symbol = draggableMap[? "symbol"];
			if(ds_map_exists(draggableMap, "gr")){
				var _gr = draggableMap[? "gr"];
			} else {
				var _gr = 1;
			}
			if(ds_map_exists(draggableMap, "obj_speed")){
				var _obj_speed = draggableMap[? "obj_speed"];
			} else {
				var _obj_speed = 5;
			}
			if(obj_type == 1){
				if(ds_map_exists(draggableMap, "pant_div")){
					var player_2_x = draggableMap[? "player_2_x"];
					var player_2_y = draggableMap[? "player_2_y"];
					var pant_div = draggableMap[? "pant_div"];
				} else {
					var player_2_x = 0;
					var player_2_y = 0;
					var pant_div = 0;
				}
			}
		
			var new_inst = instance_create_depth(_x, _y, _depth, obj_create_obj_editor);
			//x = _x;
			//y = _y;
			if(obj_type != 1 && obj_type != -1){
				new_inst.image_xscale = _imageXscale;
				new_inst.image_yscale = _imageYscale;
				new_inst.image_angle = _imageAngle;
				new_inst._depth = _depth;
				new_inst.depth = _depth;
			}
			new_inst.type = obj_type;
			if(obj_type == 0){
				new_inst.ID = _ID;
			}
			if(obj_type == 1 || obj_type == 14 || obj_type == 15){
				new_inst.gr = _gr;
			}
			if(obj_type == 1){
				if(pant_div){
					var scnd_player = instance_create_depth(player_2_x, player_2_y, _depth, obj_create_obj_editor);
					scnd_player.is_scnd_player = true;
					scnd_player.type = 1;
				}
			}
			if(obj_type == 3 || obj_type == 8 || obj_type == 9 || obj_type == 16){
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
			new_inst.select = false;
			new_inst.grab = false;
			new_inst.duplicated = false;
			init_obj_id_arr[obj_nmb_fix] = new_inst.id;
			obj_id_arr[obj_nmb_fix] = new_inst.id;
		}
		ds_map_destroy(draggableMap);
		
		
		obj_nmb_fix++;
	}
	obj_nmb++;
}
