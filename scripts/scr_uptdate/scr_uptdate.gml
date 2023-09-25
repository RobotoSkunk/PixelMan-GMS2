fast_file_key_crypt(directory[0] + levels[f_nmb], directory[0] + levels[f_nmb], 0, "AgfR_aedtt&$32fds_asdfe-3-ad3rt-");
	
var lvl = string_copy(string(levels[f_nmb]), 1, string_length(levels[f_nmb])-4);

content = "";
var archive = file_text_open_read(directory[0] + levels[f_nmb]);
while !file_text_eof(archive) {
	var line = file_text_read_string(archive);
	file_text_readln(archive);
	var content = content + line;
}
file_text_close(archive);
//content = base64_encode(content);
	
if content == "" content = scr_default_level();
for(var i = 0; directory_exists(directory[0] + "[PML] " + string(i) + "\\"); i++){/*Do nothing...*/}
var levelname = string(i);

if (file_exists(directory[0] + levels[f_nmb])) {
	file_delete(directory[0] + levels[f_nmb]);
}
levels[f_nmb] = "[PML] " + levelname + "\\";

var dir = directory[0] + levels[f_nmb];
var content_dir = dir + "Level\\";
directory_create(dir);
var randpass = " | " + scr_randpass(25);

var file_size = 0, obj_nmb = 1;
var new_con = scr_string_split(content, "|");
for(var i = 0; i < array_length_1d(new_con); i++){
	
	var file_name = content_dir + base64_encode(md5_string_unicode(i)) + ".pmol";
	var _file = file_text_open_write(file_name);
	
	file_text_write_string(_file, new_con[i]);
	file_text_close(_file);
	
	fast_file_key_crypt(file_name, file_name, 1, scr_blowfish(0) + randpass);
	
	var file_bin = file_bin_open(file_name, 0);
	file_size += file_bin_size(file_bin);
	file_bin_close(file_bin);
	obj_nmb++;
}

ini_open(dir + "data.pmd");
ini_write_string("Data", "Name", base64_encode(lvl));
ini_write_string("Data", "Description", "");
ini_write_string("Data", "Date", date_date_string(date_current_datetime()));
ini_write_real("Data", "Pant_div", false);
ini_write_real("Data", "Level_size", file_size);

ini_write_string("Controllers", "GM_version", GM_version);
ini_write_real("Controllers", "Verify", 0);
ini_write_real("Controllers", "Obj_nmb", obj_nmb);
ini_write_string("Controllers", "Password", randpass);
ini_write_real("Controllers", "Saved", 1);

lvl_name = base64_decode(ini_read_string("Data", "Name", "FATAL_READLVL_ERROR_0"));
ini_close();
fast_file_key_crypt(dir + "data.pmd", dir + "data.pmd", 1, scr_blowfish(0));