/// @description Procesador
//Gamepad touch
if(touch_controls){
	if(!pause){
		#region Detectar mouse 1 y 2
		if (device_mouse_check_button(0, mb_left) and device_mouse_x_to_gui(0) < display_get_gui_width()/2) {
			finger[0] = 0;
			finger[1] = 1;
		} else if (device_mouse_check_button(0, mb_left) and device_mouse_x_to_gui(0) > display_get_gui_width()/2){
			finger[0] = 1;
			finger[1] = 0;
		} else {
			finger[0] = 0;
			finger[1] = 0;
			move_to_jump = 0;
			move_to_left = 0;
			move_to_right = 0;
			touchpad[0] = 0;
			touchpad[1] = 0;
			touchpad[2] = 0;
			touchpad[3] = 0;
		} 
		if (device_mouse_check_button(1, mb_left) and device_mouse_x_to_gui(1) < display_get_gui_width()/2) {
			finger[0] = 1;
			finger[1] = 0;
		} else if(device_mouse_check_button(1, mb_left) and device_mouse_x_to_gui(1) > display_get_gui_width()/2){
			finger[0] = 0;
			finger[1] = 1;
		} else {
			finger[0] = 0;
			finger[1] = 0;
			move_to_jump = 0;
			move_to_left = 0;
			move_to_right = 0;
			touchpad[0] = 0;
			touchpad[1] = 0;
			touchpad[2] = 0;
			touchpad[3] = 0;
		}
		#endregion
		#region Controles diestros
		#region Touch izquierdo
		switch(joy_type){
			case 1:
				if (device_mouse_check_button(finger[0], mb_left)) {
					if (device_mouse_x_to_gui(finger[0]) > 7*gamepad_size and device_mouse_x_to_gui(finger[0]) < 116*gamepad_size){
						if (device_mouse_y_to_gui(finger[0]) > ideal_height-52*gamepad_size and device_mouse_y_to_gui(finger[0]) < ideal_height-5*gamepad_size){
							touchpad[0] = true;
						}
					}
				}
		
				if(touchpad[0]){
					posx_device = lerp(posx_device, device_mouse_x_to_gui(finger[0]), 0.5);
					posx_device = clamp(posx_device, 23*gamepad_size, 100*gamepad_size);
					posx_device_alpha[0] = lerp(posx_device_alpha[0], 0.7, 0.5);
					if(device_mouse_x_to_gui(finger[0]) > 70*gamepad_size) move_to_right = 1;
					else move_to_right = 0;
					if (device_mouse_x_to_gui(finger[0]) < 50*gamepad_size) move_to_left = 1;
					else move_to_left = 0;
					if(device_mouse_check_button_released(finger[0], mb_left)) touchpad[0] = false;
				} else {
					posx_device = lerp(posx_device, 60*gamepad_size, 0.5);
					move_to_right = 0;
					move_to_left = 0;
					posx_device_alpha[0] = lerp(posx_device_alpha[0], 0.4, 0.2);
				}
				break;
			default:
				if (device_mouse_check_button(finger[0], mb_left)) {
					//Left
					if (device_mouse_x_to_gui(finger[0]) > 5*gamepad_size and device_mouse_x_to_gui(finger[0]) < 40*gamepad_size){
						if (device_mouse_y_to_gui(finger[0]) > ideal_height-52*gamepad_size and device_mouse_y_to_gui(finger[0]) < ideal_height-5){
							touchpad[2] = true;
						} else touchpad[2] = false;
					} else touchpad[2] = false;
					//Right
					if (device_mouse_x_to_gui(finger[0]) > 42*gamepad_size and device_mouse_x_to_gui(finger[0]) < 77*gamepad_size){
						if (device_mouse_y_to_gui(finger[0]) > ideal_height-52*gamepad_size and device_mouse_y_to_gui(finger[0]) < ideal_height-5){
							touchpad[3] = true;
						} else touchpad[3] = false;
					} else touchpad[3] = false;
				}
			
				if (touchpad[2]){
					move_to_left = 1;
					posx_device_alpha[2] = lerp(posx_device_alpha[2], 0.7, 0.5);
					if(device_mouse_check_button_released(finger[0], mb_left)) touchpad[2] = false;
				} else {
					move_to_left = 0;
					posx_device_alpha[2] = lerp(posx_device_alpha[2], 0.4, 0.5);
				}
			
				if (touchpad[3]){
					move_to_right = 1;
					posx_device_alpha[3] = lerp(posx_device_alpha[3], 0.7, 0.5);
					if(device_mouse_check_button_released(finger[0], mb_left)) touchpad[3] = false;
				} else {
					move_to_right = 0;
					posx_device_alpha[3] = lerp(posx_device_alpha[3], 0.4, 0.5);
				}
				break;
		}
		#endregion
		#region Touch derecho
		if (device_mouse_check_button(finger[1], mb_left)) {
			if (device_mouse_x_to_gui(finger[1]) > ideal_width-66*gamepad_size and device_mouse_x_to_gui(finger[1]) < ideal_width-5*gamepad_size){
				if (device_mouse_y_to_gui(finger[1]) > ideal_height-61*gamepad_size and device_mouse_y_to_gui(finger[1]) < ideal_height){
					touchpad[1] = true;
				}
			}
		} else {touchpad[1] = false;}

		if(touchpad[1]){
			posx_device_alpha[1] = lerp(posx_device_alpha[1], 0.7, 0.5);
			if (device_mouse_check_button_pressed(finger[1], mb_left)) move_to_jump = 1;
			else move_to_jump = false;
		} else {
			posx_device_alpha[1] = lerp(posx_device_alpha[1], 0.4, 0.2);
			move_to_jump = 0;
		}
		#endregion
		#endregion
	}
}