/// @description Procesador de la GUI
if(slider){
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(ideal_width-40, 0, ideal_width, ideal_height, 0);
	draw_set_colour(c_white);
	draw_set_alpha(0.2);
	draw_rectangle(ideal_width-40, 0, ideal_width, ideal_height, 0);
	draw_set_alpha(1);
	draw_rectangle(ideal_width-40, y1, ideal_width, y2, 0);
	draw_set_colour(-1);
}
#region Trancisiones

draw_set_colour(c_white);
draw_rectangle(-1, 0, xp1, ideal_height/2, 0);
draw_rectangle(ideal_width, ideal_height/2, xp2, ideal_height, 0);

#endregion
scr_cursor_sprite(1);
