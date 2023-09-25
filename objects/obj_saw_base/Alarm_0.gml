/// @description Preparar sierras
if(spawn_saw){
	new_inst = instance_create(x+lengthdir_x(15, image_angle+90)*image_xscale, y+lengthdir_y(15, image_angle+90)*image_yscale, obj_saw);
	new_inst.image_xscale = image_xscale;
	new_inst.image_yscale = image_yscale;
} //23