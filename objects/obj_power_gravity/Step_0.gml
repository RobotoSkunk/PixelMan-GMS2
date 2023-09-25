/// @description Procesador
if(restart){
	line = 20;
	touched = false;
	ratio = 0;
}

if (pause) {exit;}
rot[0] += rot[1];

if(time <= 0){
	time = 0.05;
}

//Cambiar gravedad
if (line < 20){
	line += 0.33/time;
	image_blend = make_colour_hsv(0, 0, 200);
} else {
	line = 20;
	image_blend = make_colour_hsv(0, 0, 255);
	if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_mobile_saw_base)){
		if(place_meeting(x, y, obj_player)){
			var player_id = instance_place(x, y, obj_player);
			player_id.vv = -player_id.vv;
			switch (player_id.grav){
					case 1:
					player_id.grav = -1;
					break;
				default:
					player_id.grav = 1;
					break;
			}
		} else if(place_meeting(x, y, obj_mobile_saw_base)){
			var obj_id = instance_place(x, y, obj_mobile_saw_base);
			obj_id.vs = -obj_id.vs;
			switch (obj_id.gr){
					case 1:
					obj_id.gr = -1;
					break;
				default:
					obj_id.gr = 1;
					break;
			}
		}
		line = 0;
		audio_play_sound(snd_gravity, 25, 0);
		touched = true;
		ratio = 0;
	}
}
if(touched){
	ratio += 2;
	if (ratio > max_ratio) {
		touched = false;
		ratio = 0;
	}
}