/// @description Inicializar
globalvar attempts;

attempts = 1;

image_alpha = 0;
depth = -1;
x = room_width/2;
y = room_height/2;
xp1 = ideal_width+1;
xp2 = -1;
time = room_speed;
globalvar move_to_room;
move_to_room = false;
slider = false;
move_camera = false;
y1 = 0;
y2 = 60;
mouseypos = 0;
surface_resize(application_surface, ideal_width*resolution, ideal_height*resolution);
camera_set_view_size(view_camera[0], ideal_width, ideal_height);

switch(os_type){
	case os_uwp: os = "os_uwp" break;
	case os_win8native: os = "os_win8native" break;
	case os_xboxone: os = "os_xboxone" break;
	case os_android: os = "os_android" break;
	case os_windows: os = "os_windows" break;
	case os_ios: os = "os_ios" break;
	case os_macosx: os = "os_macosx" break;
	case os_linux: os = "os_linux" break;
	case os_switch: os = "os_switch" break;
	case os_ps3: os = "os_ps3" break;
	case os_ps4: os = "os_ps4" break;
	case os_tvos: os = "os_tvos" break;
	case os_unknown: os = "os_unknown" break;
	case os_winphone: os = "os_winphone" break;
	case os_psvita: os = "os_psvita" break;
}
length = 400;

obj_display_controller.actual_width = -1;
obj_display_controller.actual_height = -1;
