/// @description GPU
draw_sprite_ext(spr_title, 0, ideal_width/2, ideal_height/2, 2, 2, 0, -1, 0.15*al);

if(al < 9.05){
	var sep = 40,
		init_y = ideal_height/2 - (btn_nmb/2)*sep + 15,
		txt_arr = [text[1], text[2], text[3]];;

	draw_set_font(fnt_robotoBI);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);

	for(var i = 0; i < btn_nmb; i++){
		draw_sprite(spr_menu_btns_1, i, x_arr[i], init_y + sep*i);
		var txt_sz = clamp(125/string_width(txt_arr[i]), 0, 1);
		draw_text_transformed(x_arr[i] + 30, init_y + sep*i + 2, txt_arr[i], txt_sz, txt_sz, 0);
	}

	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);

	draw_sprite_ext(spr_menu_btns_2, 0, -25*x_arr_2[0], 0, 1, 1, 0, -1, 1);
	draw_sprite_ext(spr_menu_btns_2, 1, -25*x_arr_2[1], ideal_height-50, 1, 1, 0, -1, 1);
	draw_sprite_ext(spr_menu_btns_2, 2, ideal_width-129+25*x_arr_2[2], ideal_height-50, 1, 1, 0, -1, 1);

	draw_sprite_ext(spr_title, 0, ideal_width-160, 40 - 140*al, 1 + dsin(st1)*0.6, 1 + dsin(st1)*0.6, 12*dsin(st2), -1, 1);

	#region Pantalla de salida
	if(al_exit > 0){
		var mx = device_mouse_x_to_gui(0),
			my = device_mouse_y_to_gui(0),
			_y = 20;
	
		draw_set_color(c_black);
		draw_set_alpha(al_exit*0.8);
		draw_rectangle(0, 0, ideal_width, ideal_height, 0);
		draw_rectangle(0, ideal_height/2-45, ideal_width, ideal_height/2+45, 0);
		draw_set_alpha(al_exit);
	
		if(point_in_rectangle_to_gui(mx, my, ideal_width/2-140, ideal_height/2+_y-10, ideal_width/2-5, ideal_height/2+_y+10) && menu_active == 0){
			draw_set_color($dbdbdb);
			if mouse_check_button_released(mb_left) {
				goto = -1;
				timer[0] = 2;
			}
		} else { 
			draw_set_color($a0a0a0);
		}
		draw_rectangle(ideal_width/2-140, ideal_height/2+_y-10, ideal_width/2-5, ideal_height/2+_y+10, 0);
	
		if(point_in_rectangle_to_gui(mx, my, ideal_width/2+5, ideal_height/2+_y-10, ideal_width/2+140, ideal_height/2+_y+10) && menu_active == 0){
			draw_set_color($dbdbdb);
			if mouse_check_button_released(mb_left) {
				move_to_room = true;
				alarm[0] = room_speed*0.6;
			}
		} else {
			draw_set_color($a0a0a0);
		}
		draw_rectangle(ideal_width/2+140, ideal_height/2+_y-10, ideal_width/2+5, ideal_height/2+_y+10, 0);
	
	
		draw_set_font(fnt_robotoBI);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_text(ideal_width/2, ideal_height/2 - 15, text[48]);
	
		draw_set_font(fnt_robotoB);
		draw_text(ideal_width/2+72.5, ideal_height/2+_y+2, text[37]);
		draw_text(ideal_width/2-72.5, ideal_height/2+_y+2, text[39]);
	
		draw_set_alpha(1);
	
		draw_line_width(-5, ideal_height/2 - 50, -5 + (ideal_width + 10)*al_exit, ideal_height/2 - 50, 2);
		draw_line_width(ideal_width+5 - (ideal_width+10)*al_exit, ideal_height/2 + 50, ideal_width + 5, ideal_height/2 + 50, 2);
	
		draw_set_font(-1);
		draw_set_halign(-1);
		draw_set_valign(-1);
		draw_set_color(-1);
	}
	#endregion
}