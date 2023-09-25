/// @description Dibujar ilusión
var xp, yp;
xp = x+irandom_range(-1, 1)*(!pause)*image_xscale;
yp = y+irandom_range(-1, 1)*(!pause)*image_yscale;
draw_sprite_ext(spr_mobile_saw, 0, xp, yp-5*image_yscale, image_xscale, image_yscale, ang, -1, 1);
draw_sprite_ext(sprite_index, image_index, x, y+a*gr, image_xscale, image_yscale, 0, -1, 1);
