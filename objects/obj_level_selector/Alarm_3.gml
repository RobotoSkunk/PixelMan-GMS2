/// @description Leer nivel
fast_file_key_crypt(directory[0] + file + "data.pmd", directory[0] + file + "data.pmd", 0, scr_blowfish(0));
ini_open(directory[0] + file + "data.pmd");
	lvl_name = base64_decode(ini_read_string("Data", "Name", "FATAL_READELVL_ERROR_1"));
	lvl_date = ini_read_string("Data", "Date", date_date_string(date_current_datetime()));
	lvl_pant_div = ini_read_real("Data", "Pant_div", false);
	final_size = ini_read_real("Data", "Level_size", -1);
	
	lvl_verify = ini_read_real("Controllers", "Verify", 0);
	lvl_gm_version = ini_read_string("Controllers", "GM_version", GM_version);
	lvl_saved = ini_read_real("Controllers", "Saved", 0);
ini_close();
fast_file_key_crypt(directory[0] + file + "data.pmd", directory[0] + file + "data.pmd", 1, scr_blowfish(0));

/*if(string_count(".", lvl_gm_version) == 2){
	lvl_gm_version = lvl_gm_version + ".0";
}*/

alarm[0] = 2;
