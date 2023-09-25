/// @description Debug y otras cosas
draw_set_circle_precision(64);
draw_set_colour(c_white);
draw_set_alpha(al);
draw_circle(x, y, rad1, 0);
draw_set_alpha(1);

draw_self();

if (debug){
    draw_set_colour(c_white);
    draw_set_halign(fa_left);
	if(instance_exists(obj_player)){
	    if (distance_to_object(obj_player) < rad-5){
	        draw_set_colour(c_fuchsia);
	        draw_line(x, y, obj_player.x, obj_player.y);
	    }
	}
    draw_set_halign(fa_center);
    draw_text_transformed(x, y-30*image_yscale, string_hash_to_newline(string(t)), image_xscale, image_yscale, 0);
}
draw_set_halign(-1);

