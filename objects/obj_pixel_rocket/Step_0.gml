/// @description Procesador
if (pause) {exit;}
x += xdir;
y += ydir;
image_xscale += -0.1;
image_yscale += -0.1;
if (image_xscale < 0 or image_yscale < 0  or distance_to_object(obj_player) > ideal_width){
    instance_destroy();
}

