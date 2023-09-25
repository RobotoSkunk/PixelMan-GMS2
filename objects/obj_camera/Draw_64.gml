/// @description Procesador de la GUI
if (room != rm_editor) draw_sprite(spr_button_pause, 0, 22, 22);
else draw_sprite(spr_buttons_editor, 7, 18, 18);

if(pant_div){
	draw_set_color(c_black);
	draw_line_width(ideal_width/2, -1, ideal_width/2, ideal_height, 4);
	draw_set_color(c_white);
	draw_line_width(ideal_width/2, -1, ideal_width/2, ideal_height, 2);
}

#region Pausa
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
tpause++;
tpause = clamp(tpause, 0, 10);
if(alph > 0.1){
	draw_set_colour(c_black);
	draw_set_alpha(alph);
	draw_rectangle(0, 0, ideal_width, ideal_height, false);
	draw_set_alpha(1);
	if(!lvl_start){
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_roboto);
		var att_txt, att_arr;
		
		switch(languaje){
			case "Español":
				att_txt = "Intento ";
				break;
			case "Inglés":
				att_txt = "Attempt ";
				break;
			case "Portugués":
				att_txt = "Tentativo ";
				break;
		}
		
		if(gonna_start){
			var param;
			param[0] = 3 - round(starting_time/7);
			param[1] = (param[0] <= 0);
			draw_sprite_ext(spr_count, param[0], ideal_width/2, ideal_height/2, 1 + param[1], 1 + param[1], 0, -1, 1);
			att_arr = ideal_width*2;
		} else {
			draw_text_transformed(ideal_width/2, ideal_height/2, "Press any button to start", 2, 2, 0);
			//att_x += sin(degtorad(ideal_width/2 - att_x))*10;
			att_arr = ideal_width/2;
		}
		
		att_x += degtorad(att_arr - att_x)*7;
		draw_set_valign(fa_top);
		draw_text_transformed(att_x, 5, att_txt + string(attempts), 1, 1, 0);
		
		draw_set_halign(-1);
		draw_set_valign(-1);
		draw_set_font(-1);
		draw_set_color(-1);
	}
}

if(tpause >= 10 && lvl_start){
	if(room != rm_editor){
		if(pause && !won){
			alph = lerp(alph, 0.8, 0.2);
			xpos = lerp(xpos, 0, 0.2);
			for(var i = 0; i < 3; i++){
				if(point_in_rectangle_to_gui(mx, my, 0, 10+50*i, 204, 50+50*i)){
					if(mouse_check_button(mb_left)) xposb[i] = lerp(xposb[i], -5-15*i, 0.2);
					else xposb[i] = lerp(xposb[i], -20-20*i, 0.2);
					#region Actions
					if(mouse_check_button_released(mb_left) && !exit_game){
						switch(i){
							case 0:
								pause = false;
								break;
							case 1:
								pause = false;
								kill = true;
								break;
							case 2:
								exit_game = true;
								alarm[3] = room_speed*0.4;
								break;
						}
					}
					#endregion
				} else {
					xposb[i] = lerp(xposb[i], -20-20*i, 0.2-0.05*i);
				}
			}
		} else {
			alph = lerp(alph, 0, 0.2);
			xpos = lerp(xpos, -161, 0.2);
			for(var i = 0; i < 3; i++){
				xposb[i] = lerp(xposb[i], -224, 0.2-0.05*i);
			}
		}
		var pb = (keyboard_check_pressed(vk_escape) && !IsDead) ||
			(gamepad_button_check_pressed(device, gp_start)  && !IsDead) ||
			(point_in_rectangle_to_gui(mx, my, 5, 5, 38, 38) && !pause && mouse_check_button_released(mb_left));
	
		if(pb && !exit_game){
			switch(pause){
				case 1: pause = 0; break;
				default: pause = 1; break;
			}
		}
	
		draw_set_alpha(alph);
		draw_sprite_ext(spr_pause_bar_1, 0, xpos, 0, 1, display_get_height()/ideal_height, 0, -1, 0.3);
		draw_sprite_ext(spr_pause_bar_1, 0, xpos-20, 0, 1, display_get_height()/ideal_height, 0, -1, 0.3);
		draw_sprite_ext(spr_pause_bar_1, 0, xpos-40, 0, 1, display_get_height()/ideal_height, 0, -1, 0.3);
		draw_set_alpha(1);
		draw_sprite_ext(spr_button_menupause, 0, xposb[0], 10, 1, 1, 0, -1, 1);
		draw_sprite_ext(spr_button_menupause, 0, xposb[1], 60, 1, 1, 0, -1, 1);
		draw_sprite_ext(spr_button_menupause, 0, xposb[2], 110, 1, 1, 0, -1, 1);
		draw_set_color($898989);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_pixelman);
		draw_text_transformed(xposb[0]+25, 40, text[35], 1.2, 1.2, 0);
		draw_text_transformed(xposb[1]+45, 90, text[46], 1.2, 1.2, 0);
		draw_text_transformed(xposb[2]+65, 140, text[37], 1.2, 1.2, 0);
		draw_set_halign(-1);
		draw_set_valign(-1);
		draw_set_font(-1);
		draw_set_alpha(1);
	
	} else {
		if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 0, 38, 38) && mouse_check_button_released(mb_left)){
			kill = true;
		} else if(keyboard_check_pressed(vk_escape)) kill = true;
	}
}
#endregion
#region Win
if(won && room != rm_editor){
	desp = (1)-sz;
	sp += (0.05 * desp) - (0.19 * sp);
	sz += sp;
	
	draw_set_colour(c_black);
	draw_set_alpha(alph);
	draw_rectangle(0, 0, ideal_width, ideal_height, false);
	draw_set_alpha(1);
	
	draw_set_color(c_white);
	draw_rectangle(cw-150*sz, ch-60*sz, cw+150*sz, ch+60*sz, 0);
	draw_set_color(c_black);
	draw_rectangle(cw-145*sz, ch-55*sz, cw+145*sz, ch+55*sz, 0);
	draw_sprite_ext(spr_decorated_buttons, 6, cw+80*sz, ch+60*sz, sz*bz[0], sz*bz[0], 0, -1, 1);
	if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+48*sz, ch+28*sz, cw+112*sz, ch+92*sz)){
		if(mouse_check_button(mb_left)) bz[0] = lerp(bz[0], 1.2, 0.3);
		else bz[0] = lerp(bz[0], 1, 0.3);
		if(mouse_check_button_released(mb_left)){
			exit_game = true;
			alarm[3] = room_speed*0.4;
		}
	} else bz[0] = lerp(bz[0], 1, 0.3);
	draw_sprite_ext(spr_decorated_buttons, 7, cw-80*sz, ch+60*sz, sz*bz[1], sz*bz[1], 0, -1, 1);
	if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-112*sz, ch+28*sz, cw-48*sz, ch+92*sz)){
		if(mouse_check_button(mb_left)) bz[1] = lerp(bz[1], 1.2, 0.3);
		else bz[1] = lerp(bz[1], 1, 0.3);
		if(mouse_check_button_released(mb_left)){
			exit_game = true;
			alarm[4] = room_speed*0.4;
		}
	} else bz[1] = lerp(bz[1], 1, 0.3);
	draw_set_font(fnt_roboto);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text_transformed(cw, ch, text[47], sz, sz, 0);
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_color(-1);
}
#endregion
#region Debug
switch (debug){
    case true:
		if(instance_exists(obj_player)){
			if (obj_player.desblock != noone) txtd = "Blocked!"; else txtd = "Noone";
		} else {
			txtd = "-1";
		}
        if (keyboard_check_pressed(vk_f4) and keyboard_check(vk_control) and keyboard_check(vk_shift)) {debug = false;}
		draw_set_colour(c_black);
        draw_set_alpha(0.5);
        draw_rectangle(0, display_get_gui_height()-65, 250, display_get_gui_height(), 0);
        draw_rectangle(display_get_gui_width()-130, 0, display_get_gui_width(), 220, 0);
        //Versión y propiedades de pantalla
        draw_set_colour(c_white);
        draw_set_alpha(1);
        draw_text(5, display_get_gui_height()-20, string_hash_to_newline(string(display_get_width()) + " x " + string(display_get_height()) + " (" + string(aspect_ratio) + ") " + string(fps) +"fps"));
        draw_text(5, display_get_gui_height()-35, string_hash_to_newline("Alpha Build ") + string(GM_version));
		draw_text(5, display_get_gui_height()-50, string_hash_to_newline("Runtime ") + string(GM_runtime_version));
		draw_text(5, display_get_gui_height()-65, string_hash_to_newline("Os_type: ") + string(os));
        //Datos
        draw_set_halign(fa_right);
        draw_text(ideal_width - 5, 5, string_hash_to_newline("DEBUG_ON"));
        draw_text(ideal_width - 5, 20, string_hash_to_newline(string(ideal_width) + " x " + string(ideal_height)));
		if(instance_exists(obj_player)){
	        draw_text(ideal_width - 5, 35, string_hash_to_newline(string(obj_player.x)));
	        draw_text(ideal_width - 5, 50, string_hash_to_newline(string(obj_player.y)));
			draw_text(ideal_width - 5, 65, string_hash_to_newline(string(obj_player.vh)));
			draw_text(ideal_width - 5, 80, string_hash_to_newline(string(obj_player.vv)));
			draw_text(ideal_width - 5, 125, string_hash_to_newline(string(obj_player.vdirect)));
			draw_text(ideal_width - 5, 140, string_hash_to_newline(string(obj_player.hdirect)));
		}
        draw_text(ideal_width - 5, 95, string_hash_to_newline(string(x)));
        draw_text(ideal_width - 5, 110, string_hash_to_newline(string(y)));
        draw_text(ideal_width - 5, 155, string_hash_to_newline(string(txtd)));
		draw_text(ideal_width - 5, 170, string_hash_to_newline(string(instance_number(obj_camera))));
		draw_text(ideal_width - 5, 185, "axislh: " + string(gamepad_axis_value(device, gp_axislh)));
        draw_set_halign(fa_left);
        break;
    default:
        if (keyboard_check_pressed(vk_f4) and keyboard_check(vk_control) and keyboard_check(vk_shift)) {debug = true;}
}
#endregion
#region Transición
draw_set_colour(c_white);
draw_rectangle(-1, 0, xp1, ideal_height/2, 0);
draw_rectangle(ideal_width, ideal_height/2, xp2, ideal_height, 0);
draw_set_colour(-1);
#endregion
scr_cursor_sprite(0);
