/// @description Dibujar registro
var cw = ideal_width/2;
var ch = ideal_height/2;
obj_button = 1;
#region Animación
if(acc){
	desp = (1)-sz;
	sp += (0.05 * desp) - (0.19 * sp);
	sz += sp;
	al = lerp(al, 0.6, 0.4);
	obj_button.can_use = false;
	//obj_exit_game.can_use = false;
} else {
	sz = lerp(sz, 0, 0.4);
	al = lerp(al, 0, 0.4);
}
if(al > 0.1){
	draw_set_color(c_black);
	draw_set_alpha(al);
	draw_rectangle(0, 0, ideal_width, ideal_height, 0);
}
#endregion
#region Registro
if(sz > 0.1){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_rectangle(cw-sides*sz, ch-top*sz, cw+sides*sz, ch+bottom*sz, 0);
	draw_set_color(c_black);
	draw_rectangle(cw-(sides-5)*sz, ch-(top-5)*sz, cw+(sides-5)*sz, ch+(bottom-5)*sz, 0);
	
	if(!account_in){
		#region Si no se encuentra una cuenta registrada
		if(!logreg){
			#region Control panel
			if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-140, ch+23, cw-5, ch+43) and acc){
				draw_set_color($dbdbdb);
				draw_rectangle(cw-140*sz, ch+23*sz, cw-5*sz, ch+43*sz, 0);
				if mouse_check_button_released(mb_left) {
					acc = false;
					obj_button.can_use = true;
					//obj_exit_game.can_use = true;
				}
			} else { 
				draw_set_color($a0a0a0);
				draw_rectangle(cw-140*sz, ch+23*sz, cw-5*sz, ch+43*sz, 0);
			}
	
			if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+5, ch+23, cw+140, ch+43) and acc){
				draw_set_color($dbdbdb);
				draw_rectangle(cw+140*sz, ch+23*sz, cw+5*sz, ch+43*sz, 0);
				if mouse_check_button_released(mb_left) {
					logreg = true;
				}
			} else {
				draw_set_color($a0a0a0);
				draw_rectangle(cw+140*sz, ch+23*sz, cw+5*sz, ch+43*sz, 0);
			}
		
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_font(fnt_roboto);
			if(languaje != "Español"){
				draw_text_transformed(cw, ch-10*sz, text[50], sz, sz, 0);
			} else {
				draw_text_transformed(cw, ch-10*sz, text[50], sz-0.2, sz-0.2, 0);
			}
			draw_set_valign(fa_middle);
			draw_text_transformed(cw+72.5*sz, ch+34*sz, text[51], sz, sz, 0);
			draw_text_transformed(cw-72.5*sz, ch+34*sz, text[52], sz, sz, 0);
	
			draw_set_font(-1);
			draw_set_halign(-1);
			draw_set_valign(-1);
			draw_set_color(-1);
			#endregion
		} else {
			if(!get_acc and !set_acc){
				answer = "";
				top = lerp(top, 70, 0.3);
				bottom = lerp(bottom, 95, 0.3);
				sides = lerp(sides, 100, 0.3);
				
				#region Register/Login
				if(reg){
					#region Register
					#region Switch
					draw_set_color(c_white);
					draw_rectangle(cw, ch-(top+25)*sz, cw+sides*sz, ch-top*sz, 0);
					draw_rectangle(cw-sides*sz, ch-(top+25)*sz, cw, ch-top*sz, 0);
					draw_set_color(c_black);
					draw_rectangle(cw+2.5*sz, ch-(top+20)*sz, cw+(sides-5)*sz, ch-(top-15)*sz, 0);
				
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-5), ch-(top+20), cw-2.5, ch-top) and acc){
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-5)*sz, ch-(top+20)*sz, cw-2.5*sz, ch-top*sz, 0);
						if mouse_check_button_released(mb_left) {
							reg = false;
							user = "";
							email = "";
							password = "";
							repeat_pass = "";
						}
					} else { 
						draw_set_color(c_black);
						draw_rectangle(cw-(sides-5)*sz, ch-(top+20)*sz, cw-2.5*sz, ch-top*sz, 0);
					}
				
				
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					draw_set_font(fnt_roboto);
					draw_text_transformed(lerp(cw-sides*sz, cw, 0.5), ch-(top+10)*sz, text[63], sz, sz, 0);
					draw_text_transformed(lerp(cw, cw+sides*sz, 0.5), ch-(top+10)*sz, text[86], sz, sz, 0);
					#endregion
					draw_set_color(c_white);
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					draw_set_font(fnt_roboto);
					
					#region Fields
					
					draw_text_transformed(cw-(sides-8)*sz, ch-(top-13)*sz, text[53], 0.7*sz, 0.7*sz, 0);
					draw_text_transformed(cw-(sides-8)*sz, ch-(top-44)*sz, "E-mail", 0.7*sz, 0.7*sz, 0);
					draw_text_transformed(cw-(sides-8)*sz, ch-(top-76)*sz, text[54], 0.7*sz, 0.7*sz, 0);
					draw_text_transformed(cw-(sides-8)*sz, ch-(top-107)*sz, text[55], 0.7*sz, 0.7*sz, 0);
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-8), ch-(top-18), cw+(sides-8), ch-(top-38)) and acc){
						if mouse_check_button_released(mb_left) {
							btn = 1;
							keyboard_string = user;
						}
					} else 
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-8), ch-(top-49), cw+(sides-8), ch-(top-69)) and acc){
						if mouse_check_button_released(mb_left) {
							btn = 2;
							keyboard_string = email;
						}
					} else 
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-8), ch-(top-81), cw+(sides-29), ch-(top-101)) and acc){
						if mouse_check_button_released(mb_left) {
							btn = 3;
							keyboard_string = password;
						}
					} else 
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-8), ch-(top-112), cw+(sides-8), ch-(top-132)) and acc){
						if mouse_check_button_released(mb_left) {
							btn = 4;
							keyboard_string = repeat_pass;
						}
					} else {
						if mouse_check_button_released(mb_left) {
							btn = 0;
						}
					}
					if btn == 1 {draw_set_color(c_red); user = keyboard_string;} else draw_set_color(c_white);
					draw_rectangle(cw-(sides-8)*sz, ch-(top-18)*sz, cw+(sides-8)*sz, ch-(top-38)*sz, 0);
					if btn == 2 {draw_set_color(c_red); email = keyboard_string;} else draw_set_color(c_white);
					draw_rectangle(cw-(sides-8)*sz, ch-(top-49)*sz, cw+(sides-8)*sz, ch-(top-69)*sz, 0);
					if btn == 3 {draw_set_color(c_red); password = keyboard_string;} else draw_set_color(c_white);
					draw_rectangle(cw-(sides-8)*sz, ch-(top-81)*sz, cw+(sides-29)*sz, ch-(top-101)*sz, 0);
					if btn == 4 {draw_set_color(c_red); repeat_pass = keyboard_string;} else draw_set_color(c_white);
					draw_rectangle(cw-(sides-8)*sz, ch-(top-112)*sz, cw+(sides-8)*sz, ch-(top-132)*sz, 0);
				
					draw_set_color(c_black);
					draw_rectangle(cw-(sides-9)*sz, ch-(top-19)*sz, cw+(sides-9)*sz, ch-(top-37)*sz, 0);
					draw_rectangle(cw-(sides-9)*sz, ch-(top-50)*sz, cw+(sides-9)*sz, ch-(top-68)*sz, 0);
					draw_rectangle(cw-(sides-9)*sz, ch-(top-82)*sz, cw+(sides-30)*sz, ch-(top-100)*sz, 0);
					draw_rectangle(cw-(sides-9)*sz, ch-(top-113)*sz, cw+(sides-9)*sz, ch-(top-131)*sz, 0);
				
					draw_set_color(c_white)
					txtsz[0] = clamp((sides-10)*2/string_width(user), 0, 1);
					txtsz[1] = clamp((sides-10)*2/string_width(email), 0, 1);
					draw_text_transformed(cw-(sides-10)*sz, ch-(top-28)*sz, user, txtsz[0]*sz, txtsz[0]*sz, 0);
					draw_text_transformed(cw-(sides-10)*sz, ch-(top-59)*sz, email, txtsz[1]*sz, txtsz[1]*sz, 0);
					if(show_pass){
						txtsz[2] = clamp((sides-20)*2/string_width(password), 0, 1);
						txtsz[3] = clamp((sides-10)*2/string_width(repeat_pass), 0, 1);

						draw_text_transformed(cw-(sides-10)*sz, ch-(top-91)*sz, password, txtsz[2]*sz, txtsz[2]*sz, 0);
						draw_text_transformed(cw-(sides-10)*sz, ch-(top-122)*sz, repeat_pass, txtsz[3]*sz, txtsz[3]*sz, 0);
					} else {
						var hide = ["", ""];
						repeat string_length(password) hide[0] += "*";
						repeat string_length(repeat_pass) hide[1] += "*";
						
						txtsz[2] = clamp((sides-20)*2/string_width(hide[0]), 0, 1);
						txtsz[3] = clamp((sides-10)*2/string_width(hide[1]), 0, 1);
					
						draw_text_transformed(cw-(sides-10)*sz, ch-(top-91-(5*txtsz[2]))*sz, hide[0], txtsz[2]*sz, txtsz[2]*sz, 0);
						draw_text_transformed(cw-(sides-10)*sz, ch-(top-122-(5*txtsz[3]))*sz, hide[1], txtsz[3]*sz, txtsz[3]*sz, 0);
					}
				
					draw_sprite_ext(spr_button_tf, show_pass, cw+(sides-18)*sz, ch-(top-91)*sz, sz, sz, 0, -1, 1);
				
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+(sides-29), ch-(top-75), cw+(sides-2), ch-(top-109)) and acc){
						if mouse_check_button_released(mb_left) {
							switch(show_pass){
								case 1: show_pass = 0; break;
								default: show_pass = 1; break;
							}
						}
					}
					#endregion
					
					draw_set_halign(fa_center);
					#region Buttons
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10), ch+(bottom-27), cw-5, ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							acc = false;
							obj_button.can_use = true;
							//obj_exit_game.can_use = true;
						}
					} else { 
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
					}
	
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+5, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							set_acc = true;
							if(string_length(string_replace_all(password, " ", "")) < 6){
								set_acc = false;
								sit = 2;
								sitalph = 5;
							} else if(password != repeat_pass){
								set_acc = false;
								sit = 3;
								sitalph = 5;
							} else if(!string_is_email(email)){
								set_acc = false;
								sit = 1;
								sitalph = 5;
							} else if(string_length(string_replace_all(user, " ", "")) < 3){
								set_acc = false;
								sit = 0;
								sitalph = 5;
							} else {
								set_acc = false;
								move_to_room = true;
								alarm[3] = room_speed*0.6;
								//email = string_lower(email);
								//var col = dec_to_hex(hsv[0]);
								//col = col + dec_to_hex(hsv[1]);
								//col = col + dec_to_hex(hsv[2]);
								//post = http_post_string("http://pixelmanserver.000webhostapp.com/user_register.php", "name=" + user + "&email=" + email + "&pass=" + password + "&player=" + string(spr_player) + "&color=" + col);
							}
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
					}
				
					draw_set_color(c_white);
					draw_text_transformed(lerp(cw+5*sz, cw+(sides-10)*sz, 0.5), ch+(bottom-16)*sz, text[56], sz, sz, 0);
					draw_text_transformed(lerp(cw-(sides-10)*sz, cw-5*sz, 0.5), ch+(bottom-16)*sz, text[52], sz, sz, 0);
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
					#endregion
				} else {
					#region Login
					#region Switch
					draw_set_color(c_white);
					draw_rectangle(cw, ch-(top+25)*sz, cw+sides*sz, ch-top*sz, 0);
					draw_rectangle(cw-sides*sz, ch-(top+25)*sz, cw, ch-top*sz, 0);
					draw_set_color(c_black);
					draw_rectangle(cw-(sides-5)*sz, ch-(top+20)*sz, cw-2.5*sz, ch-(top-15)*sz, 0);
				
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+2.5, ch-(top+20), cw+(sides-5), ch-top) and acc){
						draw_set_color($a0a0a0);
						draw_rectangle(cw+2.5*sz, ch-(top+20)*sz, cw+(sides-5)*sz, ch-top*sz, 0);
						if mouse_check_button_released(mb_left) {
							reg = true;
							user = "";
							email = "";
							password = "";
							repeat_pass = "";
						}
					} else { 
						draw_set_color(c_black);
						draw_rectangle(cw+2.5*sz, ch-(top+20)*sz, cw+(sides-5)*sz, ch-top*sz, 0);
					}
				
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					draw_set_font(fnt_roboto);
					draw_text_transformed(lerp(cw-sides*sz, cw, 0.5), ch-(top+10)*sz, text[63], sz, sz, 0);
					draw_text_transformed(lerp(cw, cw+sides*sz, 0.5), ch-(top+10)*sz, text[86], sz, sz, 0);
					#endregion
					draw_set_color(c_white);
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					draw_set_font(fnt_roboto);
					
					#region Fields
					draw_text_transformed(cw-(sides-8)*sz, ch-(top-13)*sz, "E-mail", 0.7*sz, 0.7*sz, 0);
					draw_text_transformed(cw-(sides-8)*sz, ch-(top-44)*sz, text[54], 0.7*sz, 0.7*sz, 0);
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-8), ch-(top-18), cw+(sides-8), ch-(top-38)) and acc){
						if mouse_check_button_released(mb_left) {
							btn = 1;
							keyboard_string = email;
						}
					} else 
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-8), ch-(top-49), cw+(sides-29), ch-(top-69)) and acc){
						if mouse_check_button_released(mb_left) {
							btn = 2;
							keyboard_string = password;
						}
					} else {
						if mouse_check_button_released(mb_left) {
							btn = 0;
						}
					}
					if btn == 1 {draw_set_color(c_red); email = keyboard_string;} else draw_set_color(c_white);
					draw_rectangle(cw-(sides-8)*sz, ch-(top-18)*sz, cw+(sides-8)*sz, ch-(top-38)*sz, 0);
					if btn == 2 {draw_set_color(c_red); password = keyboard_string;} else draw_set_color(c_white);
					draw_rectangle(cw-(sides-8)*sz, ch-(top-49)*sz, cw+(sides-29)*sz, ch-(top-69)*sz, 0);
				
					draw_set_color(c_black);
					draw_rectangle(cw-(sides-9)*sz, ch-(top-19)*sz, cw+(sides-9)*sz, ch-(top-37)*sz, 0);
					draw_rectangle(cw-(sides-9)*sz, ch-(top-50)*sz, cw+(sides-30)*sz, ch-(top-68)*sz, 0);
				
					draw_set_color(c_white)
					txtsz[0] = clamp((sides-10)*2/string_width(email), 0, 1);
					
					draw_text_transformed(cw-(sides-10)*sz, ch-(top-28)*sz, email, txtsz[0]*sz, txtsz[0]*sz, 0);
					
					if(show_pass){
						txtsz[2] = clamp((sides-20)*2/string_width(password), 0, 1);

						draw_text_transformed(cw-(sides-10)*sz, ch-(top-59)*sz, password, txtsz[2]*sz, txtsz[2]*sz, 0);
					} else {
						var hide = ["", ""];
						repeat string_length(password) hide[0] += "*";
						
						txtsz[2] = clamp((sides-20)*2/string_width(hide[0]), 0, 1);
	
						draw_text_transformed(cw-(sides-10)*sz, ch-(top-59-(5*txtsz[2]))*sz, hide[0], txtsz[2]*sz, txtsz[2]*sz, 0);
					}
				
					draw_sprite_ext(spr_button_tf, show_pass, cw+(sides-18)*sz, ch-(top-59)*sz, sz, sz, 0, -1, 1);
				
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+(sides-29), ch-(top-45), cw+(sides-2), ch-(top-79)) and acc){
						if mouse_check_button_released(mb_left) {
							switch(show_pass){
								case 1: show_pass = 0; break;
								default: show_pass = 1; break;
							}
						}
					}
					#endregion
					
					draw_set_halign(fa_center);
					#region Buttons
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10), ch+(bottom-27), cw-5, ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							acc = false;
							obj_button.can_use = true;
							//obj_exit_game.can_use = true;
						}
					} else { 
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
					}
	
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+5, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							get_acc = true;
							if(string_length(string_replace_all(password, " ", "")) < 1){
								get_acc = false;
								sit = 5;
								sitalph = 5;
							}else if(string_length(string_replace_all(email, " ", "")) < 1){
								get_acc = false;
								sit = 4;
								sitalph = 5;
							} else if(!string_is_email(email)){
								get_acc = false;
								sit = 1;
								sitalph = 5;
							} else {
								get_acc = false;
								alarm[3] = room_speed*0.6;
								move_to_room = true;
								//email = string_lower(email);
								//post = http_post_string("http://pixelmanserver.000webhostapp.com/user_login.php", "email=" + email + "&pass=" + password);
							}
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
					}
				
					draw_set_color(c_white);
					draw_text_transformed(lerp(cw+5*sz, cw+(sides-10)*sz, 0.5), ch+(bottom-16)*sz, text[63], sz, sz, 0);
					draw_text_transformed(lerp(cw-(sides-10)*sz, cw-5*sz, 0.5), ch+(bottom-16)*sz, text[52], sz, sz, 0);
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
					#endregion
				}
				#endregion
				
			} else if(set_acc){
				#region Respuesta del servidor
				if(os_is_network_connected()){
					if(answer == ""){
						#region Checking
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 30, 0.3);
						sides = lerp(sides, 130, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[79], sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
					} else if (answer == "success"){
						#region Successfully!
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 60, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[87], sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								//obj_exit_game.can_use = true;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
					} else if (answer == "exists_1"){
						#region The email exists
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 60, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[61], sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								set_acc = false;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
					} else if (answer == "exists_2"){
						#region The user exists
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 60, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[62], sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								set_acc = false;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
					} else if(answer != ""){
						#region FATAL_ERROR_NET_X
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 80, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, string_hash_to_newline(answer + "#Please report this bug"), sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								////obj_exit_game.can_use = true;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
					}
				} else {
					#region No Internet connection
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 80, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[88], sz, sz, 0);
						
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								//obj_exit_game.can_use = true;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
				}
				#endregion
			} else if(get_acc){
				#region Respuesta del servidor
				if(os_is_network_connected()){
					if(answer == ""){
						#region Checking
							top = lerp(top, 30, 0.3);
							bottom = lerp(bottom, 30, 0.3);
							sides = lerp(sides, 130, 0.3);
					
							draw_set_color(c_white);
							draw_set_halign(fa_center);
							draw_set_valign(fa_middle);
							draw_set_font(fnt_roboto);
							draw_text_transformed(cw, ch, "Waiting to server...", sz, sz, 0);
							draw_set_font(-1);
							draw_set_halign(-1);
							draw_set_valign(-1);
							draw_set_color(-1);
							#endregion
					} else if (answer == "error_1"){
						#region The email doesn't exists
							top = lerp(top, 30, 0.3);
							bottom = lerp(bottom, 60, 0.3);
							sides = lerp(sides, 120, 0.3);
					
							draw_set_color(c_white);
							draw_set_halign(fa_center);
							draw_set_valign(fa_middle);
							draw_set_font(fnt_roboto);
							draw_text_transformed(cw, ch, text[66], sz, sz, 0);
					
							#region Buttons
							if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
								draw_set_color($dbdbdb);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
								if mouse_check_button_released(mb_left) {
									get_acc = false;
								}
							} else {
								draw_set_color($a0a0a0);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							}
				
							draw_set_color(c_white);
							draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
							draw_set_font(-1);
							draw_set_halign(-1);
							draw_set_valign(-1);
							draw_set_color(-1);
							#endregion
							#endregion
					} else if (answer == "error_2"){
						#region Incorrect password
							top = lerp(top, 30, 0.3);
							bottom = lerp(bottom, 60, 0.3);
							sides = lerp(sides, 120, 0.3);
					
							draw_set_color(c_white);
							draw_set_halign(fa_center);
							draw_set_valign(fa_middle);
							draw_set_font(fnt_roboto);
							draw_text_transformed(cw, ch, text[67], sz, sz, 0);
					
							#region Buttons
							if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
								draw_set_color($dbdbdb);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
								if mouse_check_button_released(mb_left) {
									get_acc = false;
								}
							} else {
								draw_set_color($a0a0a0);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							}
				
							draw_set_color(c_white);
							draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
							draw_set_font(-1);
							draw_set_halign(-1);
							draw_set_valign(-1);
							draw_set_color(-1);
							#endregion
							#endregion
					} else if (answer == "success"){
						#region Successfully!
							top = lerp(top, 30, 0.3);
							bottom = lerp(bottom, 60, 0.3);
							sides = lerp(sides, 120, 0.3);
					
							draw_set_color(c_white);
							draw_set_halign(fa_center);
							draw_set_valign(fa_middle);
							draw_set_font(fnt_roboto);
							draw_text_transformed(cw, ch, text[64], sz, sz, 0);
					
							#region Buttons
							if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
								draw_set_color($dbdbdb);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
								if mouse_check_button_released(mb_left) {
									acc = false;
									obj_button.can_use = true;
									//obj_exit_game.can_use = true;
								}
							} else {
								draw_set_color($a0a0a0);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							}
				
							draw_set_color(c_white);
							draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
							draw_set_font(-1);
							draw_set_halign(-1);
							draw_set_valign(-1);
							draw_set_color(-1);
							#endregion
							#endregion
					} else if(answer != ""){
						#region FATAL_ERROR_NET_X
							top = lerp(top, 30, 0.3);
							bottom = lerp(bottom, 80, 0.3);
							sides = lerp(sides, 120, 0.3);
					
							draw_set_color(c_white);
							draw_set_halign(fa_center);
							draw_set_valign(fa_middle);
							draw_set_font(fnt_roboto);
							draw_text_transformed(cw, ch, string_hash_to_newline(answer + text[65]), sz, sz, 0);
					
							#region Buttons
							if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
								draw_set_color($dbdbdb);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
								if mouse_check_button_released(mb_left) {
									acc = false;
									obj_button.can_use = true;
									//obj_exit_game.can_use = true;
								}
							} else {
								draw_set_color($a0a0a0);
								draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							}
				
							draw_set_color(c_white);
							draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
							draw_set_font(-1);
							draw_set_halign(-1);
							draw_set_valign(-1);
							draw_set_color(-1);
							#endregion
							#endregion
					}
				} else {
					#region No Internet connection
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 80, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[88], sz, sz, 0);
						
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								//obj_exit_game.can_use = true;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
				}
				#endregion
			} else {
				#region ERROR
				top = lerp(top, 30, 0.3);
				bottom = lerp(bottom, 60, 0.3);
				sides = lerp(sides, 120, 0.3);
				
				draw_set_color(c_white);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt_roboto);
				draw_text_transformed(cw, ch, "FATAL_ERROR_1", sz, sz, 0);
					
				#region Buttons
				if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
				draw_set_color($dbdbdb);
				draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
					if mouse_check_button_released(mb_left) {
						get_acc = false;
						set_acc = false;
					}
				} else {
					draw_set_color($a0a0a0);
					draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
				}
				
				draw_set_color(c_white);
				draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
				draw_set_font(-1);
				draw_set_halign(-1);
				draw_set_valign(-1);
				draw_set_color(-1);
				#endregion
				#endregion
			}
		}
		#endregion
	} else {
		#region Si se encuentra una cuenta registrada
		if(!save && !load){
			switch(quest){
				case 0:
					#region Menú principal
					top = lerp(top, 90, 0.3);
					bottom = lerp(bottom, 95, 0.3);
					sides = lerp(sides, 100, 0.3);
			
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_top);
					draw_set_font(fnt_roboto);
					draw_text_transformed(cw, ch-(top-5)*sz, user, sz, sz, 0);
					draw_set_valign(fa_middle);
					
					draw_rectangle(cw-25*sz, ch-(top-20)*sz, cw+25*sz, ch-(top-70)*sz, 0);
					draw_set_color(c_black);
					draw_rectangle(cw-24*sz, ch-(top-21)*sz, cw+24*sz, ch-(top-69)*sz, 0);
					
					#region Buttons
					#region Back
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							acc = false;
							obj_button.can_use = true;
							//obj_exit_game.can_use = true;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
					}
					draw_set_color(c_white);
					draw_text_transformed(cw, ch+(bottom-16)*sz, text[52], sz, sz, 0);
					#endregion
					#region Save data
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch-(top-72), cw+(sides-10), ch-(top-92)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-72)*sz, cw+(sides-10)*sz, ch-(top-92)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 1;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-72)*sz, cw+(sides-10)*sz, ch-(top-92)*sz, 0);
					}
			
					draw_set_color(c_white);
					draw_text_transformed(cw, ch-(top-83)*sz, text[68], sz, sz, 0);
					#endregion
					#region Load data
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch-(top-97), cw+(sides-10), ch-(top-117)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-97)*sz, cw+(sides-10)*sz, ch-(top-117)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 4;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-97)*sz, cw+(sides-10)*sz, ch-(top-117)*sz, 0);
					}
	
					draw_set_color(c_white);
					draw_text_transformed(cw, ch-(top-108)*sz, text[69], sz, sz, 0);
					#endregion
					#region Options
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch-(top-122), cw+(sides-10), ch-(top-142)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-122)*sz, cw+(sides-10)*sz, ch-(top-142)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 2;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-122)*sz, cw+(sides-10)*sz, ch-(top-142)*sz, 0);
					}
	
					draw_set_color(c_white);
					draw_text_transformed(cw, ch-(top-133)*sz, text[70], sz, sz, 0);
					#endregion
			
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
			
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					break;
					#endregion
				case 1:
					#region Preguntar si guardar partida
					top = lerp(top, 30, 0.3);
					bottom = lerp(bottom, 50, 0.3);
					sides = lerp(sides, 130, 0.3);
			
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_top);
					draw_set_font(fnt_roboto);
					draw_text_transformed(cw, ch-(top-10)*sz, text[74], sz, sz, 0);
					var w = (sides-10)*2/string_width(text[75]);
					draw_text_transformed(cw, ch-(top-28)*sz, text[75], w*sz, w*sz, 0);
					draw_set_valign(fa_middle);
					
					#region Buttons
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10), ch+(bottom-27), cw-5, ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 0;
						}
					} else { 
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
					}
	
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+5, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							save = true;
							final_text = "";
							fileName[0] = file_find_first(directory[0] + "*.pml", fa_directory);
							alarm[0] = 1;
							answer = "";
							a = 0;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
					}
				
					draw_set_color(c_white);
					draw_text_transformed(lerp(cw+5*sz, cw+(sides-10)*sz, 0.5), ch+(bottom-16)*sz, text[78], sz, sz, 0);
					draw_text_transformed(lerp(cw-(sides-10)*sz, cw-5*sz, 0.5), ch+(bottom-16)*sz, text[89], sz, sz, 0);
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
					
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					break;
					#endregion
				case 2:
					#region Opciones
					top = lerp(top, 70, 0.3);
					bottom = lerp(bottom, 75, 0.3);
					sides = lerp(sides, 120, 0.3);
			
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_top);
					draw_set_font(fnt_roboto);
					draw_text_transformed(cw, ch-(top-5)*sz, text[70], sz, sz, 0);
					draw_set_valign(fa_middle);
					
					#region Buttons
					#region Back
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 0;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
					}
					draw_set_color(c_white);
					draw_text_transformed(cw, ch+(bottom-16)*sz, text[52], sz, sz, 0);
					#endregion
					#region Manage account
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch-(top-20), cw+(sides-10), ch-(top-40)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-20)*sz, cw+(sides-10)*sz, ch-(top-40)*sz, 0);
						if mouse_check_button_released(mb_left) {
							
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-20)*sz, cw+(sides-10)*sz, ch-(top-40)*sz, 0);
					}
			
					draw_set_color(c_white);
					draw_text_transformed(cw, ch-(top-30)*sz, text[71], sz, sz, 0);
					#endregion
					#region Report an account bug
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch-(top-45), cw+(sides-10), ch-(top-65)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-45)*sz, cw+(sides-10)*sz, ch-(top-65)*sz, 0);
						if mouse_check_button_released(mb_left) {
					
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-45)*sz, cw+(sides-10)*sz, ch-(top-65)*sz, 0);
					}
	
					draw_set_color(c_white);
					draw_text_transformed(cw, ch-(top-55)*sz, text[72], sz, sz, 0);
					#endregion
					#region Logout
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch-(top-70), cw+(sides-10), ch-(top-90)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-70)*sz, cw+(sides-10)*sz, ch-(top-90)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 3;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch-(top-70)*sz, cw+(sides-10)*sz, ch-(top-90)*sz, 0);
					}
	
					draw_set_color(c_white);
					draw_text_transformed(cw, ch-(top-80)*sz, text[73], sz, sz, 0);
					#endregion
					
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
			
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					break;
					#endregion
				case 3:
					#region Preguntar si cerrar sesión
					top = lerp(top, 30, 0.3);
					bottom = lerp(bottom, 50, 0.3);
					sides = lerp(sides, 130, 0.3);
			
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_top);
					draw_set_font(fnt_roboto);
					draw_text_transformed(cw, ch-(top-10)*sz, text[76], sz, sz, 0);
					var w = (sides-10)*2/string_width(text[77]);
					draw_text_transformed(cw, ch-(top-28)*sz, text[77], w*sz, w*sz, 0);
					draw_set_valign(fa_middle);
					
					#region Buttons
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10), ch+(bottom-27), cw-5, ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 2;
						}
					} else { 
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
					}
	
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+5, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							fileName[0] = file_find_first(directory[0] + "*.pml", fa_directory);
							while(fileName[0] != ""){
								file_delete(directory[0] + fileName[0]);
								fileName[0] = file_find_next();
							}
							file_delete("User_account.pmx");
							file_delete("User_data.pmx");
							spr_player = 0;
							rgb[0] = 255;
							rgb[1] = 255;
							rgb[2] = 255;
							hsv[0] = 0;
							hsv[1] = 0;
							hsv[2] = 255;
							acc = false;
							obj_button.can_use = true;
							//obj_exit_game.can_use = true;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
					}
				
					draw_set_color(c_white);
					draw_text_transformed(lerp(cw+5*sz, cw+(sides-10)*sz, 0.5), ch+(bottom-16)*sz, text[78], sz, sz, 0);
					draw_text_transformed(lerp(cw-(sides-10)*sz, cw-5*sz, 0.5), ch+(bottom-16)*sz, text[89], sz, sz, 0);
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
					
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					break;
					#endregion
				case 4:
					#region Preguntar si cargar partida
					top = lerp(top, 30, 0.3);
					bottom = lerp(bottom, 50, 0.3);
					sides = lerp(sides, 130, 0.3);
			
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_top);
					draw_set_font(fnt_roboto);
					draw_text_transformed(cw, ch-(top-10)*sz, text[90], sz, sz, 0);
					var w = (sides-10)*2/string_width(text[75]);
					draw_text_transformed(cw, ch-(top-28)*sz, text[75], w*sz, w*sz, 0);
					draw_set_valign(fa_middle);
					
					#region Buttons
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10), ch+(bottom-27), cw-5, ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							quest = 0;
						}
					} else { 
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw-5*sz, ch+(bottom-7)*sz, 0);
					}
	
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw+5, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
						draw_set_color($dbdbdb);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							load = true;
							final_text = "";
							fileName[0] = file_find_first(directory[0] + "*.pml", fa_directory);
							alarm[1] = 1;
							answer = "";
							a = 0;
							
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw+(sides-10)*sz, ch+(bottom-27)*sz, cw+5*sz, ch+(bottom-7)*sz, 0);
					}
				
					draw_set_color(c_white);
					draw_text_transformed(lerp(cw+5*sz, cw+(sides-10)*sz, 0.5), ch+(bottom-16)*sz, text[78], sz, sz, 0);
					draw_text_transformed(lerp(cw-(sides-10)*sz, cw-5*sz, 0.5), ch+(bottom-16)*sz, text[89], sz, sz, 0);
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
					
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					break;
					#endregion
				default:
					#region ERROR
					top = lerp(top, 30, 0.3);
					bottom = lerp(bottom, 60, 0.3);
					sides = lerp(sides, 120, 0.3);
				
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					draw_set_font(fnt_roboto);
					draw_text_transformed(cw, ch, "FATAL_ERROR_2", sz, sz, 0);
					
					#region Buttons
					if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
					draw_set_color($dbdbdb);
					draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						if mouse_check_button_released(mb_left) {
							get_acc = false;
							set_acc = false;
						}
					} else {
						draw_set_color($a0a0a0);
						draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
					}
				
					draw_set_color(c_white);
					draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
					draw_set_font(-1);
					draw_set_halign(-1);
					draw_set_valign(-1);
					draw_set_color(-1);
					#endregion
					break;
					#endregion
			}
		} else if(save){
			#region Respuesta del servidor
			if(os_is_network_connected()){
				if(answer == ""){
					#region Checking
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 30, 0.3);
						sides = lerp(sides, 130, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, state, sz, sz, 0);
						
						if(file_length != 0){
							file_load++;
							draw_rectangle(cw-(sides-6), ch+(bottom-11), cw-(sides-6)+(file_load*((sides-6)*2)/(file_length/2)), ch+(bottom-6), 0);
						}
						
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
				} else if (answer == "uploaded"){
					#region Successfully!
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 60, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[80], sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								save = false;
								quest = 0;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
				} else if(answer != ""){
					#region FATAL_ERROR_NET_X
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 80, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, string_hash_to_newline(answer + text[65]), sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								//obj_exit_game.can_use = true;
								answer = "";
								state = "";
								load = false;
								quest = 0;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
				}
			} else {
				#region No Internet connection
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 80, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[88], sz, sz, 0);
						
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								//obj_exit_game.can_use = true;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
			}
				#endregion
		} else if(load){
			#region Respuesta del servidor
			if(os_is_network_connected()){
				if(answer == ""){
					#region Checking
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 30, 0.3);
						sides = lerp(sides, 130, 0.3);
						
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, state, sz, sz, 0);
						
						if(file_length != 0){
							file_load++;
							draw_rectangle(cw-(sides-6), ch+(bottom-11), cw-(sides-6)+(file_load*((sides-6)*2)/(file_length/2)), ch+(bottom-6), 0);
						}
						
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
				} else if(answer == "levels_req"){
					#region Waiting levels
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 30, 0.3);
						sides = lerp(sides, 130, 0.3);
						
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, state, sz, sz, 0);
						
						if(file_length != 0){
							file_load++;
							draw_rectangle(cw-(sides-6), ch+(bottom-11), cw-(sides-6)+(file_load*((sides-6)*2)/(file_length/2)), ch+(bottom-6), 0);
						}
						
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
				} else if(answer == "loading"){
					#region Saving
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 30, 0.3);
						sides = lerp(sides, 130, 0.3);
						
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, state, sz, sz, 0);
						
						if(file_length != 0){
							file_load++;
							draw_rectangle(cw-(sides-6), ch+(bottom-11), cw-(sides-6)+(file_load*((sides-6)*2)/(file_length/2)), ch+(bottom-6), 0);
						}
						
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
				} else if (answer == "loaded"){
					#region Successfully!
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 60, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[81], sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								load = false;
								quest = 0;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
				} else if(answer != ""){
					#region FATAL_ERROR_NET_X
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 80, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, string_hash_to_newline(answer + text[65]), sz, sz, 0);
					
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								//obj_exit_game.can_use = true;
								answer = "";
								state = "";
								load = false;
								quest = 0;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
				}
			} else {
				#region No Internet connection
						top = lerp(top, 30, 0.3);
						bottom = lerp(bottom, 80, 0.3);
						sides = lerp(sides, 120, 0.3);
					
						draw_set_color(c_white);
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						draw_set_font(fnt_roboto);
						draw_text_transformed(cw, ch, text[88], sz, sz, 0);
						
						#region Buttons
						if(point_in_rectangle_to_gui(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), cw-(sides-10)*sz, ch+(bottom-27), cw+(sides-10), ch+(bottom-7)) and acc){
							draw_set_color($dbdbdb);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
							if mouse_check_button_released(mb_left) {
								acc = false;
								obj_button.can_use = true;
								//obj_exit_game.can_use = true;
							}
						} else {
							draw_set_color($a0a0a0);
							draw_rectangle(cw-(sides-10)*sz, ch+(bottom-27)*sz, cw+(sides-10)*sz, ch+(bottom-7)*sz, 0);
						}
				
						draw_set_color(c_white);
						draw_text_transformed(cw, ch+(bottom-16)*sz, "Ok", sz, sz, 0);
						draw_set_font(-1);
						draw_set_halign(-1);
						draw_set_valign(-1);
						draw_set_color(-1);
						#endregion
						#endregion
			}
			#endregion
		}
		#endregion
	}
} else {
	top = 30;
	bottom = 50;
	sides = 150;
	reg = false;
	logreg = false;
	get_acc = false;
	set_acc = false;
}
#endregion
#region Errores de registro
if(sitalph > 0.1){
	sitalph = lerp(sitalph, 0, 0.1);
	
	switch(sit){
		case 0: sittxt = text[60]; break;
		case 1: sittxt = text[59]; break;
		case 2: sittxt = text[57]; break;
		case 3: sittxt = text[58]; break;
		case 4: sittxt = text[85]; break;
		case 5: sittxt = text[84]; break;
	}
	
	draw_set_color(c_black);
	draw_set_alpha(clamp(sitalph, 0, 1) - 0.2);
	draw_rectangle(cw-(string_width(sittxt)/2)-5, ch-(string_height(string_hash_to_newline(sittxt))/2)-5, cw+(string_width(sittxt)/2)+5, ch+(string_height(string_hash_to_newline(sittxt))/2)+5, 0);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_alpha(sitalph);
	draw_set_font(fnt_roboto);
	draw_text(cw, ch, string_hash_to_newline(sittxt));
	
	draw_set_valign(-1);
	draw_set_halign(-1);
	draw_set_color(-1);
	draw_set_alpha(1);
	draw_set_font(-1);
}
#endregion
