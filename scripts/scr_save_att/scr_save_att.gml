///@param directory {string}
///@param attempts {real}
var dir = argument0;
fast_file_key_crypt(dir, dir, 0, scr_blowfish(0));
ini_open(dir);
var att_act = ini_read_real("Data", "Attempts", 0);
ini_write_real("Data", "Attempts", att_act + argument1);
ini_close();
fast_file_key_crypt(dir, dir, 1, scr_blowfish(0));