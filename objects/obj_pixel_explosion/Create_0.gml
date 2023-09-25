/// @description Inicializar

X = choose(random(50), random(-50));
Y = choose(random(50), random(-50));
S = choose(random(0.4)+1);
M = -0.05;

depth = -1;
image_xscale = S;
image_yscale = S;
if(hide_particles) instance_destroy();