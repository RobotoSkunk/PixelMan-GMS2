/// @description Dibujar linea
draw_set_colour(c_white);
draw_set_font(fnt_pixelman);
draw_set_halign(fa_left);

if(!is_text){
	draw_line_width(x_camera+10, y, x_camera+ideal_width-10, y, 4);
	draw_line_width(x_camera+9, y, x_camera+ideal_width-9, y, 2);
} else {
	switch(txt){
		case 0:
			draw_set_font(fnt_roboto);
			draw_set_halign(fa_center);
			draw_text(x, y-7, text[15]);
			break;
		case 1:
			draw_text(x, y-15, text[6]);
			break;
		case 2:
			draw_set_font(fnt_roboto);
			draw_text(x, y-9, "(" + string(surface_get_width(application_surface)) + " x " + string(surface_get_height(application_surface)) + ")");
			break;
		case 3:
			draw_text(x, y-15, text[7]);
			break;
		case 4:
			draw_text(x, y-15, text[3]);
			break;
		case 5:
			draw_set_font(fnt_roboto);
			for(var i = 0; i < os_map_size; i++){
				draw_text(x, y+15*i, string(i) + ". " + os_map_info[i] + ": " + string(os_map_data[i]));
			}
			break;
		case 6:
			draw_set_font(fnt_roboto);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text(x, y, text[34]);
			break;
	}
}

draw_set_halign(-1);
draw_set_font(-1);
draw_set_colour(-1);