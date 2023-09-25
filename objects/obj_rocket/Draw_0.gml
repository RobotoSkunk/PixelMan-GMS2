/// @description Debug

draw_self();

if (debug){
    draw_set_colour(c_white);
    draw_set_halign(fa_center);
	if (!explode) draw_text_transformed(x, y-20*image_yscale, string_hash_to_newline(string(image_angle)), image_xscale, image_yscale, 0);
    draw_set_colour(c_fuchsia);
    draw_line(x, y, obj_player.x, obj_player.y);
}
draw_set_halign(-1);

