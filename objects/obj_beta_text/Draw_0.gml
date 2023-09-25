/// @description Dibujar el texto
draw_set_font(fnt_roboto);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text_ext_transformed(x, y_camera+string_height(string_hash_to_newline(txt))/2, string_hash_to_newline(txt), -1, ideal_width, 0.8, 0.8, 0);
draw_set_colour(-1);
draw_set_halign(-1);
draw_set_font(-1);