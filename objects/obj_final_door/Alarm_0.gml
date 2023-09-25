/// @description Detectar interruptores activos
if(instance_exists(obj_switch)){
	var act = 0;
	for(var i = 0; i < instance_number(obj_switch); i++){
		if instance_find(obj_switch, i).active == true act++;
	}
	
	if(act == instance_number(obj_switch)){
		open = true;
		audio_play_sound(snd_open_door, 25, 0);
	} else {
		alarm[0] = 2;
	}
} else {
	open = true;
	audio_play_sound(snd_open_door, 25, 0);
}
