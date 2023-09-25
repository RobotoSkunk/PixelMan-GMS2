/// @description CPU
can_use = (menu_active == 3);
if(can_use){
	al = lerp(al, 1, 0.1);
} else {
	al = lerp(al, 0, 0.1);
}

txt_array2d[0, 0] = text[100];
txt_array2d[0, 1] = text[10];
txt_array2d[0, 2] = text[11];
txt_array2d[0, 3] = text[12];
txt_array2d[0, 4] = text[14];
txt_array2d[1, 0] = text[17];
txt_array2d[1, 1] = text[92];
txt_array2d[1, 2] = text[93];
txt_array2d[3, 0] = "Precise data";

set_array2d[0, 0] = window_get_fullscreen();
set_array2d[0, 1] = vsync;
set_array2d[0, 2] = custom_cursor;
set_array2d[0, 3] = show_cursor;
set_array2d[0, 4] = hide_particles;
set_array2d[1, 0] = fx_volume;
set_array2d[1, 1] = mus_volume;
set_array2d[1, 2] = gen_volume;
set_array2d[3, 0] = prec_data;
