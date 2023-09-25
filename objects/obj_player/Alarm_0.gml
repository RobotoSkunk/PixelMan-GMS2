/// @description Reiniciar habitación
attempts++;
if(!won){
	for(var i = 0; i < snd_length; i++){
		audio_stop_sound(aud[i]);
	}
	restart = true;
	alarm[2] = 3;
}
