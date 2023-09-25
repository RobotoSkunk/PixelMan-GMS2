/// @description Mostrar objeto
var can_draw = collision_rectangle(x_camera, y_camera, x_camera+ideal_width*zoom, y_camera+ideal_height*zoom, self, 0, 0);
var ex = 0.5*zoom;

#region Propiedades del Room
if(type == -1 && rectangle_in_rectangle(x_camera, y_camera, x_camera+ideal_width*zoom, y_camera+ideal_height*zoom, 0, 0, x, y) != 0){
	draw_set_color(c_orange);
	draw_line_width(0, 0, x, 0, zoom);
	draw_line_width(0, 0, 0, y+ex, zoom);
	draw_line_width(x, y, x, -ex, zoom);
	draw_line_width(x, y, 0, y, zoom);
	draw_sprite(spr_room_properties, 0, 0, 0);
	draw_set_color(-1);
}
#endregion

if(can_create && (can_draw || menu)){
	#region Variables
	var grd_sz, snap, x1, y1, x2, y2, a, rz_btn_x, rz_btn_y, dist_x, dist_y, ww, hh, open_menu, time_to_wait, place_mult_obj;
	x1 = x-sprite_xoffset-2;
	y1 = y-sprite_yoffset-2;
	x2 = x-sprite_xoffset+sprite_width;
	y2 = y-sprite_yoffset+sprite_height;
	a = 3*zoom;
	dist_x = (x2 - x1);
	dist_y = (y2 - y1);
	place_mult_obj = mouse_check_button(mb_left) && keyboard_check(vk_shift);
	grd_sz = obj_editor.grid_size;
	snap = obj_editor.snap;
	open_menu = obj_editor.open_menu;
	time_to_wait = obj_editor.time_to_wait;
	ww = sprite_get_width(sprite_index);
	hh = sprite_get_height(sprite_index);
	draw_set_circle_precision(18 - 9*ldm);
	#endregion
	if(select){
		#region Draw line
		if(type = 8 || type = 9){
			var lst = ds_list_create(), obj_id = noone, found = false;
			collision_line_list(x, y, mouseX, mouseY, obj_create_obj_editor, 0, 1, lst, 1);
			for(var i = 0; i < ds_list_size(lst); i++){
				if(lst[| i].solid && !found){
					obj_id = lst[| i].id;
					found = true;
				}
			}
			ds_list_destroy(lst);
			if(obj_id != noone){
				var r = collision_line_point(x, y, mouseX, mouseY, obj_id, 0, 1);
			} else {
				var r = collision_line_point(x, y, mouseX, mouseY, obj_player, 0, 1);
			}
			draw_set_color(c_fuchsia);
			draw_set_alpha(0.5);
			draw_line_width(x, y, r[1], r[2], zoom);
			draw_set_color(-1);
			draw_set_alpha(1);
		}
		#endregion
		#region Draw circle warning
		if(type = 9 || type = 8){
			draw_set_alpha(0.1);
			draw_set_color(c_fuchsia);
			draw_circle(x, y, 150*image_xscale, 0);
			draw_set_color(-1);
			draw_set_alpha(1);
		}
		#endregion
	}
	#region Draw line laser
	if(type == 11 || type == 16){
		var _x = x+lengthdir_x(ideal_width*zoom, image_angle), _y = y+lengthdir_y(ideal_width*zoom, image_angle);
		var lst = ds_list_create(), obj_id = noone, found = false;
		collision_line_list(x, y, _x, _y, obj_create_obj_editor, 0, 1, lst, 1);
		for(var i = 0; i < ds_list_size(lst); i++){
			if(lst[| i].solid && !found){
				obj_id = lst[| i].id;
				found = true;
			}
		}
		ds_list_destroy(lst);
		if(obj_id != noone){
			var r = collision_line_point(x, y, _x, _y, obj_id, 0, 1);
		} else {
			var r = collision_line_point(x, y, _x, _y, obj_player, 0, 1);
		}
		draw_set_color(c_fuchsia);
		draw_set_alpha(0.5);
		draw_line_width(x, y, r[1], r[2], zoom);
		draw_set_color(-1);
		draw_set_alpha(1);
	}
	#endregion
	#region Draw saw
	if(type = 6 && spawn_saw){
		draw_sprite_ext(spr_saw, 0, x+lengthdir_x(15, image_angle+90)*image_xscale, y+lengthdir_y(15, image_angle+90)*image_yscale, image_xscale, image_yscale, image_angle, -1, 1);
		if(collision_point(mouseX, mouseY, self, 0, 0) && can_grab){
			draw_sprite_ext(spr_saw, 0, x+lengthdir_x(15, image_angle+90)*image_xscale, y+lengthdir_y(15, image_angle+90)*image_yscale, image_xscale, image_yscale, image_angle, c_yellow, 0.6);
		}
		if(duplicated){
			draw_sprite_ext(spr_saw, 0, x+lengthdir_x(15, image_angle+90)*image_xscale, y+lengthdir_y(15, image_angle+90)*image_yscale, image_xscale, image_yscale, image_angle, c_aqua, 0.6);
		} else if(select || mult_select){
			draw_sprite_ext(spr_saw, 0, x+lengthdir_x(15, image_angle+90)*image_xscale, y+lengthdir_y(15, image_angle+90)*image_yscale, image_xscale, image_yscale, image_angle, c_lime, 0.6);
		}
		if(show_mask && type != -1){ //14
			draw_set_alpha(0.4);
			draw_set_color(c_red);
			draw_circle(x+(lengthdir_x(15, image_angle+90)*image_xscale)-1, y+(lengthdir_y(15, image_angle+90)*image_yscale)-1, 13.5*image_xscale, 0);
			draw_set_alpha(1);
			draw_set_color(-1);
		}
	}
	#endregion
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale*gr, image_angle, image_blend, image_alpha);

	#region Seleccionado
	if(collision_point(mouseX, mouseY, self, 0, 0) && can_grab){
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale*gr, image_angle, c_yellow, 0.6);
	}
	if(duplicated){
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale*gr, image_angle, c_aqua, 0.6);
	} else if(select || mult_select){
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale*gr, image_angle, c_lime, 0.6);
	}
	#endregion
	#region Máscara de colisión
	if(show_mask && type != -1){
		draw_set_alpha(0.4);
		draw_set_color(c_red);
		if(type = 5 || type = 3){
			draw_circle(x-1, y-1, (bbox_right-bbox_left)/2, 0);
		} else {
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 0);
		}
		draw_set_alpha(1);
		draw_set_color(-1);
	}
	#endregion
	if(select && can_create && !place_mult_obj){
		#region Reescalar objeto
		if(rz && can_chg && !grab && !multiple_instances && !multiselect && !open_menu){
			draw_set_color(c_blue);
			#region Cuadrado principal
			draw_line_width(x1, y1, x2, y1, zoom);
			draw_line_width(x2, y1-ex, x2, y2+ex, zoom);
			draw_line_width(x2, y2, x1, y2, zoom);
			draw_line_width(x1, y2+ex, x1, y1-ex, zoom);
			#endregion
			#region Esquinas
			var hover = 0;
			for(var i = 0; i < 4; i++){
				rz_btn_x = x1 + dist_x*i - (dist_x*2)*round(i/3);
				rz_btn_y = y1 + dist_y*round(i/3);
				draw_line_width(rz_btn_x+a, rz_btn_y-a, rz_btn_x-a, rz_btn_y-a, zoom);
				draw_line_width(rz_btn_x-a, rz_btn_y+a+ex, rz_btn_x-a, rz_btn_y-a-ex, zoom);
				draw_line_width(rz_btn_x+a, rz_btn_y-a-ex, rz_btn_x+a, rz_btn_y+a+ex, zoom);
				draw_line_width(rz_btn_x-a, rz_btn_y+a, rz_btn_x+a, rz_btn_y+a, zoom);
				if(point_in_rectangle(mouseX, mouseY,rz_btn_x-a, rz_btn_y-a, rz_btn_x+a, rz_btn_y+a)){
					obj_create_obj_editor.can_grab = false;
					can_grab = true;
					st = i;
					hover = 1;
					if(mouse_check_button_pressed(mb_left)){
						b = true;
						if(i % 2 == 0){
							xsz = x2;
							rx = -1;
						} else {
							xsz = x1;
							rx = 1;
						}
						if(i > 1){
							ysz = y1;
							ry = 1;
						} else {
							ysz = y2;
							ry = -1;
						}
					}
				} else {
					obj_create_obj_editor.can_grab = true;
				}
				if(b){
					obj_create_obj_editor.can_grab = false;
					can_grab = true;
					if(snap){
						if(free_asp){
							image_xscale = rx*((round(mouseX/grd_sz)*grd_sz)-xsz)/ww;
							image_yscale = ry*((round(mouseY/grd_sz)*grd_sz)-ysz)/hh;
						} else {
							var sc_x = rx*((round(mouseX/grd_sz)*grd_sz)-xsz)/ww;
							var sc_y = ry*((round(mouseY/grd_sz)*grd_sz)-ysz)/hh;
							image_xscale = max(sc_x, sc_y);
							image_yscale = max(sc_x, sc_y);
						}
						x = (round(mouseX/grd_sz)*grd_sz)-ww*(rx*image_xscale)/2;
						y = (round(mouseY/grd_sz)*grd_sz)-hh*(ry*image_yscale)/2;
					} else {
						if(free_asp){
							image_xscale = rx*(mouseX-xsz)/ww;
							image_yscale = ry*(mouseY-ysz)/hh;
						} else {
							var sc_x = rx*(mouseX-xsz)/ww;
							var sc_y = ry*(mouseY-ysz)/hh;
							image_xscale = max(sc_x, sc_y);
							image_yscale = max(sc_x, sc_y);
						}
						x = mouseX-ww*(rx*image_xscale)/2;
						y = mouseY-hh*(ry*image_yscale)/2;
					}
				
					if(instance_exists(obj_editor)){
						obj_editor.time_to_wait = 0;
					}
					if mouse_check_button_released(mb_left) b = false;
				}
			}
			if(!hover){
				st = -1;
			}
			#endregion
		} else {
			st = -1;
		}
		#endregion
		#region Angle
		if(can_chg && !grab && !multiple_instances && !multiselect && can_ang && !b && can_grab && !menu){
			var dis = max(point_distance(x1, y1, x2, y2), point_distance(x2, y2, x1, y1))+5;
			var xang = x+lengthdir_x(dis+9, image_angle)*zoom-1;
			var yang = y+lengthdir_y(dis+9, image_angle)*zoom-1;
		
			if(point_distance(xang, yang, mouseX, mouseY) < 10*zoom){
				if(mouse_check_button_pressed(mb_left)){
					an = 1;
				}
				obj_create_obj_editor.can_grab = false;
				can_grab = true;
			}
			if(an){
				obj_create_obj_editor.can_grab = false;
				can_grab = true;
				image_angle += sin(degtorad(point_direction(x, y, mouseX, mouseY) - image_angle))*17;
				if mouse_check_button_released(mb_left) an = 0;
				if(instance_exists(obj_editor)){
					obj_editor.time_to_wait = 0;
				}
			} else {
				obj_create_obj_editor.can_grab = true;
			}
	
			draw_primitive_begin(pr_trianglestrip);
			if(is_mobile || fps < 40){
				var circle_nmb_vertex = 18;
			} else {
				var circle_nmb_vertex = 24;
			}
			for(var i = 0; i <= 360; i += 360/circle_nmb_vertex){
				draw_vertex(x+(dis+8)*cos(degtorad(i))*zoom, y+(dis+8)*sin(degtorad(i))*zoom);
				draw_vertex(x+(dis+10)*cos(degtorad(i))*zoom, y+(dis+10)*sin(degtorad(i))*zoom);
			}
			draw_primitive_end();
	
			draw_circle(xang, yang, 3*zoom, 0);
	
			draw_primitive_begin(pr_trianglestrip);
			for(var i = 0; i <= 360; i += 360/14){
				draw_vertex(xang+8*cos(degtorad(i))*zoom+1, yang+8*sin(degtorad(i))*zoom+1);
				draw_vertex(xang+10*cos(degtorad(i))*zoom+1, yang+10*sin(degtorad(i))*zoom+1);
			}
			draw_primitive_end();
		
		}
		#endregion
		#region Dibujar menú
		if(!multiple_instances && !multiselect && collision_point(mouseX, mouseY, self, 0, 0) && mouse_check_button_pressed(mb_right) && time_to_wait = 2){
			menu = true;
		}
		if(menu){
			al = lerp(al, 1, 0.1);
			depth = -260;
		} else {
			al = lerp(al, 0, 0.1);
		}

		if(al > 0.1){
			#region Variables
			var menu_width, menu_height, options_nmb, menu_x, menu_y, data, blocks_txt, data_txt, valid_data, platform_txt, dir_txt, bck;
			menu_width = 150;
			menu_x = x2 + 25;
			menu_y = y2 + 15;
			if(type != -1){
				options_nmb = 2 + men_z[type] + (can_chg + free_asp) + can_ang + (men_options[type]&&type==0) + (men_bool[type]&&type==6) + (men_camptxt[type]&&(type!=15&&type!=14)) + (men_options[type]&&type==14) + (men_options[type]&&(type==14||type==15)) + (men_camptxt[type]&&type==16) + (men_options[type]&&type==18) + (men_bool[type]&&(type==1 || type==14 || type==15)) + (men_camptxt[type]&&(type==15||type==14));
				valid_data = [1, 1, men_z[type], !free_asp && can_chg, free_asp, free_asp, can_ang, men_options[type]&&type==0, men_bool[type]&&type==6, men_camptxt[type]&&(type!=15&&type!=14), men_options[type]&&type==14, men_options[type]&&(type==14||type==15), men_camptxt[type]&&type==16, men_options[type]&&type==18, men_bool[type]&&(type==1 || type==14 || type==15), men_camptxt[type]&&(type==15||type==14)];
			} else {
				options_nmb = 2;
				valid_data = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			}
			menu_height = 15 + 25*options_nmb;
			switch(languaje){
				case "Español":
					blocks_txt = ["Tierra", "Por defecto"];
					platform_txt = ["Plataforma 1","Plataforma 2", "Plataforma 3"];
					dir_txt = ["Derecha","Izquierda", "Aleatorio"];
					data = ["X ", "Y ", "Z ", "Escala ", "Escala X ", "Escala Y ", "Ángulo ", blocks_txt[ID], "Aparecer sierra ", "Tiempo ", platform_txt[tp], dir_txt[start_in], "Iniciar en ", string(symbol), "Gravedad invertida ", "Velocidad "];
					bck = "Volver";
					break;
				case "Inglés":
					blocks_txt = ["Dirt", "Default"];
					platform_txt = ["Platform 1","Platform 2", "Platform 3"];
					dir_txt = ["Right","Left", "Random"];
					data = ["X ", "Y ", "Z ", "Scale ", "Scale X ", "Scale Y ", "Angle ", blocks_txt[ID], "Spawn saw ", "Time ", platform_txt[tp], dir_txt[start_in], "Start in ", string(symbol), "Inverted gravity ", "Speed "];
					bck = "Back";
					break;
				case "Portugués":
					blocks_txt = ["Sujeira", "Padrão"];
					platform_txt = ["Plataforma 1","Plataforma 2", "Plataforma 3"];
					dir_txt = ["Direito","Esquerda", "Aleatório"];
					data = ["X ", "Y ", "Z ", "Escala ", "Escala X ", "Escala Y ", "Ângulo ", blocks_txt[ID], "Spawn viu ", "Tempo ", platform_txt[tp], dir_txt[start_in], "Comece em ", string(symbol), "Gravidade invertida ", "Velocidade "];
					bck = "Voltar";
					break;
			}
			#endregion
		
			draw_set_alpha(0.8*al);
			draw_set_color(c_black);
			draw_rectangle(x_camera, y_camera, x_camera+ideal_width*zoom, y_camera+ideal_height*zoom, 0);
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale*gr, image_angle, image_blend, al);
		
			#region Cuadrado
			draw_set_alpha(al);
			draw_set_color(c_white);
			draw_rectangle(menu_x, menu_y, menu_x+menu_width, menu_y+menu_height, 0);
			draw_rectangle(menu_x-2, menu_y+2, menu_x+menu_width+2, menu_y+menu_height-2, 0);
			draw_set_color(c_black);
			draw_set_font(fnt_roboto);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_transformed(lerp(menu_x, menu_x+menu_width, 0.5), menu_y+5, wht_is, 0.5, 0.5, 0);
			draw_rectangle(menu_x+2, menu_y+10, menu_x+menu_width-2, menu_y+menu_height-2, 0);
			draw_rectangle(menu_x, menu_y+12, menu_x+menu_width, menu_y+menu_height-4, 0);
			#endregion
			#region Exit button
			var _exit = false;
			if(menu){
				if(point_in_rectangle(mouseX, mouseY, menu_x, menu_y-30, menu_x+menu_width, menu_y-5)){
					if(mouse_check_button(mb_left)){draw_set_color(c_gray);}
					else {draw_set_color(c_dkgray);}
					
					if(mouse_check_button_released(mb_left)){
						_exit = true;
					}
				} else {
					draw_set_color(c_black);
				}
				draw_rectangle(menu_x, menu_y-5, menu_x+menu_width, menu_y-30, 0);
				draw_set_color(c_white);
				draw_rectangle_border(menu_x, menu_y-5, menu_x+menu_width, menu_y-30, 1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_text_transformed(menu_x+(menu_width/2), menu_y-15, bck, 1, 1, 0);
			}
			#endregion
			
			i = -1;
			for(var i1 = 0; i1 < array_length_1d(valid_data); i1++){
				if(valid_data[i1] != 1){
					continue;
				} else {
					i++;
				}
				data_txt = data[i1];
				if(i1 < 7 || i1 == 9 || i1 == 12 || i1 == 15){
				#region Campos de texto
				draw_set_valign(fa_middle);
				draw_set_halign(fa_left);
				//Procesador de texto
				if(mouse_check_button_released(mb_left)){
					if(point_in_rectangle(mouseX, mouseY, 3+menu_x+string_width(data_txt)*0.8, 15+menu_y+25*i, menu_x+menu_width-3, 30+menu_y+25*i) && menu){
						arg[i] = true;
						keyboard_string = arg_txt[i];
					} else if(arg[i]){
						arg[i] = false;
						set_config(i, i1);
					}
				}
				if(arg[i]) {
					draw_set_color(c_red);
					draw_rectangle(3+menu_x+string_width(data_txt)*0.8-1, 15+menu_y+25*i-1, menu_x+menu_width-2, 30+menu_y+25*i+1, 0);
				
					arg_txt[i] = keyboard_string;
				} else {
					var values;
					values = [x, y, _depth, image_xscale, image_xscale, image_yscale, image_angle, -1, -1, time, -1, -1, start_time, -1, -1, obj_speed];
					arg_txt[i] = (string_format(values[i1], string_length(string(round(values[i1]))), decimal_nmb+1));
				}
				//Rectángulos
				draw_set_color(c_white);
				draw_rectangle(3+menu_x+string_width(data_txt)*0.8, 15+menu_y+25*i, menu_x+menu_width-3, 30+menu_y+25*i, 0); //Altura 15
				//¿Qué es?
				draw_set_color(c_white);
				draw_text_transformed(menu_x+3, 23+menu_y+25*i, data_txt, 0.8, 0.8, 0);
				//Datos
				draw_set_color(c_black);
				draw_set_halign(fa_left);
				var adj_txt = clamp((menu_width-(string_width(data_txt)*0.8)-10)/(string_width(arg_txt[i])), 0, 0.8);
				draw_text_transformed(7+menu_x+string_width(data_txt)*0.8, 23+menu_y+25*i, arg_txt[i], adj_txt, adj_txt, 0);
				#endregion
				} else if(i1 == 7 || i1 == 10 || i1 == 11 || i1 == 13){
					#region Selector
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_text_transformed(lerp(menu_x, menu_x+menu_width, 0.5), 23+menu_y+25*i, data_txt, 0.8, 0.8, 0);
					draw_sprite(spr_arrow_s, 0, menu_x+15, 23+menu_y+25*i);
					draw_sprite_ext(spr_arrow_s, 0, menu_x+menu_width-15, 23+menu_y+25*i, -1, 1, 0, -1, al);
					if(mouse_check_button_released(mb_left) && menu) {
						if(point_in_rectangle(mouseX, mouseY, menu_x+11, 23+menu_y+25*i-8, menu_x+19, 23+menu_y+25*i+9)){
							if i1 == 7 ID--;
							else if i1 == 10 tp--;
							else if i1 == 11 start_in--;
							else if i1 == 13 symbol--;
						}
						if(point_in_rectangle(mouseX, mouseY, menu_x+menu_width-19, 23+menu_y+25*i-8, menu_x+menu_width-11, 23+menu_y+25*i+9)){
							if i1 == 7 ID++;
							else if i1 == 10 tp++;
							else if i1 == 11 start_in++;
							else if i1 == 13 symbol++;
						}
						if (i1 == 7) {
							if(ID < 0) ID = 1;
							if(ID > 1) ID = 0;
							if (ID > -1 && ID < array_length_1d(block_array)) {
								sprite_index = block_array[ID];
								image_index = block_random;
							} else {
								sprite_index = spr_block_default;
							}
						} else if (i1 == 10) {
							if(tp < 0) tp = 2;
							if(tp > 2) tp = 0;
							if (tp > -1 && tp < 3) {
								sprite_index = platform_array[tp];
							}
						} else if (i1 == 11) {
							if(start_in < 0) start_in = 2;
							if(start_in > 2) start_in = 0;
						} else if (i1 == 13) {
							if(symbol < 0) symbol = 16;
							if(symbol > 16) symbol = 0; //spr_letter_symbols
						}
					}
					#endregion
				} else if(i1 == 1 || i1 == 8 || i1 == 14){
					#region Booleano
					if(i1 == 1 || i1 == 14){
						if(mouse_check_button_released(mb_left) && menu) {
							if(point_in_rectangle(mouseX, mouseY, menu_x+menu_width-23, 23+menu_y+25*i-8, menu_x+menu_width-6, 23+menu_y+25*i+9)){
								switch(gr){
									case 1:
										gr = -1;
										break;
									default:
										gr = 1;
										break;
								}
							}
						}
						draw_sprite(spr_button_tf, clamp(gr, 0, 1)+1, menu_x+menu_width-15, 23+menu_y+25*i);
					} else if(i1 == 8){
						if(mouse_check_button_released(mb_left) && menu) {
							if(point_in_rectangle(mouseX, mouseY, menu_x+menu_width-23, 23+menu_y+25*i-8, menu_x+menu_width-6, 23+menu_y+25*i+9)){
								switch(spawn_saw){
									case 1:
										spawn_saw = false;
										break;
									default:
										spawn_saw = true;
										break;
								}
							}
						}
						draw_sprite(spr_button_tf, spawn_saw, menu_x+menu_width-15, 23+menu_y+25*i);
					}
					draw_set_color(c_white);
					draw_set_halign(fa_left);
					draw_text_transformed(menu_x+3, 23+menu_y+25*i, data_txt, 0.8, 0.8, 0);
					#endregion
				}
				#region Cerrar menú
				if(keyboard_check_pressed(vk_escape) || _exit){
					if(arg[i]){
						set_config(i, i1);
						
						/*if i1 == 0 arg_txt[i] = string(x);
						else if i1 == 1 arg_txt[i] = string(y);
						else if i1 == 2 arg_txt[i] = string(_depth);
						else if i1 == 3 arg_txt[i] = string(image_xscale);
						else if i1 == 4 arg_txt[i] = string(image_xscale);
						else if i1 == 5 arg_txt[i] = string(image_yscale);
						else if i1 == 6 arg_txt[i] = string(image_angle);
						else if i1 == 9 arg_txt[i] = string(time);
						else if i1 == 12 arg_txt[i] = string(start_time);
						else if i1 == 15 arg_txt[i] = string(obj_speed);*/
						arg[i] = false;
					}
					depth = _depth;
					menu = false;
				}
				#endregion
			}
		}
		#endregion
	}
	draw_set_alpha(1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_color(-1);
	draw_set_circle_precision(24 - 12*ldm);
} else {
	if(can_draw){
		if(type = 6 && spawn_saw){
			draw_sprite_ext(spr_saw, 0, x+lengthdir_x(15, image_angle+90)*image_xscale, y+lengthdir_y(15, image_angle+90)*image_yscale, image_xscale, image_yscale, image_angle, -1, 1);
		}
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale*gr, image_angle, image_blend, image_alpha);
	}
}
#region Cartel
if(type == 18 && can_draw){
	var fix_x, fix_y;
	fix_x = 0;
	fix_y = 0;
	switch(symbol){
		case 1:
			fix_y = -0.5;
			break;
		case 2:
			fix_y = -0.5;
			break;
		case 3:
			fix_y = -0.5;
			break;
		case 4:
			fix_x = -0.5;
			fix_y = -0.5;
			break;
		case 5:
			fix_x = 0.5;
			fix_y = -0.5;
			break;
		case 6:
			fix_x = -0.5;
			fix_y = -0.5;
			break;
		case 7:
			fix_x = 0.5;
			break;
		case 8:
			fix_y = -0.5;
			break;
		case 9:
			fix_x = -0.5;
			break;
		case 10:
			fix_x = 0.5;
			fix_y = -1;
			break;
		case 11:
			fix_x = -0.5;
			break;
		case 12:
			fix_x = -0.5;
			break;
		case 13:
				fix_x = -0.5;
			break;
		case 14:
			fix_x = -0.5;
			break;
		case 16:
			fix_x = -0.5;
			break;
		default:
			fix_x = 0;
			fix_y = 0;
			break;
	}
	var xpos, ypos;
	xpos = (5.5*cos(degtorad(image_angle+90))+fix_y*cos(degtorad(image_angle+90))+fix_x*sin(degtorad(image_angle+90)))*image_xscale;
	ypos = (5.5*sin(degtorad(image_angle+90))+fix_y*sin(degtorad(image_angle+90))-fix_x*cos(degtorad(image_angle+90)))*image_yscale;
	draw_sprite_ext(spr_letter_symbols, symbol, x+xpos, y-ypos, image_xscale, image_yscale, image_angle, -1, 1);
}
#endregion
