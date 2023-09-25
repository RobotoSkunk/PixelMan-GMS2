/// @description Debug y otras cosas
#region Advertencias
if (detected && image_index == image_number-1){
	draw_sprite_ext(spr_laser_gun_line, 0, x, y, image_xscale, image_yscale, image_angle, -1, submg);
}
if (image_index != image_number-1){
	draw_set_alpha(0.5);
	draw_line_width(x+lengthdir_x(20, image_angle), y+lengthdir_y(20, image_angle), x+lengthdir_x(long, image_angle), y+lengthdir_y(long, image_angle), image_xscale);
	draw_set_alpha(1);
} else if (!detected){
	if(instance_number(obj_player) < 2){
		var a, b, px, py, cam_x, cam_y, cam_w, cam_h;
		for(var i = 0; i < round(long/6/image_xscale); i++){
			a = lengthdir_x(6, image_angle)*i*image_xscale;
			b = lengthdir_y(6, image_angle)*i*image_yscale;
			px = x+a; py = y+b;
			cam_x = x_camera; cam_y = y_camera;
			cam_w = ideal_width*zoom; cam_h = ideal_height*zoom;
			
			if((px > cam_x && px < cam_x+cam_w && py > cam_y && py < cam_y+cam_h)){
				draw_sprite_ext(spr_pointed_line, s, px, py, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			}
		}
	} else {
		var a, b, px, py, cam_x, cam_y, cam_w, cam_h;
		for(var i = 0; i < round(long/6/image_xscale); i++){
			a = lengthdir_x(6, image_angle)*i*image_xscale;
			b = lengthdir_y(6, image_angle)*i*image_yscale;
			px = x+a; py = y+b;
			cam_x[0] = camera_get_view_x(view_camera[0]); cam_y[0] = camera_get_view_y(view_camera[0]);
			cam_w[0] = camera_get_view_width(view_camera[0]); cam_h[0] = camera_get_view_height(view_camera[0]);
			cam_x[1] = camera_get_view_x(view_camera[1]); cam_y[1] = camera_get_view_y(view_camera[1]);
			cam_w[1] = camera_get_view_width(view_camera[1]); cam_h[1] = camera_get_view_height(view_camera[1]);
			
			if((px > cam_x[0] && px < cam_x[0]+cam_w[0] && py > cam_y[0] && py < cam_y[0]+cam_h[0])
			|| (px > cam_x[1] && px < cam_x[1]+cam_w[1] && py > cam_y[1] && py < cam_y[1]+cam_h[1])){
				draw_sprite_ext(spr_pointed_line, s, px, py, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			}
		}
	}
} else {
	draw_set_alpha(submg);
	draw_line_width(x+lengthdir_x(20, image_angle), y+lengthdir_y(20, image_angle), x+lengthdir_x(long, image_angle), y+lengthdir_y(long, image_angle), image_xscale);
	draw_set_alpha(1);
}
#endregion
draw_self();
#region Debug
if (debug){
	draw_set_color(c_fuchsia);
	draw_line_width(x, y, x+lengthdir_x(long, image_angle), y+lengthdir_y(long, image_angle), image_xscale);
	draw_set_colour(c_yellow);
	draw_circle(xl, yl, 2, 0);
	draw_set_color(-1);
}
#endregion
