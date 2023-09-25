/// @description Procesador
if(restart){
	x = init_pos[0];
	y = init_pos[1];
	hspeed = 0;
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
	exit;
}

if(pause){
	hspeed = 0;
	exit;
}

if collision_line(x, y, x-w-1, y, obj_block, 0, 1) {
	dir = 1;
} else if collision_line(x, y, x+w+1, y, obj_block, 0, 1){
	dir = -1;
}
hspeed = obj_speed*dir;

/*if(round(obj_player.y + obj_player.sprite_height/2) > y + (sprite_height/2) && gr = 1){
	mask_index = -1;
} else if(round(obj_player.y - obj_player.sprite_height/2) < y - (sprite_height/2) && gr = -1){
	mask_index = -1;
} else {
	mask_index = spr;
}*/
mask_index = spr;