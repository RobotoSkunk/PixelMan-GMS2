/// @description Dibujar créditos
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_font(fnt_roboto);

if(al > 0.02){
	for(var i = 0; i < sprite_get_number(spr_social_button); i++){
		if(can_use && point_in_rectangle_to_gui(mx, my, 2, ideal_height - 22 - 26*i, 22, ideal_height - 2 - 25*i) && !in_use){
			if(mouse_check_button(mb_left)){
				sb[i] = lerp(sb[i], 1.3, 0.2);
			} else {
				sb[i] = lerp(sb[i], 1, 0.2);
			}
		
			if(mouse_check_button_released(mb_left)){
				switch(i){
					case 0:
						url_open_ext("https://www.youtube.com/channel/UCrzfN-UbR2q0VxaI7spSDrw", "_blank");
						break;
					case 1:
						url_open_ext("https://twitter.com/RobotoSkunkGame", "_blank");
						break;
					case 2:
						url_open_ext("https://www.facebook.com/RobotoSkunk/", "_blank");
						break;
					case 3:
						url_open_ext("https://pixelmanserver.000webhostapp.com/", "_blank");
						break;
				}
			}
		} else {
			sb[i] = lerp(sb[i], 1, 0.2);
		}
	
		draw_sprite_ext(spr_social_button, i, -26 + 39*al, ideal_height - 13 - 24*i, sb[i], sb[i], 0, -1, 1); //13
	}
}

if (can_use && mouse_check_button_pressed(mb_left) && !point_in_rectangle_to_gui(mx, my, 0, 0, 50, 60)
	&& !point_in_rectangle_to_gui(mx, my, 2, ideal_height - 2 - 26*i, 24, ideal_height - 2)){
	ym = new_ypos - my;
	in_use = true;
}

if(al > 0.02){
	draw_sprite(spr_Alex, 0, xpos, ideal_height);
	draw_set_alpha(al);
	draw_text(ideal_width/2, ypos + 55, credits);
	var crd = string_height(credits);
	draw_set_font(fnt_robotoB);
	var correct_size = crd / string_height(headers + "\n");
	draw_text_transformed(ideal_width/2, ypos + 55, headers, correct_size, correct_size, 0);
	draw_set_alpha(1);
	draw_sprite_ext(spr_title, 0, ideal_width/2, ypos, 1.1, 1.1, 0, -1, al);
	draw_sprite_ext(spr_gms2logo, 0, ideal_width/2, ypos + string_height(credits) + 115, 0.3, 0.3, 0, -1, al);
	
	var con = (can_use && (!in_use && time_to_wait == 2));
	scr_button_back(con, -100 + 100*al);
}

draw_set_colour(-1);
draw_set_halign(-1);
draw_set_font(-1);