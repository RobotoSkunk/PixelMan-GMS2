/// @description Inicializar
globalvar pause, lvl_start, attempts;

zoom = 0.5;
zm = 0.5;
pause = true;
lvl_start = false;
restart = false;
attempts = 1;

x = 0;
y = 0;
image_alpha = 0;
timer = array_create(10, 0);
pos = [x, y];

obj_nmb = 0;
alph = 1;
finished = false;
load_x = 0;

if(level_name != ""){
	var dir = directory[0] + level_name + "data.pmd";
	fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
	ini_open(dir);
	obj_max = ini_read_real("Controllers", "Obj_nmb", -1);
	lvl_pass = ini_read_string("Controllers", "Password", "N/A");
	lvl_saved = ini_read_real("Controllers", "Saved", 0);
	ini_close();
	fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
} else {
	obj_max = -1;
	room_goto(rm_main_menu);
}

if(lvl_pass == "N/A"){
	show_message("FATAL_ERROR_LVLBUGDECRYPT_01\nPlease contact to @RobotoSkunk.");
	game_end();
} else if(!lvl_saved){
	show_message("FATAL_ERROR_LVLBUGSAVED_01\nPlease contact to @RobotoSkunk.");
	game_end();
}

grav = 1;
player_2 = [x, y];
pant_div_ = false;
player_pos = [x, y];
//_depth = 0;
xp1 = -1;
xp2 = ideal_width+1;

timer[0] = 5;