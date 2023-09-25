/// @description CPU
var mx = device_mouse_x_to_gui(0),
	my = device_mouse_y_to_gui(0),
	any = false;

can_use = [menu_active == 1, menu_active == 1.1, menu_active == 1.2, menu_active == 1.3];
for(var i = 0; i < array_length_1d(can_use); i++){
	if(can_use[i]){
		al[i] = lerp(al[i], 1, 0.1);
		any = true;
	} else {
		al[i] = lerp(al[i], 0, 0.1);
	}
}
if(any){
	wait++;
	wait = clamp(wait, 0, 2);
} else {
	wait = 0;
}
#region Selector
if(can_use[0]){
	for(var i = 0; i < sprite_get_number(spr_menu_select_button); i++){
	var posx = 90 + round_down(i/2)*ideal_width;
	if(i % 2 == 0) posx = -90 + round_down(i/2)*ideal_width;
		if(point_in_rectangle(mx, my, ideal_width/2 + posx - page_x - 75, ideal_height/2 - 100, ideal_width/2 + posx - page_x + 75, ideal_height/2 + 100)){
			if(mouse_check_button(mb_left)) sz[i] = lerp(sz[i], 1.2, 0.2);
			else sz[i] = lerp(sz[i], 1, 0.2);
			
			if(mouse_check_button_released(mb_left)){
				wait = 0;
				switch(i){
					case 2:
						menu_active = 1.3;
						if(lvls == undefined){
							timer[0] = 5;
							lvl_nmb = -1;
							finding_lvls = true;
						}
						break;
				}
			}
		} else {
			sz[i] = lerp(sz[i], 1, 0.2);
		}
	}
	#region Navegación
	var index = sprite_get_number(spr_menu_select_button);
	if(point_in_rectangle(mx, my, 0, ideal_height/2 - 20, 25, ideal_height/2 + 20)){
		if(mouse_check_button(mb_left)) sz[index] = lerp(sz[index], 1.3, 0.2);
		else sz[index] = lerp(sz[index], 1, 0.2);
		
		if(mouse_check_button_released(mb_left)){
			page--;
		}
	} else {
		sz[index] = lerp(sz[index], 1, 0.2);
	}
	
	index++;
	if(point_in_rectangle(mx, my, ideal_width-25, ideal_height/2 - 20, ideal_width, ideal_height/2 + 20)){
		if(mouse_check_button(mb_left)) sz[index] = lerp(sz[index], 1.3, 0.2);
		else sz[index] = lerp(sz[index], 1, 0.2);
		
		if(mouse_check_button_released(mb_left)){
			page++;
		}
	} else {
		sz[index] = lerp(sz[index], 1, 0.2);
	}
	#endregion
	
}
page = clamp(page, 0, 1);
page_x = lerp(page_x, ideal_width*page, 0.1);
#endregion
#region Selector de niveles
if(finding_lvls){
	sload += 5;
	if(sload > 359) sload = 0;
	btn_sz_sel = [0.8, 0.8];
} else {
	var wheel = mouse_wheel_up() - mouse_wheel_down(), btn_h = 55, sep = 70;
	if(!new_lvl && !going_to_dlt && !lvl_data[0]) y_to += wheel*35;
	y_to = clamp(y_to, -(btn_h*array_length_1d(lvls) - ideal_height + 5), 0);
	y_btn = lerp(y_btn, y_to, 0.2);
	draw_set_font(fnt_robotoB);
	
	for(var i = 0; i < array_length_1d(lvls_col); i++){
		var new_y = -(ideal_height/2) + (ideal_height/2)*al[3], y_btn_pos = new_y + y_btn;
		#region Mostrar niveles
		if(rectangle_in_rectangle(0, 0, ideal_width, ideal_height, sep, 5 + btn_h*i + y_btn_pos, ideal_width-sep, btn_h + btn_h*i + y_btn_pos)){
			if(!new_lvl && !going_to_dlt && !lvl_data[0] && point_in_rectangle(mx, my, sep, 5 + btn_h*i + y_btn_pos, ideal_width-sep, btn_h + btn_h*i + y_btn_pos)){
				if(mouse_check_button(mb_left)) lvls_col[i] = lerp(lvls_col[i], 150, 0.2);
				else lvls_col[i] = lerp(lvls_col[i], 100, 0.2);
				
				if(mouse_check_button_released(mb_left) && wait == 2){
					lvl_data = [1, i, lvls[i]];
					map = json_decode(lvl_data[2]);
					new_desc = string_adv(map[? "lvl_description"], 245*1.2)
					ds_map_destroy(map);
				}
			} else {
				lvls_col[i] = lerp(lvls_col[i], 0, 0.2);
			}
		}
		#endregion
	}
	if(lvl_data[0]){
		lvl_al = lerp(lvl_al, 0.8, 0.2);
	} else {
		lvl_al = lerp(lvl_al, 0, 0.2);
	}
	
	if(!surface_exists(line)){
		line = surface_create(50, ideal_height+2);
		surface_set_target(line);
		draw_clear_alpha(c_black, 0);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(35, -1);
		draw_vertex(50, -1);
		draw_vertex(0, ideal_height+1);
		draw_vertex(15, ideal_height+1);
		draw_primitive_end();
		draw_set_color(-1);
		surface_reset_target();
	}
	if(lvl_al > 0.05){
		var xpos = ideal_width+1 - 351*(lvl_al/0.8);
		if(!new_lvl && !going_to_dlt && mouse_check_button_released(mb_left)){
			#region Renombrar
			if(lvl_data[0] && point_in_rectangle(mx, my, xpos + 45, 15, xpos + 300, 50)){
				chg_name = true;
				var map = json_decode(lvl_data[2]);
				new_name = map[? "lvl_name"];
				keyboard_string = new_name;
				ds_map_destroy(map);
			} else if(chg_name){
				var map = json_decode(lvl_data[2]);
				var dir = directory[0] + map[? "lvl_file"] + "data.pmd";
				var tmp_name = new_name;
				if string_replace_all(tmp_name, " ", "") == "" tmp_name = "Unnamed";
				
				fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
					ini_open(dir);
						ini_write_string("Data", "Name", base64_encode(tmp_name));
						map[? "lvl_name"] = base64_decode(ini_read_string("Data", "Name", "FATAL_ERROR_CHGNAME_01"));
					ini_close();
				fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
				
				lvl_data[2] = json_encode(map);
				tmp_name = map[? "lvl_name"];
				ds_map_destroy(map);
				
				var map = json_decode(lvls[lvl_data[1]]);
				map[? "lvl_name"] = tmp_name;
				lvls[lvl_data[1]] = json_encode(map);
				ds_map_destroy(map);
				chg_name = false;
			}
			#endregion
			#region Cambiar descripción
			if(lvl_data[0] && point_in_rectangle(mx, my, xpos + 45, 72, xpos + 300, 153)){
				chg_desc = true;
				var map = json_decode(lvl_data[2]);
				new_desc = map[? "lvl_description"];
				keyboard_string = new_desc;
				ds_map_destroy(map);
			} else if(chg_desc){
				var map = json_decode(lvl_data[2]);
				var dir = directory[0] + map[? "lvl_file"] + "data.pmd";
				var tmp_desc = string_replace_all(new_desc, " \n", "");
				if string_replace_all(tmp_desc, " ", "") == "" tmp_desc = "";
				
				fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
					ini_open(dir);
						ini_write_string("Data", "Description", base64_encode(tmp_desc));
						map[? "lvl_description"] = base64_decode(ini_read_string("Data", "Description", ""));
					ini_close();
				fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
				
				lvl_data[2] = json_encode(map);
				tmp_desc = map[? "lvl_description"];
				ds_map_destroy(map);
				
				var map = json_decode(lvls[lvl_data[1]]);
				map[? "lvl_description"] = tmp_desc;
				lvls[lvl_data[1]] = json_encode(map);
				ds_map_destroy(map);
				chg_desc = false;
			}
			#endregion
		}
		if(chg_name){
			line_sz[0] = lerp(line_sz[0], 1, 0.2);
			if(string_length(keyboard_string) > 25){
				keyboard_string = string_copy(keyboard_string, 1, 25);
			}
			new_name = keyboard_string;
		} else {
			line_sz[0] = lerp(line_sz[0], 0, 0.2);
		}
		if(chg_desc){
			line_sz[1] = lerp(line_sz[1], 1, 0.2);
			if(string_length(keyboard_string) > 140){
				keyboard_string = string_copy(keyboard_string, 1, 140);
			}
			new_desc = string_adv(keyboard_string, 245*1.2);
		} else {
			line_sz[1] = lerp(line_sz[1], 0, 0.2);
		}
		
		#region Botones
		for(var i = 0; i < 4; i++){
			if(!new_lvl && !going_to_dlt && point_in_rectangle(mx, my, xpos + 70 + 65*i - 32*0.9, ideal_height - 70 - 32*0.9, xpos + 70 + 65*i + 32*0.9, ideal_height - 70 + 32*0.9)){
				if(mouse_check_button(mb_left)) btn_lvl_sz[i] = lerp(btn_lvl_sz[i], 1.1, 0.3);
				else btn_lvl_sz[i] = lerp(btn_lvl_sz[i], 0.9, 0.3);
				
				if(mouse_check_button_released(mb_left)){
					var map = json_decode(lvl_data[2]);
					switch(i){
						case 0:
							if(scr_compare_versions(map[? "lvl_gm_version"], GM_version) <= 0 && map[? "lvl_saved"]){
								move_to_room = true;
								timer[1] = room_speed*0.6;
								level_name = map[? "lvl_file"];
							}
							break;
						case 1:
							if(scr_compare_versions(map[? "lvl_gm_version"], GM_version) <= 0 && map[? "lvl_saved"]){
								move_to_room = true;
								timer[2] = room_speed*0.6;
								level_name = map[? "lvl_file"];
							}
							break;
						case 2:
							going_to_dlt = true;
							deleting = false;
							al_dlt = 0;
							del_dir = "";
							file_del = "";
							files_deleted = 0;
							break;
						case 3:
							if(scr_compare_versions(map[? "lvl_gm_version"], GM_version) <= 0 && map[? "lvl_saved"]){
								move_to_room = true;
								timer[3] = room_speed*0.6;
							}
							break;
					}
					ds_map_destroy(map);
				}
			} else {
				btn_lvl_sz[i] = lerp(btn_lvl_sz[i], 0.9, 0.3);
			}
			
		}
		#endregion
	}
	
	draw_set_font(-1);
	
	#region Recargar niveles
	if(!finding_lvls && !new_lvl && !going_to_dlt && !lvl_data[0] && can_use[3] && point_in_rectangle(mx, my, 10, ideal_height - 60, 60, ideal_height - 10)){ //25
		if(mouse_check_button(mb_left)) btn_sz_sel[0] = lerp(btn_sz_sel[0], 1, 0.3);//
		else btn_sz_sel[0] = lerp(btn_sz_sel[0], 0.8, 0.3);
		
		if(mouse_check_button_released(mb_left)){
			timer[0] = 5;
			lvl_nmb = -1;
			finding_lvls = true;
		}
	} else {
		btn_sz_sel[0] = lerp(btn_sz_sel[0], 0.8, 0.3);
	}
	#endregion
	#region Crear nivel
	if(!finding_lvls && !new_lvl && !going_to_dlt && !lvl_data[0] && can_use[3] && point_in_rectangle(mx, my, ideal_width - 60, ideal_height - 60, ideal_width - 10, ideal_height - 10)){ //25
		if(mouse_check_button(mb_left)) btn_sz_sel[1] = lerp(btn_sz_sel[1], 1, 0.3);//
		else btn_sz_sel[1] = lerp(btn_sz_sel[1], 0.8, 0.3);
		
		if(mouse_check_button_released(mb_left)){
			new_lvl = true;
		}
	} else {
		btn_sz_sel[1] = lerp(btn_sz_sel[1], 0.8, 0.3);
	}
	#endregion
}
#endregion
#region Nuevo nivel
if(new_lvl){
	ul_al = lerp(ul_al, 1, 0.1);
	if(new_lvl_chg){
		line_sz[2] = lerp(line_sz[2], 1, 0.2);
		if(string_length(keyboard_string) > 25){
			keyboard_string = string_copy(keyboard_string, 1, 25);
		}
		new_lvl_name = keyboard_string;
	} else {
		line_sz[2] = lerp(line_sz[2], 0, 0.2);
	}
	if(process_lvl){
		timer[0] = 5;
		lvl_nmb = -1;
		finding_lvls = true;
		scr_create_level(new_lvl_name);
		new_lvl_name = "";
		new_lvl = false;
		process_lvl = false;
	}
} else {
	ul_al = lerp(ul_al, 0, 0.1);
}
#endregion
#region Alarmas
for(var i = 0; i < array_length_1d(timer); i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				#region alarm 0 | Encontrar niveles
				case 0:
					//Buscar niveles
					var lvl_found = "";
					if(lvl_nmb == -1){
						lvl_found = file_find_first(directory[0] + "*", fa_directory);
						lvls = undefined;
						lvls_col = undefined;
					} else {
						lvl_found = file_find_next();
					}
					
					aa = lvl_found;
					
					//Añadirlos al array o finalizar búsqueda
					if(lvl_found != ""){
						if(file_exists(directory[0] + lvl_found + "\\data.pmd")){
							#region Leer nivel
							var ini_str = fast_file_string_key_crypt(directory[0] + lvl_found + "\\data.pmd", scr_blowfish(0));
							//if(lvl_nmb == 0) show_debug_message(ini_str);
							
							ini_open_from_string(ini_str);
								var lvl_name = base64_decode(ini_read_string("Data", "Name", "FATAL_READELVL_ERROR_1"));
								var lvl_date = ini_read_string("Data", "Date", date_date_string(date_current_datetime()));
								var lvl_pant_div = ini_read_real("Data", "Pant_div", false);
								var final_size = ini_read_real("Data", "Level_size", -1);
								var lvl_attempts = ini_read_real("Data", "Attempts", 0);
								var lvl_description = base64_decode(ini_read_string("Data", "Description", ""));
								var lvl_id = ini_read_string("Data", "ID", "N/A");
								var lvl_user = ini_read_string("Data", "User", "N/A");
								
								var lvl_verify = ini_read_real("Controllers", "Verify", 0);
								var lvl_gm_version = ini_read_string("Controllers", "GM_version", GM_version);
								var lvl_saved = ini_read_real("Controllers", "Saved", 0);
							ini_close();
							#endregion
							#region Detectar tamaño del nivel
							var file_size, lvl_size_nmb, lvl_size_tp, data_size_arr, lvl_size;

							if(final_size == -1){
								lvl_size = "FATAL_ERROR_FSIZE1";
							} else {
								file_size = final_size;
								lvl_size_nmb = "";
								lvl_size_tp = "ERROR";
								data_size_arr = [power(2, 10), power(2, 20)];

								var file_buffer = buffer_load(directory[0] + lvl_found + "\\data.pmd");
								file_size += buffer_get_size(file_buffer);
								buffer_delete(file_buffer);

								if(file_size < data_size_arr[0]){ //Bytes
									lvl_size_nmb = string(file_size);
									lvl_size_tp = " B";
								} else if(file_size < data_size_arr[1]){ //Kilobytes
									lvl_size_nmb = string(file_size/data_size_arr[0]);
									lvl_size_tp = " KB";
								} else { //Megabytes
									lvl_size_nmb = string(file_size/data_size_arr[1]);
									lvl_size_tp = " MB";
								}
								lvl_size = lvl_size_nmb + lvl_size_tp;
							}
							#endregion
							
							var map = ds_map_create(), arr_sz = array_length_1d(lvls);
							map[? "lvl_file"] = lvl_found + "\\";
							map[? "lvl_name"] = lvl_name;
							map[? "lvl_date"] = lvl_date;
							map[? "lvl_pant_div"] = lvl_pant_div;
							map[? "lvl_size"] = lvl_size;
							map[? "lvl_verify"] = lvl_verify;
							map[? "lvl_gm_version"] = lvl_gm_version;
							map[? "lvl_saved"] = lvl_saved;
							map[? "lvl_attempts"] = lvl_attempts;
							map[? "lvl_description"] = lvl_description;
							map[? "lvl_user"] = lvl_user;
							map[? "lvl_id"] = lvl_id;
							
							lvls[arr_sz] = json_encode(map);
							lvls_col[arr_sz] = 0;
							
							if(lvl_data[0] && arr_sz == lvl_data[1]){
								lvl_data = [1, arr_sz, lvls[arr_sz]];
								new_desc = string_adv(lvl_description, 245*1.2);
							}
							
							ds_map_destroy(map);
						}
						lvl_nmb++;
						timer[0] = 5;
					} else {
						y_btn = ideal_width;
						y_to = 0;
						finding_lvls = false;
						file_find_close();
					}
					break;
				#endregion
				#region alarm 1 | Ir al editor
				case 1:
					room_goto(rm_editor);
					break;
				#endregion
				#region alarm 2 | Ir al editor
				case 2:
					room_goto(rm_test);
					break;
				#endregion
				#region alarm 3 | Ir al editor
				case 3:
					room_goto(rm_patreon);
					break;
				#endregion
				#region alarm 4 | Eliminar nivel
				case 4:
					if(file_del != ""){
						repeat(5 + force_cpu){
							if(file_del != ""){
								file_delete(del_dir + "\\Level\\" + file_del);
								file_del = file_find_next();
								files_deleted++;
							}
						}
						timer[4] = 1;
					} else {
						file_find_close();
						file_delete(del_dir + "\\data.pmd");
						directory_destroy(del_dir);
						lvl_data = [false, 0, ""];
						timer[0] = 1;
						lvl_nmb = -1;
						finding_lvls = true;
						lvl_al = 0;
						going_to_dlt = false;
					}
					break;
				#endregion
			}
		}
	}
}
#endregion
