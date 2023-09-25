/// @description Procesador
if (pause) {exit;}
x += xdir;
y += ydir;
image_xscale += -0.05;
image_yscale += -0.05;
if (image_xscale < 0 or image_yscale < 0){
    instance_destroy();
}

