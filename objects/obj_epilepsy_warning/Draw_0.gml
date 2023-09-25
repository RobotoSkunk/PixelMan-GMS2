/// @description Dibujar texto
draw_self();
draw_set_font(fnt_roboto);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text_ext_transformed(x, y+45, string_hash_to_newline(tx), -1, ideal_width, 0.8, 0.8, 0);
draw_set_colour(-1);
draw_set_halign(-1);
draw_set_font(-1);