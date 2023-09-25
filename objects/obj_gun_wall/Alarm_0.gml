/// @description Desfase de tiempo
if(start_time > 0.1){
	alarm[1] = room_speed*start_time;
} else {
	alarm[1] = room_speed*0.1;
}