/// @description GPU
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, ideal_width, ideal_height, 0);
draw_set_alpha(1);

var cw = ideal_width/2;
var ch = ideal_height/2;
draw_set_color(c_white);
draw_sprite_ext(spr_title, 0, cw, ch, 1.5, 1.5, 0, -1, 1);
draw_set_font(fnt_roboto);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(cw, ideal_height-12, txt);
var delta = 60/1000000*delta_time;
if(60/delta < 30){
	draw_set_valign(fa_top);
	draw_text_transformed(cw, 5, "Caution " + string(round(60/delta)) + "/60 FPS! Change the CPU force in the configuration menu.", 0.5, 0.5, 0);
}
draw_rectangle(5, ideal_height-10, load_x+5, ideal_height-5, 0);

if(alph > 0){
	draw_set_color(c_white);
	draw_set_alpha(alph);
	draw_rectangle(0, 0, ideal_width, ideal_height, 0);
}

draw_set_color(-1);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_alpha(1);
