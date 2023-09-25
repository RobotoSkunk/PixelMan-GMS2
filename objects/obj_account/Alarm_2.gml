/// @description Cargar niveles
var n = 0;
var cont = "";
file_length = 0;
file_load = 0;

while(file_exists(directory[0] + string(n) + ".pml")){
	n++;
}
if(a < array_length_1d(file_load_map)){
	if(file_load_map[a] != "" && file_load_map[a] != "|"){
		cont = base64_decode(file_load_map[a]);
		var map = json_decode(cont);
		
		if(map != -1){
			ini_open(directory[0] + string(n) + ".pml");
			if(ds_map_exists(map, "Name")){
				var lvl_name = map[? "Name"];
				ini_write_string("Data", "Name", string(lvl_name));
			}
			if(ds_map_exists(map, "Date")){
				var lvl_date = map[? "Date"];
				ini_write_string("Data", "Date", lvl_date);
			}
			if(ds_map_exists(map, "Content")){
				var lvl_content = map[? "Content"];
				ini_write_string("Level", "Content", lvl_content);
				file_length = string_byte_length(lvl_content)/1000 + 1;
			} else {
				file_length = 10;
			}
			if(ds_map_exists(map, "Verify")){
				var lvl_verify = map[? "Verify"];
				ini_write_string("Data", "Verify", lvl_verify);
			}
			if(ds_map_exists(map, "GM_version")){
				var lvl_gm_version = map[? "GM_version"];
				ini_write_string("Data", "GM_version", lvl_gm_version);
			}
			ini_close();
			
			ds_map_destroy(map);
		
			if(file_exists(directory[0] + string(n) + ".pml")){
				fast_file_key_crypt(directory[0] + string(n) + ".pml", directory[0] + string(n) + ".pml", 1, "AgfR_aedtt&$32fds_asdfe-3-ad3rt-");
			}
		}
		switch(languaje){
			case "Español":
				state = "Instalando nivel " + string(a) + "...";
				break;
			case "Inglés":
				state = "Installing level " + string(a) + "...";
				break;
			case "Portugués":
				state = "Instalando nível " + string(a) + "...";
				break;
		}
		
		alarm[2] = file_length/2;
	}
} else {
	answer = "loaded";
}

a++;