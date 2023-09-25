/// @description Reiniciar
for(var i = 0; i < snd_length; i++){
	audio_stop_sound(aud[i]);
}
room_restart();
scr_save_att(directory[0] + level_name + "data.pmd", attempts);
