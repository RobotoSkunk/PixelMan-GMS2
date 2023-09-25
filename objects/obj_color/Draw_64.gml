/// @description Interfaz
if(al > 0.05){
	var mx = device_mouse_x_to_gui(0),
		my = device_mouse_y_to_gui(0),
		repsize = clamp((ideal_height*0.4)/120, 0, 1),
		new_y = (ideal_height/2) - (ideal_height/2)*al;
	draw_set_alpha(al);
	
	draw_set_color(c_white);
	draw_line_width(ideal_width/2, 42.5 + new_y, ideal_width/2, ideal_height-52.5 + new_y, 5);
	draw_line_width(50, 40 + new_y, ideal_width-20, 40 + new_y, 5);
	draw_line_width(20, ideal_height-50 + new_y, ideal_width-20, ideal_height-50 + new_y, 5);

	scr_button_back(can_use && in_use == -1, new_y, al);

	#region Seleccionar jugador
	for(var i = 0; i < spr_max; i++){
		var spr_x = ((ideal_width/2)-36*((spr_max-1)/2))+36*i+1;
		var spr_y = ideal_height-25 + new_y;
		var spr_middle_x = sprite_get_xoffset(spr_player_array[i])-(sprite_get_width(spr_player_array[i])/2);
		var spr_middle_y = sprite_get_yoffset(spr_player_array[i])-(sprite_get_height(spr_player_array[i])/2);
		if i == spr_player bt_col[i] = make_color_rgb(114, 255, 104);
		else bt_col[i] = -1;
		draw_sprite_ext(spr_buttons_editor, 4, spr_x, spr_y, bt_sz[i], bt_sz[i], 0, bt_col[i], al);
		draw_sprite_ext(spr_player_array[i], 0, spr_x+spr_middle_x, spr_y+spr_middle_y, bt_sz[i], bt_sz[i], 0, bt_col[i], al);
	
		if(can_use && point_in_rectangle_to_gui(mx, my, spr_x-16, spr_y-16, spr_x+16, spr_y+16) && in_use == -1){
			if mouse_check_button(mb_left) bt_sz[i] = lerp(bt_sz[i], 1.2, 0.3);
			else bt_sz[i] = lerp(bt_sz[i], 1, 0.3);
		
			if (mouse_check_button_released(mb_left)) {
				spr_player = i;
				if(!file_exists("User_account.pmx")){
					var file = file_text_open_write("User_account.pmx");
					file_text_write_string(file, "");
					file_text_close(file);
				}
	
				fast_file_key_crypt("User_account.pmx", "User_account.pmx", 0, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
				ini_open("User_account.pmx");
				ini_write_real("Player", "spr_player", spr_player);
				ini_close();
				fast_file_key_crypt("User_account.pmx", "User_account.pmx", 1, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
			}
		} else bt_sz[i] = lerp(bt_sz[i], 1, 0.3);
	}
	//draw_sprite_ext(spr_decorated_buttons, 5, 17, ideal_height-23, -1, 1, 0, -1, 1);
	//draw_sprite_ext(spr_decorated_buttons, 5, ideal_width-17, ideal_height-23, 1, 1, 0, -1, 1);
	#endregion
	#region Previsualizar jugador
	var spr_prev_x = lerp(ideal_width/2, ideal_width-20, 0.5);
	prev_zoom = lerp(prev_zoom, prev_zoom_in, 0.3);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_roboto);
	if(prev_anim){
		f += 0.4;
		draw_sprite_ext(spr_player_array_run[spr_player], f, spr_prev_x, lerp(40, ideal_height-50, 0.4) + new_y, (prev_zoom+1)*repsize, (prev_zoom+1)*repsize, 0, player_color, al);
		if f > sprite_get_number(spr_player_array_run[spr_player])-1 f = 0;
		switch(languaje){
			case "Español":
				draw_text(spr_prev_x, ideal_height-65 + new_y, "Corriendo");
				break;
			case "Inglés":
				draw_text(spr_prev_x, ideal_height-65 + new_y, "Running");
				break;
			case "Portugués":
				draw_text(spr_prev_x, ideal_height-65 + new_y, "Correndo");
				break;
		}
	} else {
		f = 0;
		draw_sprite_ext(spr_player_array[spr_player], 0, spr_prev_x, lerp(40, ideal_height-50, 0.4) + new_y, (prev_zoom+1)*repsize, (prev_zoom+1)*repsize, 0, player_color, al);
		switch(languaje){
			case "Español":
				draw_text(spr_prev_x, ideal_height-65 + new_y, "Parado");
				break;
			case "Inglés":
				draw_text(spr_prev_x, ideal_height-65 + new_y, "Stand");
				break;
			case "Portugués":
				draw_text(spr_prev_x, ideal_height-65 + new_y, "Ficar de pé");
				break;
		}
	}

	if(can_use && point_in_rectangle_to_gui(mx, my, spr_prev_x-60, ideal_height-75, spr_prev_x-40, ideal_height-55) && in_use == -1){
		if mouse_check_button(mb_left) sel_sz[0] = lerp(sel_sz[0], 1.2, 0.3);
		else sel_sz[0] = lerp(sel_sz[0], 1, 0.3);
	
		if mouse_check_button_released(mb_left) {
			switch(prev_anim){
				case 1: prev_anim = 0; break;
				default: prev_anim = 1; break;
			}
		}
	} else {
		sel_sz[0] = lerp(sel_sz[0], 1, 0.3);
	}
	if(can_use && point_in_rectangle_to_gui(mx, my, spr_prev_x+40, ideal_height-75, spr_prev_x+60, ideal_height-55) && in_use == -1){
		if mouse_check_button(mb_left) sel_sz[1] = lerp(sel_sz[1], 1.2, 0.3);
		else sel_sz[1] = lerp(sel_sz[1], 1, 0.3);
	
		if mouse_check_button_released(mb_left) switch(prev_anim){
			case 1: prev_anim = 0; break;
			default: prev_anim = 1; break;
		}
	} else {
		sel_sz[1] = lerp(sel_sz[1], 1, 0.3);
	}
	draw_sprite_ext(spr_arrow_s, 0, spr_prev_x-50, ideal_height-65 + new_y, sel_sz[0], sel_sz[0], 0, -1, al);
	draw_sprite_ext(spr_arrow_s, 0, spr_prev_x+50, ideal_height-65 + new_y, -sel_sz[1], sel_sz[1], 0, -1, al);

	draw_set_color(c_dkgray);
	draw_rectangle(spr_prev_x-40, ideal_height-85 + new_y, spr_prev_x+40, ideal_height-80 + new_y, 0);
	draw_set_color(c_white);
	draw_rectangle(spr_prev_x-40, ideal_height-85 + new_y, spr_prev_x-40+((prev_zoom_in*80)/4), ideal_height-80 + new_y, 0);
	draw_set_valign(fa_bottom);
	draw_text_transformed(spr_prev_x, ideal_height-87 + new_y, "Zoom", 0.8, 0.8, 0);
	draw_set_valign(fa_middle);

	if(can_use && point_in_rectangle_to_gui(mx, my, spr_prev_x-41, ideal_height-86, spr_prev_x+41, ideal_height-79) && mouse_check_button_pressed(mb_left) && in_use == -1 && !prev_act){
		prev_act = 1;
	}
	if(prev_act){
		prev_zoom_in = clamp(((mx-spr_prev_x+40)*4)/80, 0, 4);
		if mouse_check_button_released(mb_left) prev_act = 0;
	}

	#endregion
	#region Colores del jugador
	var col_x = lerp(20, ideal_width/2, 0.5);
	var col_y = lerp(40, ideal_height-50, 0.45) + new_y;
	var err = 0;
	switch(mod_color){
		#region HSV 1
		case 0:
			draw_sprite_ext(spr_hsv_color, 6, col_x, col_y, repsize, repsize, 0, -1, al);
			draw_sprite_ext(spr_hsv_color, 1, col_x, col_y, repsize, repsize, 0, -1, al);
			draw_sprite_ext(spr_hsv_color, 2, col_x, col_y, repsize, repsize, 0, make_colour_hsv(hsv[0], 255, 255), al);
			draw_sprite_ext(spr_hsv_color, 3, col_x, col_y, repsize, repsize, 0, -1, al);
			draw_sprite_ext(spr_hsv_color, 0, col_x, col_y, repsize, repsize, 0, -1, al);
			
			angle = (hsv[0]*360)/255;
			draw_sprite_ext(spr_hsv_color, 4, col_x, col_y, repsize, repsize, angle, -1, al);
			
			posX = col_x+((hsv[1]*(50*repsize))/255)-(25*repsize);
			posY = col_y-((hsv[2]*(50*repsize))/255)+(25*repsize);
			draw_sprite_ext(spr_hsv_color, 5,  posX, posY, repsize, repsize, 0, make_colour_hsv(0, 0, -hsv[2]), al);

			if (can_use && mouse_check_button_pressed(mb_left) && point_distance(mx, my, col_x, col_y) < 50*repsize && point_distance(mx, my, col_x, col_y) > 38*repsize && in_use == -1) in_use = 1;
			if (can_use && mouse_check_button_pressed(mb_left) && point_in_rectangle_to_gui(mx, my, col_x-25*repsize, col_y-25*repsize, col_x+24*repsize, col_y+25*repsize) && in_use == -1) in_use = 0;
			if (in_use == 0){
				hsv[1] = round(clamp(((col_x-mx-(25*repsize))*255)/(-50*repsize), 0, 255));
				hsv[2] = round(clamp(((col_y-(ideal_height-my)+(7*repsize))*255)/(-50*repsize), 0, 255));
				player_color = make_colour_hsv(hsv[0], hsv[1], hsv[2]);
				
				if(mouse_check_button_released(mb_left)) in_use = -1;
			}
			if (in_use == 1){
				hsv[0] = round((point_direction(col_x, col_y, mx, my)*255)/360);
				player_color = make_colour_hsv(hsv[0], hsv[1], hsv[2]);
				
				if(mouse_check_button_released(mb_left)) in_use = -1;
			}
			break;
		#endregion
		#region HSV 2
		case 1:
			draw_sprite(spr_hsv_rgb_color, 5, col_x, col_y);
			draw_sprite(spr_hsv_rgb_color, 5, col_x, col_y-20);
			draw_sprite(spr_hsv_rgb_color, 5, col_x, col_y+20);
			draw_sprite(spr_hsv_rgb_color, 1, col_x, col_y-20);
			draw_sprite(spr_hsv_rgb_color, 3, col_x, col_y);
			draw_sprite_ext(spr_hsv_rgb_color, 4, col_x, col_y, 1, 1, 0, make_colour_hsv(hsv[0], 255, 255), al);
			draw_sprite(spr_hsv_rgb_color, 0, col_x, col_y+20);
			draw_sprite(spr_hsv_rgb_color, 2, col_x+((hsv[0]*100)/255)-50, col_y-30);
			draw_sprite(spr_hsv_rgb_color, 2, col_x+((hsv[1]*100)/255)-50, col_y-10);
			draw_sprite(spr_hsv_rgb_color, 2, col_x+((hsv[2]*100)/255)-50, col_y+10);
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_text(col_x+55, col_y-20, string(round((hsv[0]*360)/255)) + "°");
			draw_text(col_x+55, col_y, string(round((hsv[1]*100)/255)) + "%");
			draw_text(col_x+55, col_y+20,string(round((hsv[2]*100)/255)) + "%");
			draw_set_colour(-1);
		
			if (can_use && mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, col_x-50, col_y-25, col_x+50, col_y-15) && in_use == -1) in_use = 0;
			if (can_use && mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, col_x-50, col_y-5, col_x+50, col_y+5) && in_use == -1) in_use = 1;
			if (can_use && mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, col_x-49.5, col_y+15, col_x+49.5, col_y+25) && in_use == -1) in_use = 2;
		
			if(in_use > -1){
				hsv[in_use] = clamp(((col_x-mx-50)*-255)/100, 0, 255);
				player_color = make_colour_hsv(hsv[0], hsv[1], hsv[2]);
				
				if (mouse_check_button_released(mb_left)) in_use = -1;
	        }
			break;
		#endregion
		#region RGB
		case 2:
			draw_sprite(spr_hsv_rgb_color, 5, col_x, col_y);
			draw_sprite(spr_hsv_rgb_color, 5, col_x, col_y-20);
			draw_sprite(spr_hsv_rgb_color, 5, col_x, col_y+20);
			draw_sprite_ext(spr_hsv_rgb_color, 0, col_x, col_y-20, 1, 1, 0, make_colour_rgb(255, 0, 0), al);
			draw_sprite_ext(spr_hsv_rgb_color, 0, col_x, col_y, 1, 1, 0, make_colour_rgb(0, 255, 0), al);
			draw_sprite_ext(spr_hsv_rgb_color, 0, col_x, col_y+20, 1, 1, 0, make_colour_rgb(0, 0, 255), al);
			draw_sprite(spr_hsv_rgb_color, 2, col_x+((rgb[0]*100)/255)-50, col_y-30);
			draw_sprite(spr_hsv_rgb_color, 2, col_x+((rgb[1]*100)/255)-50, col_y-10);
			draw_sprite(spr_hsv_rgb_color, 2, col_x+((rgb[2]*100)/255)-50, col_y+10);
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_text(col_x+55, col_y-20, string(round(rgb[0])));
			draw_text(col_x+55, col_y, string(round(rgb[1])));
			draw_text(col_x+55, col_y+20, string(round(rgb[2])));
			draw_set_colour(-1);
		
			if (can_use && mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, col_x-50, col_y-25, col_x+50, col_y-15) && in_use == -1) in_use = 0;
			if (can_use && mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, col_x-50, col_y-5, col_x+50, col_y+5) && in_use == -1) in_use = 1;
			if (can_use && mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, col_x-49.5, col_y+15, col_x+49.5, col_y+25) && in_use == -1) in_use = 2;
		
			if(in_use > -1){
				rgb[in_use] = clamp(((col_x-mx-50)*-255)/100, 0, 255);
				player_color = make_colour_rgb(rgb[0], rgb[1], rgb[2]);
				
				if (mouse_check_button_released(mb_left)) in_use = -1;
	        }
			break;
		#endregion
		#region HEX
		case 3:
			draw_set_color(c_black);
			draw_rectangle(col_x-45, col_y-12, col_x+45, col_y+12, 0);
			draw_set_color(c_white);
			draw_text(col_x, col_y+1, new_hex);
			
			draw_set_halign(fa_right);
			draw_text(col_x-46, col_y+1, "#");
			draw_set_halign(fa_center);
			
			if(in_use == 1){
				keyboard_string = string_copy(keyboard_string, 1, 6);
				new_hex = keyboard_string;
				if(new_hex != hex_col){
					if(point_in_rectangle(mx, my, col_x-45, col_y+14, col_x+45, col_y+36)){
						draw_set_color(c_dkgray);
						if(mouse_check_button_released(mb_left)){
							var str = new_hex,
								str_length = string_length(str),
								r, g, b;
							
							if(str_length < 6){
								var loop = abs(6 - str_length);
								
								repeat(loop){
									str += "0";
								}
							}
							r = hex2dec(string_copy(str, 1, 2));
							g = hex2dec(string_copy(str, 3, 2));
							b = hex2dec(string_copy(str, 5, 2));
							
							new_hex = string_fill(dec2hex(r), "0", 2) + string_fill(dec2hex(g), "0", 2) + string_fill(dec2hex(b), "0", 2);
							hex_col = new_hex;
							
							player_color = hex2col(hex_col);
							in_use = -1;
						}
					} else {
						draw_set_color(c_black);
						if(mouse_check_button_released(mb_left)) {
							in_use = -1;
							new_hex = hex_col;
						}
					}
					draw_rectangle(col_x-45, col_y+14, col_x+45, col_y+36, 0);
					draw_set_color(c_white);
					draw_text(col_x, col_y+27, "SET");
					draw_rectangle_border(col_x-45, col_y+14, col_x+45, col_y+36, 1);
				} else {
					if(mouse_check_button_released(mb_left)) in_use = -1;
				}
				draw_set_color(c_red);
			}
			
			if(in_use == -1 && point_in_rectangle(mx, my, col_x-45, col_y-12, col_x+45, col_y+12) && mouse_check_button_released(mb_left)){
				in_use = 1;
				keyboard_string = new_hex;
			}
			
			draw_rectangle_border(col_x-45, col_y-12, col_x+45, col_y+12, 1);
			draw_set_color(c_white);
			break;
		#endregion
		default:
			err = 1;
			break;
	}
	draw_set_halign(fa_center);
	if(!err){
		var nms = ["HSV 1", "HSV 2", "RGB", "HEX"];
		draw_text(col_x, 55 + new_y, nms[mod_color]);
	} else {
		draw_text(col_x, 55 + new_y, "FATAL_ERROR_3");
	}
	
	if(in_use == -1 && mouse_check_button_released(mb_left)){
		if(mod_color != 3){
			hsv = [colour_get_hue(player_color), colour_get_saturation(player_color), colour_get_value(player_color)];
			rgb = [colour_get_red(player_color), colour_get_green(player_color), colour_get_blue(player_color)];
			player_color = make_colour_hsv(hsv[0], hsv[1], hsv[2]);
			new_hex = string_fill(dec2hex(rgb[0]), "0", 2) + string_fill(dec2hex(rgb[1]), "0", 2) + string_fill(dec2hex(rgb[2]), "0", 2);
			hex_col = new_hex;
		} else {
			player_color = hex2col(hex_col);
			hsv = [colour_get_hue(player_color), colour_get_saturation(player_color), colour_get_value(player_color)];
			rgb = [colour_get_red(player_color), colour_get_green(player_color), colour_get_blue(player_color)];
		}
		ini_open("User_data.pmx");
		ini_write_string("player_options", "color", hex_col);
		ini_close();
	}
	
	for(var i = 0; i < 4; i++){
		var col_btn_y = ideal_height-75 + new_y;
		draw_sprite_ext(spr_color_button, (i*2) + (mod_color == i), col_x-54+36*i, col_btn_y, btn_col_sz[i], btn_col_sz[i], 0, -1, al);
		
		if(can_use && point_in_rectangle_to_gui(mx, my, col_x-54+36*i-15, col_btn_y-10, col_x-54+36*i+15, col_btn_y+10) && in_use == -1){
			if mouse_check_button(mb_left) btn_col_sz[i] = lerp(btn_col_sz[i], 1.2, 0.3);
			else btn_col_sz[i] = lerp(btn_col_sz[i], 1, 0.3);
			
			if(mouse_check_button_released(mb_left)){
				mod_color = i;
			}
		} else btn_col_sz[i] = lerp(btn_col_sz[i], 1, 0.3);
	}
	#endregion
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_pixelman);
	draw_text(ideal_width/2, 25 + new_y, text[2]);
	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	draw_set_alpha(1);
}
