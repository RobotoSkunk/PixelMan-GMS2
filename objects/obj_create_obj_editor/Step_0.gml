/// @description Procesador
if(instance_exists(obj_editor) && can_create){
	#region Variables
	var grd_sz, snap, time_to_wait, con_1, con_2, room_max, open_menu, move_wasd, player_nmb;
	grd_sz = obj_editor.grid_size;
	snap = obj_editor.snap;
	time_to_wait = obj_editor.time_to_wait;
	room_max = obj_editor.room_max;
	open_menu = obj_editor.open_menu;
	move_wasd = obj_editor.move_wasd;
	player_nmb = obj_editor.player_nmb;
	con_1 = mouse_check_button_pressed(mb_left) && !multiselect && select && multiple_instances && can_place;
	con_2 = mouse_check_button_pressed(mb_left) && collision_point(mouseX, mouseY, self, 0, 0) && select && !multiselect && can_place; // && can_create
	#endregion
	#region Si está seleccionado...
	if(select){
		#region Arrastrar objeto
		if(con_1 || con_2){
			if(snap && multiple_instances){
				xg = x - round(mouseX/grd_sz)*grd_sz;
				yg = y - round(mouseY/grd_sz)*grd_sz;
			} else {
				xg = x - mouseX;
				yg = y - mouseY;
			}
			grab = true;
			situation = 2;
		} else if(mouse_check_button_released(mb_left)){
			grab = false;
			situation = 0;
		} else if(multiselect){
			grab = false;
			situation = 0;
		}
	
		if(grab && can_grab){
			if(multiple_instances){
				if(snap || type = -1){
					x = round(mouseX/grd_sz)*grd_sz + xg;
					y = round(mouseY/grd_sz)*grd_sz + yg;
				} else {
					x = round(mouseX) + xg;
					y = round(mouseY) + yg;
				}
			} else {
				x = mouseX + xg;
				y = mouseY + yg;
				if(snap || type = -1){
					x = round(x/grd_sz)*grd_sz;
					y = round(y/grd_sz)*grd_sz;
				} else {
					x = round(x);
					y = round(y);
				}
			}
			obj_editor.time_to_wait = 0;
		} else {
			situation = 0;
			grab = false;
		}
		
		#endregion
		#region Deseleccionar
		if (keyboard_check(vk_control) && keyboard_check_pressed(ord("F")) && !menu) select = false;
		#endregion
		#region Eliminar
		if(!is_mobile && ((keyboard_check_pressed(vk_delete) || keyboard_check_pressed(vk_backspace))) && !menu && type != -1){
			instance_destroy();
		}
		#endregion
		#region Ángulo
		if(can_ang && !menu){
			if ((keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("E"))) && keyboard_check(vk_shift)){
				image_angle += (keyboard_check_pressed(ord("Q")) - keyboard_check_pressed(ord("E")))*90;
			} else if(keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("E"))){
				image_angle += (keyboard_check_pressed(ord("Q")) - keyboard_check_pressed(ord("E")))*45;
			}
		}
		#endregion
		#region Mover WASD
		if(move_wasd && !menu){
			if(keyboard_check(vk_alt)){
				x += (keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A")));
				y += (keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W")));
			} else if(keyboard_check(vk_shift)){
				x += (keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A")))*grd_sz*5;
				y += (keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W")))*grd_sz*5;
			} else {
				x += (keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A")))*grd_sz;
				y += (keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W")))*grd_sz;
			}
		}
		#endregion
		#region Clamps
		if(!free_asp){
			image_xscale = clamp(image_xscale, 0.25, 9999);
			image_yscale = clamp(image_yscale, 0.25, 9999);
		} else {
			image_xscale = clamp(image_xscale, -9999, 9999);
			image_yscale = clamp(image_yscale, -9999, 9999);
		}
		if(type != -1){
			x = clamp(x, -room_max, room_max);
			y = clamp(y, -room_max, room_max);
		} else {
			x = clamp(x, 768, room_max);
			y = clamp(y, 496, room_max);
		}
		obj_speed = clamp(obj_speed, 0, 25);
		if(time < 0) time = abs(time);
		#endregion
	} else {
		grab = false;
		b = false;
		duplicated = false;
		menu = false;
		an = false;
	}
	#endregion
	if(!menu){
		if type != -1 depth = clamp(depth, -255, 90);
		_depth = depth;
		obj_speed = clamp(obj_speed, 0, 25);
	}
	if(player_nmb == 1){
		is_scnd_player = false;
	}
	if(type == 1 && !obj_editor.test && !obj_editor.saving){
		if(is_scnd_player) image_blend = make_color_rgb(141, 199, 240);
		else image_blend = make_color_rgb(143, 240, 141);
	}
}
if(mult_select && mouse_check_button_released(mb_any)){
	mult_select = false;
	select = true;
}
