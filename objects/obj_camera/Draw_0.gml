/// @description Varias cosas
#region Debug
if (debug){
    draw_set_alpha(0.5);
    draw_set_colour(c_red);
    draw_line(0, obj_player.y, obj_player.x, obj_player.y);
    draw_set_colour(c_blue);
    draw_line(obj_player.x, 0, obj_player.x, obj_player.y);
    draw_set_colour(c_yellow);
    draw_line(0, mouseY, mouseX, mouseY);
    draw_line(mouseX, 0, mouseX, mouseY);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_text_transformed(mouseX+5, mouseY-5, string_hash_to_newline(string(mouseX)), 0.8, 0.8, 0);
    draw_set_halign(fa_center);
    draw_text_transformed(mouseX, mouseY+5, string_hash_to_newline(string(mouseY)), 0.8, 0.8, 0);
}
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_colour(c_white);
#endregion
#region Puntos por donde pasó el jugador
if(room == rm_editor && instance_exists(obj_player) && draw_test_path){
	if(!pant_div){
		#region Un jugador
		var player_x = obj_player.x;
		var player_y = obj_player.y;
		if(obj_player.speed != 0 && moment[0] < test_nmb){
			mfix[0]++;
			if(mfix[0] >= path_quality){
				player_path[0, moment[0]] = player_x;
				player_path[1, moment[0]] = player_y;
				moment[0]++;
				mfix[0] = 0;
			}
		} else if(obj_player.speed != 0){
			mfix[0]++;
			if(mfix[0] >= path_quality){
				player_path[0, test_nmb-1] = player_x;
				player_path[1, test_nmb-1] = player_y;
				for(var i = 0; i < array_length_2d(player_path, 0)-1; i++){
					player_path[0, i] = player_path[0, i+1];
					player_path[1, i] = player_path[1, i+1];
				}
				mfix[0] = 0;
			}
		}
		draw_set_color(c_lime);
		for(var i = 0; i < array_length_2d(player_path, 0)-1; i++){
			if(player_path[0, i] > x_camera && player_path[0, i] < x_camera+ideal_width*zoom && player_path[1, i] > y_camera && player_path[1, i] < y_camera+ideal_height*zoom){
				draw_set_alpha(i/array_length_2d(player_path, 0));
				draw_line_width(player_path[0, i], player_path[1, i], player_path[0, i+1], player_path[1, i+1], 0.5*zoom);
			}
		}
		draw_set_color(-1);
		draw_set_alpha(1);
		#endregion
	} else {
		#region Dos jugadores
		for(var i = 0; i < 2; i++){
			if(player_id[i] != -1){
				var player_x = player_id[i].x;
				var player_y = player_id[i].y;
				var address_x = 3*(i % 2);
				var address_y = 1+3*(i % 2);
				if(player_id[i].speed != 0 && moment[i] < round(test_nmb/2)){
					mfix[i]++;
					if(mfix[i] >= path_quality){
						player_path[address_x, moment[i]] = player_x;
						player_path[address_y, moment[i]] = player_y;
						moment[i]++;
						mfix[i] = 0;
					}
				} else if(player_id[i].speed != 0){
					mfix[i]++;
					if(mfix[i] >= path_quality){
						player_path[address_x, array_length_2d(player_path, address_x)-1] = player_x;
						player_path[address_y, array_length_2d(player_path, address_x)-1] = player_y;
						for(var ia = 0; ia < array_length_2d(player_path, address_x)-1; ia++){
							if(ia > -1){
								player_path[address_x, ia] = player_path[address_x, ia+1];
								player_path[address_y, ia] = player_path[address_y, ia+1];
							}
						}
						mfix[i] = 0;
					}
				}
				if(i == 0){
					draw_set_color(c_lime);
				} else {
					draw_set_color(c_aqua);
				}
				var cam_pos, cam_sz;
				cam_pos = [camera_get_view_x(view_camera[i]), camera_get_view_y(view_camera[i])];
				cam_sz = [camera_get_view_width(view_camera[i]), camera_get_view_height(view_camera[i])];
				
				for(var ib = 0; ib < array_length_2d(player_path, address_x)-1; ib++){
					if(player_path[address_x, ib] > cam_pos[0] && player_path[address_x, ib] < cam_pos[0]+cam_sz[0] && player_path[address_y, ib] > cam_pos[1] && player_path[address_y, ib] < cam_pos[1]+cam_sz[1]){
						draw_set_alpha(ib/array_length_2d(player_path, address_x));
						draw_line_width(player_path[address_x, ib], player_path[address_y, ib], player_path[address_x, ib+1], player_path[address_y, ib+1], 0.5*zoom);
					}
				}
				draw_set_color(-1);
				draw_set_alpha(1);
			}
		}
		#endregion
	}
	
	var player_death_x = obj_player.x;
	var player_death_y = obj_player.y;
	if(IsDead && !won){
		draw_sprite(spr_mark, 0, player_death_x+0.5, player_death_y+0.5);
		 player_path[2, 0] = player_death_x;
		 player_path[2, 1] = player_death_y;
		 player_path[2, 2] = true;
	}
	player_path[2, 3] = true;
}
#endregion
