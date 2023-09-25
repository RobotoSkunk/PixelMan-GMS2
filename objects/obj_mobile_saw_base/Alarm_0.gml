/// @description Crear sierra
//saw = instance_create_depth(x, y-5*image_yscale*gr, depth+1, obj_mobile_saw);
init_sz = image_yscale;
//image_yscale = image_yscale*gr;
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
init_grav = gr;
