/// @description Volver
for(var i = 0; i < snd_length; i++){
	audio_stop_sound(aud[i]);
}
if(room == rm_test){
	scr_save_att(directory[0] + level_name + "data.pmd", attempts);
}
room_goto(rm_main_menu);
