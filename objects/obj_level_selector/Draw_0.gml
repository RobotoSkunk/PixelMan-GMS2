/// @description Dibujar selector
if(!((y > y_camera && y < y_camera + ideal_height) || (y+60 > y_camera && y+60 < y_camera + ideal_height))) exit;

draw_set_color(c_white);
draw_rectangle(x, y, x_camera+ideal_width-50, y+60, 0);
draw_set_color(c_black);
draw_rectangle(x+5, y+5, x_camera+ideal_width-55, y+55, 0);
draw_set_color(c_white);
draw_set_alpha(al);
draw_rectangle(x, y, x_camera+ideal_width-50, y+60, 0);
draw_set_alpha(1);

if(searched){
	draw_set_color(c_white);
	draw_set_font(fnt_roboto);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	var txt_sz;
	txt_sz = clamp(point_distance(x+10, y, x_camera+ideal_width-60, y) / string_width(lvl_name), 0, 1)
	draw_text_transformed(x+10, y+16, string(lvl_name), txt_sz, txt_sz, 0);


	draw_set_valign(fa_bottom);
	var verifytxt = "";
	var playernmbtxt = "";
	var adjust_txt = 0;
	var final_txt = "";
	#region Verificado
	if(lvl_verify){
		switch(languaje){
			case "Español":
				verifytxt = " | Verificado | ";
				break;
			case "Inglés":
				verifytxt = " | Verified | ";
				break;
			case "Portugués":
				verifytxt = " | Verificado | ";
				break;
		}
	} else {
		switch(languaje){
			case "Español":
				verifytxt = " | No verificado | ";
				break;
			case "Inglés":
				verifytxt = " | Unverified | ";
				break;
			case "Portugués":
				verifytxt = " | Não verificado | ";
				break;
		}
	}
	#endregion
	#region Multijugador
	if(!lvl_pant_div){
		switch(languaje){
			case "Español":
				playernmbtxt = " | Solitario";
				break;
			case "Inglés":
				playernmbtxt = " | Solo";
				break;
			case "Portugués":
				playernmbtxt = " | Solo";
				break;
		}
	} else {
		switch(languaje){
			case "Español":
				playernmbtxt = " | Multijugador";
				break;
			case "Inglés":
				playernmbtxt = " | Multiplayer";
				break;
			case "Portugués":
				playernmbtxt = " | Multijogador";
				break;
		}
	}
	#endregion
	
	final_txt = string(lvl_size) + " | " + string(lvl_date) + verifytxt + lvl_gm_version + playernmbtxt;
	
	adjust_txt = clamp(point_distance(x+10, y, x_camera+ideal_width-60, y) / string_width(final_txt), 0, 1);
	
	draw_text_transformed(x+10, y+55, final_txt, adjust_txt, adjust_txt, 0);
	
	/*if(!scr_compare_versions(lvl_gm_version) || !lvl_saved){
		draw_set_color(c_black);
		draw_set_alpha(0.8);
		draw_rectangle(x+5, y+5, x_camera+ideal_width-55, y+55, 0);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_font(fnt_roboto);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if(!lvl_saved){
			switch(languaje){
				case "Español":
					state = "Algo salió mal...";
					break;
				case "Inglés":
					state = "Something went wrong...";
					break;
				case "Portugués":
					state = "Algo deu errado...";
					break;
			}
		} else {
			switch(languaje){
				case "Español":
					state = "Necesitas actualizar el juego";
					break;
				case "Inglés":
					state = "You need to update the game";
					break;
				case "Portugués":
					state = "Você precisa atualizar o jogo";
					break;
			}
		}
		draw_text_transformed(lerp(x, x_camera+ideal_width-50, 0.5), y+30, string(state), 1, 1, 0);
	}*/
	
} else {
	draw_set_color(c_white);
	draw_set_font(fnt_roboto);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(lerp(x, x_camera+ideal_width-50, 0.5), y+30, string(state), 2, 2, 0);
	if (a < af){
		a++;
		draw_set_color(c_white);
		draw_rectangle(x+6, y+49, x+6+(a*(point_distance(x+6, y, x_camera+ideal_width-56, y))/af), y+54, 0);
	}
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);
