/// @description Disparar
var new_inst;
started = 1;
new_inst = instance_create_depth(x+lengthdir_x(6, image_angle)*image_xscale, y+lengthdir_y(6, image_angle)*image_yscale, depth+0.1, obj_bullet);
if(instance_exists(new_inst)){
	new_inst.direction = image_angle;
	new_inst.image_xscale = image_xscale;
	new_inst.image_yscale = image_yscale;
}
audio_play_sound(snd_launch_bullet, 100, 0);

if(time > 0.1){
	alarm[1] = room_speed*time;
} else {
	alarm[1] = room_speed*0.1;
}
