/// @description Inicializar
if(level_name != ""){
	var dir = directory[0] + level_name + "data.pmd";
	lvl_file = directory[0] + level_name;
	fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
	ini_open(dir);
	lvl_name = base64_decode(ini_read_string("Data", "Name", "FATAL_ERROR_0"));
	lvl_user = ini_read_string("Data", "User", "N/A");
	lvl_id = ini_read_string("Data", "ID", "N/A");
	lvl_attempts = ini_read_real("Data", "Attempts", 0);
	
	lvl_verify = ini_read_real("Controllers", "Verify", 0);
	lvl_saved = ini_read_real("Controllers", "Saved", 0);
	ini_close();
	fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));
} else {
	show_message("FATAL_ERROR_LVLNOTFOUND_01\nPlease contact to @RobotoSkunk.");
	game_end();
}
if(!lvl_saved){
	show_message("FATAL_ERROR_LVLBUGSAVED_01\nPlease contact to @RobotoSkunk.");
	game_end();
}

lvl_change_name = false;

for(var i = 0; i < 4; i++){
	bnt_size[i] = 0.8;
}
dlt_lvl = false;
deleting = false;
file_to_delete = "";
files_deleted = 1;
al = 0;
sz = 0;
desp = 0;
sp = 0;
anim = false;
active = false;
timer[10] = 0;
