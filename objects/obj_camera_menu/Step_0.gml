/// @description Procesador
//if (device_mouse_check_button(0, mb_right)) action_next_room();
#region Activar/desactivar debug
if (keyboard_check_pressed(vk_f4) && keyboard_check(vk_control) && keyboard_check(vk_shift)){
    switch (debug){
        case true:
            debug = false;
            break;
        default:
            debug = true;
            break;
    }
}
#endregion
#region Transición
if (move_to_room){
    time += -1;
    if (time < room_speed*0.7){
        xp1 = lerp(xp1, ideal_width+5, 0.2);
        xp2 = lerp(xp2, -6, 0.2);
    } else {
		xp1 = lerp(xp1, -1, 0.2);
		xp2 = lerp(xp2, ideal_width, 0.2);
	}
} else {
    xp1 = lerp(xp1, -1, 0.2);
    xp2 = lerp(xp2, ideal_width, 0.2);
}
#endregion
#region Pocisionar la cámara al objeto
x_camera = x-(ideal_width/2);
y_camera = y-(ideal_height/2);
camera_set_view_pos(view_camera[0], x_camera, y_camera);
camera_set_view_size(view_camera[0], ideal_width, ideal_height);
#endregion
#region Slider
if(slider){
	if(device_mouse_check_button(0, mb_left)){
		if(device_mouse_x_to_gui(0) > ideal_width-40) move_camera = true;
	}
	if(move_camera){
		mouseypos = device_mouse_y_to_gui(0)-30;
		if(device_mouse_check_button_released(0, mb_left)) move_camera = false;
	}
	mouseypos += (mouse_wheel_down() - mouse_wheel_up())*10;
	if(gamepad_axis_value(device, gp_axisrv) > 0.07 or gamepad_axis_value(device, gp_axisrv) < -0.07){
		mouseypos += (gamepad_axis_value(device, gp_axisrv))*5;
	}
	
	y = lerp(y, ((mouseypos*length)/(ideal_height-60))+room_height/2, 0.5);
	y1 = lerp(y1, mouseypos, 0.5);
	y2 = lerp(y2, mouseypos+60, 0.5);
	
	y1 = clamp(y1, 0, ideal_height-60);
	y2 = clamp(y2, 60, ideal_height);
	y = clamp(y, room_height/2, length);
	mouseypos = clamp(mouseypos, 0, ideal_height-60);
}
#endregion
