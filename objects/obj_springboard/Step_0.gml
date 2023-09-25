/// @description Procesador
if (place_meeting(x, y, obj_player)){
	var player_id = instance_place(x, y, obj_player);
    animation = true;
    player_id.vv = lengthdir_x(-vvsp*1.4*(player_id.grav), image_angle);
	player_id.vh = lengthdir_x(-vvsp*1.1, image_angle-90);
	player_id.cjr = 0.3-abs(lengthdir_x(0.39, image_angle-90));
	t++;
	t = clamp(t, 0, 3);
	player_id.cjh = false;
} else if (place_meeting(x, y, obj_mobile_saw_base)){
	var saw_id = instance_place(x, y, obj_mobile_saw_base);
    animation = true;
    saw_id.vs = lengthdir_x(-vvsp*1.4*(saw_id.gr), image_angle);
	t++;
	t = clamp(t, 0, 3);
} else {
	t = 0;
}
if(t == 1){
	audio_play_sound(snd_spring, 100, 0);
}
//Animación
switch (animation){
    case true:
        if (image_index = image_number-1){
            animation = false;
        } else image_speed = 1;
        break;
    default:
        image_index = 0;
        image_speed = 0;
        break;
}
