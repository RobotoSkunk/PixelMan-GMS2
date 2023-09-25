/// @description Procesador
var next_volume;
for(var i = 0; i < snd_length; i++){
	audio_sound_gain(aud[i], fx_volume*gen_volume, 0);
}
if(room == rm_test){
	next_volume = 1-0.8*(pause && lvl_start);
} else {
	next_volume = 0;
}

volume_in_game = lerp(volume_in_game, next_volume, 0.05);

if(volume_in_game > 0){
	var is_playing = false;
	
	if(volume_in_game > 0.1){
		for(var i = 0; i < msc_length; i++){
			if(audio_is_playing(mus[i])) is_playing = true;
		}
		if(!is_playing){
			var rndm_song = irandom(msc_length-1);
			audio_play_sound(mus[rndm_song], 1, 1);
		}
	}
	
	for(var i = 0; i < msc_length; i++){
		if(volume_in_game > 0.1){
			audio_sound_gain(mus[i], mus_volume*gen_volume*volume_in_game, 0);
		} else {
			audio_stop_sound(mus[i]);
		}
	}
}
