/// @description Interfaz
draw_set_alpha(al);
if(al > 0.05){
	var selector_width, btn_nmb, txt_array, btn_size, mx, my, res_txt, new_y;

	selector_width = point_distance(50, 0, ideal_width-20, 0);
	txt_array = [text[6], "Audio", "Touch", text[99]];
	btn_nmb = array_length_1d(txt_array);
	btn_size = selector_width/4;
	mx = device_mouse_x_to_gui(0);
	my = device_mouse_y_to_gui(0);
	res_txt = "(" + string(round(ideal_width*resolution)) + " x " + string(round(ideal_height*resolution)) + ")";
	new_y = (ideal_height/2) - (ideal_height/2)*al;
	
	scr_button_back(can_use, new_y, al);
	
	#region Selector
	for(var i = 0; i < btn_nmb; i++){
		if(can_use && point_in_rectangle(mx, my, 52+btn_size*i, 5, 49+btn_size*(i+1), 40)){
			draw_set_color(c_gray);
			if mouse_check_button_pressed(mb_left) set_menu = i;
			draw_rectangle(52+btn_size*i, 5 + new_y, 49+btn_size*(i+1), 40 + new_y, 0);
		} else if(set_menu = i){
			draw_set_color(c_dkgray);
			draw_rectangle(52+btn_size*i, 5 + new_y, 49+btn_size*(i+1), 40 + new_y, 0);
		}
		
		draw_set_color(c_white);
		if i != btn_nmb-1 draw_line_width(50+btn_size*(i+1), 8 + new_y, 50+btn_size*(i+1), 35 + new_y, 2);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_roboto);
		draw_text_transformed(52+btn_size*(i+0.5), 25 + new_y, txt_array[i], 1, 1, 0);
	}

	draw_set_color(c_white);
	draw_line_width(50, 40 + new_y, ideal_width-20, 40 + new_y, 2);
	#endregion
	#region Menús
	switch(set_menu){
		case 0:
			#region Vídeo
			for(var i = 0; i < 5; i++){
				if(can_use && point_in_rectangle_to_gui(mx, my, 17, 62+22*i, 33, 78+22*i)){
					if mouse_check_button(mb_left) btn_set_size[i] = lerp(btn_set_size[i], 1.3, 0.3);
					else btn_set_size[i] = lerp(btn_set_size[i], 1, 0.3);
				
					if (mouse_check_button_released(mb_left)) {
						ini_open("User_data.pmx");
						switch(i){
							case 0:
								obj_display_controller.actual_width = -1;
								obj_display_controller.actual_height = -1;
							
								if(!window_get_fullscreen()){
									var wx, wy, ww, wh;
									wx = ini_read_real("window_data", "x", display_get_width()/2 - init_width/2);
									wy = ini_read_real("window_data", "y", display_get_height()/2 - init_height/2);
									ww = ini_read_real("window_data", "width", init_width);
									wh = ini_read_real("window_data", "height", init_height);
								
									ww = clamp(ww, init_width, display_get_width());
									wh = clamp(wh, init_height, display_get_height());
									wx = clamp(wx, 0, display_get_width() - ww);
									wy = clamp(wy, 0, display_get_height() - wh);
								
									window_set_rectangle(wx, wy, ww, wh);
								}
							
								window_set_fullscreen(!window_get_fullscreen());
								ini_write_real("window_data", "fullscreen", window_get_fullscreen());
								break;
							case 1:
								switch(vsync){case 1: vsync = 0; break; default: vsync = 1; break;}
								ini_write_real("game_settings", "vsync", vsync);
								display_reset(0, vsync);
								break;
							case 2:
								switch(custom_cursor){case 1: custom_cursor = 0; break; default: custom_cursor = 1; break;}
								ini_write_real("game_settings", "custom_cursor", custom_cursor);
								break;
							case 3:
								switch(show_cursor){case 1: show_cursor = 0; break; default: show_cursor = 1; break;}
								ini_write_real("game_settings", "show_cursor", show_cursor);
								break;
							case 4:
								switch(hide_particles){case 1: hide_particles = 0; break; default: hide_particles = 1; break;}
								ini_write_real("game_settings", "hide_particles", hide_particles);
								break;
						}
						ini_close();
					}
				} else {
					btn_set_size[i] = lerp(btn_set_size[i], 1, 0.3);
				}
				draw_sprite_ext(spr_button_tf, set_array2d[0, i], 25, 70+22*i + new_y, btn_set_size[i], btn_set_size[i], 0, -1, al);
				draw_set_color(c_white);
				draw_set_halign(fa_left);
				draw_text(36, 70+22*i + new_y, txt_array2d[0, i]);
			}
		
			draw_text(40, 93+22*i + new_y, res_txt);
			var mm = -1;
			if(can_use && point_in_rectangle(mx, my, 17, 85+22*i, 33, 101+22*i)){ //Minus
				if mouse_check_button(mb_left) btn_set_size[i] = lerp(btn_set_size[i], 1.3, 0.3);
				else btn_set_size[i] = lerp(btn_set_size[i], 1, 0.3);
			
				if (mouse_check_button_released(mb_left)) {
					mm = 0;
				}
			} else {
				btn_set_size[i] = lerp(btn_set_size[i], 1, 0.3);
			}
			if(can_use && point_in_rectangle(mx, my, 47 + string_width(res_txt), 85+22*i, 63 + string_width(res_txt), 101+22*i)){ //Plus 
				if mouse_check_button(mb_left) btn_set_size[i+1] = lerp(btn_set_size[i+1], 1.3, 0.3);
				else btn_set_size[i+1] = lerp(btn_set_size[i+1], 1, 0.3);
				if (mouse_check_button_released(mb_left)) {
					mm = 1;
				}
			} else {
				btn_set_size[i+1] = lerp(btn_set_size[i+1], 1, 0.3);
			}
			if(mm != -1){
				if(mm == 0){
					resolution -= 0.5;
				} else if(mm == 1){
					resolution += 0.5;
				}
				obj_display_controller.actual_width = -1;
				obj_display_controller.actual_height = -1;
				ini_open("User_data.pmx");
				ini_write_real("game_settings", "resolution", resolution);
				ini_close();
			}
			draw_set_halign(fa_center);
			draw_text(lerp(25, 55 + string_width(res_txt), 0.5), 71+22*i + new_y, text[15]);
			draw_sprite_ext(spr_button_plus_minus, 1, 25, 93+22*i + new_y, btn_set_size[i], btn_set_size[i], 0, -1, al);
			draw_sprite_ext(spr_button_plus_minus, 0, 55 + string_width(res_txt), 93+22*i + new_y, btn_set_size[i+1], btn_set_size[i+1], 0, -1, al);
		
			if(can_use && point_in_rectangle_to_gui(mx, my, 17, 111+22*i, 33, 129+22*i)){ //Back
				if mouse_check_button(mb_left) btn_set_size[i+2] = lerp(btn_set_size[i+2], 1.3, 0.3);
				else btn_set_size[i+2] = lerp(btn_set_size[i+2], 1, 0.3);
			
				if (mouse_check_button_released(mb_left)) {
					lang -= 1;
					if(lang < 0) lang = 2;
					switch(lang){
						case 0:
							languaje = "Español";
							break;
						case 1:
							languaje = "Inglés";
							break;
						case 2:
							languaje = "Portugués";
							break;
						default:
							languaje = "Español";
							break;
					}
					ini_open("User_data.pmx");
					ini_write_string("game_settings", "languaje", languaje);
					ini_close();
					text_change = true;
				}
			} else {
				btn_set_size[i+2] = lerp(btn_set_size[i+2], 1, 0.3);
			}
			if(can_use && point_in_rectangle(mx, my, 25*5-8, 111+22*i, 25*5+8, 129+22*i)){ //Next
				if mouse_check_button(mb_left) btn_set_size[i+3] = lerp(btn_set_size[i+3], 1.3, 0.3);
				else btn_set_size[i+3] = lerp(btn_set_size[i+3], 1, 0.3);
			
				if (mouse_check_button_released(mb_left)) {
					lang += 1;
					if(lang > 2) lang = 0;
					switch(lang){
						case 0:
							languaje = "Español";
							break;
						case 1:
							languaje = "Inglés";
							break;
						case 2:
							languaje = "Portugués";
							break;
						default:
							languaje = "Español";
							break;
					}
					ini_open("User_data.pmx");
					ini_write_string("game_settings", "languaje", languaje);
					ini_close();
					text_change = true;
				}
			} else {
				btn_set_size[i+3] = lerp(btn_set_size[i+3], 1, 0.3);
			}
		
			draw_text(lerp(25, 25*5, 0.5), 120+22*i + new_y, text[34]);
			draw_sprite_ext(spr_arrow_s, 0, 25, 120+22*i + new_y, btn_set_size[i+2], btn_set_size[i+2], 0, -1, al);
			draw_sprite_ext(spr_arrow_s, 0, 25*5, 120+22*i + new_y, -btn_set_size[i+3], btn_set_size[i+3], 0, -1, al);
			break;
			#endregion
		case 1:
			#region Audio
			for(var i = 0; i < 3; i++){
				if(can_use && point_in_rectangle_to_gui(mx, my, 31, 68+38*i, 129, 93+38*i) && mouse_check_button_pressed(mb_left) && !in_use[0] && !in_use[1] && !in_use[2]) in_use[i] = true;
			
				if(in_use[i]){
					if i = 0 fx_volume = clamp(((80-mx-49)*-1)/98, 0, 1);
					if i = 1 mus_volume = clamp(((80-mx-49)*-1)/98, 0, 1);
					if i = 2 gen_volume = clamp(((80-mx-49)*-1)/98, 0, 1);
				
					if (mouse_check_button_released(mb_left)) {
						in_use[i] = false;
						ini_open("User_data.pmx");
						if i = 0 ini_write_real("game_settings", "fx_volume", fx_volume);
						if i = 1 ini_write_real("game_settings", "mus_volume", mus_volume);
						if i = 2 ini_write_real("game_settings", "gen_volume", gen_volume);
						ini_close();
					}
				}
			
				draw_sprite(spr_volume_bar, 1, 80, 80+38*i + new_y);
				draw_sprite_part(spr_volume_bar, 0, 0, 0, set_array2d[1, i]*98, 25, 31, 68+38*i + new_y);
				if i != 2 draw_sprite_part_ext(spr_volume_bar, 0, 0, 0, gen_volume*set_array2d[1, i]*98, 25, 31, 68+38*i + new_y, 1, 1, make_color_rgb(52, 235, 100), 0.5*al);
			
				draw_set_font(fnt_roboto);
				draw_set_halign(fa_left);
				draw_text(135, 85+38*i + new_y, string(round(set_array2d[1, i]*100)) + "%");
				draw_set_halign(fa_center);
				draw_text_transformed(80, 63+38*i + new_y, txt_array2d[1, i], 0.8, 0.8, 0);
				draw_set_halign(-1);
				draw_set_font(-1);
			}
			break;
			#endregion
		case 2:
			#region Controles
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(ideal_width/2, ideal_height/2 + new_y, "Coming soon...");
			break;
			#endregion
		case 3:
			#region Otros
			for(var i = 0; i < 1; i++){
				if(can_use && point_in_rectangle_to_gui(mx, my, 17, 62+22*i, 33, 78+22*i)){
					if mouse_check_button(mb_left) btn_set_size[i] = lerp(btn_set_size[i], 1.3, 0.3);
					else btn_set_size[i] = lerp(btn_set_size[i], 1, 0.3);
				
					if (mouse_check_button_released(mb_left)) {
						ini_open("User_data.pmx");
						switch(i){
							case 0:
								prec_data = !prec_data;
								ini_write_string("game_settings", "prec_data", prec_data);
								break;
						}
						ini_close();
					}
				} else {
					btn_set_size[i] = lerp(btn_set_size[i], 1, 0.3);
				}
				draw_sprite_ext(spr_button_tf, set_array2d[3, i], 25,70+22*i + new_y, btn_set_size[i], btn_set_size[i], 0, -1, al);
				draw_set_color(c_white);
				draw_set_halign(fa_left);
				draw_text(36, 73+22*i + new_y, txt_array2d[3, i]);
			}
		
			////////////////////////////////////////////////////////////////
		
			var force_cpu_max = 50, y_pos = 22*i;
			draw_set_halign(fa_center);
			draw_text(70, 72+y_pos + new_y, "Force CPU");
			draw_set_halign(fa_left);
			if(force_cpu > 1){
				var txt_cpu = " Objects per frame";
			} else {
				var txt_cpu = " Object per frame";
			}
			draw_text(125, 93+y_pos + new_y, string(force_cpu) + txt_cpu);
			draw_sprite(spr_slider_1, 0, 70, 90+y_pos + new_y);
			if(can_use && point_in_rectangle(mx, my, 25, 85+y_pos, 115, 95+y_pos) && mouse_check_button_pressed(mb_left)){
				in_use[0] = 1;
			}
			if(in_use[0]){
				force_cpu = round(clamp(((mx-30)*force_cpu_max)/80, 1, force_cpu_max));
				if(mouse_check_button_released(mb_left)) {
					ini_open("User_data.pmx");
					ini_write_real("game_settings", "force_cpu", force_cpu);
					ini_close();
					in_use[0] = 0;
				}
			}
			draw_sprite(spr_slider_1, 1, 30 + ((force_cpu-1)*80)/(force_cpu_max-1), 90+y_pos + new_y);
			break;
			#endregion
	}
	#endregion

	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
}
draw_set_alpha(1);
