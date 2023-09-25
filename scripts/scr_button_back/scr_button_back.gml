/// @param extra_condition* {bool}
/// @param new_y* {real}
/// @param alpha* {real}
//var mx, my;
var mx, my, extra_condition = true, new_y = 0, alpha = 1;
mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);

for(var i = 1; i < argument_count; i++){
	switch(i){
		case 0:
			extra_condition = argument[i];
			break;
		case 1:
			new_y = argument[i];
			break;
		case 2:
			alpha = argument[i];
			break;
	}
}

if(!variable_instance_exists(id, "btn_back_size")){
	btn_back_size = 1;
}
if(room != rm_editor){
	var btn_x_pos = 0;
} else {
	if(instance_exists(obj_editor)){
		var btn_x_pos = xda[(settings + (help*2)) % 2];
	} else {
		var btn_x_pos = 0;
	}
}

if(point_in_rectangle(mx, my, 0, 0, 50, 60) && extra_condition){
	if mouse_check_button(mb_left) btn_back_size = lerp(btn_back_size, 1.3, 0.3);
	else btn_back_size = lerp(btn_back_size, 1, 0.3);

	if(mouse_check_button_released(mb_left)){
		if(room != rm_editor){
			switch(object_index){
				case obj_settings:
					menu_active = -1;
					break;
				case obj_credits_controller:
					menu_active = -1;
					break;
				case obj_select_mode:
					switch(menu_active){
						case 1:
							menu_active = -1;
							break;
						case 1.3:
							if(!new_lvl && !going_to_dlt){
								if(!lvl_data[0]){
									menu_active = 1;
								} else {
									lvl_data[0] = 0;
								}
							}
							break;
						default:
							menu_active = 1;
							break;
					}
					break;
				case obj_color:
					menu_active = -1;
					break;
				case obj_patreon:
					alarm[0] = 60*0.6;
					move_to_room = true;
					break;
			}
		} else {
			if(instance_exists(obj_editor)){
				if(help){
					help = false;
					randomize();
					xdest[0] = choose(-ideal_width, ideal_width);
					sp[0] = 0;
					desp[0] = 0;
				} else if(settings){
					settings = false;
					randomize();
					xdest[1] = choose(-ideal_width, ideal_width);
					sp[1] = 0;
					desp[1] = 0;
				}
			}
		}
	}
} else {
	btn_back_size = lerp(btn_back_size, 1, 0.3);
}

draw_sprite_ext(spr_button_lr, 2, btn_x_pos+25, 28 + new_y, btn_back_size, btn_back_size, 0, -1, alpha);
