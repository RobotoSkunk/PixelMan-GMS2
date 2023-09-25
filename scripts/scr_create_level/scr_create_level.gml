///@param lvl_name {string}
var lvl_data = "", lvl_name = "", lvl_dir = "", lvl_obj = [], file_size = 0, obj_nmb = 0;
for(var i = 0; directory_exists(directory[0] + "[PML] " + string(i) + "\\"); i++){/*Do nothing...*/}
directory_create(directory[0] + "[PML] " + string(i) + "\\");

lvl_data = directory[0] + "[PML] " + string(i) + "\\data.pmd";
lvl_dir = directory[0] + "[PML] " + string(i) + "\\Level\\";

if string_replace_all(argument0, " ", "") == "" lvl_name = base64_encode("Unnamed");
else lvl_name = base64_encode(argument0);
var randpass = " | " + scr_randpass(25);

lvl_obj = scr_string_split(scr_default_level(), "|");
for(var i = 0; i < array_length_1d(lvl_obj); i++){
	var file_name = lvl_dir + base64_encode(md5_string_unicode(i)) + ".pmol";
	var _file = file_text_open_write(file_name);
	
	file_text_write_string(_file, lvl_obj[i]);
	file_text_close(_file);
	
	fast_file_key_crypt(file_name, file_name, 1, scr_blowfish(0) + randpass);
	
	var file_bin = file_bin_open(file_name, 0);
	file_size += file_bin_size(file_bin);
	file_bin_close(file_bin);
	obj_nmb++;
}

ini_open(lvl_data);
	ini_write_string("Data", "Name", lvl_name);
	ini_write_string("Data", "Description", "");
	ini_write_string("Data", "Date", date_date_string(date_current_datetime()));
	ini_write_real("Data", "Pant_div", false);
	ini_write_real("Data", "Level_size", file_size);
	
	ini_write_real("Controllers", "Verify", 0);
	ini_write_string("Controllers", "GM_version", GM_version);
	ini_write_real("Controllers", "Obj_nmb", obj_nmb);
	ini_write_string("Controllers", "Password", randpass);
	ini_write_real("Controllers", "Saved", 1);
ini_close();
fast_file_key_crypt(lvl_data, lvl_data, 1, scr_blowfish(0));

return 0;
