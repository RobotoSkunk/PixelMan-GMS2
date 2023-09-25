/// @description Valores por defecto
image_alpha = random_range(0.8, 1);
scale = random_range(0.5, 0.8);
image_yscale = scale;
image_xscale = scale;
if(instance_exists(obj_player)){
	xdir = random(0.6)*sign(obj_player.vv);
	ydir = random(0.6)*-obj_player.grav;
}
depth = -9;
