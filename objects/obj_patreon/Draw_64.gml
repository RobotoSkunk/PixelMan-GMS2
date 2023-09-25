/// @description GPU
var cw, ch, mx, my;
cw = ideal_width/2;
ch = ideal_height/2;
mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);

draw_set_font(fnt_roboto);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var txt_adjust = min(ideal_width-50, ideal_height-40)/min(string_width(txt), string_height(txt));
txt_adjust = clamp(txt_adjust, 0, 1);
draw_text_transformed(cw, 10, txt, txt_adjust, txt_adjust, 0);


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(point_in_rectangle(mx, my, 5, ideal_height-25, ideal_width-5, ideal_height-5)){
	if(mouse_check_button_released(mb_left)) url_open_ext("https://patreon.com/RobotoSkunk", "_blank");
	draw_set_color(c_gray);
} else {
	draw_set_color(c_dkgray);
}
draw_rectangle(5, ideal_height-25, ideal_width-5, ideal_height-5, 0);
draw_set_color(c_white);

draw_text(cw, ideal_height-15, btn_txt);
scr_button_back();
