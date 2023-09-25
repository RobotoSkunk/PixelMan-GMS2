/// @description Inicializar

X = choose(random(25), random(-25))*image_xscale;
Y = choose(random(25), random(-25))*image_xscale;
S = choose(random(0.2)+0.5)*image_xscale;
M = -0.06*image_xscale;

depth = -1;
image_xscale = S;
image_yscale = S;
if(hide_particles) instance_destroy();