/// @description Debug
draw_set_circle_precision(64);
draw_set_colour(c_white);
draw_set_alpha(al);
draw_circle(x, y, rad1, 0);
draw_set_alpha(1);

draw_self();
if (debug){
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text_transformed(x, y+25*image_yscale, string(image_angle), image_xscale, image_yscale, 0);
	draw_set_colour(-1);
	draw_set_halign(-1);
	if(instance_exists(obj_player)){
		if (!collision_line(x, y, obj_player.x, obj_player.y, obj_block, 1, 0) and !IsDead){
			draw_set_colour(c_fuchsia);
			draw_line(x, y, obj_player.x, obj_player.y);
			draw_set_colour(-1);
		} else {
			draw_set_colour(c_white);
			draw_set_alpha(0.5);
			draw_line(x, y, obj_player.x, obj_player.y);
			draw_set_alpha(1);
			draw_set_colour(-1);
		}
	}
}