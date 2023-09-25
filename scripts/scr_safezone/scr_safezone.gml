///@func safezone(width, height);
///@desc adjust perfectly the screen game to a given safe zone with a width, height and resolution.
///@param {real} width width of the safe zone.
///@param {real} height height of the safe zone.
globalvar ideal_width, ideal_height, aspect_ratio;
var width, height, window_width, window_height, scaleX, scaleY;

width = argument0;
height = argument1;
if(!variable_instance_exists(id, "first_frame")){
	first_frame = 1;
}

//Read only globalvars
aspect_ratio = width/height;

//Read and write globalvar
if(!variable_global_exists("resolution")){
	resolution = 1;
}

if(window_get_fullscreen()){
	window_width = display_get_width();
	window_height = display_get_height();
} else {
	window_width = window_get_width();
	window_height = window_get_height();
}

if(!variable_instance_exists(id, "actual_width")){
	actual_width = window_width;
	actual_height = window_height;
}

if(window_get_fullscreen() ^^ (!window_get_fullscreen() && (actual_width != window_width || actual_height != window_height))){
	if(!window_get_fullscreen()){
		actual_width = window_width;
		actual_height = window_height;
		
		if(boot_loaded){
			ini_open("User_data.pmx");
			ini_write_real("window_data", "x", window_get_x());
			ini_write_real("window_data", "y", window_get_y());
			ini_write_real("window_data", "width", window_get_width());
			ini_write_real("window_data", "height", window_get_height());
			ini_close();
		}
	}
	
	ideal_width = window_width;
	ideal_height = round(ideal_width/aspect_ratio + 0.5);
	
	if(ideal_height > window_height){
		ideal_height = window_height;
		ideal_width = round(ideal_height*aspect_ratio + 0.5);
	}
	
	scaleX = window_width / ideal_width;
	scaleY = window_height / ideal_height;
	ideal_width = width*scaleX;
	ideal_height = height*scaleY;
	
	if(room == rm_editor && instance_exists(obj_editor)){
		var ed_quad = clamp(obj_editor.editor_quality, 0.25, 1),
			win_w = window_width*ed_quad,
			win_h = window_height*ed_quad;
	} else {
		while(max(ideal_width*resolution, ideal_height*resolution) > max(window_width, window_height)){
			resolution -= 0.5;
		}
		if(resolution < 1) resolution = 1;
		var win_w = ideal_width*resolution,
			win_h = ideal_height*resolution;
	}
	if(win_w < 10) win_w = 10;
	if(win_h < 10) win_h = 10;
	
	surface_resize(application_surface, round(win_w), round(win_h));
	display_set_gui_size(ideal_width, ideal_height);
}

if(first_frame){
	for(var i = 1; i <= room_last; i++){
		if(room_exists(i)){
			//room_set_view(i, 0, 1, 0, 0, ideal_width, ideal_height, 0, 0, 1, 1, 0, 0, 0, 0, -1);
			if(ideal_width != undefined && ideal_height != undefined){
				var newcam = camera_create_view(0, 0, argument0, argument1, 0, -1, 0, 0, 0, 0);
			} else {
				
			}
			var currcam = room_get_camera(i, 0);
			if (currcam != -1){
				camera_destroy(currcam);
			}
			room_set_camera(i, 0, newcam);
			room_set_viewport(i, 0, 1, 0, 0, 1, 1);
			
			room_set_view_enabled(i, 1);
		}
	}
	
	//Avoid stupidities...
	//window_set_max_width(display_get_width());
	//window_set_max_height(display_get_height());
	window_command_set_active(window_command_minimize, false);
	window_set_min_width(width);
	window_set_min_height(height);
}

first_frame = 0;

return -1;
