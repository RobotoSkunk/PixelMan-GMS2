/// @description Procesador
if(restart){
	destroy = false;
	time = 0;
	mask_index = spr_special_block_1;
	sprite_index = spr_special_block_1;
	image_index = 0;
	image_alpha = 1;
	exit;
}

if (pause) {image_speed = 0; exit;}
var col_rocket = place_meeting(x, y, obj_rocket);
var col_laser = place_meeting(x-1, y-1, obj_laser) || place_meeting(x+1, y+1, obj_laser);
var col_bullet = place_meeting(x, y, obj_bullet);

if (col_rocket || col_laser || col_bullet){
	destroy = true;
}

if (destroy){
	time++;
	image_speed = 0.5;
	if (time > room_speed*0.3) {
		mask_index = -1;
		sprite_index = -1;
		image_alpha = 0;
	}
	time = clamp(time, 0, room_speed*0.4);
} else {
	image_speed = 0;
}
