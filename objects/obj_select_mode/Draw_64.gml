/// @description GPU
#region Selector
if(al[0] > 0.05){
	var size = sz[sprite_get_number(spr_menu_select_button)],
		size_2 = sz[sprite_get_number(spr_menu_select_button)+1],
		new_y = -(ideal_height/2) + (ideal_height/2)*al[0],
		names = [text[43], "Online", "Editor", ""],
		avaiable = [0, 0, 1, 0];

	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_robotoB);
	draw_set_alpha(al[0]);

	for(var i = 0; i < sprite_get_number(spr_menu_select_button); i++){
		var posx = 90 + round_down(i/2)*ideal_width;
		if(i % 2 == 0) posx = -90 + round_down(i/2)*ideal_width;
		draw_sprite_ext(spr_menu_select_button, i, ideal_width/2 + posx - page_x, ideal_height/2 + new_y, sz[i], sz[i], 0, -1, al[0]);
		draw_text_transformed(ideal_width/2 + posx - page_x, ideal_height/2-80*sz[i] + new_y, names[i], sz[i]*1.8, sz[i]*1.8, 0);
	
		if(!avaiable[i]){
			var final_nmb = sprite_get_number(spr_menu_select_button)-1;
			draw_sprite_ext(spr_menu_select_button, final_nmb, ideal_width/2 + posx - page_x, ideal_height/2 + new_y, sz[i], sz[i], 0, -1, al[0]*0.8);
			draw_text_transformed(ideal_width/2 + posx - page_x+10*sz[i], ideal_height/2-15*sz[i] + new_y, "Coming Soon", sz[i]*1.8, sz[i]*1.8, -55);
		}
	}

	if(page != 0) draw_sprite_ext(spr_decorated_buttons, 5, 18, ideal_height/2+new_y, -size, size, 0, -1, al[0]);
	if(page != 1) draw_sprite_ext(spr_decorated_buttons, 5, ideal_width-18, ideal_height/2+new_y, size_2, size_2, 0, -1, al[0]);

	scr_button_back(can_use[0], new_y, al[0]);

	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_alpha(1);
}
#endregion
#region Selector de niveles
if(al[3] > 0.05){
	draw_set_alpha(al[3]);
	var new_y = -(ideal_height/2) + (ideal_height/2)*al[3];
	#region Botones de selección
	if(finding_lvls){
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_roboto);
		var w = 150,
			x1 = clamp(ideal_width/2 - w/2 + dsin(sload)*w, ideal_width/2 - w/2, ideal_width/2 + w/2),
			x2 = clamp(ideal_width/2 + w/2 + dsin(sload)*w, ideal_width/2 - w/2, ideal_width/2 + w/2);
		
		draw_text_transformed(ideal_width/2, ideal_height/2-5 + new_y, "Loading...", 0.8, 0.8, 0);
		if(dsin(sload) != -1 && dsin(sload) != 1){
			draw_rectangle(x1, ideal_height/2+9 + new_y, x2, ideal_height/2+10 + new_y, 0);
		}
		
		draw_set_color(-1);
		draw_set_font(-1);
		draw_set_halign(-1);
		draw_set_valign(-1);
	} else {
		draw_sprite_ext(spr_decorated_buttons, 7, 35, ideal_height-35 + new_y, btn_sz_sel[0], btn_sz_sel[0], 0, -1, al[3]);
		draw_sprite_ext(spr_decorated_buttons, 11, ideal_width-35, ideal_height-35 + new_y, btn_sz_sel[1], btn_sz_sel[1], 0, -1, al[3]);
		if(array_length_1d(lvls) > 0){
			var btn_h = 55, sep = 70, y_btn_pos = new_y + y_btn;
			for(var i = 0; i < array_length_1d(lvls); i++){
				#region Mostrar niveles
				if(rectangle_in_rectangle(0, 0, ideal_width, ideal_height, sep, 5 + btn_h*i + y_btn_pos, ideal_width-sep, btn_h + btn_h*i + y_btn_pos)){
					draw_set_color(make_color_hsv(0, 0, lvls_col[i]));
					draw_rectangle(sep, 5 + btn_h*i + y_btn_pos, ideal_width-sep, btn_h + btn_h*i + y_btn_pos, 0);
					draw_set_color(c_white);
					
					var map = json_decode(lvls[i]);
					
					draw_set_font(fnt_robotoB);
					draw_set_halign(fa_left);
					draw_set_valign(fa_top);
					var txt_sz = clamp((ideal_width-sep*2-10) / string_width(map[? "lvl_name"]), 0, 1);
					draw_text_transformed(sep + 5, 10 + btn_h*i + y_btn_pos, string(map[? "lvl_name"]), txt_sz, txt_sz, 0);
					
					var verifytxt = [text[114], text[113]],
						playernmbtxt = [text[115], text[116]],
						adjust_txt = 0,
						final_txt = "";
					
					//lvl_name | lvl_date | lvl_pant_div | lvl_size | lvl_verify | lvl_gm_version | lvl_saved | lvl_attempts
					final_txt = string(map[? "lvl_size"]) + " | " +
							string(map[? "lvl_date"]) + " | " +
							verifytxt[map[? "lvl_verify"]] + " | " +
							map[? "lvl_gm_version"] + " | " +
							playernmbtxt[map[? "lvl_pant_div"]];
					
					draw_set_font(fnt_roboto);
					adjust_txt = clamp((ideal_width-sep*2-10) / string_width(final_txt), 0, 1);
					draw_set_valign(fa_bottom);
					draw_text_transformed(sep + 5, btn_h + btn_h*i + y_btn_pos, final_txt, adjust_txt, adjust_txt, 0);
					
					//Mostrar error
					if(scr_compare_versions(map[? "lvl_gm_version"], GM_version) == 1 || !map[? "lvl_saved"]){
						draw_set_color(c_black);
						draw_set_alpha(0.8*al[3]);
						draw_rectangle(sep, 5 + btn_h*i + y_btn_pos, ideal_width-sep, btn_h + btn_h*i + y_btn_pos, 0);
						
						draw_set_color(c_white);
						draw_set_alpha(al[3]);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						if(scr_compare_versions(map[? "lvl_gm_version"], GM_version) == 1){var prnt_e = text[118];}
						else {var prnt_e = text[117];}
						draw_text_transformed(ideal_width/2, btn_h/2 + btn_h*i + y_btn_pos - 2, prnt_e, 1, 1, 0);
					}
					
					draw_set_color(c_white);
					draw_rectangle_border(sep, 5 + btn_h*i + y_btn_pos, ideal_width-sep, btn_h + btn_h*i + y_btn_pos, 2);
					
					ds_map_destroy(map);
				}
				#endregion
			}
		} else {
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt_roboto);
			draw_text(ideal_width/2, ideal_height/2 + new_y, text[38]);
		}
		
		draw_set_color(-1);
		draw_set_font(-1);
		draw_set_halign(-1);
		draw_set_valign(-1);
	}
	#endregion
	#region Interfaz del nivel
	if(lvl_al > 0.05){
		draw_set_color(c_black);
		draw_set_alpha(lvl_al);
		draw_rectangle(-1, -1, ideal_width+1, ideal_height+1, 0);
		
		draw_set_alpha(1);
		draw_set_color(c_white);
		var xpos = ideal_width+1 - 351*(lvl_al/0.8);
		draw_set_alpha(1);
		if(surface_exists(line)){
			draw_set_color(c_black);
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(xpos + 40, -1);
			draw_vertex(ideal_width+1, -1);
			draw_vertex(xpos + 10, ideal_height+1);
			draw_vertex(ideal_width+1, ideal_height+1);
			draw_primitive_end();
			
			draw_surface(line, xpos, 0);
		}
		
		if(lvl_data[2] != ""){
			var map = json_decode(lvl_data[2]);
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			draw_set_color(c_white);
			draw_set_font(fnt_robotoBI);
			#region Nombre del nivel
			if(chg_name){
				var lvl_nm = new_name;
			} else {
				var lvl_nm = map[? "lvl_name"];
			}
			var txt_sz = clamp(245 / string_width(lvl_nm), 0, 1);
			draw_text_transformed(xpos + 50, 52, lvl_nm, txt_sz, txt_sz, 0);
			
			draw_set_color(c_dkgray);
			draw_line_width(xpos + 45, 50, xpos + 300, 50, 1);
			draw_set_color(c_white);
			if(line_sz[0] != 0){
				draw_line_width(xpos + 45, 50, xpos + 45 + 255*line_sz[0], 50, 1);
			}
			#endregion
			#region Descripción
			if(!chg_desc && map[? "lvl_description"] == ""){
				var lvl_dsc = "No description...";
				draw_set_color(c_dkgray);
			} else {
				//var lvl_dsc = map[? "lvl_description"];
				var lvl_dsc = new_desc;
			}
			draw_set_font(fnt_robotoB);
			draw_set_valign(fa_top);
			if(string_height(lvl_dsc) > 95) txt_sz = 0.55;
			else txt_sz = 0.8;
			draw_text_transformed(xpos + 50, 72, lvl_dsc, txt_sz, txt_sz, 0);
			
			draw_set_color(c_dkgray);
			draw_line_width(xpos + 45, 153, xpos + 300, 153, 1);
			draw_set_color(c_white);
			if(line_sz[1] != 0){
				draw_line_width(xpos + 45, 153, xpos + 45 + 255*line_sz[1], 153, 1);
			}
			#endregion
			#region Level data
			var verifytxt = [text[114], text[113]]

			var final_data = "User: " + map[? "lvl_user"] + " | ID: " + map[? "lvl_id"] + " | " + verifytxt[map[? "lvl_verify"]] + " | Attempts: " + string(map[? "lvl_attempts"]);
			
			draw_set_font(fnt_roboto);
			draw_set_valign(fa_bottom);
			adjust_txt = clamp(275 / string_width(final_data), 0, 0.9);
			draw_text_transformed(xpos + 25, ideal_height-5, final_data, adjust_txt, adjust_txt, 0);
			#endregion
			
			for(var i = 0; i < 4; i++){
				var col = c_dkgray;
				if ((scr_compare_versions(map[? "lvl_gm_version"], GM_version) <= 0 && map[? "lvl_saved"]) || i == 2) col = -1;
				
				draw_sprite_ext(spr_decorated_buttons, 1+i, xpos + 70 + 65*i, ideal_height - 70, btn_lvl_sz[i], btn_lvl_sz[i], 0, col, 1);
			}
			
			draw_set_halign(-1);
			draw_set_valign(-1);
			draw_set_color(-1);
			draw_set_font(-1);
			ds_map_destroy(map);
		}
		
		draw_set_color(-1);
	}
	#endregion
	scr_button_back(can_use[3], new_y, al[3]);
	#region Nuevo nivel
	if(ul_al > 0.05){
		var _y = 30, mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
		draw_set_alpha(ul_al*0.8);
		draw_set_color(c_black);
	
		draw_rectangle(-1, -1, ideal_width+1, ideal_height+1, 0);
		draw_rectangle(0, ideal_height/2-45, ideal_width, ideal_height/2+45, 0);
		draw_set_alpha(ul_al);
	
		if(new_lvl && point_in_rectangle_to_gui(mx, my, ideal_width/2-140, ideal_height/2+_y-10, ideal_width/2-5, ideal_height/2+_y+10)){
			draw_set_color($dbdbdb);
			if mouse_check_button_released(mb_left) {
				new_lvl = false;
			}
		} else { 
			draw_set_color($a0a0a0);
		}
		draw_rectangle(ideal_width/2-140, ideal_height/2+_y-10, ideal_width/2-5, ideal_height/2+_y+10, 0);
	
		if(new_lvl && point_in_rectangle_to_gui(mx, my, ideal_width/2+5, ideal_height/2+_y-10, ideal_width/2+140, ideal_height/2+_y+10)){
			draw_set_color($dbdbdb);
			if mouse_check_button_released(mb_left) {
				process_lvl = true;
			}
		} else {
			draw_set_color($a0a0a0);
		}
		draw_rectangle(ideal_width/2+140, ideal_height/2+_y-10, ideal_width/2+5, ideal_height/2+_y+10, 0);
	
	
		draw_set_font(fnt_robotoBI);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_text(ideal_width/2, ideal_height/2 - 30, text[41]);
	
		draw_set_font(fnt_robotoB);
		draw_text(ideal_width/2+72.5, ideal_height/2+_y+2, text[40]);
		draw_text(ideal_width/2-72.5, ideal_height/2+_y+2, text[39]);
		
		if(new_lvl && mouse_check_button_released(mb_left)){
			if(!new_lvl_chg && point_in_rectangle_to_gui(mx, my, ideal_width/2 - 180, ideal_height/2 - 12, ideal_width/2 + 180, ideal_height/2 + 12)){
				new_lvl_chg = true;
				keyboard_string = new_lvl_name;
			} else if(new_lvl_chg){
				new_lvl_chg = false;
			}
		}
		draw_set_color(c_dkgray);
		draw_line_width(ideal_width/2 - 180, ideal_height/2 + 12, ideal_width/2 + 180, ideal_height/2 + 12, 1);
		draw_set_color(c_white);
		if(line_sz[2] != 0){
			draw_line_width(ideal_width/2 - 180*line_sz[2], ideal_height/2 + 12, ideal_width/2 + 180*line_sz[2], ideal_height/2 + 12, 1);
		}
		draw_set_font(fnt_roboto);
		draw_text(ideal_width/2, ideal_height/2+2, new_lvl_name);
		draw_set_alpha(1);
	
		draw_line_width(-5, ideal_height/2 - 50, -5 + (ideal_width + 10)*ul_al, ideal_height/2 - 50, 2);
		draw_line_width(ideal_width+5 - (ideal_width+10)*ul_al, ideal_height/2 + 50, ideal_width + 5, ideal_height/2 + 50, 2);
	
		draw_set_font(-1);
		draw_set_halign(-1);
		draw_set_valign(-1);
	
		draw_set_color(-1);
	}
	#endregion
	#region Eliminar nivel
	if(going_to_dlt){
		al_dlt = lerp(al_dlt, 1, 0.1);
	} else {
		al_dlt = lerp(al_dlt, 0, 0.1);
	}
	if(al_dlt > 0){
		var mx = device_mouse_x_to_gui(0),
			my = device_mouse_y_to_gui(0),
			_y = 20;
	
		draw_set_color(c_black);
		draw_set_alpha(al_dlt*0.8);
		draw_rectangle(0, 0, ideal_width, ideal_height, 0);
		draw_rectangle(0, ideal_height/2-45, ideal_width, ideal_height/2+45, 0);
		draw_set_alpha(al_dlt);
		
		if(!deleting){
			if(going_to_dlt && point_in_rectangle_to_gui(mx, my, ideal_width/2-140, ideal_height/2+_y-10, ideal_width/2-5, ideal_height/2+_y+10)){
				draw_set_color($dbdbdb);
				if mouse_check_button_released(mb_left) {
					going_to_dlt = false;
				}
			} else { 
				draw_set_color($a0a0a0);
			}
			draw_rectangle(ideal_width/2-140, ideal_height/2+_y-10, ideal_width/2-5, ideal_height/2+_y+10, 0);
			
			if(going_to_dlt && point_in_rectangle_to_gui(mx, my, ideal_width/2+5, ideal_height/2+_y-10, ideal_width/2+140, ideal_height/2+_y+10)){
				draw_set_color($dbdbdb);
				if mouse_check_button_released(mb_left) {
					deleting = true;
					timer[4] = 2;
					var map = json_decode(lvl_data[2]);
					del_dir = directory[0] + map[? "lvl_file"];
					file_del = file_find_first(del_dir + "\\Level\\*.pmol", fa_directory);
					ds_map_destroy(map);
					files_deleted = 0;
				}
			} else {
				draw_set_color($a0a0a0);
			}
			draw_rectangle(ideal_width/2+140, ideal_height/2+_y-10, ideal_width/2+5, ideal_height/2+_y+10, 0);
			
			draw_set_font(fnt_robotoBI);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_color(c_white);
			draw_text(ideal_width/2, ideal_height/2 - 15, text[44]);
	
			draw_set_font(fnt_robotoB);
			draw_text(ideal_width/2+72.5, ideal_height/2+_y+2, text[45]);
			draw_text(ideal_width/2-72.5, ideal_height/2+_y+2, text[39]);
		} else {
			draw_set_font(fnt_robotoBI);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_color(c_white);
			draw_text(ideal_width/2, ideal_height/2, "Deleted " + string(files_deleted) + " files...");
		}
		
		draw_set_alpha(1);
		
		draw_line_width(-5, ideal_height/2 - 50, -5 + (ideal_width + 10)*al_dlt, ideal_height/2 - 50, 2);
		draw_line_width(ideal_width+5 - (ideal_width+10)*al_dlt, ideal_height/2 + 50, ideal_width + 5, ideal_height/2 + 50, 2);
		
		draw_set_font(-1);
		draw_set_halign(-1);
		draw_set_valign(-1);
		draw_set_color(-1);
	}
	#endregion
}
#endregion
