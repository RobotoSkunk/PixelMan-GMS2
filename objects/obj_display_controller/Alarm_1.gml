/// @description Establecer pantalla completa
var can_full = true;
if(parameter_count() > 0){
	for(var i = 0; i < parameter_count(); i++){
		if(parameter_string(i) == "-inawindow"){
			can_full = false;
		}
	}
}
if(can_full){
	ini_open("User_data.pmx");
	var ws = ini_read_real("window_data", "fullscreen", 1);
	ini_close();

	window_set_fullscreen(ws);
	window_set_size(init_width, init_height);
} else {
	window_set_fullscreen(0);
	window_set_size(init_width, init_height);
}