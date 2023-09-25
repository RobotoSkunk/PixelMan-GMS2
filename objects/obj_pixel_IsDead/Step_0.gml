/// @description Procesador

hspeed = lerp(hspeed, X, 0.01);
vspeed = lerp(vspeed, Y, 0.01);
image_xscale += -0.05;
image_yscale += -0.05;

if (image_xscale < 0 || image_yscale < 0){
    instance_destroy();
}

