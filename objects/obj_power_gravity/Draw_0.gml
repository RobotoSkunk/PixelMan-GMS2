/// @description Dibujar interfaz
if(ratio > 1){
	draw_set_alpha(1-(ratio/max_ratio));
	draw_set_color(c_white);
	draw_set_circle_precision(44);
	draw_circle(x-0.5, y-0.5, ratio, 0);
	draw_set_circle_precision(22);
	draw_set_color(-1);
	draw_set_alpha(1);
}
draw_self();
if (line < 20){
    draw_set_alpha(0.5);
    draw_line_width(x+10*image_xscale, y-15*image_yscale, x-10*image_xscale, y-15*image_yscale, image_xscale);
    draw_set_alpha(1);
    draw_line_width(x+(line-10)*image_xscale, y-15*image_yscale, x-10*image_xscale, y-15*image_yscale, image_xscale);
} else {
    draw_sprite_ext(spr_gravity, 1, x, y, image_xscale, image_yscale, rot[0], -1, 1);
}
if (debug){
    draw_set_halign(fa_center);
    draw_text_transformed(x, y+15*image_yscale, string_hash_to_newline(string(line)), image_xscale, image_yscale, 0);
    draw_set_halign(-1);
}

