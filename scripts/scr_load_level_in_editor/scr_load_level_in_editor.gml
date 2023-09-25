var levelname = directory[0] + level_name;
scr_editor_obj(false);

if (file_exists(levelname)){
	file_copy(levelname, directory[3] + "Backup\\" + base64_encode(level_name));
	var file_buffer = buffer_load(levelname);
	if(buffer_get_size(file_buffer) != 0){
		fast_file_key_crypt(levelname, levelname, 0, scr_blowfish(0));
	
		//var worldLoadFile = file_text_open_read(levelname);
	
		/*if (!file_text_eof(worldLoadFile)){
			var worldMasterData = file_text_read_string(worldLoadFile);*/
			ini_open(levelname);
			var content = ini_read_string("Level", "Content", "");
			content = base64_decode(content);
			ini_close();
			var worldMasterData = content;//file_text_read_string(content);
			var wordArray = scr_string_split(worldMasterData, "|");
			var draggableCount = array_length_1d(wordArray);
		
			if (draggableCount > 0){
				for (var i = 0; i < draggableCount; i++){
					var draggableJson = wordArray[i];
				
					var draggableMap = json_decode(draggableJson);
				
					var _x = ds_map_find_value(draggableMap, "x");
					var _y = ds_map_find_value(draggableMap, "y");
					var _imageXscale = ds_map_find_value(draggableMap, "image_xscale");
					var _imageYscale = ds_map_find_value(draggableMap, "image_yscale");
					var _imageAngle = ds_map_find_value(draggableMap, "image_angle");
					var obj_type = ds_map_find_value(draggableMap, "obj_type");
					if(ds_map_exists(draggableMap, "time")){
						var _time = ds_map_find_value(draggableMap, "time");
					} else {
						var _time;
						if(obj_type == 1) _time = 1;
						else if(obj_type == 8) _time = 0.7;
						else if(obj_type == 9) _time = 2;
						else if(obj_type == 16) _time = 2;
						else _time = 1;
					}
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
					if(ds_map_exists(draggableMap, "gr")){
						var _gr = ds_map_find_value(draggableMap, "gr");
					} else {
						var _gr = 1;
					}
					if(ds_map_exists(draggableMap, "obj_speed")){
						var _obj_speed = ds_map_find_value(draggableMap, "obj_speed");
					} else {
						var _obj_speed = 5;
					}
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
					
					var new_inst = instance_create_depth(_x, _y, _depth, obj_create_obj_editor);
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
					ds_map_destroy(draggableMap);
				}
			}
		//}
	
		//file_text_close(worldLoadFile);
	
		fast_file_key_crypt(levelname, levelname, 1, scr_blowfish(0));
		buffer_delete(file_buffer);
		file_delete(directory[3] + "Backup\\" + base64_encode(level_name));
	} else {
		var new_inst = instance_create(384, 224, obj_create_obj_editor);
		new_inst.type = 1;
		new_inst.depth = dp[1];
		var new_inst = instance_create(336, 272, obj_create_obj_editor);
		new_inst.type = 0;
		new_inst.depth = dp[0];
		var new_inst = instance_create(352, 272, obj_create_obj_editor);
		new_inst.type = 0;
		new_inst.depth = dp[0];
		var new_inst = instance_create(368, 272, obj_create_obj_editor);
		new_inst.type = 0;
		new_inst.depth = dp[0];
		var new_inst = instance_create(384, 272, obj_create_obj_editor);
		new_inst.type = 0;
		new_inst.depth = dp[0];
		var new_inst = instance_create(400, 272, obj_create_obj_editor);
		new_inst.type = 0;
		new_inst.depth = dp[0];
		var new_inst = instance_create(416, 272, obj_create_obj_editor);
		new_inst.type = 0;
		new_inst.depth = dp[0];
		var new_inst = instance_create(432, 272, obj_create_obj_editor);
		new_inst.type = 0;
		new_inst.depth = dp[0];
		var new_inst = instance_create(416, 256, obj_create_obj_editor);
		new_inst.type = 12;
		new_inst.depth = dp[12];
		var new_inst = instance_create(352, 240, obj_create_obj_editor);
		new_inst.type = 13;
		new_inst.depth = dp[13];
		var new_inst = instance_create(room_width, room_height, obj_create_obj_editor);
		new_inst.type = -1;
		new_inst.depth = -257;
	} 
} else {
	var new_inst = instance_create(384, 224, obj_create_obj_editor);
	new_inst.type = 1;
	new_inst.depth = dp[1];
	var new_inst = instance_create(336, 272, obj_create_obj_editor);
	new_inst.type = 0;
	new_inst.depth = dp[0];
	var new_inst = instance_create(352, 272, obj_create_obj_editor);
	new_inst.type = 0;
	new_inst.depth = dp[0];
	var new_inst = instance_create(368, 272, obj_create_obj_editor);
	new_inst.type = 0;
	new_inst.depth = dp[0];
	var new_inst = instance_create(384, 272, obj_create_obj_editor);
	new_inst.type = 0;
	new_inst.depth = dp[0];
	var new_inst = instance_create(400, 272, obj_create_obj_editor);
	new_inst.type = 0;
	new_inst.depth = dp[0];
	var new_inst = instance_create(416, 272, obj_create_obj_editor);
	new_inst.type = 0;
	new_inst.depth = dp[0];
	var new_inst = instance_create(432, 272, obj_create_obj_editor);
	new_inst.type = 0;
	new_inst.depth = dp[0];
	var new_inst = instance_create(416, 256, obj_create_obj_editor);
	new_inst.type = 12;
	new_inst.depth = dp[12];
	var new_inst = instance_create(352, 240, obj_create_obj_editor);
	new_inst.type = 13;
	new_inst.depth = dp[13];
	var new_inst = instance_create(room_width, room_height, obj_create_obj_editor);
	new_inst.type = -1;
	new_inst.depth = -257;
}
