/// @description Procesador
if(restart){
	x = init_pos[0] + random_range(-25, 25);
	y = init_pos[1] + random_range(-25, 25);
	zoom = 0.5;
	zm = 0.5;
	pause = true;
	alph = 0.8;
	lvl_start = false;
	start_opt = false;
	gonna_start = false;
	starting_time = 0;
	att_x = -ideal_width;
	time = 0;
	instance_activate_all();
}

var shake_array, shake;
shake = 0;
shake_array = [0, 0];
#region Terremoto
if(shake_bool){
	if(!pant_div){
		var shake = random_range(2, 3);
	} else {
		for(var i = 0; i < 2; i++){
			shake_array[i] = random_range(2, 3);
		}
	}
	if (IsDead) {
		gamepad_set_vibration(device, 1, 0.7);
		
		if !won gamepad_set_colour(device, c_red);
		else gamepad_set_color(device, c_lime);
	}
	else {gamepad_set_vibration(device, 0.2, 0.5); gamepad_set_colour(device, -1);}
	at++;
	if(at > room_speed*0.2) {shake_bool = false; at = 0;}
} else {
	gamepad_set_vibration(device, 0, 0);
	gamepad_set_colour(device, -1);
}
#endregion
zoom += sin(degtorad(zm - zoom))*10;
zoom = clamp(zoom, 0.5, 2.5);
if(!lvl_start && keyboard_check_pressed(vk_anykey)){
	zm = 1;
	gonna_start = true;
}
if(gonna_start){
	starting_time++;
	
	if(starting_time >= 30){
		lvl_start = true;
		pause = false;
		gonna_start = false;
	}
}

if(!pant_div){
	#region Procesar movimiento
	var Xto, Yto;
	if (instance_exists(obj_player)){
		 move_towards_point(obj_player.x, obj_player.y, 0);
		 Xto = obj_player.x + lengthdir_x(min(95,distance_to_point(obj_player.x, obj_player.y)), direction);
		 Yto = obj_player.y + lengthdir_y(min(95,distance_to_point(obj_player.x, obj_player.y)), direction);
	
		//Zoom
		camera_set_view_size(view_camera[0], ideal_width*zoom, ideal_height*zoom);
	 
		 x += (Xto-x)/25;
		 y += (Yto-y)/25;
		x_camera = x-(ideal_width/2)*zoom;
		y_camera = y-(ideal_height/2)*zoom;
		audio_listener_position(x_camera+(ideal_width/2)*zoom, y_camera+(ideal_width/2)*zoom, -1);
		audio_listener_orientation(0, 1, 0, 0, 0, 1);
	}
	#endregion
	#region Mover cámara después de procesar
	camera_set_view_pos(view_camera[0], x_camera+(shake*choose(-1, 1)*zoom), y_camera+(shake*choose(-1, 1)*zoom));

	//Límite de la cámara
	x = clamp(x, (ideal_width/2)*zoom, room_width-(ideal_width/2)*zoom);
	y = clamp(y, (ideal_height/2)*zoom, room_height-(ideal_height/2)*zoom);
	#endregion
} else {
	if(player_id[0] != -1 && player_id[1] != -1){
		for(var i = 0; i < 2; i++){
			#region Procesar movimiento
			var Xto, Yto, cam_w, cam_h;
			if (instance_exists(player_id[i])){
				Xto[i] = player_id[i].x + lengthdir_x(min(5,distance_to_point(player_id[i].x, player_id[i].x)), direction); //95
				Yto[i] = player_id[i].y + lengthdir_y(min(5,distance_to_point(player_id[i].y, player_id[i].y)), direction); //95
				view_xport[i] = (ideal_width/2)*(i % 2);
				view_wport[i] = ideal_width/2;
				view_yport[i] = 0;
				view_hport[i] = ideal_height;
				view_visible[i] = true;
				
				//Zoom
				camera_set_view_size(view_camera[i], view_wport[i]*zoom, view_hport[i]*zoom);
				cam_w[i] = camera_get_view_width(view_camera[i]);
				cam_h[i] = camera_get_view_height(view_camera[i]);
				
				new_x[i] += (Xto[i]-new_x[i])/25;
				new_y[i] += (Yto[i]-new_y[i])/25;
				new_x_camera[i] = new_x[i]-(lerp(0, cam_w[i], 0.5));
				new_y_camera[i] = new_y[i]-(lerp(0, cam_h[i], 0.5));
			}
			#endregion
			#region Mover cámara después de procesar
			camera_set_view_pos(view_camera[i], new_x_camera[i]+(shake_array[i]*choose(-1, 1)*zoom), new_y_camera[i]+(shake_array[i]*choose(-1, 1)*zoom));

			//Límite de la cámara
			new_x[i] = clamp(new_x[i], cam_w[i]/2, room_width-(cam_w[i]/2));
			new_y[i] = clamp(new_y[i], (cam_h[i]/2), room_height-(cam_h[i]/2));
			
			#endregion
		}
		var num = audio_get_listener_count();
		var mask = 0;
		for(var i = 0; i < min(num, 2); ++i;){
			var info = audio_get_listener_info(i);
			var m = audio_listener_get_data(info[? "mask"]);
			audio_listener_set_position(info[? "index"], new_x_camera[i]+(lerp(0, cam_w[i], 0.5)), new_y_camera[i]+(lerp(0, cam_w[i], 0.5)), -1);
			audio_listener_set_orientation(info[? "index"], 0, 1, 0, 0, 0, 1);
			mask = mask | m;
			ds_map_destroy(info);
		}
		audio_set_listener_mask(mask);
	}
	
}
#region Si muere o gana el jugador
if(!exit_game){
	if(room != rm_editor){
		time = clamp(time, 0, room_speed);
		if(IsDead && !won){
			time++;
			if(time < room_speed*0.2) shake_bool = true;
			else shake_bool = false;
			if(time > room_speed/2){
				xp1 = lerp(xp1, ideal_width+5, 0.2);
				  xp2 = lerp(xp2, -6, 0.2);
			}
		} else if(won){
			cam_angle[0] = lerp(cam_angle[0], cam_angle[1], 0.1);
			if(pant_div){
				for(var i = 0; i < 2; i++){
					if(i % 2 == 0){
						camera_set_view_angle(view_camera[i], cam_angle[0]);
					} else {
						camera_set_view_angle(view_camera[i], -cam_angle[0]);
					}
				}
			} else {
				camera_set_view_angle(view_camera[0], cam_angle[0]);
			}
			zm = 0.4;
			alph = lerp(alph, 0.4, 0.2);
			if(time < room_speed*0.2) {time++; shake_bool = true;}
			else shake_bool = false;
			xp1 = lerp(xp1, -1, 0.2);
			 xp2 = lerp(xp2, ideal_width, 0.2);
		} else {
			 xp1 = lerp(xp1, -1, 0.2);
			 xp2 = lerp(xp2, ideal_width, 0.2);
		}
	} else if(IsDead) {
		time++;
		start_opt = false;
		stack_camera = false;
		if(time > room_speed*0.2){
			alarm[1] = 10;
			time = -room_speed*2;
		}
		
		if(time < room_speed*0.2) shake_bool = true;
		else shake_bool = false;
	} else {
		xp1 = lerp(xp1, -1, 0.2);
		xp2 = lerp(xp2, ideal_width, 0.2);
	}
} else {
	xp1 = lerp(xp1, ideal_width+5, 0.2);
	xp2 = lerp(xp2, -6, 0.2);
}
#endregion
#region Optimizar juego
if(room == rm_editor && !IsDead && test){
	if(distance_to_object(obj_player) < ideal_width) start_opt = 1;
}
if(room == rm_editor && IsDead){
	start_opt = 0;
}

if(start_opt){
	instance_deactivate_all(1);
	instance_activate_object(obj_player);
	instance_activate_object(obj_display_controller);
	instance_activate_object(obj_touchpad);
	instance_activate_object(obj_laser_gun);
	instance_activate_object(obj_sound_controller);
	instance_activate_object(obj_text_controller);
	instance_activate_object(obj_final_door);
	instance_activate_object(obj_switch);
	instance_activate_object(obj_gun_wall);
	instance_activate_object(obj_saw);
	#region Objetos
	var inst, xi1, yi1, xi2, yi2;
		#region Cañón
		instance_activate_object(obj_cannon);
		for(var a = 0; a < instance_number(obj_cannon); a++){
			inst[a] = instance_find(obj_cannon, a);
			xi1[a] = inst[a].x-150*inst[a].image_xscale;
			yi1[a] = inst[a].y-150*inst[a].image_yscale;
			xi2[a] = 300*inst[a].image_xscale;
			yi2[a] = 300*inst[a].image_yscale;
			instance_activate_region(xi1[a], yi1[a], xi2[a], yi2[a], 1);
		}
		#endregion
		#region Balas
		instance_activate_object(obj_bullet);
		for(var a = 0; a < instance_number(obj_bullet); a++){
			inst[a] = instance_find(obj_bullet, a);
			xi1[a] = inst[a].x-20*inst[a].image_xscale;
			yi1[a] = inst[a].y-20*inst[a].image_yscale;
			xi2[a] = 40*inst[a].image_xscale;
			yi2[a] = 40*inst[a].image_yscale;
			instance_activate_region(xi1[a], yi1[a], xi2[a], yi2[a], 1);
		}
		#endregion
		#region Jugador
		if(!pant_div){
			instance_activate_region(obj_player.x-50, obj_player.y-50, 150, 150, 1);
		} else {
			for(var i = 0; i < 2; i++){
				instance_activate_region(player_id[i].x-50, player_id[i].y-50, 150, 150, 1);
			}
		}
		#endregion
		#region Pistola
		instance_activate_object(obj_gun);
		for(var a = 0; a < instance_number(obj_gun); a++){
			inst[a] = instance_find(obj_gun, a);
			xi1[a] = inst[a].x-150*inst[a].image_xscale;
			yi1[a] = inst[a].y-150*inst[a].image_yscale;
			xi2[a] = 300*inst[a].image_xscale;
			yi2[a] = 300*inst[a].image_yscale;
			instance_activate_region(xi1[a], yi1[a], xi2[a], yi2[a], 1);
		}
		#endregion
		#region Láser
		instance_activate_object(obj_laser_gun);
		for(var a = 0; a < instance_number(obj_laser_gun); a++){
			inst[a] = instance_find(obj_laser_gun, a);
			xi1[a] = inst[a].x+lengthdir_x(inst[a].long, inst[a].image_angle);
			yi1[a] = inst[a].y+lengthdir_y(inst[a].long, inst[a].image_angle);
			xi2[a] = 5;
			yi2[a] = 5;
			instance_activate_region(xi1[a]-2.5, yi1[a]-2.5, xi2[a], yi2[a], 1);
		}
		#endregion
		#region Cohete
		instance_activate_object(obj_rocket);
		for(var a = 0; a < instance_number(obj_rocket); a++){
			inst[a] = instance_find(obj_rocket, a);
			xi1[a] = inst[a].x-10*inst[a].image_xscale;
			yi1[a] = inst[a].y-10*inst[a].image_yscale;
			xi2[a] = 20*inst[a].image_xscale;
			yi2[a] = 20*inst[a].image_yscale;
			instance_activate_region(xi1[a], yi1[a], xi2[a], yi2[a], 1);
		}
		#endregion
		#region Sierra móvil
		instance_activate_object(obj_mobile_saw_base);
		for(var a = 0; a < instance_number(obj_mobile_saw_base); a++){
			inst[a] = instance_find(obj_mobile_saw_base, a);
			xi1[a] = inst[a].x-36*inst[a].image_xscale;
			yi1[a] = inst[a].y-abs(14*inst[a].image_yscale);
			xi2[a] = 108*inst[a].image_xscale;
			yi2[a] = abs(42*inst[a].image_yscale);
			instance_activate_region(xi1[a], yi1[a], xi2[a], yi2[a], 1);
		}
		#endregion
		#region Plataformas
		instance_activate_object(obj_platform);
		for(var a = 0; a < instance_number(obj_platform); a++){
			inst[a] = instance_find(obj_platform, a);
			xi1[a] = inst[a].x-38*inst[a].image_xscale;
			yi1[a] = inst[a].y-abs(5*inst[a].image_yscale);
			xi2[a] = 114*inst[a].image_xscale;
			yi2[a] = abs(15*inst[a].image_yscale);
			instance_activate_region(xi1[a], yi1[a], xi2[a], yi2[a], 1);
		}
		#endregion
	#endregion
	if(!pant_div){
		var x1 = camera_get_view_x(view_camera[0])-20;
		var y1 = camera_get_view_y(view_camera[0])-20;
		var x2 = camera_get_view_width(view_camera[0])+20;
		var y2 = camera_get_view_height(view_camera[0])+20;
		instance_activate_region(x1, y1, x2, y2, 1);
	} else {
		for(var i = 0; i < 2; i++){
			var x1 = camera_get_view_x(view_camera[i])-20;
			var y1 = camera_get_view_y(view_camera[i])-20;
			var x2 = camera_get_view_width(view_camera[i])+20;
			var y2 = camera_get_view_height(view_camera[i])+20;
			instance_activate_region(x1, y1, x2, y2, 1);
		}
	}
	instance_deactivate_object(obj_create_obj_editor);
} else {
	instance_activate_all();
	instance_deactivate_object(obj_create_obj_editor);
}
#endregion
