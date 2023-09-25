/// @description Procesador
if(restart){
	hspeed = 0;
	vspeed = 0;
	image_speed = 0;
	image_index = 0;
	x = init_pos[0];
	y = init_pos[1];
	switch(start_in){
		case 0: //Right
			dir = 1;
			break;
		case 1: //Left
			dir = -1;
			break;
		default: //Left or Right
			dir = choose(-1, 1);
			break;
	}
	gr = init_grav;
	image_yscale = init_sz*gr;
	b = 0;
	exit;
}

if (pause){
	hspeed = 0;
	vspeed = 0;
	image_speed = 0;
	exit;
}
image_yscale = init_sz*gr;
image_speed = 0.08;
b++;
if(b > 6){
	b = 0;
}
if(b > 3){
	a = 1;
} else {
	a = 0;
}

if(dir != 0){
	var left = collision_line(x, y, x-15, y, obj_block, 0, 1);
	var right = collision_line(x, y, x+15, y, obj_block, 0, 1);
	if(right){
		dir = -1;
	} else if(left){
		dir = 1;
	}
}
desblock = collision_rectangle(x+14, y+7, x-14, y-7, obj_block, true, false);

if(place_meeting(x, y+(vs+2)*gr, obj_block) || place_meeting(x, y+sign(vs*gr)/2, obj_block) || collision_line(x, y, x, y+vs*gr, obj_block, true, false)){
	vs = 0;
} else {
	vs += 0.5;
	vs = clamp(vs, -vvsp*2, vvsp);
}
if (desblock != noone){
    for (var i = 0; i<abs(8); i++){
        if (!place_meeting(x, y+sign(vs*gr), obj_block)) then break;
        y += sign(-vs*gr);
    }
    /*for (var i = 0; i<abs(hspeed*hspeed); i++){
        if (!place_meeting(x+sign(hspeed), y, obj_block)) then break;
        x += sign(-hspeed);
    }*/
}

if(gr = 1){
	out_room = y > room_height + 50;
} else {
	out_room = y < -50;
}

if(x > room_width + 50 || x < -50 || out_room){
	//instance_destroy(saw);
	//saw = noone;
	//instance_destroy();
	hspeed = 0;
	vspeed = 0;
} else { //else if(saw != noone){
	hspeed = obj_speed*dir;
	vspeed = vs*gr;
}

/*if(saw != noone){
	saw.x = x+obj_speed*dir;
	saw.y = y-5*image_yscale;
}*/

ang += img_angle;
if(collision_circle(x, y-5*image_yscale, 6, obj_player, 1, 0)){
	kill = true;
}
