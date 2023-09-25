/// @description Valores por defecto
image_alpha = random_range(0.8, 1);
scale = random_range(1, 1.2)*image_xscale;
depth = 3;
image_yscale = scale;
image_xscale = scale;
xdir = random(0.6)*choose(-1, 1)*image_xscale;
ydir = random(0.6)*choose(-1, 1)*image_xscale;
if(hide_particles) instance_destroy();