/// @description Leer archivos para recibir datos
var txt = "";
var content = "";
file_length = 0;
file_load = 0;

if(fileName[0] != ""){
	a++;
	
	fast_file_key_crypt(directory[0] + fileName[0], directory[0] + fileName[0], 0, "AgfR_aedtt&$32fds_asdfe-3-ad3rt-");
	#region Leer archivo
	ini_open(directory[0] + fileName[0]);
	if(!ini_section_exists("Data")){
		var lvl = string_copy(string(fileName[0]), 1, string_length(fileName[0])-4);
		ini_close();
	
		content = "";
		var archive = file_text_open_read(directory[0] + fileName[0]);
		while !file_text_eof(archive) {
			var line = file_text_read_string(archive);
			file_text_readln(archive);
			var content = content + line;
		}
		file_text_close(archive);
		content = base64_encode(content);
	
		var levelname = string(pos);
		if (file_exists(directory[0] + fileName[0])) {
			file_delete(directory[0] + fileName[0]);
			fileName[0] = levelname + ".pml";
		}
		ini_open(directory[0] + fileName[0]);
		ini_write_string("Data", "Name", lvl);
		ini_write_string("Level", "Content", content);
		ini_write_string("Data", "Date", date_date_string(date_current_datetime()));
		ini_write_real("Data", "Verify", 0);
		ini_write_string("Data", "GM_version", GM_version);
		var lvl_name = ini_read_string("Data", "Name", "FATAL_ERROR_0");
		var lvl_date = ini_read_string("Data", "Date", date_date_string(date_current_datetime()));
		var lvl_content = ini_read_string("Level", "Content", "");
		var lvl_verify = ini_read_real("Data", "Verify", 0);
		var lvl_gm_version = ini_read_string("Data", "GM_version", GM_version);
		ini_close();
		
		state = text[91] + string(a) + text[83];
	} else {
		var lvl_name = ini_read_string("Data", "Name", "FATAL_ERROR_0");
		var lvl_date = ini_read_string("Data", "Date", date_date_string(date_current_datetime()));
		var lvl_content = ini_read_string("Level", "Content", "");
		var lvl_verify = ini_read_real("Data", "Verify", 0);
		var lvl_gm_version = ini_read_string("Data", "GM_version", GM_version);
		ini_close();
		
		state = text[82] + string(a) + text[83];
	}

	#endregion
	fast_file_key_crypt(directory[0] + fileName[0], directory[0] + fileName[0], 1, "AgfR_aedtt&$32fds_asdfe-3-ad3rt-");
	
	var map = ds_map_create();
	ds_map_add(map, "Name", lvl_name);
	ds_map_add(map, "Date", lvl_date);
	ds_map_add(map, "Content", lvl_content);
	ds_map_add(map, "Verify", lvl_verify);
	ds_map_add(map, "GM_version", lvl_gm_version);
	
	txt = base64_encode(json_encode(map));
	ds_map_destroy(map);
	
	final_text = final_text + txt + "|";
	fileName[0] = file_find_next();
	
	file_length = string_byte_length(lvl_content)/1000 + 1;
	
	alarm[1] = file_length/2;
} else {
	file_find_close();
	
	fast_file_key_crypt("User_account.pmx", "User_account.pmx", 0, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
	ini_open("User_account.pmx");
	if(ini_read_real("Account", "id", 0) > 0){
		var ID = ini_read_real("Account", "id", 0);
	}
	ini_close();
	fast_file_key_crypt("User_account.pmx", "User_account.pmx", 1, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
	
	post = http_post_string("http://pixelmanserver.000webhostapp.com/user_load_data.php", "id=" + string(ID));
	
	state = text[79];
	
}
