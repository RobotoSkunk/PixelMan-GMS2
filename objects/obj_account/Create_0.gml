/// @description Inicializar
depth = 1;
size = 0.8;
acc = false;
can_use = true;
logreg = false;
reg = false;

user = "";
email = "";
password = "";
repeat_pass = "";
show_pass = false;
btn = 0;
txtsz = [1, 1, 1, 1];

al = 0;
sz = 0;
desp = 0;
sp = 0;

answer = "";
//uploading = false;
//upload_process = 0;

top = 30;
bottom = 50;
sides = 150;

if(file_exists("User_account.pmx")){
	fast_file_key_crypt("User_account.pmx", "User_account.pmx", 0, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
	ini_open("User_account.pmx");
	if(ini_read_real("Account", "id", 0) > 0){
		account_in = true;
		user = ini_read_string("Account", "username", "FATAL_ERROR_2");
	} else {
		account_in = false;
	}
	ini_close();
	fast_file_key_crypt("User_account.pmx", "User_account.pmx", 1, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
} else {
	account_in = false;
}
get_acc = false;
set_acc = false;

//array = ["", "", "", "", "", ""];
a = 0;

fileName[0] = "";
final_text = "";

sit = 0;
sitalph = 0;
sittxt = "";

save = false;
load = false;
quest = 0;
state = "";
file_length = 0;
file_load = 0;

file_load_map[0] = "";