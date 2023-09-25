/// @description Procesador
if(restart){
	detected = false;
	image_index = image_number-1;
	image_speed = 0;
	xl = x;
	yl = y;
	long = 0;
}

if (pause){
	image_index = imag;
	if(!lvl_start){
		#region Línea
		var distance, line_scr;
		distance = point_distance(0, 0, room_width, room_height);
		line_scr = collision_line_point(x, y, x+lengthdir_x(distance, image_angle), y+lengthdir_y(distance, image_angle), obj_block, 0, 1);
		xl = line_scr[1];
		yl = line_scr[2];
		long = point_distance(x, y, xl, yl);
		#endregion
	}
	exit;
}
imag = image_index;

#region Línea
var distance, line_scr;
distance = point_distance(0, 0, room_width, room_height);
line_scr = collision_line_point(x, y, x+lengthdir_x(distance, image_angle), y+lengthdir_y(distance, image_angle), obj_block, 0, 1);
xl = line_scr[1];
yl = line_scr[2];
long = point_distance(x, y, xl, yl);
#endregion
#region Detectar jugador
player_detect = collision_line(x, y, x+lengthdir_x(long, image_angle), y+lengthdir_y(long, image_angle), obj_player, 0, 0);
if (player_detect && image_index = image_number-1){
	detected = true;
}
#endregion
#region Crear laser
if (detected && image_index = image_number-1){
	clock++;
} if(clock = 2){
	audio_play_sound(snd_detected, 100, 0);
} if (clock > 30){
	image_speed = 0.5;
	image_index = 0;
	new_inst = instance_create(x+lengthdir_x(20*image_xscale, image_angle), y+lengthdir_y(20*image_xscale, image_angle), obj_laser);
	new_inst.image_angle = image_angle;
	new_inst.image_xscale = long-20*image_xscale;
	new_inst.image_yscale = 2*image_yscale;
	new_inst.sp = -0.2*image_yscale;
	audio_play_sound(snd_laser, 100, 0);
	//Detener
	clock = 0;
	detected = 0;
}
if(new_inst != -1){
	if(instance_exists(new_inst) && collision_line(x, y, x+lengthdir_x(long, image_angle), y+lengthdir_y(long, image_angle), obj_player, 1, 1)){
		kill = true;
	}
}
#endregion
#region Atascar sprite
if (image_index = image_number-1){
	image_speed = 0;
	image_index = image_number-1;
}

//Otro
if (s < 5){
	s += 0.5;
} else s = 0;
#endregion
if(detected && image_index == image_number-1){
	clk++;
	if(clk <= 2){
		submg = 1;
	} else if(clk <= 4){
		submg = 0;
	} else {
		clk = 0;
	}
}
