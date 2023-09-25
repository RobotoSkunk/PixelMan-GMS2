/// @description CPU
if(!finished){
	alph = lerp(alph, 0, 0.2);
	
	var load_x_max, load_x_next;
	load_x_max = ideal_width-30;
	load_x_next = 20+(load_x_max/(obj_max-1))*obj_nmb;
	
	load_x = lerp(load_x, clamp(load_x_next, 0, ideal_width-10), 0.1);
	//txt = string(round((obj_nmb*100)/obj_max)) + "% loaded...";
	txt = scr_text_load(obj_nmb, obj_max, 0);
} else {
	alph = lerp(alph, 1, 0.2);
	switch(languaje){
		case "Español":
			txt = "Hecho";
			break;
		case "Inglés":
			txt = "Done";
			break;
		case "Portugués":
			txt = "Feito";
			break;
	}
	
	if(alph > 0.9){
		var new_inst = instance_create_depth(player_pos[0], player_pos[1], -10, obj_player);
		new_inst.grav = grav;
		new_inst.player_2 = player_2;
		new_inst.pant_div = pant_div_;
		
		instance_destroy();
	}
}

x = lerp(x, pos[0], 0.5);
y = lerp(y, pos[1], 0.5);
camera_set_view_pos(view_camera[0], x - ideal_width/2, y - ideal_height/2);
var x1 = camera_get_view_x(view_camera[0]);
var y1 = camera_get_view_y(view_camera[0]);
var x2 = camera_get_view_width(view_camera[0]);
var y2 = camera_get_view_height(view_camera[0]);
instance_activate_region(x1, y1, x2, y2, 1);

#region Alarms
for(var i = 0; i < 10; i++){
	if(timer[i] > 0){
		timer[i]--;
		if(timer[i] <= 0){
			switch(i){
				case 0:
				#region Alarm 0 | Crear objeto
					if(obj_nmb < obj_max){
						scr_create_object();
						timer[0] = 1;
					} else {
						if(obj_max == -1){
							room_goto(rm_main_menu);
						} else {
							finished = true;
						}
					}
					break;
				#endregion
			}
		}
	}
}
#endregion