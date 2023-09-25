/// @description Valores iniciales por defecto
#region Game data
#region Cargar y/o crear variables y datos
globalvar hex_col, gamepad_size, joy_type, resolution, vsync, custom_cursor,
show_cursor, touch_controls, hide_particles, spr_player, fx_volume, mus_volume, gen_volume, languaje,
force_cpu, restart, prec_data, custom_window;
restart = false;

ini_open("User_data.pmx");
#region player_color
if(ini_section_exists("player_color")){
	var hsv = [ini_read_real("player_color", "hue", 0),
		ini_read_real("player_color", "saturation", 0),
		ini_read_real("player_color", "value", 255)];
	var rgb = [ini_read_real("player_color", "red", colour_get_red(make_colour_hsv(hsv[0], hsv[1], hsv[2]))),
		ini_read_real("player_color", "green", colour_get_green(make_colour_hsv(hsv[0], hsv[1], hsv[2]))),
		ini_read_real("player_color", "blue", colour_get_blue(make_colour_hsv(hsv[0], hsv[1], hsv[2])))];
	
	hex_col = string_fill(dec2hex(rgb[0]), "0", 2) + string_fill(dec2hex(rgb[1]), "0", 2) + string_fill(dec2hex(rgb[2]), "0", 2);
	
	ini_section_delete("player_color");
	ini_write_string("player_options", "color", hex_col);
} else {
	hex_col = ini_read_string("player_options", "color", "ffffff");
}
#endregion
#region game_settings
gamepad_size = ini_read_real("game_settings", "gamepad_size", 1);
joy_type = ini_read_real("game_settings", "joy_type", 0);
resolution = ini_read_real("game_settings", "resolution", 3);
languaje = ini_read_string("game_settings", "languaje", "Inglés");
vsync = ini_read_real("game_settings", "vsync", 1);
custom_cursor = ini_read_real("game_settings", "custom_cursor", 1);
show_cursor = ini_read_real("game_settings", "show_cursor", 1);
if (os_type = os_android || os_type = os_ios){
	touch_controls = ini_read_real("game_settings", "touch_controls", 1);
} else {
	touch_controls = ini_read_real("game_settings", "touch_controls", 0);
}
hide_particles = ini_read_real("game_settings", "hide_particles", 0);
fx_volume = ini_read_real("game_settings", "fx_volume", 1);
mus_volume = ini_read_real("game_settings", "mus_volume", 1);
gen_volume = ini_read_real("game_settings", "gen_volume", 1);
force_cpu = ini_read_real("game_settings", "force_cpu", 5);
prec_data = ini_read_real("game_settings", "prec_data", 1);
//custom_window = ini_read_real("game_settings", "custom_window", 1);
#endregion
if(ini_key_exists("game_settings", "spr_player")){
	ini_key_delete("game_settings", "spr_player");
}
var wx, wy, ww, wh;
wx = ini_read_real("window_data", "x", display_get_width()/2 - init_width/2);
wy = ini_read_real("window_data", "y", display_get_height()/2 - init_height/2);
ww = ini_read_real("window_data", "width", init_width);
wh = ini_read_real("window_data", "height", init_height);
ini_close();
#region User account
if(!file_exists("User_account.pmx")){
	var file = file_text_open_write("User_account.pmx");
	file_text_write_string(file, "");
	file_text_close(file);
}

fast_file_key_crypt("User_account.pmx", "User_account.pmx", 0, scr_blowfish(2));
ini_open("User_account.pmx");
spr_player = ini_read_real("Player", "spr_player", 0);
ini_close();
fast_file_key_crypt("User_account.pmx", "User_account.pmx", 1, scr_blowfish(2));
#endregion
#endregion
#region Aplicar cambios
if(!window_get_fullscreen()){
	ww = clamp(ww, init_width, display_get_width());
	wh = clamp(wh, init_height, display_get_height());
	wx = clamp(wx, 0, display_get_width() - ww);
	wy = clamp(wy, 0, display_get_height() - wh);
	
	obj_display_controller.actual_width = -1;
	obj_display_controller.actual_height = -1;
	
	window_set_rectangle(wx, wy, ww, wh);
}
timeline_index = tml_fix_vsync;
timeline_loop = false;
timeline_running = true;
#endregion
#endregion
init = [0, 60];
state = [0, 0];
alph = 0;
load_x = 0;
load_x_next = 0;
f_nmb = 0;
image_alpha = 0;
image_speed = 0;

timer = array_create(10, 0);
timer[0] = init[1]+15;
levels = [];
is_file = [];

var fileName = file_find_first(directory[0] + "*.pml", fa_directory);
for(var i = 0; fileName != ""; i++){
	levels[i] = fileName;
	is_file[i] = true;
    fileName = file_find_next();
}
file_find_close();

var fileName = file_find_first(directory[0] + "*", fa_directory);
var i1 = i;
for(var i = 0; fileName != ""; i++){
	if(file_exists(directory[0] + fileName + "\\data.pmd")){
		levels[i1] = fileName;
		is_file[i1] = false;
		i1++;
	}
    fileName = file_find_next();
}

here_are_levels = (i > 0);
lvl_name = "";
updating = false;
backup = false;
txt = "Loading";
next = false;

var txt_init, rnd;
txt_init = ["Loaded bugs!",
	"Finally loaded!",
	"This loading game screen  is only in English!",
	"Better than Sierra games!",
	"Random text!"];

randomize();
rnd = irandom(array_length_1d(txt_init)-1);

rand_txt = txt_init[rnd];
instance_create(0, 0, obj_text_controller);
instance_create(0, 0, obj_sound_controller);
window_set_cursor(cr_none);
