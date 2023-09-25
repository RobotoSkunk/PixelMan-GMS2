/// @description Inicializar
globalvar multiselect, multiple_instances, can_create, zoom, show_mask, restart, lvl_start, can_place, ldm, decimal_nmb;

multiselect = false;
multiple_instances = false;
move_to_room = false;
zoom = 1;
zm = 1;
can_create = false;
move_to_room = false;
show_mask = false;
multidelete = false;
restart = false;
lvl_start = true;
can_place = true;

randomize();

ini_open("User_data.pmx");
grid_size = clamp(ini_read_real("editor_settings", "grid_size", 16), 8, max_grd_sz);
grd_hcolor = ini_read_real("editor_settings", "grd_hcolor", 0);
grd_scolor = ini_read_real("editor_settings", "grd_scolor", 0);
al_grd = ini_read_real("editor_settings", "al_grd", 0.5);
scroll_zm = ini_read_real("editor_settings", "scroll_zm", 0);
move_wasd = ini_read_real("editor_settings", "move_wasd", 0);
//undo_nmb = ini_read_real("editor_settings", "undo_nmb", 25);
draw_test_path = ini_read_real("editor_settings", "draw_test_path", 1);
path_quality = ini_read_real("editor_settings", "path_quality", 1);
test_nmb = clamp(round(ini_read_real("editor_settings", "test_nmb", 500)), 0, 500);
ldm = ini_read_real("editor_settings", "ldm", 0);
prev_obj = ini_read_real("editor_settings", "prev_obj", 1);
decimal_nmb = ini_read_real("editor_settings", "decimal_nmb", 1);
if(os_type == os_android || os_type == os_ios){
	var mult = 0.75;
} else {
	var mult = 1;
}
editor_quality = ini_read_real("editor_settings", "editor_quality", mult);
init_editor = 1;
ini_close();

init_effect = init_editor;
init_al = 0;
if(path_quality < 1) path_quality = 1;

obj_display_controller.actual_width = -1;
obj_display_controller.actual_height = -1;

over_something = false;

snap = true;
open_menu = false;
cur_sit = 0;
//cur_act = cur_sit;
cvg1 = 0;
cvg2 = 0;

start_opt = false;
test = false;

xs = 0;
ys = 0;
xs1 = 0;
ys1 = 0;
al = 0;
gui_al = 0;
zoom_gui = false;
tt = "";
xp1 = ideal_width+1;
xp2 = -1;
time = room_speed;
pause_editor = false;
pxpos = array_create(5, -250);

vhe = 0;
vve = 0;
vemax = 3;
wheel = 0;
drag_camera = false;
if(os_type == os_android || os_type == os_ios){
	PX = -999999;
	PY = -999999;
} else if(os_type == os_windows || os_type == os_linux || os_type == os_macosx){
	PX = 0;
	PY = 0;
}
can_drg_camera = true;
time_to_wait = 0;

btn_sz = array_create(15, 1);

depth = -256;
image_speed = 0;
image_alpha = 0;

scr_editor_obj(0);
room_max = 999999;

selector = 0;
select_x = -141;
select_y_mult = 0;
select_y = 36*select_y_mult;
//t = resolution;
t = 1;
sb[0] = 1;
sb[1] = 1;
surf_buttons = surface_create(140*t, (ideal_height-30-55)*t);
ymaxsel = 0;
btn_sel = array_create(array_length_1d(obj_sprites), 1);
btn_sel_col = array_create(array_length_1d(obj_sprites), -1);
type = 0;

xdest = [choose(-ideal_width, ideal_width), choose(-ideal_width, ideal_width)];
desp = [0, 0];
sp = [0, 0];
xda = [xdest[0], xdest[1]];

array_btn_editor = [3, 1, 0, 2, 2, 6, 8];
interface_bscale = array_create(array_length_1d(array_btn_editor), 1);
player_nmb = 0;
end_nmb = 0;

settings = false;
help = false;
saving = false;
save_exit = false;

help_page = [0, 0];
sett_page = [0, 0, 0];
slide_active = [0, 0, 0, 0];

player_path[0, 0] = 0; //x1
player_path[1, 0] = 0; //y1
player_path[2, 0] = 0; //kill point x
player_path[2, 1] = 0; //kill point y
player_path[2, 2] = 0; //kill bool
player_path[2, 3] = 0; //Path exists
player_path[3, 0] = 0; //x2
player_path[4, 0] = 0; //y2

data_txt = "";
data_act = false;
data_alph = 0;
prev_instance = -1;
can_preview = true;

init_obj_id_arr = [];
obj_id_arr = [];
obj_max = -1;
obj_nmb = 0;
loaded = false;
obj_nmb_fix = 0;
player_nmb = 0;
file_size = 0;
lvl_pass = "N/A";

timer = array_create(10, 0);
timer[0] = 2;

player_2 = [x, y, 0]; //x, y, pant_div

//debug = true;
//show_debug_overlay(1);