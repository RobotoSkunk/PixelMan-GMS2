/// @description Algunas cosas
#region Casillas
if(al_grd > 0.05){
	if(!ldm){
		draw_set_color(make_color_hsv(grd_hcolor, grd_scolor, 255));
		draw_set_alpha(al_grd);
		var grd_nmb_w = round((ideal_width*zoom)/grid_size)+2;
		var grd_nmb_h = round((ideal_height*zoom)/grid_size)+2;
		var grd_pos_x = grid_size*clamp(round(x_camera/grid_size), 0, (room_max/grid_size)-50);
		var grd_pos_y = grid_size*clamp(round(y_camera/grid_size), 0, (room_max/grid_size)-50);
		var zm_fix = (zoom + (1-editor_quality*1));
			
		if(y_camera > -ideal_height*zoom){
			for(var i = 0; i < grd_nmb_w+1; i++){
				var grd_pos = grid_size*i-(grid_size/2);
				var grd_min = -(grid_size/2);
				var grd_max = grid_size*grd_nmb_h-(grid_size/2);
	
	
				if(grd_pos_x+grd_pos > x_camera && grd_pos_x+grd_pos < x_camera+ideal_width*zoom){
					draw_line_width(grd_pos_x+grd_pos-1, grd_pos_y+grd_min-1, grd_pos_x+grd_pos-1, grd_pos_y+grd_max-1, 0.5*zm_fix);
				}
			}
		}
		
		if(x_camera > -ideal_width*zoom){
			for(var i = 0; i < grd_nmb_h+1; i++){
				var grd_pos = grid_size*i-(grid_size/2);
				var grd_min = -(grid_size/2);
				var grd_max = grid_size*grd_nmb_w-(grid_size/2);
	
				if(grd_pos_y+grd_pos > y_camera && grd_pos_y+grd_pos < y_camera+ideal_height*zoom){
					draw_line_width(grd_pos_x+grd_min-1, grd_pos_y+grd_pos-1, grd_pos_x+grd_max-1, grd_pos_y+grd_pos-1, 0.5*zm_fix);
				}
	
			}
		}
	} else {
		var spr_grd_w = sprite_get_width(spr_grid);
		var grd_sz = grid_size/16;
		var grd_nmb_w = round((ideal_width*zoom)/(spr_grd_w*grd_sz))+1;
		var grd_nmb_h = round((ideal_height*zoom)/(spr_grd_w*grd_sz))+1;
		var grd_pos_x = (spr_grd_w*grd_sz)*clamp(round_down(x_camera/(spr_grd_w*grd_sz)), 0, (room_max-(spr_grd_w*grd_sz)));
		var grd_pos_y = (spr_grd_w*grd_sz)*clamp(round_down(y_camera/(spr_grd_w*grd_sz)), 0, (room_max-(spr_grd_w*grd_sz)));
		
		for(var ix = 0; ix < grd_nmb_w; ix++){
			for(var iy = 0; iy < grd_nmb_h; iy++){
				draw_sprite_ext(spr_grid, 0, grd_pos_x + (spr_grd_w*grd_sz)*ix, grd_pos_y + (spr_grd_w*grd_sz)*iy, grd_sz, grd_sz, 0, make_color_hsv(grd_hcolor, grd_scolor, 255), al_grd);
			}
		}
	}
}
#endregion
#region Previsualizar objeto para colocar
if(prev_obj && can_preview){
	if(snap){
		var new_x = round(mouseX/grid_size)*grid_size;
		var new_y = round(mouseY/grid_size)*grid_size;
	} else {
		var new_x = round(mouseX);
		var new_y = round(mouseY);
	}
	if(prev_instance != -1){
		if(instance_exists(prev_instance)){
			if(prev_instance.type == type){
				var spr_obj = prev_instance.sprite_index;
				var subimg = prev_instance.image_index;
				var img_xscale = prev_instance.image_xscale;
				var img_yscale = prev_instance.image_yscale*prev_instance.gr
				var img_ang = prev_instance.image_angle;
				draw_sprite_ext(spr_obj, subimg, new_x, new_y, img_xscale, img_yscale, img_ang, -1, 0.3);
			} else {
				draw_sprite_ext(obj_sprites[type], 0, new_x, new_y, 1, 1, 0, -1, 0.3);
			}
		}
	} else {
		draw_sprite_ext(obj_sprites[type], 0, new_x, new_y, 1, 1, 0, -1, 0.3);
	}
}
#endregion
#region Puntos por donde pasó el jugador
if(player_path[2, 3] && draw_test_path){
	draw_set_alpha(1);
	draw_set_color(c_lime);
	for(var i = 0; i < array_length_2d(player_path, 0)-1; i++){
		if(player_path[0, i] > x_camera && player_path[0, i] < x_camera+ideal_width*zoom && player_path[1, i] > y_camera && player_path[1, i] < y_camera+ideal_height*zoom){
			draw_set_alpha(i/array_length_2d(player_path, 0));
			draw_line_width(player_path[0, i], player_path[1, i], player_path[0, i+1], player_path[1, i+1], 0.5*zoom);
		}
	}
	draw_set_color(c_aqua);
	for(var i = 0; i < array_length_2d(player_path, 3)-1; i++){
		if(player_path[3, i] > x_camera && player_path[3, i] < x_camera+ideal_width*zoom && player_path[4, i] > y_camera && player_path[4, i] < y_camera+ideal_height*zoom){
			draw_set_alpha(i/array_length_2d(player_path, 3));
			draw_line_width(player_path[3, i], player_path[4, i], player_path[3, i+1], player_path[4, i+1], 0.5*zoom);
		}
	}
	draw_set_color(-1);
	draw_set_alpha(1);
	if(player_path[2, 2]){
		draw_sprite(spr_mark, 0, player_path[2, 0]+0.5, player_path[2, 1]+0.5);
	}
}
#endregion
#region Multiselección
if(al > 0.1){
	draw_set_color(c_teal);
	draw_set_alpha(0.3*al);
	draw_rectangle(xs, ys, xs1, ys1, 0);
	draw_set_alpha(al);
	
	draw_rectangle_border(xs, ys, xs1, ys1, zoom);
}
#endregion
draw_set_alpha(1);
draw_set_color(-1);
