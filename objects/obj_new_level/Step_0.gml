/// @description Procesador
if(20+70*instance_number(obj_level_selector) > ideal_height){
	x = x_camera+ideal_width-69;
} else {
	x = x_camera+ideal_width-29;
}
y = y_camera+ideal_height-29;

/*if(instance_exists(obj_button)){
	//obj_button.x = x_camera+25;
	//obj_button.y = y_camera+28;
}*/

if(new_level){
	desp = (1)-sz;
	sp += (0.05 * desp) - (0.19 * sp);
	sz += sp;
	al = lerp(al, 0.6, 0.4);
} else {
	sz = lerp(sz, 0, 0.4);
	al = lerp(al, 0, 0.4);
}

if(instance_exists(obj_level_selector)){
	if(new_level){
		obj_level_selector.b = false;
	} else if(collision_point(mouseX, mouseY, self, 0, 0)){
		obj_level_selector.b = false;
	} else {
		if(20+70*instance_number(obj_level_selector) > ideal_height){
			if(device_mouse_x_to_gui(0) > ideal_width-40){
				obj_level_selector.b = false;
			} else {
				obj_level_selector.b = true;
			}
		} else {
			obj_level_selector.b = true;
		}
	}
}

if(new_level){
	size = lerp(size, 1, 0.4);
	if(keyboard_check_pressed(vk_escape)) {
		new_level = false;
		new_level_write = false;
		//lvl_name = "";
	}
} else if(collision_point(mouseX, mouseY, self, 0, 0)){
	if(mouse_check_button(mb_left)){
		size = lerp(size, 1.2, 0.4);
	} else if(mouse_check_button_released(mb_left)){
		new_level = true;
	} else {
		size = lerp(size, 1, 0.4);
	}
} else {
	size = lerp(size, 1, 0.4);
}

#region Alarms
for(var i = 0; i < 10; i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				case 0:
				#region Alarm 0 | Crear nivel
					scr_create_level(lvl_name);
					room_restart();
					break;
				#endregion
			}
		}
	}
}
#endregion
