/// @func scr_cursor_sprite(type, situtation);
/// @param type {real}
/// @param situation* {real}
var cur_sit;
var cur_type = argument[0];
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var is_mobile = os_type == os_android || os_type == os_ios;

if(in_window){
	switch(cur_type){
		case 0:
			#region Cámara del juego
			if(!pause && !won){
				if(show_cursor){
					if(!is_mobile){
						if(custom_cursor){
							window_set_cursor(cr_none);
							draw_sprite_ext(spr_cursor, 0, mx, my, 0.7, 0.7, 0, -1, 1);
						} else {
							window_set_cursor(cr_default);
						}
					}
				} else {
					window_set_cursor(cr_none);
				}
			} else {
				if(!is_mobile){
					if(custom_cursor){
						window_set_cursor(cr_none);
						draw_sprite_ext(spr_cursor, 0, mx, my, 0.7, 0.7, 0, -1, 1);
					} else {
						window_set_cursor(cr_default);
					}
				}
			}
			#endregion
			break;
		case 1:
			#region Menús
			if(!is_mobile){
				if(custom_cursor){
					window_set_cursor(cr_none);
					draw_sprite_ext(spr_cursor, 0, mx, my, 0.7, 0.7, 0, -1, 1);
				} else {
					window_set_cursor(cr_default);
				}
			}
			#endregion
			break;
		case 2:
			#region Editor
			if(argument_count > 1){
				cur_sit = argument[1];
				if(cur_sit != -1){
					window_set_cursor(cr_none);
					draw_sprite_ext(spr_editor_cursor, cur_sit, mx, my, 1, 1, 0, -1, 1);
				} else {
					if(custom_cursor){
						window_set_cursor(cr_none);
						draw_sprite_ext(spr_cursor, 0, mx, my, 0.7, 0.7, 0, -1, 1);
					} else {
						window_set_cursor(cr_default);
					}
				}
			}
			#endregion
			break;
	}
}