/// @description Dibujar interfaz
var mx, my, cw, ch;
mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);
cw = ideal_width/2;
ch = ideal_height/2;

draw_set_alpha(al);
draw_set_color(c_black);
draw_rectangle(0, 0, ideal_width, ideal_height, 0);
draw_set_color(-1);
draw_set_alpha(1);
#region No hay niveles
if(instance_number(obj_level_selector) = 0){
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_roboto);
	draw_text(cw, ch, text[38]);
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_color(-1);
}
#endregion
#region Crear nivel
if(sz > 0.1){
	draw_set_color(c_white);
	draw_rectangle(cw-150*sz, ch-50*sz, cw+150*sz, ch+50*sz, 0);
	draw_set_color(c_black);
	draw_rectangle(cw-145*sz, ch-45*sz, cw+145*sz, ch+45*sz, 0);
	
	//Cambiar nombre
	if(mouse_check_button_released(mb_left)){
		new_level_write = point_in_rectangle_to_gui(mx, my, cw-120, ch-10, cw+120, ch+10);
	}
	if(new_level_write){
		lvl_name = string_copy(keyboard_string, 0, 50);
	} else {
		keyboard_string = lvl_name;
	}
	
	if new_level_write draw_set_color(c_red);
	else draw_set_color(c_white);
	draw_rectangle(cw-120*sz, ch-10*sz, cw+120*sz, ch+10*sz, 0);
	draw_set_color(c_black);
	draw_rectangle(cw-118*sz, ch-8*sz, cw+118*sz, ch+8*sz, 0);
	
	//Cancelar
	if(point_in_rectangle_to_gui(mx, my, cw-140, ch+23, cw-5, ch+43) && new_level){
		draw_set_color($dbdbdb);
		if mouse_check_button_released(mb_left) {
			new_level = false;
			//new_level_write = false;
		}
	} else { 
		draw_set_color($a0a0a0);
	}
	draw_rectangle(cw-140*sz, ch+23*sz, cw-5*sz, ch+43*sz, 0);
	
	//Crear nivel
	if(point_in_rectangle_to_gui(mx, my, cw+5, ch+23, cw+140, ch+43) && new_level){
		draw_set_color($dbdbdb);
		if mouse_check_button_released(mb_left) {
			timer[0] = room_speed*0.6;
			move_to_room = true;
		}
	} else {
		draw_set_color($a0a0a0);
	}
	draw_rectangle(cw+140*sz, ch+23*sz, cw+5*sz, ch+43*sz, 0);
	
	//Nombre en pantalla
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_roboto);
	draw_text_transformed(cw, ch-35*sz, text[41], sz, sz, 0);
	draw_set_valign(fa_middle);
	if(lvl_name == ""){
		var name_dflt = "";
		switch(languaje){
			case "Español": name_dflt = "Inserte un nombre..."; break;
			case "Inglés": name_dflt = "Insert a name..."; break;
			case "Portugués": name_dflt = "Inserir um nome..."; break;
			default: text_change = true; languaje = "Inglés"; break;
		}
		draw_set_alpha(0.3);
		draw_text_transformed(cw, ch, name_dflt, sz, sz, 0);
		draw_set_alpha(1);
	} else {
		var txt_sz;
		txt_sz = clamp(220 / string_width(lvl_name), 0, 1);
		
		draw_text_transformed(cw, ch, lvl_name, txt_sz*sz, txt_sz*sz, 0);
	}
	draw_text_transformed(cw+72.5*sz, ch+34*sz, text[40], sz, sz, 0);
	draw_text_transformed(cw-72.5*sz, ch+34*sz, text[39], sz, sz, 0);
	
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_color(-1);
} else lvl_name = "";
draw_set_alpha(1);
#endregion
