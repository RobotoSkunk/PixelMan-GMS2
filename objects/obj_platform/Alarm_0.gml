/// @description Establecer valores
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
switch(tp){
	case 0:
		spr = spr_platform_0;
		w = 8;
		break;
	case 1:
		spr = spr_platform_1;
		w = 23;
		break;
	default:
		spr = spr_platform_2;
		w = 38;
		break;
}
/*if(gr = -1){
	image_yscale = -1;
}