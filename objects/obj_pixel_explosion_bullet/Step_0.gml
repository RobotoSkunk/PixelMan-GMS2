/// @description Procesador
if (pause) {
	hspeed = 0;
	vspeed = 0;
	exit;
}
hspeed = lerp(hspeed, X, 0.01);
vspeed = lerp(vspeed, Y, 0.01);
image_xscale += M;
image_yscale += M;

if (image_xscale < 0 or image_yscale < 0  or distance_to_object(obj_player) > ideal_width){
    instance_destroy();
}

