scr_editor_obj(0);

for(var i = 0; i <= force_cpu; i++){
	var dir = directory[0] + level_name + "Level\\" + base64_encode(md5_string_unicode(obj_nmb)) + ".pmol";
	if(file_exists(dir)){
		//fast_file_key_crypt(dir, dir, 0, scr_blowfish(0) + lvl_pass);
		
		var draggableJson = fast_file_string_key_crypt(dir, scr_blowfish(0) + lvl_pass);
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
			var _depth = 0;
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
				var _obj_speed = 2;
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
	
			var obj = scr_detect_object(obj_type);
	
			if(obj_type != 1){
				var new_inst = instance_create_depth(_x, _y, _depth, obj);
				pos = [_x, _y];
			} else {
				grav = _gr;
				player_2 = [player_2_x, player_2_y];
				pant_div_ = pant_div;
				player_pos = [_x, _y];
			}
			if(obj_type != 1 && obj_type != -1){
				new_inst.image_xscale = _imageXscale;
				new_inst.image_yscale = _imageYscale;
				new_inst.image_angle = _imageAngle;
				new_inst.depth = _depth;
			}
			if(obj_type == 0){
				new_inst.ID = _ID;
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
			if(obj_type == 14 || obj_type == 15){
				new_inst.gr = _gr;
			}
		}
		ds_map_destroy(draggableMap);
		
	
		//fast_file_key_crypt(dir, dir, 1, scr_blowfish(0) + lvl_pass);	
	}
	obj_nmb++;
}
