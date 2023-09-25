/// @description Procesador
x = x_camera + 50;

if(point_in_rectangle(mouseX, mouseY, x, y, x_camera+ideal_width-50, y+60) && b && searched){
	al = lerp(al, 0.4, 0.3);
	/*if(mouse_check_button_released(mb_left) && scr_compare_versions(lvl_gm_version) && lvl_saved){
		alarm[1] = room_speed*0.6;
		move_to_room = true;
		level_name = string(file);
	}*/
} else {
	al = lerp(al, 0, 0.3);
}
