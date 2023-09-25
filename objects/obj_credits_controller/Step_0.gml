/// @description CPU
can_use = (menu_active == 5);
if(can_use){
	al = lerp(al, 1, 0.1);
	xpos = lerp(xpos, ideal_width, 0.1);
} else {
	al = lerp(al, 0, 0.1);
	if(al < 0.98){
		xpos = lerp(xpos, ideal_width + 300, 0.1);
	} else {
		xpos = ideal_width + 300;
	}
}

if(text_change) alarm[0] = 1;

if(al > 0.02){
	draw_set_font(fnt_roboto);
	var my = device_mouse_y_to_gui(0);
	var wheel = mouse_wheel_up() - mouse_wheel_down();
	var txt = credits;
	time_to_wait++;
	time_to_wait = clamp(time_to_wait, 0, 2);

	if(can_use && wheel != 0){
		new_ypos += wheel*25;
	} else if(in_use){
		new_ypos = my + ym;
		time_to_wait = 0;
		if mouse_check_button_released(mb_left) in_use = false;
	} else if(can_use){
		new_ypos--;
	}

	ypos = lerp(ypos, new_ypos, 0.1);
	
	if(can_use){
		if(ypos > ideal_height + 41){
			ypos = -170-string_height(txt);
			new_ypos = -170-string_height(txt);
			ym = new_ypos - my;
		} else if(ypos < -171-string_height(txt)){
			ypos = ideal_height+40;
			new_ypos = ideal_height+40;
			ym = new_ypos - my;
		}
	} else {
		new_ypos = ideal_height+40;
		ym = new_ypos;
	}
}