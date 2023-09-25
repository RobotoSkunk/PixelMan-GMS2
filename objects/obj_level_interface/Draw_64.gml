/// @description Interfaz
var lvl_data = "";
var verifytxt = "";
var adjust_txt = 0;
var ideal_size_name = clamp((ideal_width*0.5)/280, 0, 1);
var cw = ideal_width/2;
var ch = ideal_height/2;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
active = (dlt_lvl || deleting || move_to_room);
#region Botones
draw_sprite_ext(spr_decorated_buttons, 2, cw-48, ch+32, bnt_size[0]+0.3, bnt_size[0]+0.3, 0, -1, 1);
if(point_in_rectangle(mx, my, cw-80, ch, cw-16, ch+64) && !active){
	if mouse_check_button(mb_left) bnt_size[0] = lerp(bnt_size[0], 1, 0.3);
	else bnt_size[0] = lerp(bnt_size[0], 0.8, 0.3);
	
	if(mouse_check_button_released(mb_left) && !active){
		alarm[1] = room_speed*0.6;
		move_to_room = true;
	}
} else {
	bnt_size[0] = lerp(bnt_size[0], 0.8, 0.3);
}

draw_sprite_ext(spr_decorated_buttons, 1, cw+48, ch+32, bnt_size[1]+0.3, bnt_size[1]+0.3, 0, -1, 1);
if(point_in_rectangle(mx, my, cw+16, ch, cw+80, ch+64) && !active){
	if mouse_check_button(mb_left) bnt_size[1] = lerp(bnt_size[1], 1, 0.3);
	else bnt_size[1] = lerp(bnt_size[1], 0.8, 0.3);
	
	if(mouse_check_button_released(mb_left) && !active){
		alarm[0] = room_speed*0.6;
		move_to_room = true;
	}
} else {
	bnt_size[1] = lerp(bnt_size[1], 0.8, 0.3);
}

draw_sprite_ext(spr_decorated_buttons, 4, ideal_width-32, 32, bnt_size[2], bnt_size[2], 0, c_dkgray, 1);
if(point_in_rectangle(mx, my, ideal_width-60, 0, ideal_width, 60) && !active){
	if mouse_check_button(mb_left) {bnt_size[2] = lerp(bnt_size[2], 1, 0.3);}
	else bnt_size[2] = lerp(bnt_size[2], 0.8, 0.3);
	
	if(mouse_check_button_released(mb_left) && !active){
		alarm[3] = room_speed*0.6;
		move_to_room = true;
	}
	
} else {
	bnt_size[2] = lerp(bnt_size[2], 0.8, 0.3);
}

draw_sprite_ext(spr_decorated_buttons, 3, ideal_width-32, 92, bnt_size[3], bnt_size[3], 0, -1, 1);
if(point_in_rectangle(mx, my, ideal_width-60, 64, ideal_width, 124) && !active){
	if mouse_check_button(mb_left) bnt_size[3] = lerp(bnt_size[3], 1, 0.3);
	else bnt_size[3] = lerp(bnt_size[3], 0.8, 0.3);
	
	if(mouse_check_button_released(mb_left) && !active){
		dlt_lvl = true;
		anim = true;
	}
	
} else {
	bnt_size[3] = lerp(bnt_size[3], 0.8, 0.3);
}
#endregion
#region Cambiar nombre del nivel
if(lvl_change_name){draw_set_color(c_red);}
else {draw_set_color(c_white);}
draw_rectangle(cw-140*ideal_size_name, 30*ideal_size_name, cw+140*ideal_size_name, 80*ideal_size_name, 0);
draw_set_color(c_black);
draw_rectangle(cw-135*ideal_size_name, 35*ideal_size_name, cw+135*ideal_size_name, 75*ideal_size_name, 0);

if(mouse_check_button_released(mb_left)){
	lvl_change_name = point_in_rectangle_to_gui(mx, my, cw-140*ideal_size_name, 30*ideal_size_name, cw+140*ideal_size_name, 80*ideal_size_name);
	if(!lvl_change_name){
		var dir = lvl_file + "data.pmd";
		fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
		ini_open(dir);
		var tmp_name = lvl_name;
		if string_replace_all(tmp_name, " ", "") == "" tmp_name = "Unnamed";
		ini_write_string("Data", "Name", base64_encode(tmp_name));
		lvl_name = base64_decode(ini_read_string("Data", "Name", "FATAL_ERROR_CHGNAME_01"));
		ini_close();
		fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
	} else {
		keyboard_string = lvl_name;
	}
}

if(lvl_change_name){
	lvl_name = keyboard_string;
}
draw_set_font(fnt_roboto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text_transformed(cw, 55*ideal_size_name, lvl_name, 1.4*ideal_size_name, 1.4*ideal_size_name, 0);
#endregion
#region Datos del nivel
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_alpha(1);

if(lvl_verify){
	switch(languaje){
		case "Español":
			verifytxt = " | Verificado";
			break;
		case "Inglés":
			verifytxt = " | Verified";
			break;
		case "Portugués":
			verifytxt = " | Verificado";
			break;
	}
} else {
	switch(languaje){
		case "Español":
			verifytxt = " | No verificado";
			break;
		case "Inglés":
			verifytxt = " | Unverified";
			break;
		case "Portugués":
			verifytxt = " | Não verificado";
			break;
	}
}

lvl_data = "User: " + lvl_user + " | ID: " + lvl_id + verifytxt + " | Attempts: " + string(lvl_attempts);

adjust_txt = clamp(ideal_width-10 / string_width(lvl_data), 0, 1);

draw_text_transformed(cw, ideal_height-5, lvl_data, adjust_txt, adjust_txt, 0);
#endregion
#region Eliminar nivel
draw_set_color(c_black);
draw_set_alpha(al);
draw_rectangle(0, 0, ideal_width, ideal_height, 0);


if(sz > 0.1 && dlt_lvl){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_rectangle(cw-150*sz, ch-30*sz, cw+150*sz, ch+50*sz, 0);
	draw_set_color(c_black);
	draw_rectangle(cw-145*sz, ch-25*sz, cw+145*sz, ch+45*sz, 0);
	
	if(!deleting){
		if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-140, ch+23, cw-5, ch+43) && dlt_lvl){
			draw_set_color($dbdbdb);
			draw_rectangle(cw-140*sz, ch+23*sz, cw-5*sz, ch+43*sz, 0);
			if mouse_check_button_released(mb_left) {
				anim = false;
			}
		} else { 
			draw_set_color($a0a0a0);
			draw_rectangle(cw-140*sz, ch+23*sz, cw-5*sz, ch+43*sz, 0);
		}
	
		if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+5, ch+23, cw+140, ch+43) && dlt_lvl){
			draw_set_color($dbdbdb);
			draw_rectangle(cw+140*sz, ch+23*sz, cw+5*sz, ch+43*sz, 0);
			if mouse_check_button_released(mb_left) {
				file_to_delete = file_find_first(lvl_file + "Level\\*.pmol", fa_directory);
				deleting = true;
				timer[0] = 2;
			}
		} else {
			draw_set_color($a0a0a0);
			draw_rectangle(cw+140*sz, ch+23*sz, cw+5*sz, ch+43*sz, 0);
		}
	}
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_font(fnt_roboto);
	draw_set_valign(fa_middle);
	if(!deleting){
		draw_text_transformed(cw, ch, text[44], sz, sz, 0);
		draw_text_transformed(cw+72.5*sz, ch+34*sz, text[45], sz, sz, 0);
		draw_text_transformed(cw-72.5*sz, ch+34*sz, text[39], sz, sz, 0);
	} else {
		if(file_to_delete != ""){
			draw_text_transformed(cw, ch, string(files_deleted) + text[112], sz, sz, 0);
		} else {
			switch(languaje){
				case "Español":
					var txt = "Hecho";
					break;
				case "Inglés":
					var txt = "Done";
					break;
				case "Portugués":
					var txt = "Feito";
					break;
			}
			draw_text_transformed(cw, ch, txt, sz, sz, 0);
		}
	}
}
#endregion
draw_set_alpha(1);
scr_button_back(2, !dlt_lvl);
