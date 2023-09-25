/// @description Interfaz del editor
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
#region Plano cartesiano de Game Maker
draw_set_colour(c_blue);
draw_set_font(fnt_roboto);
draw_set_halign(fa_left);
draw_arrow(10, 5, 10, 35, 5);
draw_line_width(10, 5, 10, 33, 1);
draw_text_transformed(9, 37, "y", 0.5, 0.5, 0);
draw_text_transformed(15, 25, "Mouse Y: " + string(mouseY), 0.5, 0.5, 0);
draw_set_colour(c_red);
draw_arrow(5, 10, 35, 10, 5);
draw_line_width(5, 10, 33, 10, 1);
draw_text_transformed(37, 7, "x", 0.5, 0.5, 0);
draw_text_transformed(15, 15, "Mouse X: " + string(mouseX), 0.5, 0.5, 0);
var rand;
rand = [0, 0];
if(fps >= 50){
	draw_set_color(c_lime);
} else if(fps < 50 && fps >= 30){
	draw_set_color(c_yellow);
} else {
	draw_set_color(c_red);
	rand = [random(2), random(2)];
}
draw_text_transformed(15+rand[0], 35+rand[1], "FPS: " + string(fps), 0.5, 0.5, 0);
#endregion
#region Selector de objetos
draw_set_color(c_white);
draw_rectangle(select_x, 55, select_x + 140, ymaxsel, 0);
draw_rectangle(select_x, 50, select_x + 135, ymaxsel+5, 0);
draw_set_color(c_black);
draw_rectangle(select_x, 60, select_x + 135, ymaxsel-5, 0);
draw_rectangle(select_x, 55, select_x + 130, ymaxsel, 0);
draw_set_color(-1);
draw_sprite(spr_button_hide_editor, selector+1, select_x + 141, 70);
#region Selector
if(select_x > -120){
	draw_surface_ext(surf_buttons, select_x, 56, 1/t, 1/t, 0, -1, 1);
	
	draw_sprite_ext(spr_arrow_s, 0, select_x + 121, 61, sb[0], sb[0], -90, -1, 1);
	draw_sprite_ext(spr_arrow_s, 0, select_x + 120, ymaxsel-5, sb[1], sb[1], 90, -1, 1);
}
#endregion
#endregion
#region Menú del editor
var mult_menu = clamp(ideal_width/(81+36*array_length_1d(array_btn_editor)), 0, 1);
var menu_txt;
switch(languaje){
	case "Español":
		menu_txt = ["Pausa", "Configuración", "Guía del editor", "Rehacer (NOT AVAIABLE)", "Deshacer (NOT AVAIABLE)", "Guardar nivel", "Testear nivel"];
		break;
	case "Inglés":
		menu_txt = ["Pause", "Settings", "Editor guide", "Redo (NOT AVAIABLE)", "Undo (NOT AVAIABLE)", "Save level", "Test level"];
		break;
	case "Portugués":
		menu_txt = ["Pausar", "Configuração", "Guia do Editor", "Refazer (NOT AVAIABLE)", "Desfazer (NOT AVAIABLE)", "Salvar nível", "Nível de teste"];
		break;
}
for(var i = 0; i < array_length_1d(array_btn_editor); i++){
	var btn_x = 21+36*i;
	var act_col = -1;
	if(i == 3) act_col = c_dkgray;
	if(i == 4) act_col = c_dkgray;
	if(i == 5 && (player_nmb == 0 || end_nmb == 0)) act_col = c_dkgray;
	if(i == 6 && player_nmb == 0) act_col = c_dkgray;
	if(i == 3) draw_sprite_ext(spr_buttons_editor, array_btn_editor[i], ideal_width-btn_x*mult_menu, 21*mult_menu, -interface_bscale[i]*mult_menu, interface_bscale[i]*mult_menu, 0, act_col, 1);
	else draw_sprite_ext(spr_buttons_editor, array_btn_editor[i], ideal_width-btn_x*mult_menu, 21*mult_menu, interface_bscale[i]*mult_menu, interface_bscale[i]*mult_menu, 0, act_col, 1);
	
	if(i == 2){
		var help_line_pos_x = btn_x*mult_menu;
	}
	
	if(point_in_rectangle_to_gui(mx, my, ideal_width-(btn_x+16)*mult_menu, 4*mult_menu, ideal_width-(btn_x-16)*mult_menu, 37*mult_menu) && !cvg1 && time_to_wait == 2){
		if(mouse_check_button(mb_left)  && act_col == -1) interface_bscale[i] = lerp(interface_bscale[i], 1.2, 0.3);
		else interface_bscale[i] = lerp(interface_bscale[i], 1, 0.3);
		
		data_txt = menu_txt[i];
		over_something = true;
		data_act = true;
		
		if(mouse_check_button_released(mb_left)){
			if(act_col == -1){
				if(i == 0){
					pause_editor = true;
				} else if(i == 1){
					#region Configuración
					settings = true;
					xdest[1] = 0;
					sp[1] = 2;
					#endregion
				} else if(i == 2){
					#region Ayuda
					help = true;
					xdest[0] = 0;
					sp[0] = 2;
					#endregion
				} else if(i == 6){
					#region Testeo
					start_opt = false;
					switch(languaje){
						case "Español":
							tt = "Preparando testeo...";
							break;
						case "Inglés":
							tt = "Preparing test...";
							break;
						case "Portugués":
							tt = "Preparando o teste...";
							break;
						default:
							text_change = 1;
							languaje = "Inglés";
							break;
					}
					timer[1] = 2;
					test = true;
					#endregion
				} else if(i == 5){
					#region Guardar nivel
					start_opt = false;
					switch(languaje){
						case "Español":
							tt = "Preparando para guardar...";
							break;
						case "Inglés":
							tt = "Preparing to save...";
							break;
						case "Portugués":
							tt = "Preparando para salvar...";
							break;
						default:
							text_change = 1;
							languaje = "Inglés";
							break;
					}
					timer[3] = 15;
					saving = true;
					#endregion
				}
			} else {
				if(i == 6){
					#region Testeo
					timer[1] = 2;
					#endregion
				} else if(i == 5){
					#region Guardar nivel
					timer[3] = 2;
					#endregion
				}
			}
		}
	} else {
		interface_bscale[i] = lerp(interface_bscale[i], 1, 0.3);
		if(!over_something){
			data_act = false;
		}
	}
}
#endregion
#region Barra de zoom
draw_sprite_ext(spr_slider_1, 0, 45, ideal_height-11, 0.8, 0.8, 0, -1, 1);
draw_sprite_ext(spr_slider_1, 1, (zm*70/2.5)+2.5, ideal_height-11, 0.8, 0.8, 0, -1, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_roboto);
draw_text(85, ideal_height-10, "Zoom");
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
if(point_in_rectangle_to_gui(mx, my, 0, ideal_height-20, 85, ideal_height)){
	if(mouse_check_button_pressed(mb_left) && can_create && time_to_wait == 2){
		zoom_gui = true;
	}
}
if(zoom_gui){
	time_to_wait = 0;
	zm = mx*2.5/70;
	if mouse_check_button_released(mb_left) zoom_gui = false;
}
#endregion
#region Mouse data
data_alph = lerp(data_alph, data_act, 0.3);
if(data_alph > 0.1){
	var size_of_data = 0.5;
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_roboto);
	draw_set_color(c_black);
	draw_set_alpha(data_alph*0.7);
	draw_rectangle(mx-(string_width(data_txt)*size_of_data/2)-2, my+5, mx+(string_width(data_txt)*size_of_data/2)+2, my+string_height(data_txt)*size_of_data+5, 0);
	draw_set_color(c_white);
	draw_set_alpha(data_alph);
	draw_text_transformed(mx, my+6, data_txt, size_of_data, size_of_data, 0);
	draw_set_alpha(1);
}
#endregion
#region Obscurecer fondo
if(gui_al > 0.01){
	draw_set_alpha(gui_al);
	draw_set_color(c_black);
	draw_rectangle(0, 0, ideal_width, ideal_height, 0);
	draw_set_alpha(1);
}
#endregion
#region Menú de pausa
if(!pause_editor){
	pxpos[0] = lerp(pxpos[0], -162, 0.2);
	for(var i = 1; i < 4; i++){
		pxpos[i] = lerp(pxpos[i], -225, 0.2-0.05*(i-1));
	}
} else {
	pxpos[0] = lerp(pxpos[0], 0, 0.2);
	for(var i = 1; i < 4; i++){
		if(point_in_rectangle_to_gui(mx, my, 0, 10+50*(i-1), 204, 50+50*(i-1))){
			if(mouse_check_button(mb_left)) pxpos[i] = lerp(pxpos[i], -5-20*(i-1), 0.2);
			else pxpos[i] = lerp(pxpos[i], -20-20*(i-1), 0.2);
			
			if(mouse_check_button_released(mb_left)){
				switch(i-1){
					case 0:
						pause_editor = false;
						break;
					case 1:
						if (player_nmb > 0 && end_nmb > 0){
							#region Guardar nivel
							start_opt = false;
							switch(languaje){
								case "Español":
									tt = "Preparando para guardar...";
									break;
								case "Inglés":
									tt = "Preparing to save...";
									break;
								case "Portugués":
									tt = "Preparando para salvar...";
									break;
								default:
									tt = "Preparando para guardar...";
									break;
							}
							timer[3] = 15;
							save_exit = true;
							saving = true;
						
						} else if(player_nmb == 0){
							switch(languaje){
								case "Español":
									tt = "Necesitas un jugador para guardar";
									break;
								case "Inglés":
									tt = "You need a player to save";
									break;
								case "Portugués":
									tt = "Você precisa de um jogador para salvar";
									break;
								default:
									tt = "Necesitas un jugador para guardar";
									break;
							}
							timer[2] = 180;
						} else if(end_nmb == 0){
							switch(languaje){
								case "Español":
									tt = "Necesitas una puerta final para guardar";
									break;
								case "Inglés":
									tt = "You need a final door to save";
									break;
								case "Portugués":
									tt = "Você precisa de uma porta final para salvar";
									break;
								default:
									tt = "Necesitas una puerta final para guardar";
									break;
							}
							timer[2] = 180;
							#endregion
						}
						pause_editor = false;
						break;
					case 2:
						move_to_room = true;
						save_exit = true;
						timer[2] = room_speed*0.6;
						break;
				}
			}
		} else {
			pxpos[i] = lerp(pxpos[i], -20-20*(i-1), 0.2-0.05*(i-1));
		}
	}
}
var bk_btn = vk_escape;
var pb = keyboard_check_pressed(bk_btn) && !settings && !help && time_to_wait = 2 && !open_menu && !saving && loaded;
if(pb){
	switch(pause_editor){
		case 1: pause_editor = 0; break;
		default: pause_editor = 1; break;
	}
}
if(pxpos[3] != 255){
	draw_sprite_ext(spr_pause_bar_1, 0, pxpos[0], 0, 1, display_get_height()/ideal_height, 0, -1, 0.3);
	draw_sprite_ext(spr_pause_bar_1, 0, pxpos[0]-20, 0, 1, display_get_height()/ideal_height, 0, -1, 0.3);
	draw_sprite_ext(spr_pause_bar_1, 0, pxpos[0]-40, 0, 1, display_get_height()/ideal_height, 0, -1, 0.3);
	draw_sprite(spr_button_menupause, 0, pxpos[1], 10);
	draw_sprite(spr_button_menupause, 0, pxpos[2], 60);
	draw_sprite(spr_button_menupause, 0, pxpos[3], 110);

	draw_set_color($898989);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_pixelman);
	draw_text_transformed(pxpos[1]+25, 40, text[35], 1.2, 1.2, 0);
	draw_text_transformed(pxpos[2]+45, 85, text[36], 0.8, 0.8, 0);
	draw_text_transformed(pxpos[3]+65, 140, text[37], 1, 1, 0);
	draw_set_font(-1);
}
#endregion
#region Menú de ayuda
if(xda[0] > -ideal_width+15 && xda[0] < ideal_width-15){
	draw_set_color(c_white);
	draw_rectangle(xda[0]+55, 35, xda[0]+ideal_width-55, ideal_height-25, 0);
	draw_rectangle(xda[0]+50, 40, xda[0]+ideal_width-50, ideal_height-30, 0);
	draw_set_color(c_black);
	draw_rectangle(xda[0]+60, 40, xda[0]+ideal_width-60, ideal_height-30, 0);
	draw_rectangle(xda[0]+55, 45, xda[0]+ideal_width-56, ideal_height-35, 0);
	
	#region Variables
	draw_set_font(fnt_roboto);
	var controls, theme, txt_example, rows_per_page, txt_size, pages_nmb;
	switch(languaje){
		case "Español":
			theme = ["Controles", "ERROR"];
			
			controls[0, 0] = "WASD*/Flechas";							controls[1, 0] = "Mover cámara";
			controls[0, 1] = "Botón medio";								controls[1, 1] = "Arrastrar cámara";
			controls[0, 2] = "Botón izquierdo";							controls[1, 2] = "Seleccionar/Crear/Arrastrar";
			controls[0, 3] = "Botón derecho";							controls[1, 3] = "Opciones de instancia";
			controls[0, 4] = "Scroll*";									controls[1, 4] = "Zoom*";
			controls[0, 5] = "SHIFT + WASD/Flechas";					controls[1, 5] = "Correr";
			controls[0, 6] = "SHIFT + Botón izquierdo";					controls[1, 6] = "Colocar objetos deslizando";
			controls[0, 7] = "CTRL";									controls[1, 7] = "Ignorar grid";
			controls[0, 8] = "CTRL + F";								controls[1, 8] = "Deseleccionar";
			controls[0, 9] = "CTRL + D";								controls[1, 9] = "Duplicar instancias";
			controls[0, 10] = "CTRL + S";								controls[1, 10] = "Guardar nivel";
			controls[0, 11] = "CTRL + Q or E";							controls[1, 11] = "Rotar instancia 90 grados";
			controls[0, 12] = "ALT + Left button";						controls[1, 12] = "Seleccionar deslizando";
			controls[0, 13] = "ALT + Right button";						controls[1, 13] = "Eliminar deslizando";
			controls[0, 14] = "SUPR o Retroceso";						controls[1, 14] = "Eliminar instancias seleccionadas";
			controls[0, 15] = "TAB";									controls[1, 15] = "Mostrar/Esconder hitboxes (No es preciso)";
			controls[0, 16] = "ESC";									controls[1, 16] = "Salir/Cancelar/Atrás";
			controls[0, 17] = "Q o E";									controls[1, 17] = "Rotar instancia 45 grados";
			controls[0, 18] = "Barra espaciadora + Botón izquierdo";	controls[1, 18] = "Arrastrar cámara (Para laptops)";
			controls[0, 19] = "Scroll*";								controls[1, 19] = "Subir/Bajar camera*";
			controls[0, 20] = "\"O\" o P";								controls[1, 20] = "Incrementar/Decrementar zoom";
			controls[0, 21] = "WASD*";									controls[1, 21] = "Mover instancias una casilla*";
			controls[0, 22] = "WASD* + SHIFT";							controls[1, 22] = "Mover instancias 5 casillas*";
			controls[0, 23] = "WASD* + ALT";							controls[1, 23] = "Mover instancias por pixel*";
			break;
		case "Inglés":
			theme = ["Controls", "ERROR"];
	
			controls[0, 0] = "WASD*/Direction keys";			controls[1, 0] = "Move camera";
			controls[0, 1] = "Middle button";					controls[1, 1] = "Drag camera";
			controls[0, 2] = "Left button";						controls[1, 2] = "Select/Create/Drag";
			controls[0, 3] = "Right button";					controls[1, 3] = "Instance options";
			controls[0, 4] = "Scroll*";							controls[1, 4] = "Zoom*";
			controls[0, 5] = "SHIFT + WASD/Direction keys";		controls[1, 5] = "Run";
			controls[0, 6] = "SHIFT + Left button";				controls[1, 6] = "Swipe creating";
			controls[0, 7] = "CTRL";							controls[1, 7] = "Ignore grid";
			controls[0, 8] = "CTRL + F";						controls[1, 8] = "Deselect";
			controls[0, 9] = "CTRL + D";						controls[1, 9] = "Duplicate instances";
			controls[0, 10] = "CTRL + S";						controls[1, 10] = "Save level";
			controls[0, 11] = "CTRL + Q or E";					controls[1, 11] = "Rotate instance 90 degrees";
			controls[0, 12] = "ALT + Left button";				controls[1, 12] = "Swipe selecting";
			controls[0, 13] = "ALT + Right button";				controls[1, 13] = "Swipe deleting";
			controls[0, 14] = "SUPR or Backspace";				controls[1, 14] = "Delete instance selected";
			controls[0, 15] = "TAB";							controls[1, 15] = "Show/Hide hitboxes (No accurate)";
			controls[0, 16] = "ESC";							controls[1, 16] = "Exit/Cancel/Back";
			controls[0, 17] = "Q or E";							controls[1, 17] = "Rotate instance 45 degrees";
			controls[0, 18] = "Space bar + Left button";		controls[1, 18] = "Grab camera (For laptops)";
			controls[0, 19] = "Scroll*";						controls[1, 19] = "Up/Down camera*";
			controls[0, 20] = "O or P";							controls[1, 20] = "Increase/Decrease zoom";
			controls[0, 21] = "WASD*";							controls[1, 21] = "Move instances a grid*";
			controls[0, 22] = "WASD* + SHIFT";					controls[1, 22] = "Move instances 5 grids*";
			controls[0, 23] = "WASD* + ALT";					controls[1, 23] = "Move instances a pixel*";
			break;
		case "Portugués":
			theme = ["Controles", "ERRO"];
	
			controls[0, 0] = "WASD*/Teclas de direção";				controls[1, 0] = "Mover câmera";
			controls[0, 1] = "Middle button";						controls[1, 1] = "Arrastar câmera";
			controls[0, 2] = "Botão esquerdo";						controls[1, 2] = "Selecione/Criar/Arraste";
			controls[0, 3] = "Botão direito";						controls[1, 3] = "Opções de instância";
			controls[0, 4] = "Scroll*";								controls[1, 4] = "Zoom*";
			controls[0, 5] = "SHIFT + WASD/Teclas de direção";		controls[1, 5] = "Corre";
			controls[0, 6] = "SHIFT + Botão esquerdo";				controls[1, 6] = "Deslize para criar";
			controls[0, 7] = "CTRL";								controls[1, 7] = "Ignorar grade";
			controls[0, 8] = "CTRL + F";							controls[1, 8] = "Desmarcar";
			controls[0, 9] = "CTRL + D";							controls[1, 9] = "Instâncias duplicadas";
			controls[0, 10] = "CTRL + S";							controls[1, 10] = "Salvar nível";
			controls[0, 11] = "CTRL + Q or E";						controls[1, 11] = "Rodar instância 90 graus";
			controls[0, 12] = "ALT + Botão esquerdo";				controls[1, 12] = "Deslize para selecionar";
			controls[0, 13] = "ALT + Botão direito";				controls[1, 13] = "Deslize para excluir";
			controls[0, 14] = "SUPR ou Backspace";					controls[1, 14] = "Excluir instância selecionada";
			controls[0, 15] = "TAB";								controls[1, 15] = "Mostrar/Ocultar hitboxes (não precisas)";
			controls[0, 16] = "ESC";								controls[1, 16] = "Sair/Cancelar/Voltar";
			controls[0, 17] = "Q ou E";								controls[1, 17] = "Gire a instância 45 graus";
			controls[0, 18] = "Barra de espaço + Botão esquerdo";	controls[1, 18] = "Câmera de garra (para laptops)";
			controls[0, 19] = "Scroll*";							controls[1, 19] = "Carregar/Baixar a câmera*";
			controls[0, 20] = "O ou P";								controls[1, 20] = "Aumentar/Diminuir o zoom";
			controls[0, 21] = "WASD*";								controls[1, 21] = "Mover instâncias uma grade*";
			controls[0, 22] = "WASD* + SHIFT";						controls[1, 22] = "Mover instâncias 5 grades*";
			controls[0, 23] = "WASD* + ALT";						controls[1, 23] = "Mover instâncias uma pixel*";
			break;
	}
	
	txt_example = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
	
	rows_per_page = round_down((ideal_height-45)/(string_height(txt_example)+4));
	pages_nmb = round_down(array_length_2d(controls, 0)/rows_per_page);
	
	#endregion
	if(help){
		if(help_page[1] != 0) draw_sprite_ext(spr_decorated_buttons, 5, xda[0]+17, ideal_height/2, -1, 1, 0, -1, 1);
		if(help_page[1] != pages_nmb) draw_sprite_ext(spr_decorated_buttons, 5, xda[0]+ideal_width-17, ideal_height/2, 1, 1, 0, -1, 1);
	
		if(mouse_check_button_released(mb_left)){
			if(device_mouse_y_to_gui(0) > ideal_height/2-40 && device_mouse_y_to_gui(0) < ideal_height/2+40){
				if (device_mouse_x_to_gui(0) > ideal_width-30){
					help_page[1]++;
				} else if (device_mouse_x_to_gui(0) < 30){
					help_page[1]--;
				}
			}
		}
	}
	help_page[1] = clamp(help_page[1], 0, pages_nmb);
	
	txt_size = clamp(ideal_width/string_width(txt_example), 0, 1);
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(xda[0]+ideal_width/2, 45, theme[0]);
	
	draw_set_valign(fa_middle);
	var for_end = clamp(rows_per_page*(help_page[1]+1), 0, array_length_2d(controls, 0));
	var iy = 0;
	for(var i = rows_per_page*help_page[1]; i < for_end; i++){
		var txt_y = 82+((string_height(txt_example)-2)*iy);
		draw_set_halign(fa_left);
		draw_text_transformed(xda[0]+60, txt_y, controls[0, i], txt_size, txt_size, 0);
		draw_set_halign(fa_right);
		draw_text_transformed(xda[0]+ideal_width-60, txt_y, controls[1, i], txt_size, txt_size, 0);
		if(i < for_end-1){
			var line_y = 70+(string_height(txt_example)-2)*(iy+1);
			draw_line_width(xda[0]+60, line_y, xda[0]+ideal_width-60, line_y, txt_size);
		}
		iy++;
	}
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text_transformed(ideal_width-5, ideal_height-5, "*It may vary depending on your configuration.", 0.5, 0.5, 0);
}
#endregion
#region Menú de configuración
if(xda[1] > -ideal_width+15 && xda[1] < ideal_width-15){
	#region Variables
	switch(languaje){
		case "Español":
			var sett_txt_page = ["Casillas", "Rendimiento | página " + string(sett_page[1]+1), "Otros | página " + string(sett_page[2]+1), "Restaurar"];
			var sz_grd_txt = "Tamaño: ";
			break;
		case "Inglés":
			var sett_txt_page = ["Grids", "Performance | page " + string(sett_page[1]+1), "Others | página " + string(sett_page[2]+1), "Restore"];
			var sz_grd_txt = "Size: ";
			break;
		case "Portugués":
			var sett_txt_page = ["Grades", "Desempenho | página " + string(sett_page[1]+1), "Outros | página " + string(sett_page[2]+1), "Restaurar"];
			var sz_grd_txt = "Tamanho: ";
			break;
		default:
			text_change = true;
			languaje = "Inglés";
			break;
	}
	#endregion
	var sett_pages_nmb = array_length_1d(sett_txt_page)-1;
	
	if(settings){
		if(sett_page[0] != 0) draw_sprite_ext(spr_decorated_buttons, 5, xda[1]+17, ideal_height/2, -1, 1, 0, -1, 1);
		if(sett_page[0] != sett_pages_nmb) draw_sprite_ext(spr_decorated_buttons, 5, xda[1]+ideal_width-17, ideal_height/2, 1, 1, 0, -1, 1);

		if(mouse_check_button_released(mb_left)){
			if(device_mouse_y_to_gui(0) > ideal_height/2-40 && device_mouse_y_to_gui(0) < ideal_height/2+40){
				if (device_mouse_x_to_gui(0) > ideal_width-30){
					sett_page[0]++;
				} else if (device_mouse_x_to_gui(0) < 30){
					sett_page[0]--;
				}
			}
		}
	}
	sett_page[0] = clamp(sett_page[0], 0, sett_pages_nmb);
	
	draw_set_color(c_white);
	draw_rectangle(xda[1]+55, 35, xda[1]+ideal_width-55, ideal_height-25, 0);
	draw_rectangle(xda[1]+50, 40, xda[1]+ideal_width-50, ideal_height-30, 0);
	draw_set_color(c_black);
	draw_rectangle(xda[1]+60, 40, xda[1]+ideal_width-60, ideal_height-30, 0);
	draw_rectangle(xda[1]+55, 45, xda[1]+ideal_width-56, ideal_height-35, 0);
	
	draw_set_font(fnt_roboto);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(xda[1]+ideal_width/2, 45, sett_txt_page[sett_page[0]]);
	
	switch(sett_page[0]){
		case 0:
			#region Grids
			var grd_arr = [grd_hcolor, grd_scolor, al_grd, grid_size];
			for(var i = 0; i < array_length_1d(grd_arr); i++){
				
				if(i == 1) var color = make_color_hsv(grd_hcolor, 255, 255);
				else var color = c_white;
				if(i == 3){
					draw_set_color(c_white);
					draw_set_valign(fa_middle);
					draw_text_transformed(xda[1]+ideal_width/2, 75.5+21*i, sz_grd_txt + string(grid_size), 0.5, 0.5, 0);
					draw_set_valign(fa_top);
				}
				
				draw_sprite_ext(spr_editor_color_bar, i, xda[1]+ideal_width/2, 75 + 21*i, 1, 1, 0, color, 1);
				if(i != 0 && i < 3){
					draw_primitive_begin(pr_trianglefan);
					if(i == 2) draw_set_color(make_color_hsv(grd_hcolor, grd_scolor, 255));
					draw_set_alpha(1 - (i == 2));
					draw_vertex(xda[1]+ideal_width/2 - 70, 69 + 21*i);
					draw_set_alpha(i == 2);
					draw_vertex(xda[1]+ideal_width/2 + 70, 69 + 21*i);
					draw_vertex(xda[1]+ideal_width/2 + 70, 81 + 21*i);
					draw_set_alpha(1 - (i == 2));
					draw_vertex(xda[1]+ideal_width/2 - 70, 81 + 21*i);
					draw_primitive_end();
				}
				draw_set_alpha(1);
				if(i < 3){
					var prev_val = (grd_arr[i]*140/(1 + 254*(i != 2)));
				} else {
					var prev_val = ((grd_arr[i]-8)*140/(max_grd_sz-8));
				}
				draw_sprite(spr_hsv_rgb_color, 2, xda[1]+ideal_width/2 - 70+prev_val, 62+21*i);
				if(point_in_rectangle_to_gui(mx, my, ideal_width/2 - 70, 68 + 21*i, ideal_width/2 + 70, 80 + 21*i) && settings && mouse_check_button_pressed(mb_left)){
					var using = false;
					for(var ass = 0; ass < array_length_1d(grd_arr); ass++){
						if(slide_active[ass]){
							using = true;
						}
					}
					if(!using){
						slide_active[i] = 1;
					}
				}
				if(slide_active[i]){
					//grd_arr[i]*140/(1 + 254*(i != 2))
					var value_zero = ideal_width/2-70, wanted_value = 1 + 254*(i != 2);
					if(i < 3){
						var new_value = clamp(((mx-value_zero)*wanted_value)/140, 0, wanted_value);
					} else {
						var new_value = clamp(round(((mx-value_zero)*(max_grd_sz-8))/140) + 8, 8, max_grd_sz);
					}
					switch(i){
						case 0: grd_hcolor = new_value; break;
						case 1: grd_scolor = new_value; break;
						case 2: al_grd = new_value; break;
						case 3: grid_size = new_value; break;
					}
					if(mouse_check_button_released(mb_left)) {
						slide_active[i] = false;
						ini_open("User_data.pmx");
						switch(i){
							case 0: ini_write_real("editor_settings", "grd_hcolor", grd_hcolor); break;
							case 1: ini_write_real("editor_settings", "grd_scolor", grd_scolor); break;
							case 2: ini_write_real("editor_settings", "al_grd", al_grd); break;
							case 3: ini_write_real("editor_settings", "grid_size", grid_size); break;
						}
						ini_close();
					}
				}
			}
			i -= 0.5;
			draw_set_color(c_white);
			draw_text(xda[1]+ideal_width/2, 75+21*i, text[111]);
			i++;
			draw_set_color(make_color_hsv(grd_hcolor, grd_scolor, 255));
			draw_set_alpha(al_grd);
			draw_rectangle_border(xda[1]+ideal_width/2-grid_size/2, 75 + 21*i, xda[1]+ideal_width/2+grid_size/2,  75 + 21*i + grid_size, 1);
			draw_set_alpha(1);
			#endregion
			break;
		case 1:
			#region Rendimiento
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			sett_page[1] = clamp(sett_page[1], 0, 1);
			switch(sett_page[1]){
				case 0:
					#region Página 1
					var btn_txt = [text[101], text[102]],
					btn_val = [ldm, draw_test_path];
			
					for(var i = 0; i < array_length_1d(btn_txt); i++){
						if(point_in_rectangle(mx, my, 62, 62+22*i, 78, 78+22*i)){
							if(mouse_check_button(mb_left)) btn_sz[i] = lerp(btn_sz[i], 1.2, 0.4);
							else btn_sz[i] = lerp(btn_sz[i], 1, 0.4);
				
							if(mouse_check_button_released(mb_left)){
								switch(i){
									case 0: ldm = !ldm; break;
									case 1: draw_test_path = !draw_test_path; break;
								}
						
								var btn_val = [ldm, draw_test_path],
								btn_inikey = ["ldm", "draw_test_path"];
						
								ini_open("User_data.pmx");
								ini_write_real("editor_settings", btn_inikey[i], btn_val[i]);
								ini_close();
							}
						} else btn_sz[i] = lerp(btn_sz[i], 1, 0.4);
						draw_sprite_ext(spr_button_tf, btn_val[i], xda[1]+70, 70+22*i, btn_sz[i], btn_sz[i], 0, -1, 1);
						draw_text(xda[1]+81, 72+22*i, btn_txt[i]);
					}
					#endregion
					break;
				case 1:
					#region Página 2
					var sliders_txt = [text[103], text[104], text[105]],
					sliders_max_val = [500, 10, 1],
					sliders_min_val = [25, 1, 0.25],
					sliders_val = [test_nmb, (sliders_max_val[1]+1)-path_quality, editor_quality],
					sliders_val_txt = [string(sliders_val[0]) + text[106],
									string((sliders_val[1]*100)/sliders_max_val[1]) + text[107],
									string(sliders_val[2]*100) + text[107]],
					offset_y = 45;
			
					for(var i = 0; i < array_length_1d(sliders_txt); i++){
						draw_text_transformed(xda[1]+60, 73+offset_y*i, sliders_txt[i], 0.8, 0.8, 0);
						draw_sprite(spr_slider_1, 0, xda[1]+120, 93+offset_y*i);
						if(point_in_rectangle(mx, my, 75, 85+offset_y*i, 165, 101+offset_y*i) && mouse_check_button_pressed(mb_left)){
							var using = false;
							for(var ass = 0; ass < array_length_1d(sliders_txt); ass++){
								if(slide_active[ass]){
									using = true;
								}
							}
							if(!using){
								slide_active[i] = 1; 
							}
						}
						if(slide_active[i]){
							switch(i){
								case 0: test_nmb = round(clamp(((mx-80)*sliders_max_val[i])/80, sliders_min_val[i], sliders_max_val[i])); break;
								case 1: path_quality = round(clamp(abs(((mx-160)*sliders_max_val[i])/80), sliders_min_val[i], sliders_max_val[i])); break;
								case 2: editor_quality = clamp(((mx-80)*0.75)/80, 0, 0.75); editor_quality += 0.25 break;
							}
							if(mouse_check_button_released(mb_left)) {
								ini_open("User_data.pmx");
								switch(i){
									case 0: ini_write_real("editor_settings", "test_nmb", test_nmb); break;
									case 1: ini_write_real("editor_settings", "path_quality", path_quality); break;
									case 2:
										ini_write_real("editor_settings", "editor_quality", editor_quality);
										obj_display_controller.actual_width = -1;
										obj_display_controller.actual_height = -1;
										break;
								}
								ini_close();
								slide_active[i] = 0;
							}
						}
						draw_sprite(spr_slider_1, 1, xda[1]+80 + ((sliders_val[i]-sliders_min_val[i])*80)/(sliders_max_val[i]-sliders_min_val[i]), 93+offset_y*i);
						draw_text(xda[1]+172, 95+offset_y*i, sliders_val_txt[i]);
					}
					#endregion
					break;
			}
			
			if(point_in_rectangle(mx, my, 64, 44, 76, 56)){
				if(mouse_check_button_released(mb_left)){
					sett_page[1]--;
				}
			} else if(point_in_rectangle(mx, my, ideal_width-76, 44, ideal_width-64, 56)){
				if(mouse_check_button_released(mb_left)){
					sett_page[1]++;
				}
			}
			draw_sprite_ext(spr_arrow_s, 0, xda[1]+70, 50, 1, 1, 0, -1, 0.3 + 0.7*(sett_page[1] != 0));
			draw_sprite_ext(spr_arrow_s, 0, xda[1]+ideal_width-70, 50, -1, 1, 0, -1, 0.3 + 0.7*(sett_page[1] != 1));
			#endregion
			break;
		case 2:
			#region Otros
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			sett_page[2] = clamp(sett_page[2], 0, 1);
			
			switch(sett_page[2]){
				case 0:
					#region Página 1
					var btn_txt = [text[108], text[109], text[110]],
					btn_val = [scroll_zm, move_wasd, prev_obj];
			
					for(var i = 0; i < array_length_1d(btn_txt); i++){
						if(point_in_rectangle(mx, my, 62, 62+22*i, 78, 78+22*i)){
							if(mouse_check_button(mb_left)) btn_sz[i] = lerp(btn_sz[i], 1.2, 0.4);
							else btn_sz[i] = lerp(btn_sz[i], 1, 0.4);
		
							if(mouse_check_button_released(mb_left)){
								switch(i){
									case 0: scroll_zm = !scroll_zm; break;
									case 1: move_wasd = !move_wasd; break;
									case 2: prev_obj = !prev_obj; break;
								}
				
								var btn_val = [scroll_zm, move_wasd, prev_obj],
								btn_inikey = ["scroll_zm", "move_wasd", "prev_obj"];
				
								ini_open("User_data.pmx");
								ini_write_real("editor_settings", btn_inikey[i], btn_val[i]);
								ini_close();
							}
						} else btn_sz[i] = lerp(btn_sz[i], 1, 0.4);
						draw_sprite_ext(spr_button_tf, btn_val[i], xda[1]+70, 70+22*i, btn_sz[i], btn_sz[i], 0, -1, 1);
						draw_text(xda[1]+81, 72+22*i, btn_txt[i]);
					}
					#endregion
					break;
				case 1:
					#region Página 2
					var sliders_txt = ["Decimals number"],
					sliders_max_val = [5],
					sliders_min_val = [0],
					sliders_val = [decimal_nmb],
					sliders_val_txt = [string(sliders_val[0] + 1) + " decimals"],
					offset_y = 45;
			
					for(var i = 0; i < array_length_1d(sliders_txt); i++){
						draw_text_transformed(xda[1]+60, 73+offset_y*i, sliders_txt[i], 0.8, 0.8, 0);
						draw_sprite(spr_slider_1, 0, xda[1]+120, 93+offset_y*i);
						if(point_in_rectangle(mx, my, 75, 85+offset_y*i, 165, 101+offset_y*i) && mouse_check_button_pressed(mb_left)){
							var using = false;
							for(var ass = 0; ass < array_length_1d(sliders_txt); ass++){
								if(slide_active[ass]){
									using = true;
								}
							}
							if(!using){
								slide_active[i] = 1; 
							}
						}
						if(slide_active[i]){
							switch(i){
								case 0: decimal_nmb = round(clamp(((mx-80)*sliders_max_val[i])/80, sliders_min_val[i], sliders_max_val[i])); break;
							}
							if(mouse_check_button_released(mb_left)) {
								ini_open("User_data.pmx");
								switch(i){
									case 0: ini_write_real("editor_settings", "decimal_nmb", decimal_nmb); break;
								}
								ini_close();
								slide_active[i] = 0;
							}
						}
						draw_sprite(spr_slider_1, 1, xda[1]+80 + ((sliders_val[i]-sliders_min_val[i])*80)/(sliders_max_val[i]-sliders_min_val[i]), 93+offset_y*i);
						draw_text(xda[1]+172, 95+offset_y*i, sliders_val_txt[i]);
					}
					#endregion
					break;
			}
			
			if(point_in_rectangle(mx, my, 64, 44, 76, 56)){
				if(mouse_check_button_released(mb_left)){
					sett_page[2]--;
				}
			} else if(point_in_rectangle(mx, my, ideal_width-76, 44, ideal_width-64, 56)){
				if(mouse_check_button_released(mb_left)){
					sett_page[2]++;
				}
			}
			draw_sprite_ext(spr_arrow_s, 0, xda[1]+70, 50, 1, 1, 0, -1, 0.3 + 0.7*(sett_page[2] != 0));
			draw_sprite_ext(spr_arrow_s, 0, xda[1]+ideal_width-70, 50, -1, 1, 0, -1, 0.3 + 0.7*(sett_page[2] != 1));
			#endregion
			break;
		case 3:
			#region Restaurar
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			var btn_h = 25, options = ["Reset grids", "Reset optimization", "Reset other config", "Reset all editor config"];
			
			for(var i = 0; i < array_length_1d(options); i++){
				if(point_in_rectangle(mx, my, 70, 70 + (btn_h+5)*i, 80+string_width(options[i]), (70+btn_h) + (btn_h+5)*i)){
					if(mouse_check_button(mb_left)) draw_set_color(c_gray);
					else draw_set_color(c_dkgray);
					
					if(mouse_check_button_released(mb_left)){
						ini_open("User_data.pmx");
						var sel = [0, 0, 0];
						if(i == 3){
							sel = [1, 1, 1];
						} else {
							sel[i] = 1;
						}
						if(sel[0]){
							grid_size = 16;
							grd_hcolor = 0;
							grd_scolor = 0;
							al_grd = 0.5;
							
							ini_write_real("editor_settings", "grid_size", grid_size);
							ini_write_real("editor_settings", "grd_hcolor", grd_hcolor);
							ini_write_real("editor_settings", "grd_scolor", grd_scolor);
							ini_write_real("editor_settings", "al_grd", al_grd);
						}
						if(sel[1]){
							ldm = 0;
							draw_test_path = 1;
							test_nmb = 500;
							path_quality = 1;
							if(os_type == os_android || os_type == os_ios){
								var mult = 0.75;
							} else {
								var mult = 1;
							}
							editor_quality = mult;
							
							ini_write_real("editor_settings", "ldm", ldm);
							ini_write_real("editor_settings", "draw_test_path", draw_test_path);
							ini_write_real("editor_settings", "test_nmb", test_nmb);
							ini_write_real("editor_settings", "path_quality", path_quality);
							ini_write_real("editor_settings", "editor_quality", editor_quality);
							obj_display_controller.actual_width = -1;
							obj_display_controller.actual_height = -1;
						}
						if(sel[2]){
							scroll_zm = 0;
							move_wasd = 0;
							prev_obj = 1;
							decimal_nmb = 1;
							
							ini_write_real("editor_settings", "scroll_zm", scroll_zm);
							ini_write_real("editor_settings", "move_wasd", move_wasd);
							ini_write_real("editor_settings", "prev_obj", prev_obj);
							ini_write_real("editor_settings", "decimal_nmb", decimal_nmb);
						}
						ini_close();
					}
				} else {
					draw_set_color(c_black);
				}
				
				draw_rectangle(xda[1]+70, 70 + (btn_h+5)*i, xda[1]+80+string_width(options[i]), (70+btn_h) + (btn_h+5)*i, 0);
				draw_set_color(c_white);
				draw_rectangle_border(xda[1]+70, 70 + (btn_h+5)*i, xda[1]+80+string_width(options[i]), (70+btn_h) + (btn_h+5)*i, 1);
				draw_text_transformed(xda[1]+75, (72+btn_h/2) + (btn_h+5)*i, options[i], 1, 1, 0);
			}
			#endregion
			break;
	}
	
	draw_set_color(c_white);
}

#endregion
#region Mensajes del editor
if(tt != ""){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_roboto);
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(ideal_width/2-(string_width(tt)/2)-2, ideal_height/2-10, ideal_width/2+(string_width(tt)/2)+2, ideal_height/2+8, 0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(ideal_width/2, ideal_height/2, tt);
}
#endregion
#region Transiciones
if (move_to_room){
    time += -1;
    if (time < room_speed*0.7){
        xp1 = lerp(xp1, ideal_width+5, 0.2);
        xp2 = lerp(xp2, -6, 0.2);
    }
} else {
    xp1 = lerp(xp1, -1, 0.2);
    xp2 = lerp(xp2, ideal_width, 0.2);
}
draw_set_colour(c_white);
draw_rectangle(-1, 0, xp1, ideal_height/2, 0);
draw_rectangle(ideal_width, ideal_height/2, xp2, ideal_height, 0);
#endregion
#region Controlar variables generales
cvg2 = point_in_rectangle_to_gui(mx, my, select_x, 50, select_x + 140, ymaxsel+5)
	|| point_in_rectangle_to_gui(mx, my, select_x + 140, 70, select_x + 185, 101)
	|| point_in_rectangle_to_gui(mx, my, ideal_width-(btn_x+16)*mult_menu-3, 0, ideal_width, 40*mult_menu)
	|| point_in_rectangle_to_gui(mx, my, 0, ideal_height-20, 85, ideal_height);

if(!init_editor){
	draw_set_alpha(init_al/0.7);
	draw_set_font(fnt_roboto);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	var y_effect = 10 - (init_al/0.7)*10;
	draw_text_transformed(ideal_width - help_line_pos_x - 15, 75*mult_menu + y_effect, string_hash_to_newline("If you have any question about#the editor, you can press#this button to open the menu help!"), 0.5, 0.5, 0);
	draw_sprite_ext(spr_buttons_editor, 0, ideal_width - help_line_pos_x, 21*mult_menu, mult_menu*interface_bscale[2], mult_menu*interface_bscale[2], 0, -1, init_al/0.7);
	draw_sprite(spr_editor_help, 0, ideal_width - help_line_pos_x + 10, 45 + y_effect);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(ideal_width/2, ideal_height - 30 + y_effect, "Press any key to continue...");
	if(keyboard_check_released(vk_anykey)){
		init_effect = true;
		ini_open("User_data.pmx");
		ini_write_real("editor_settings", "init", 1);
		ini_close();
	}
}

if(settings || help){
	scr_button_back(1);
}
#endregion
scr_cursor_sprite(2, cur_sit);
draw_set_colour(-1);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
