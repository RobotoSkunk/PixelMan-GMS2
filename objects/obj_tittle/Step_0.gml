/// @description Procesador

if(grow){
	scale += 0.025;
} else {
	scale -= 0.025;
}

if (rotate){
	angle -= 0.15;
} else {
	angle += 0.15;
}

image_xscale += sin(degtorad(scale - image_xscale))*2;
image_yscale += sin(degtorad(scale - image_yscale))*2;
image_angle += sin(degtorad(angle - image_angle))*2;

scale = clamp(scale, 0.5, 1.5);
angle = clamp(angle, -12, 12);
image_angle = clamp(image_angle, -12, 12);
image_xscale = clamp(image_xscale, 0.5, 1.5);
image_yscale = clamp(image_yscale, 0.5, 1.5);
