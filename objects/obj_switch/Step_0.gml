/// @description Procesador
if(restart){
	active = false;
	image_speed = 0;
	image_index = 0;
}

if(place_meeting(x, y, obj_player) && !active){
	active = true;
	audio_play_sound(snd_switch, 25, 0);
}

if(active){
	if (image_index > image_number-1){
		image_speed = 0;
		image_index = image_number-1;
	} else {
		image_speed = 0.8;
	}
}