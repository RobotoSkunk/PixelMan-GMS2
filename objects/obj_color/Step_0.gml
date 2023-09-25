/// @description CPU
can_use = (menu_active == 2);
if(can_use){
	al = lerp(al, 1, 0.1);
} else {
	al = lerp(al, 0, 0.1);
}
