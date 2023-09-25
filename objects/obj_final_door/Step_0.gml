/// @description Procesador
if(restart){
	alarm[0] = 5;
	open = false;
	image_index = 0;
	image_speed = 0;
}

if(!lvl_start){
	alarm[0] = 5;
}

if(open){
	if(place_meeting(x, y, obj_player)){
		won = true;
	}
	
	if (image_index > image_number-1){
		image_speed = 0;
		image_index = image_number-1;
	} else {
		image_speed = 0.8;
	}
}
