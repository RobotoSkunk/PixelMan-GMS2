/// @description CPU
#region Animación
if(anim){
	desp = (1)-sz;
	sp += (0.05 * desp) - (0.19 * sp);
	sz += sp;
	al = lerp(al, 0.6, 0.4);
} else {
	sz = lerp(sz, 0, 0.4);
	al = lerp(al, 0, 0.4);
	if(sz < 0.1){
		dlt_lvl = false;
	}
}
#endregion
#region Alarmas
for(var i = 0; i < 10; i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				#region Alarm 0 | Eliminar nivel
				case 0:
					if(file_to_delete != ""){
						repeat(force_cpu){
							if(file_exists(lvl_file + "Level\\" + file_to_delete)){
								file_delete(lvl_file + "Level\\" + file_to_delete);
								files_deleted++;
							}
							file_to_delete = file_find_next();
						}
						
						timer[0] = 1;
					} else {
						file_find_close();
						
						move_to_room = true;
						directory_destroy(lvl_file);
						alarm[2] = room_speed*0.6;
					}
					break;
					#endregion
			}
		}
	}
}
#endregion
