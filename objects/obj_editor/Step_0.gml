/// @description Procesador
time_to_wait++;
time_to_wait = clamp(time_to_wait, 0, 2);
cvg1 = pause_editor || settings || help || test || saving || !init_effect || !loaded;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
#region Movimiento de la cámara
if(!move_wasd && !keyboard_check(vk_control)){
	vve = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));
	vhe = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
	ves = keyboard_check(vk_shift)*5;
} else {
	vve = keyboard_check(vk_down) - keyboard_check(vk_up);
	vhe = keyboard_check(vk_right) - keyboard_check(vk_left);
	ves = keyboard_check(vk_shift)*5;
}
var wh_con = (mx < 140 && my > 50 && my < ymaxsel + 5 && selector);

if(!wh_con){
	if(!scroll_zm){
		wheel = mouse_wheel_down() - mouse_wheel_up();
	} else {
		y += (mouse_wheel_down() - mouse_wheel_up())*10*zoom;
	}
} else {
	wheel = 0;
}


if(can_create){
	if(ves != 0){
		hspeed += sin(degtorad(((vhe*ves)*zoom) - hspeed))*10;
		vspeed += sin(degtorad(((vve*ves)*zoom) - vspeed))*10;
	} else {
		hspeed += sin(degtorad(((vhe*vemax)*zoom) - hspeed))*10;
		vspeed += sin(degtorad(((vve*vemax)*zoom) - vspeed))*10;
	}
	if(hspeed < 0.01 && hspeed > -0.01){
		hspeed = 0;
	}
	if(vspeed < 0.01 && vspeed > -0.01){
		vspeed = 0;
	}
} else {
	hspeed = 0;
	vspeed = 0;
}
if(!scroll_zm){
	zm += sign(wheel)*0.08;
}
zm += (keyboard_check(ord("P")) - keyboard_check(ord("O")))*0.03;
zoom += sin(degtorad(zm - zoom))*10;
zoom = clamp(zoom, 0.5, 2.5);
zm = clamp(zm, 0.5, 2.5);
if(view_visible[1]) view_visible[1] = false;
camera_set_view_size(view_camera[0], ideal_width*zoom, ideal_height*zoom);

x = clamp(x, -999900, 999900);
y = clamp(y, -999900, 999900);
#endregion
#region Pocisionar la cámara al objeto
if(os_type == os_windows || os_type == os_macosx || os_type == os_linux){
	if((mouse_check_button_pressed(mb_middle) || (keyboard_check(vk_space) && mouse_check_button_pressed(mb_left))) && can_create){
		PX = mouseX;
		PY = mouseY;
	} if((mouse_check_button(mb_middle) || (keyboard_check(vk_space) && mouse_check_button(mb_left))) && can_create){
		var mx = mouseX-PX;
		var my = mouseY-PY;
	
		time_to_wait = 0;
		var vx = camera_get_view_x(view_camera[0]);
		var vy = camera_get_view_y(view_camera[0]);
		x_camera = vx-mx;
		y_camera = vy-my;
		x = x_camera+(camera_get_view_width(view_camera[0])/2);
		y = y_camera+(camera_get_view_height(view_camera[0])/2);
	} else {
		x_camera = x-(ideal_width/2)*zoom;
		y_camera = y-(ideal_height/2)*zoom;
	}
} else if(os_type == os_android || os_type == os_ios){
	if(device_mouse_check_button_pressed(0, mb_left) && can_create && can_drg_camera){
		PX = mouseX;
		PY = mouseY;
	} 
	if(point_distance(PX, PY, mouseX, mouseY) > 10*zoom && can_create && PX != -999999 && PY != -999999 && drag_camera == false && can_drg_camera){
		drag_camera = true;
		PX = mouseX;
		PY = mouseY;
	} else if(device_mouse_check_button_released(0, mb_left)){
		drag_camera = false;
		PX = -999999;
		PY = -999999;
	}
	if(drag_camera){
		var mx = mouseX-PX;
		var my = mouseY-PY;
		
		time_to_wait = 0;
		var vx = camera_get_view_x(view_camera[0]);
		var vy = camera_get_view_y(view_camera[0]);
		x_camera = vx-mx;
		y_camera = vy-my;
		x = x_camera+(camera_get_view_width(view_camera[0])/2);
		y = y_camera+(camera_get_view_height(view_camera[0])/2);
	} else {
		x_camera = x-(ideal_width/2)*zoom;
		y_camera = y-(ideal_height/2)*zoom;
	}
}
camera_set_view_pos(view_camera[0], x_camera, y_camera);
#endregion
#region Controles y variables del editor
var place_obj, is_obj, grd_mx, grd_my, place_mult_obj, dnt_dlt, inst_slct, slct_obj, inst_grab;
snap = !keyboard_check(vk_control);
grd_mx = round(mouseX/grid_size)
grd_my = round(mouseY/grid_size)
place_obj = mouse_check_button_released(mb_left);
slct_obj = mouse_check_button_pressed(mb_left);
place_mult_obj = mouse_check_button(mb_left) && keyboard_check(vk_shift);
is_obj[0] = collision_point(mouseX, mouseY, obj_create_obj_editor, 0, 1);
if(snap){
	var new_x = round(mouseX/grid_size)*grid_size;
	var new_y = round(mouseY/grid_size)*grid_size;
} else {
	var new_x = round(mouseX);
	var new_y = round(mouseY);
}
if(is_obj[0] != noone){
	is_obj[1] = grd_mx == round(is_obj[0].x/grid_size) && grd_my == round(is_obj[0].y/grid_size) && is_obj[0].type == type;
} else {
	is_obj[1] = false;
}
is_obj[2] = collision_point(grd_mx*grid_size, grd_my*grid_size, obj_create_obj_editor, 0, 1);
if(is_obj[2] != noone){
	is_obj[3] = grd_mx == round(is_obj[2].x/grid_size) && grd_my == round(is_obj[2].y/grid_size) && is_obj[2].type == type;
} else {
	is_obj[3] = false;
}
#endregion
#region Buscar objetos
player_nmb = 0;
end_nmb = 0;
dnt_dlt[0] = -1;
inst_slct = 0;
inst_grab = 0;
open_menu = false;
player_2 = [x, y, false];
for(var i = 0; i < instance_number(obj_create_obj_editor); i++){
	dnt_dlt[i] = -1;
	var obj_searched = instance_find(obj_create_obj_editor, i);
	if(obj_searched.type == 1) {
		player_nmb++;
		dnt_dlt[i] = obj_searched.id;
		if(obj_searched.is_scnd_player == true) player_2 = [obj_searched.x, obj_searched.y, true];
	}
	if(obj_searched.type == 12) {end_nmb++; dnt_dlt[i] = obj_searched.id;}
	if(obj_searched.type == -1) {dnt_dlt[i] = obj_searched.id;}
	if(obj_searched.select == true || obj_searched.mult_select == true) {inst_slct++; dnt_dlt[i] = obj_searched.id;}
	if(obj_searched.menu == true) {open_menu = true; dnt_dlt[i] = obj_searched.id;}
	if(obj_searched.grab == true) {inst_grab++;}
}
if(player_nmb < 2){
	player_2 = [x, y, -1, false];
}
prev_instance = -1;
can_preview = (is_obj[0] == noone && !multiselect && !multidelete && can_place && !open_menu);
multiple_instances = false;
if(inst_slct > 1) {
	multiple_instances = true;
} else if(inst_slct == 1) {
	for(var i = 0; i < array_length_1d(dnt_dlt); i++){
		if(dnt_dlt[i] != -1){
			if(dnt_dlt[i].type != -1 && dnt_dlt[i].type != 1 && dnt_dlt[i].type != 12){
				prev_instance = dnt_dlt[i].id;
			}
		}
	}
}
#endregion
#region Procesador del editor
if(can_create && can_place && !open_menu){
	if((type == 1 && player_nmb < 2) || (type == 12 && end_nmb < 1) || (type != 1 && type != 12) && time_to_wait == 2){
		#region Colocar objetos
		
		if(place_mult_obj && is_obj[0] == noone && !is_obj[1] && !is_obj[3]){
			
			var new_obj = instance_create_depth(new_x, new_y, dp[type], obj_create_obj_editor);
			new_obj.type = type;
			if(type == 8) new_obj.time = 0.7;
			else if(type == 9) new_obj.time = 2;
			#region Datos de la instancia seleccionada
			if(inst_slct == 1){
				for(var i = 0; i < array_length_1d(dnt_dlt); i++){
					if(dnt_dlt[i] != -1){
						if(dnt_dlt[i].type != -1 && dnt_dlt[i].type != 1 && dnt_dlt[i].type != 12 && dnt_dlt[i].type == type){
							new_obj.image_xscale = dnt_dlt[i].image_xscale;
							new_obj.image_yscale = dnt_dlt[i].image_yscale;
							new_obj.image_angle = dnt_dlt[i].image_angle;
							new_obj.depth = dnt_dlt[i].depth;
							new_obj._depth = dnt_dlt[i]._depth;
							new_obj.ID = dnt_dlt[i].ID;
							new_obj.spawn_saw = dnt_dlt[i].spawn_saw;
							new_obj.time = dnt_dlt[i].time;
							new_obj.start_time = dnt_dlt[i].start_time;
							new_obj.tp = dnt_dlt[i].tp;
							new_obj.symbol = dnt_dlt[i].symbol;
							new_obj.gr = dnt_dlt[i].gr;
							new_obj.obj_speed = dnt_dlt[i].obj_speed;
						}
					}
				}
			}
			#endregion
			if(instance_exists(obj_create_obj_editor)){
				obj_create_obj_editor.select = false;
			}
			if(player_nmb == 1){
				new_obj.is_scnd_player = true;
			}
			new_obj.select = true;
		} else if(place_obj && is_obj[0] == noone && !is_obj[1] && !is_obj[3]){
			var new_obj = instance_create_depth(new_x, new_y, dp[type], obj_create_obj_editor);
			new_obj.type = type;
			if(type == 8) new_obj.time = 0.7;
			else if(type == 9) new_obj.time = 2;
			#region Datos de la instancia seleccionada
			if(inst_slct == 1){
				for(var i = 0; i < array_length_1d(dnt_dlt); i++){
					if(dnt_dlt[i] != -1){
						if(dnt_dlt[i].type != -1 && dnt_dlt[i].type != 1 && dnt_dlt[i].type != 12 && dnt_dlt[i].type == type){
							new_obj.image_xscale = dnt_dlt[i].image_xscale;
							new_obj.image_yscale = dnt_dlt[i].image_yscale;
							new_obj.image_angle = dnt_dlt[i].image_angle;
							new_obj.depth = dnt_dlt[i].depth;
							new_obj._depth = dnt_dlt[i]._depth;
							new_obj.ID = dnt_dlt[i].ID;
							new_obj.spawn_saw = dnt_dlt[i].spawn_saw;
							new_obj.time = dnt_dlt[i].time;
							new_obj.start_time = dnt_dlt[i].start_time;
							new_obj.tp = dnt_dlt[i].tp;
							new_obj.symbol = dnt_dlt[i].symbol;
							new_obj.gr = dnt_dlt[i].gr;
							new_obj.obj_speed = dnt_dlt[i].obj_speed;
						}
					}
				}
			}
			#endregion
			if(instance_exists(obj_create_obj_editor)){
				obj_create_obj_editor.select = false;
			}
			if(player_nmb == 1){
				new_obj.is_scnd_player = true;
			}
			new_obj.select = true;
		}
		#endregion
	}
	#region Seleccionar objetos
	if(slct_obj && is_obj[0] != noone && time_to_wait == 2 && !multiple_instances){
		obj_create_obj_editor.select = false;
		is_obj[0].select = true;
	}
	#endregion
	#region Multi-eliminar
	if(keyboard_check(vk_alt) && mouse_check_button(mb_right)){
		if(is_obj[0] != -1){
			instance_destroy(is_obj[0]);
		}
		multidelete = true;
	} else {
		multidelete = false;
	}
	#endregion
	#region Duplicar objetos
	if(keyboard_check(vk_control) && keyboard_check_pressed(ord("D")) && inst_slct > 0){
		for(var i = 0; i < array_length_1d(dnt_dlt); i++){
			if(dnt_dlt[i] != -1){
				if(dnt_dlt[i].type != -1 && dnt_dlt[i].type != 1 && dnt_dlt[i].type != 12){
					var dup_inst = instance_create(dnt_dlt[i].x, dnt_dlt[i].y, obj_create_obj_editor);
					dup_inst.duplicated = true;
					dup_inst.select = true;
					dup_inst.type = dnt_dlt[i].type;
					dup_inst.image_xscale = dnt_dlt[i].image_xscale;
					dup_inst.image_yscale = dnt_dlt[i].image_yscale;
					dup_inst.image_angle = dnt_dlt[i].image_angle;
					dup_inst.depth = dnt_dlt[i].depth-1;
					dup_inst._depth = dnt_dlt[i]._depth-1;
					dup_inst.ID = dnt_dlt[i].ID;
					dup_inst.spawn_saw = dnt_dlt[i].spawn_saw;
					dup_inst.time = dnt_dlt[i].time;
					dup_inst.start_time = dnt_dlt[i].start_time;
					dup_inst.tp = dnt_dlt[i].tp;
					dup_inst.symbol = dnt_dlt[i].symbol;
					dup_inst.gr = dnt_dlt[i].gr;
					dup_inst.obj_speed = dnt_dlt[i].obj_speed;
				}
				dnt_dlt[i].select = false;
			}
		}
	}
	#endregion
	#region	Guardar nivel
	if(keyboard_check(vk_control) && keyboard_check_pressed(ord("S"))){
		if(player_nmb != 0 && end_nmb != 0){
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
			saving = true;
		} else {
			timer[3] = 2;
		}
	}
	#endregion
}
if(keyboard_check_pressed(vk_tab)){
	switch(show_mask){
		case 1: show_mask = 0; break;
		case 0: show_mask = 1; break;
	}
}
#region Multiselección
if(keyboard_check(vk_alt) && mouse_check_button(mb_left) && !cvg1 && !open_menu){
	if(mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_alt)){
		xs = mouseX;
		ys = mouseY;
	}
	xs1 = mouseX;
	ys1 = mouseY;
	if(instance_exists(obj_create_obj_editor)){
		obj_create_obj_editor.mult_select = false;
	}
	var ds_list = ds_list_create();
	var nmb_obj = collision_rectangle_list(xs, ys, xs1, ys1, obj_create_obj_editor, 0, 1, ds_list, 0);
	for(var i = 0; i < nmb_obj; ++i){
		ds_list[| i].mult_select = true;
	}
	ds_list_destroy(ds_list);
	multiselect = true;
	time_to_wait = 0;
} else if(mouse_check_button_released(mb_left) || keyboard_check_released(vk_alt)){
	multiselect = false;
}

if(multiselect){
	al = lerp(al, 1, 0.5);
} else {
	al = lerp(al, 0, 0.2);
}
#endregion
#endregion
#region Optimización del editor
if(start_opt){
	instance_deactivate_all(1);
	instance_activate_object(obj_editor);
	instance_activate_object(obj_display_controller);
	instance_activate_object(obj_sound_controller);
	instance_activate_object(obj_text_controller);
	instance_activate_object(obj_temp_vars);
	for(var i = 0; i < array_length_1d(dnt_dlt); i++){
		if(dnt_dlt[i] != -1) instance_activate_object(dnt_dlt[i]);
	}
	if(multiselect){
		if xs1-xs < 0 xpos = xs1; else xpos = xs;
		if ys1-ys < 0 ypos = ys1; else ypos = ys;
		instance_activate_region(xpos, ypos, abs(xs1-xs), abs(ys1-ys), 1);
	}
	var ox1 = camera_get_view_x(view_camera[0]);
	var oy1 = camera_get_view_y(view_camera[0]);
	var ox2 = camera_get_view_width(view_camera[0]);
	var oy2 = camera_get_view_height(view_camera[0]);
	instance_activate_region(ox1, oy1, ox2, oy2, true);
} else {
	instance_activate_all();
}
#endregion
#region Cursores
if(!pause_editor && !open_menu && !help && !settings){
	if(!test && !saving && loaded){
		if(is_obj[0] != noone && time_to_wait == 2 && !multiple_instances){
			cur_sit = 1;
		} else if(inst_grab > 0){
			cur_sit = 2;
		} else if(inst_slct == 1) {
			for(var i = 0; i < array_length_1d(dnt_dlt); i++){
				if(dnt_dlt[i] != -1){
					if(dnt_dlt[i].type != -1 && dnt_dlt[i].type != 1 && dnt_dlt[i].type != 12 && dnt_dlt[i].type == type){
						var st = dnt_dlt[i].st;
						if(st != -1){
							if(st > 1){
								st--;
							}
							cur_sit = 3 + (st % 2);
						} else {
							cur_sit = 0;
						}
					}
				}
			}
		} else {
			cur_sit = 0;
		}
	} else {
		cur_sit = 5;
	}
} else {
	cur_sit = -1;
}
#endregion
#region Menús Configuración/Ayuda
if(help){
	desp[0] = xdest[0]-xda[0];
	sp[0] += (0.05 * desp[0]) - (0.19 * sp[0]);
	xda[0] += sp[0];
	if(keyboard_check_pressed(vk_escape)){
		help = false;
		randomize();
		xdest[0] = choose(-ideal_width, ideal_width);
		sp[0] = 0;
		desp[0] = 0;
	}
} else {
	var next_dest_1 = ideal_width - (ideal_width*2)*(xdest[0] < 0);
	xda[0] = lerp(xda[0], next_dest_1, 0.3);
}

if(settings){
	desp[1] = xdest[1]-xda[1];
	sp[1] += (0.05 * desp[1]) - (0.19 * sp[1]);
	xda[1] += sp[1];
	if(keyboard_check_pressed(vk_escape)){
		settings = false;
		randomize();
		xdest[1] = choose(-ideal_width, ideal_width);
		sp[1] = 0;
		desp[1] = 0;
	}
} else {
	var next_dest_2 = ideal_width - (ideal_width*2)*(xdest[1] < 0);
	xda[1] = lerp(xda[1], next_dest_2, 0.3);
}
#endregion
#region Controlar variables generales
can_place = true;
can_create = true;
if(cvg1){
	can_place = false;
	can_create = false;
	gui_al = lerp(gui_al, 0.7, 0.1);
	selector = false;
} else if(cvg2){
	can_place = false;
}

if(!init_effect){
	init_al = lerp(init_al, 0.7, 0.1);
} else {
	if init_al < 0.1 init_editor = true;
	init_al = lerp(init_al, 0, 0.1);
}

if(!cvg1){
	gui_al = lerp(gui_al, 0, 0.1);
}
if(test){
	start_opt = false;
}
#endregion
x = clamp(x, -room_max, room_max);
y = clamp(y, -room_max, room_max);
#region Selector
ymaxsel = ideal_height-30;
over_something = false;
#region Abrir/Cerrar
if(selector){
	if (point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), select_x + 140, 70, 185, 101)){
		select_x = lerp(select_x, -5, 0.3);
		if(mouse_check_button_released(mb_left)) && time_to_wait == 2 selector = false;
		
		switch(languaje){
			case "Español":
				data_txt = "Cerrar editor";
				break;
			case "Inglés":
				data_txt = "Close selector";
				break;
			case "Portugués":
				data_txt = "Fechar editor";
				break;
		}
		over_something = true;
		data_act = true;
	} else {
		select_x = lerp(select_x, 0, 0.3);
		if(!over_something){
			data_act = false;
		}
	}
} else {
	if (point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), -1, 70, 45, 101) && !cvg1){
		select_x = lerp(select_x, -136, 0.3);
		if(mouse_check_button_released(mb_left)) && time_to_wait == 2 selector = true;
		
		switch(languaje){
			case "Español":
				data_txt = "Objetos";
				break;
			case "Inglés":
				data_txt = "Objects";
				break;
			case "Portugués":
				data_txt = "Objetos";
				break;
		}
		over_something = true;
		data_act = true;
	} else {
		select_x = lerp(select_x, -141, 0.3);
		if(!over_something){
			data_act = false;
		}
	}
}
#endregion
t = editor_quality*3;
if(select_x > -120){
	if (!surface_exists(surf_buttons)) {
	  surf_buttons = surface_create(140*t, ymaxsel*t);
	} else {
		surface_resize(surf_buttons, 140*t, (ymaxsel-55)*t);
	}
	surface_set_target(surf_buttons);
	draw_clear_alpha(c_black, 0);

	for(var i = 0; i < array_length_1d(obj_sprites); i++){
		var sel_x_btn = (20+36*i-108*(i/3 - frac(i/3)));
		var sel_y_btn = (select_y + 20+36*(i/3 - frac(i/3)));
		var scale_spr = clamp(20/max(sprite_get_width(obj_sprites[i]), sprite_get_height(obj_sprites[i])), 0, 1);
		var spr_x_middle = (sprite_get_xoffset(obj_sprites[i])*scale_spr)-((sprite_get_width(obj_sprites[i])*scale_spr)/2);
		var spr_y_middle = (sprite_get_yoffset(obj_sprites[i])*scale_spr)-((sprite_get_height(obj_sprites[i])*scale_spr)/2);
	
		if(sel_y_btn > -35 && sel_y_btn < ymaxsel-1){
			if(point_in_rectangle_to_gui(mx, my, sel_x_btn-16, clamp(56+sel_y_btn-16, 56, ymaxsel), sel_x_btn+16, clamp(56+sel_y_btn+16, 56, ymaxsel)) && selector){
				btn_sel_col[i] = make_color_rgb(255, 251, 133);
				if mouse_check_button(mb_left) btn_sel[i] = lerp(btn_sel[i], 1.2, 0.3);
				else btn_sel[i] = lerp(btn_sel[i], 1, 0.3);
		
				if mouse_check_button_released(mb_left) type = i;
				data_act = true;
				data_txt = what_is[i];
				over_something = true;
			} else {
				btn_sel_col[i] = -1;
				btn_sel[i] = lerp(btn_sel[i], 1, 0.3);
				if(!over_something){
					data_act = false;
				}
			}
			if type = i btn_sel_col[i] = $75ff66;
	
			draw_sprite_ext(spr_buttons_editor, 4, sel_x_btn*t, sel_y_btn*t, btn_sel[i]*t, btn_sel[i]*t, 0, btn_sel_col[i], 1);
			draw_sprite_ext(obj_sprites[i], 0, (sel_x_btn+spr_x_middle)*t, (sel_y_btn+spr_y_middle)*t, btn_sel[i]*scale_spr*t, btn_sel[i]*scale_spr*t, 0, btn_sel_col[i], 1);
		}
	}

	if(mx < 140 && my > 50 && my < ymaxsel + 5){
		select_y_mult += mouse_wheel_up() - mouse_wheel_down();
	}

	#region Mantener presionado
	if(mouse_check_button(mb_left)){
		if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 113, 57, 129, 66)){
			sb[0] = lerp(sb[0], 1.2, 0.3);
		} else {
			sb[0] = lerp(sb[0], 1, 0.3);
		}

		if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 112, ymaxsel-9, 128, ymaxsel)){
			sb[1] = lerp(sb[1], 1.2, 0.3);
		} else {
			sb[1] = lerp(sb[1], 1, 0.3);
		}
	} else {
		sb[0] = lerp(sb[0], 1, 0.3);
		sb[1] = lerp(sb[1], 1, 0.3);
	}
	#endregion
	#region Presionar botones
	if(mouse_check_button_released(mb_left)){
		if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 113, 57, 129, 66)){
			select_y_mult += 1;
		}

		if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 112, ymaxsel-9, 128, ymaxsel)){
			select_y_mult -= 1;
		}
	}
	select_y_mult = clamp(select_y_mult, -(i/3 - frac(i/3)), 0);
	select_y = lerp(select_y, 36*select_y_mult, 0.3);
	#endregion

	surface_reset_target();
}
#endregion
//if(keyboard_check_released(vk_f2))timer[6] = 1;
#region Alarmas
for(var i = 0; i < 10; i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				#region alarm 0 | Iniciar editor
				case 0:
					if(test == false){
						//scr_load_level_in_editor();
						timer[5] = 1;
						if(level_name != ""){
							var dir = directory[0] + level_name + "data.pmd";
							fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
							ini_open(dir);
							obj_max = ini_read_real("Controllers", "Obj_nmb", -1);
							lvl_pass = ini_read_string("Controllers", "Password", "N/A");
							var lvl_saved = ini_read_real("Controllers", "Saved", 0);
							ini_close();
							fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
		
							if(lvl_pass == "N/A"){
								show_message("FATAL_ERROR_LVLBUGDECRYPT_01\nPlease contact to @RobotoSkunk.");
								game_end();
							} else if(!lvl_saved){
								show_message("FATAL_ERROR_LVLBUGSAVED_01\nPlease contact to @RobotoSkunk.");
								game_end();
							}
						} else {
							room_goto(rm_main_menu);
						}
					} else {
						test = false;
						loaded = true;
						ini_open("User_data.pmx");
						init_editor = ini_read_real("editor_settings", "init", 0);
						init_effect = init_editor;
						ini_close();
						//obj_max = array_length_1d(obj_id_arr);
					}
					can_create = true;
					start_opt = true;
					break;
				#endregion
				#region alarm 1 | Iniciar testeo del nivel
				case 1:
					if(player_nmb = 0){
						switch(languaje){
							case "Español":
								tt = "Necesitas un jugador para testear";
								break;
							case "Inglés":
								tt = "You need a player to test";
								break;
							case "Portugués":
								tt = "Você precisa de um jogador para testar";
								break;
							default:
								text_change = 1;
								languaje = "Inglés";
								break;
						}
						test = false;
						start_opt = true;
						timer[2] = 180;
					} else {
						scr_start_new_test();
					}
					break;
				#endregion
				#region alarm 2 | Reiniciar tt
				case 2:
					tt = "";
					//tt = string(array_length_1d(obj_id_arr));
					saving = false;
					if !start_opt start_opt = true;
					if save_exit room_goto(rm_main_menu);
					if !loaded loaded = true;
					break;
				#endregion
				#region alarm 3 | Guardar nivel
				case 3:
					if(player_nmb == 0){
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
								text_change = 1;
								languaje = "Inglés";
								break;
						}
						timer[2] = 180;
					} else if(end_nmb == 0){
						switch(languaje){
							case "Español":
								tt = "Necesitas una salida para guardar";
								break;
							case "Inglés":
								tt = "You need an exit to save";
								break;
							case "Portugués":
								tt = "Você precisa de uma saída para salvar";
								break;
							default:
								text_change = 1;
								languaje = "Inglés";
								break;
						}
						timer[2] = 180;
					} else {
						obj_nmb = 0;
						player_nmb = 0;
						file_size = 0;
						var new_arr = [];
						for(var i = 0; i < instance_number(obj_create_obj_editor); i++){
							new_arr[i] = instance_find(obj_create_obj_editor, i);
						}
						//lvl_pass = " | " + scr_randpass(25);
						obj_max = array_length_1d(new_arr);
	
						var dir = directory[0] + level_name + "data.pmd";
						fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
						ini_open(dir);
							ini_write_real("Controllers", "Saved", 0);
						ini_close();
						fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
	
						var temp = instance_create(x, y, obj_temp_vars);
						variable_instance_set(temp.id, "obj_id_arr", new_arr);
	
						directory_destroy(directory[0] + level_name + "Level\\");
						switch(languaje){
							case "Español":
								tt = string(obj_max) + " instancias encontradas...";
								break;
							case "Inglés":
								tt = string(obj_max) + " instances found...";
								break;
							case "Portugués":
								tt = string(obj_max) + " instâncias encontradas...";
								break;
						}
						timer[4] = 15;
						saving = true;
						start_opt = true;
					}
					break;
				#endregion
				#region alarm 4 | Guardar objetos
				case 4:
					if(obj_nmb < obj_max){
						scr_save_object();
						tt = scr_text_load(clamp(obj_nmb-1, 0, obj_max), obj_max, 1);
						timer[4] = 1;
					} else {
						var dir = directory[0] + level_name + "data.pmd";
						fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
						ini_open(dir);
							ini_write_string("Data", "Pant_div", (player_nmb > 1));
							ini_write_real("Data", "Level_size", file_size);
		
							ini_write_real("Controllers", "Obj_nmb", obj_max);
							ini_write_real("Controllers", "Saved", 1);
						ini_close();
						fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
	
						if(instance_exists(obj_temp_vars)){
							instance_destroy(obj_temp_vars);
						}
						if(save_exit){
							move_to_room = true;
							timer[2] = room_speed*0.6;
						} else {
							timer[2] = 30;
						}
						switch(languaje){
							case "Español":
								tt = "Hecho";
								break;
							case "Inglés":
								tt = "Done";
								break;
							case "Portugués":
								tt = "Feito";
								break;
							default:
								text_change = 1;
								languaje = "Inglés";
								break;
						}
					}
					break;
				#endregion
				#region alarm 5 | Cargar objetos
				case 5:
					if(obj_nmb < obj_max){
						scr_create_object_editor();
						tt = scr_text_load(clamp(obj_nmb-1, 0, obj_max), obj_max, 0);
						timer[0] = 1;
					} else {
						if(obj_max == -1){
							room_goto(rm_main_menu);
						} else {
							timer[2] = 2;
							ini_open("User_data.pmx");
							init_editor = ini_read_real("editor_settings", "init", 0);
							init_effect = init_editor;
							ini_close();
						}
					}
					break;
				#endregion
				#region alarm 6 | TEST_NEW_SAVE
				case 6:
					var map = ds_map_create();
					var obj_list = ds_list_create();
					
					ds_map_add_list(map, "objects", obj_list);
					instance_activate_all();
					for(var a = 0; a < instance_number(obj_create_obj_editor); a++) {
						var inst_id = instance_find(obj_create_obj_editor, a);
						
						var instance_map = ds_map_create();
						ds_map_add(instance_map, "x", inst_id.x);
						ds_map_add(instance_map, "y", inst_id.y);
						ds_map_add(instance_map, "image_angle", inst_id.image_angle);
						
						var pos = ds_list_size(obj_list);
						ds_list_add(obj_list, instance_map);
						ds_list_mark_as_map(obj_list, pos);
					}
					
					var json = json_encode(map);
					scr_encrypt_async(json, 1, scr_blowfish(0) + lvl_pass);
					/*var file = file_text_open_write("test.json");
					file_text_write_string(file, json);
					file_text_close(file);*/

					ds_map_destroy(map);
					break;
				#endregion
			}
		}
	}
}
#endregion

/*if(variable_instance_exists(id, "async_encrypt")){
	if(async_encrypt[? "output"] != ""){
		var file = file_text_open_write("testing");
		file_text_write_string(file, async_encrypt[? "output"]);
		file_text_close(file);
		async_encrypt[? "output"] = "";
	}
}*/
