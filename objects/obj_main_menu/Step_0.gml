/// @description CPU
#region Menu controller
can_use = (menu_active == -1);
if(menu_active <= 0){
	al = lerp(al, 0, 0.1);
} else {
	al = lerp(al, 1, 0.1);
}

if(menu_active == 0){
	al_exit = lerp(al_exit, 1, 0.1);
} else {
	al_exit = lerp(al_exit, 0, 0.1);
}
#endregion
#region Botones 1
var mx = device_mouse_x_to_gui(0),
	my = device_mouse_y_to_gui(0),
	sep = 40,
	init_y = ideal_height/2 - (btn_nmb/2)*sep + 15;

for(var i = 0; i < btn_nmb; i++){
	if(can_use && point_in_rectangle(mx, my, 0, init_y + sep*i - 17, 175, init_y + sep*i + 17)){
		if mouse_check_button(mb_left) x_arr[i] = lerp(x_arr[i], -5, 0.2);
		else x_arr[i] = lerp(x_arr[i], -25, 0.2);
		
		if(mouse_check_button_released(mb_left)){
			switch(i){
				case 0: goto = 1; break;
				case 1: goto = 2; break;
				case 2: goto = 3; break;
			}
			timer[0] = 2;
		}
	} else if(menu_active <= 0){
		x_arr[i] = lerp(x_arr[i], -25, 0.2);
	} else {
		x_arr[i] = lerp(x_arr[i], -205, 0.2);
	}
}
#endregion
#region Botones 2
for(var i = 0; i < array_length_1d(arr_btn2)-1; i++){
	if(can_use && point_in_rectangle(mx, my, arr_btn2[i, 0], arr_btn2[i, 1], arr_btn2[i, 2], arr_btn2[i, 3])){
		if mouse_check_button(mb_left) x_arr_2[i] = lerp(x_arr_2[i], 0, 0.2);
		else x_arr_2[i] = lerp(x_arr_2[i], 1, 0.2);
	
		if(mouse_check_button_released(mb_left)){
			switch(i){
				case 0: goto = 0; break;
				case 1: goto = -1; break;
				case 2: goto = 5; break;
			}
			timer[0] = 2;
		}
	} else if(menu_active <= 0){
		x_arr_2[i] = lerp(x_arr_2[i], 1, 0.2);
	} else {
		x_arr_2[i] = lerp(x_arr_2[i], 6, 0.2);
	}
}
#endregion
#region Alarmas
for(var i = 0; i < 10; i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				#region alarm 0 | Cambiar goto
				case 0:
					menu_active = goto;
					break;
				#endregion
			}
		}
	}
}
#endregion
st1 += stv;
st2 += stv*0.5;
if(st1 > 359) st1 = 0;
if(st2 > 359) st2 = 0;
