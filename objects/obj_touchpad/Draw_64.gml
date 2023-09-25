/// @description Representar procesos
//Controles touch
if(touch_controls){
	switch(joy_type){
		case 1:
			draw_sprite_ext(spr_touch_controller_left, 0, 60*gamepad_size, ideal_height-28*gamepad_size, gamepad_size, gamepad_size, 0, -1, posx_device_alpha[0]);
			draw_sprite_ext(spr_touch_controller_left_joy, 0, posx_device, ideal_height-28*gamepad_size, gamepad_size, gamepad_size, 0, -1, posx_device_alpha[0]+0.2);
			break;
		default:
			draw_sprite_ext(spr_button_lr, 0, 22*gamepad_size, ideal_height-28*gamepad_size, gamepad_size, gamepad_size, 0, -1, posx_device_alpha[2]);
			draw_sprite_ext(spr_button_lr, 1, 67*gamepad_size, ideal_height-28*gamepad_size, gamepad_size, gamepad_size, 0, -1, posx_device_alpha[3]);
			break;
	}
	draw_sprite_ext(spr_touch_controller_jump, 0, ideal_width-36*gamepad_size, ideal_height-32*gamepad_size, gamepad_size, gamepad_size, 0, -1, posx_device_alpha[1]);
}
if (debug){
	draw_set_colour(c_red);
	draw_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 2.5, 0);
	draw_set_colour(c_yellow);
	draw_circle(device_mouse_x_to_gui(1), device_mouse_y_to_gui(1), 2.5, 0);
}
draw_set_colour(-1);