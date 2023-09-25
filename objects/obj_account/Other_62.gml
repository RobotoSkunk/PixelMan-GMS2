/// @description Mostrar respuesta
answer = "";
if (async_load[? "id"] == post) {
	if (async_load[? "status"] == 0) {
		answer = async_load[? "result"];
	}
}

//show_message(answer);
if(answer != ""){
	if(string_copy(answer, 1, 7) == "success"){
		#region Cuenta creada
		var data = scr_string_split(answer, "|");
		
		if(file_exists("User_account.pmx")){
			fast_file_key_crypt("User_account.pmx", "User_account.pmx", 0, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
		}
		
		ini_open("User_account.pmx");
		ini_write_real("Account", "id", real(data[1]));
		ini_write_string("Account", "username", data[2]);
		ini_write_real("Player", "spr_player", data[3]);
		ini_close();
		
		ini_open("User_data.pmx");
		var r = real(hex_to_dec_fast(string_copy(data[4], 1, 2)));
		var g = real(hex_to_dec_fast(string_copy(data[4], 3, 4)));
		var b = real(hex_to_dec_fast(string_copy(data[4], 5, 6)));
		
		ini_write_real("player_color", "red", r);
		ini_write_real("player_color", "green", g);
		ini_write_real("player_color", "blue", b);
		
		ini_write_real("player_color", "hue", color_get_hue(make_color_rgb(r, g, b)));
		ini_write_real("player_color", "saturation", color_get_saturation(make_color_rgb(r, g, b)));
		ini_write_real("player_color", "value", color_get_value(make_color_rgb(r, g, b)));
		ini_close();
		
		/*if(file_exists(working_directory + "\\TEST\\" + "User_account.pmx")){
			file_delete(working_directory + "\\TEST\\" + "User_account.pmx");
		}
		file_copy("User_account.pmx", working_directory + "\\TEST\\" + "User_account.pmx");*/
		
		fast_file_key_crypt("User_account.pmx", "User_account.pmx", 1, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
		answer = "success";
		#endregion
	} else if(string_copy(answer, 1, 6) == "loaded"){
		#region Cuenta cargada
		var data = scr_string_split(answer, "|");
		
		fast_file_key_crypt("User_account.pmx", "User_account.pmx", 0, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
		
		ini_open("User_account.pmx");
		ini_write_string("Account", "username", data[3]);
		ini_write_real("Player", "spr_player", data[1]);
		
		if(ini_read_real("Account", "id", 0) > 0){
			var ID = ini_read_real("Account", "id", 0);
		}
		ini_close();

		fast_file_key_crypt("User_account.pmx", "User_account.pmx", 1, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
		
		ini_open("User_data.pmx");
		var r = real(hex_to_dec_fast(string_copy(data[2], 1, 2)));
		var g = real(hex_to_dec_fast(string_copy(data[2], 3, 4)));
		var b = real(hex_to_dec_fast(string_copy(data[2], 5, 6)));
		
		ini_write_real("player_color", "red", r);
		ini_write_real("player_color", "green", g);
		ini_write_real("player_color", "blue", b);
		
		ini_write_real("player_color", "hue", color_get_hue(make_color_rgb(r, g, b)));
		ini_write_real("player_color", "saturation", color_get_saturation(make_color_rgb(r, g, b)));
		ini_write_real("player_color", "value", color_get_value(make_color_rgb(r, g, b)));
		ini_close();
		
		
		/*if(file_exists(working_directory + "\\TEST\\" + "User_account.pmx")){
			file_delete(working_directory + "\\TEST\\" + "User_account.pmx");
		}
		file_copy("User_account.pmx", working_directory + "\\TEST\\" + "User_account.pmx");*/
		switch(languaje){
			case "Español":
				state = "Esperando niveles...";
				break;
			case "Inglés":
				state = "Waiting levels...";
				break;
			case "Portugués":
				state = "Esperando pelos níveis...";
				break;
		}
		
		post = http_post_string("http://pixelmanserver.000webhostapp.com/user_load_player_levels.php", "id=" + string(ID) + "&final=" + final_text);
		
		answer = "levels_req";
		#endregion
	} else if(string_copy(answer, 1, string_length("player_lvl_rslt")) = "player_lvl_rslt"){
		#region Niveles cargados
		var lvls = string_copy(answer, string_length("player_lvl_rslt")+2, string_length(answer));
		file_load_map = scr_string_split(lvls, "|");
		
		answer = "loading";
		a = 0;
		alarm[2] = 2;
		#endregion
	}
}