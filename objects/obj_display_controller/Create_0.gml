/// @description Propiedades del display
#region Variables
globalvar debug;
globalvar mouseX, mouseY, in_window;
globalvar x_camera, y_camera;
globalvar maxpads, device;
globalvar move_to_right, move_to_left, move_to_jump;
globalvar zoom, zm;
globalvar os_map_data, os_map_size, os_map_info;
globalvar directory, level_name;
globalvar lvl_start;

device = 0;
x_camera = 0;
y_camera = 0;
mouseX = mouse_x;
mouseY = mouse_y;
resolution = 1;
lvl_start = false;
in_window = true;

debug = false;
#endregion
#region Localización de archivos
directory[0] = working_directory + "User levels\\";
directory[1] = working_directory + "Downloaded levels\\";
directory[2] = working_directory + "Imported levels\\";
directory[3] = working_directory + "Cache\\";
#endregion
#region Os_data
var _osdata = os_get_info();
if(_osdata != -1){
	os_map_size = ds_map_size(_osdata)-1;
	var key = ds_map_find_first(_osdata);
	for(var a = 0; a < os_map_size; a++){
		key = ds_map_find_next(_osdata, key);
		os_map_data[a] = ds_map_find_value(_osdata, key);
		os_map_info[a] = string(key);
	}
	ds_map_destroy(_osdata);
} else {
	os_map_data[0] = -1;
	os_map_size = 0;
	os_map_info[0] = "";
}
#endregion

level_name = "";
window_mouse_set(display_get_width()/2, display_get_height()/2);

depth = -9999;
randomize();
alarm[0] = 60*random_range(0.2, 1.2);
alarm[1] = alarm[0]/2;
boot_loaded = 0;
show_debug_overlay(true);

image_alpha = 0;
