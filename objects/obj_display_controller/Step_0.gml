/// @description Procesador
#region Pocisión del mouse
mouseX = x_camera+window_mouse_get_x()/window_get_width()*camera_get_view_width(view_camera[0]);
mouseY = y_camera+window_mouse_get_y()/window_get_height()*camera_get_view_height(view_camera[0]);

#endregion
#region Propiedades del Gamepad
maxpads = gamepad_get_device_count();for (var i = 0; i < maxpads; i++)
if (gamepad_is_connected(i)){
	device = i;
}
#endregion

#region cursor_details
if(os_type == os_windows && !window_get_fullscreen()){
	var dx = display_mouse_get_x(),
		dy = display_mouse_get_y(),
		wx = window_get_x(),
		wy = window_get_y(),
		ww = window_get_width(),
		wh = window_get_height();
	
	if(point_in_rectangle(dx, dy, wx-2, wy-2, wx + ww+2, wy + wh+2)){
		
		if(point_in_rectangle(dx, dy, wx-2, wy-2, wx+2, wy+2) || point_in_rectangle(dx, dy, wx + ww-2, wy + wh-2, wx + ww+2, wy + wh+2)) {
			//Esquina superior izquierda || Esquina inferior derecha
			cursor_sprite = -1;
			window_set_cursor(cr_size_nwse);
			in_window = false;
			
		} else if(point_in_rectangle(dx, dy, wx-2, wy+2, wx+2, wy + wh-2) || point_in_rectangle(dx, dy, wx + ww-2, wy+2, wx + ww+2, wy + wh-2)) {
			//Izquierda || Derecha
			cursor_sprite = -1;
			window_set_cursor(cr_size_we);
			in_window = false;
			
		} else if(point_in_rectangle(dx, dy, wx+2, wy-2, wx + ww-2, wy+2) || point_in_rectangle(dx, dy, wx+2, wy + wh-2, wx + ww-2, wy + wh+2)) {
			//Arriba || Abajo
			cursor_sprite = -1;
			window_set_cursor(cr_size_ns);
			in_window = false;
			
		} else if(point_in_rectangle(dx, dy, wx + ww-2, wy-2, wx + ww+2, wy+2) || point_in_rectangle(dx, dy, wx-2, wy + wh-2, wx+2, wy + wh+2)) {
			//Esquina inferior izquierda || Esquina superior derecha
			cursor_sprite = -1;
			window_set_cursor(cr_size_nesw);
			in_window = false;
			
		} else {
			in_window = true;
		}
		
	} else {
		in_window = false;
	}
} else {
	in_window = true;
}
#endregion

//scr_safezone(init_width, init_height - wind_height*custom_window);
scr_safezone(init_width, init_height);
//show_debug_overlay(debug);
