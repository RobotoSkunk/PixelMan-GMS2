/// @description Procesador
x = x_camera+32;
y = y_camera+ideal_height-32;

if(collision_point(mouseX, mouseY, self, 0, 0) and can_use and !acc){
	if(mouse_check_button(mb_left)){
		size = lerp(size, 1, 0.2);
	} else if(mouse_check_button_released(mb_left)){
		acc = true;
		user = "";
		quest = 0;
		answer = "";
		
		if(file_exists("User_account.pmx")){
			fast_file_key_crypt("User_account.pmx", "User_account.pmx", 0, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
			ini_open("User_account.pmx");
			if(ini_read_real("Account", "id", 0) > 0){
				user = ini_read_string("Account", "username", "FATAL_ERROR_2");
				account_in = true;
			} else {
				account_in = false;
			}
			ini_close();
			fast_file_key_crypt("User_account.pmx", "User_account.pmx", 1, "5q2#%$3sdFSDT5yHdfsbgga_-_ASDfasd");
		} else {
			account_in = false;
		}
		
	} else {
		size = lerp(size, 0.8, 0.2);
	}
} else size = lerp(size, 0.8, 0.2);
