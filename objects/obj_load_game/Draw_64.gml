/// @description Data
if(init[0] > init[1]){
	var cw = ideal_width/2;
	var ch = ideal_height/2;
	draw_set_color(c_white);
	draw_set_alpha(alph);
	draw_sprite_ext(spr_title, 0, cw, ch, 1.5, 1.5, 0, -1, alph);
	draw_set_font(fnt_roboto);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(cw, ideal_height-12, txt);
	draw_rectangle(5, ideal_height-10, load_x+5, ideal_height-5, 0);
	draw_set_color(-1);
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_alpha(1);
}