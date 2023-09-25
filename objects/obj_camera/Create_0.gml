/// @description Inicializar
globalvar pause, shake_bool, lvl_start;

image_alpha = 1;
depth = -260;

if(room == rm_editor){
	ini_open("User_data.pmx");
	draw_test_path = ini_read_real("editor_settings", "draw_test_path", 1);
	path_quality = ini_read_real("editor_settings", "path_quality", 1);
	test_nmb = clamp(round(ini_read_real("editor_settings", "test_nmb", 500)), 0, 500);
	ini_close();
	
	if(path_quality < 1) path_quality = 1;
}

gonna_start = false;
starting_time = 0;
att_x = -ideal_width;

if(room != rm_editor){
	zoom = 0.5;
	zm = 0.5;
	pause = true;
	alph = 0.8;
}  else {
	zm = 1;
	zoom = 1;
	pause = false;
	alph = 0;
}
lvl_start = !pause;
xpos = -161;
test = 0;
at = 0;

xp1 = -1;
xp2 = ideal_width+1;

time = 0;
xposb[0] = -244;
xposb[1] = -244;
xposb[2] = -244;
shake_bool = false;
txtd = "noone";
start_opt = 0;
alarm[0] = 5;
if room == rm_editor stack_camera = 0;
else stack_camera = 1;
cam_angle[0] = 0;
cam_angle[1] = choose(-20, 20);
exit_game = false;
tpause = 0;
lvl_pass = "";

surface_resize(application_surface, ideal_width*resolution, ideal_height*resolution);
camera_set_view_pos(view_camera[0], x-(ideal_width/2), y-(ideal_height/2));

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

cw = ideal_width/2;
ch = ideal_height/2;
desp = 0;
sz = 0;
sp = 0;
for(var i = 0; i < 2; i++){
	bz[i] = 1;
}

//test_lvl = "";

player_path[0, 0] = 0; //x1
player_path[1, 0] = 0; //y1
player_path[2, 0] = 0; //kill point x
player_path[2, 1] = 0; //kill point y
player_path[2, 2] = 0; //kill bool
player_path[2, 3] = 0; //Path exists
player_path[3, 0] = 0; //x2
player_path[4, 0] = 0; //y2
moment = [0, 0];
mfix = [0, 0];

pant_div = false;
new_x_camera = [0, 0];
new_y_camera = [0, 0];
new_x = [0, 0];
new_y = [0, 0];

alarm[5] = 2;
init_pos = [x, y];
//buff_lvl = buffer_create(255, buffer_grow, 1);
//game_save_buffer(buff_lvl);
obj_display_controller.actual_width = -1;
obj_display_controller.actual_height = -1;