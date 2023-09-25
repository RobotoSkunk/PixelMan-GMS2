/// @description Procesador
if (pause){
	exit;
}
xp = x+choose(-1,0,1);
yp = y+choose(-1,0,1);
ang += img_angle;

if(audio_is_playing(snd)){
	audio_emitter_position(s_emitter, x, y, 0);
	audio_emitter_falloff(s_emitter, 100, max(ideal_width, ideal_height)*image_xscale, 25);
}
