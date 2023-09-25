/// @description Procesador
#region Alarms
for(var i = 0; i < 10; i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				case 0:
				#region Alarm 0 | Leer/Actualizar nivel
					if(f_nmb < array_length_1d(levels)){
						if(is_file[f_nmb]){
							scr_uptdate();
		
							updating = true;
						} else {
							var dir = directory[0] + levels[f_nmb] + "\\";
							fast_file_key_crypt(dir + "data.pmd", dir + "data.pmd", 0, scr_blowfish(0));
							ini_open(dir + "data.pmd");
							lvl_name = base64_decode(ini_read_string("Data", "Name", "FATAL_READLVL_ERROR_0"));
							ini_close();
							fast_file_key_crypt(dir + "data.pmd", dir + "data.pmd", 1, scr_blowfish(0));
		
							updating = false;
						}

						f_nmb++;
						timer[0] = 5;
					}
					break;
				#endregion
			}
		}
	}
}
#endregion
#region Loader
init[0]++;
init[0] = clamp(init[0], 0, init[1]+2);

if(init[0] > init[1]){
	if init[0] == init[1]+1 timer[0] = 2;
	alph = lerp(alph, abs(next-1), 0.05);
	
	var load_x_max = ideal_width-30;
	if(array_length_1d(levels) > 0){
		load_x_next = 20+(load_x_max/(array_length_1d(levels)-1))*f_nmb;
	} else {
		load_x_next = 20+load_x_max;
	}
	load_x = lerp(load_x, clamp(load_x_next, 0, ideal_width-10), 0.1);
	
	var upd_state, backup_state, time_wait_txt;
	time_wait_txt = ["", " This will take a moment..."];
	if(backup){
		upd_state = ["preparing ", "updating "];
	} else {
		upd_state = ["Preparing ", "Updating "];
	}
	backup_state = ["", "Recovering and "];
	if(f_nmb < array_length_1d(levels)){
		txt = backup_state[backup] + upd_state[updating] + lvl_name + "..." + time_wait_txt[updating];
	} else if(here_are_levels || load_x > load_x_max-10) {
		txt = rand_txt;
		next = true;
	}
}

if(next && alph < 0.05){
	room_goto_next();
}
#endregion
