/// @description Dibujar intro
var xppos, yppos;
xppos = ideal_width/2;
yppos = ideal_height/2;

if(event == -2){
	ad_al[0] = lerp(ad_al[0], 1, 0.05);
} else if(event == -1){
	ad_al[0] = lerp(ad_al[0], 0, 0.05);
	ad_al[1] = lerp(ad_al[1], 1, 0.05);
} else {
	ad_al[0] = lerp(ad_al[0], 0, 0.05);
	ad_al[1] = lerp(ad_al[1], 0, 0.05);
}
if(event >= 0 && timeline_running){
	al = lerp(al, 0, 0.1);
}
switch(event){
	case 0:
		frame += 0.4;
		draw_sprite_ext(spr_player_running, frame, xppos+xs, yppos+ys, sz, sz, 0, -1, 1);
		draw_set_alpha(al);
		draw_rectangle_color(0, 0, ideal_width, ideal_height, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		break;
	case 1:
		lx += sin(degtorad(250 - lx))*2;
		xs = lx*2;
		ys = lerp(ys, 20, 0.05);
		sz = lerp(sz, 1, 0.1);
		frame += 0.4;
		draw_sprite_ext(spr_player_running, frame, xppos+xs, yppos+ys, sz, sz, 0, -1, 1);
		break;
	case 2:
		lx = lerp(lx, 4, 0.1);
		sz = lerp(sz, 1, 0.1);
		xs += lx;
		frame += 0.4;
		draw_sprite_ext(spr_player_running, frame, xppos+xs, yppos+ys, sz, sz, 0, -1, 1);
		break;
	case 3:
		xs += 4;
		yspeed += 0.5;
		ys += yspeed;
		
		if(yspeed < 0){
			frame += 0.2;
			if(frame > 2) frame = 2;
			draw_sprite(spr_player_jumping, frame-1, xppos+xs, yppos+ys);
		} else if(yspeed > -0.1 && yspeed < 0.1){
			frame = 0;
			draw_sprite(spr_player_jumping, frame-1, xppos+xs, yppos+ys);
		} else {
			frame += 0.5;
			if(frame > 4) frame = 4;
			draw_sprite(spr_player_falling, frame-1, xppos+xs, yppos+ys);
		}
		break;
	case 4:
		if(shake){
			sx = random(5)*choose(-1, 1);
			sy = random(5)*choose(-1, 1);
		} else {
			sx = 0;
			sy = 0;
		}
		draw_sprite_ext(spr_robotoskunk_logo, 0, ideal_width/2+sx, ideal_height/2+sy, 0.4, 0.4, 0, -1, 1);
		r += 20;
		draw_set_alpha(1-(r/2500));
		draw_set_circle_precision(44);
		draw_circle(ideal_width/2+sx, ideal_height/2+sy, r, 0)
		draw_set_alpha(1);
		break;
}

if(event >= 0 && window_get_cursor() != cr_none){
	window_set_cursor(cr_none);
} else if(event < 0 && window_get_cursor() != cr_default){
	window_set_cursor(cr_default);
}

if(timeline_running){
	draw_set_alpha(al);
	draw_rectangle_color(0, 0, ideal_width, ideal_height, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
}

draw_set_font(fnt_roboto);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_alpha(ad_al[0]);
if(ad_al[0] > 0){
	var yypos = -ideal_height/2 + (ideal_height/2)*ad_al[0];
	draw_text_ext_transformed(xppos, 15 + yypos, txt[0], -1, ideal_width-20, 0.8, 0.8, 0);
	if(event == -2 && point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ideal_width/2 - 150, ideal_height - 30, ideal_width/2 + 150, ideal_height - 10)){
		if(mouse_check_button(mb_left)) draw_set_color(make_color_hsv(0, 0, 200));
		else draw_set_color(make_color_hsv(0, 0, 150));
		
		if(mouse_check_button_released(mb_left)){
			event = -1;
		}
	} else {
		draw_set_color(make_color_hsv(0, 0, 100));
	}
	draw_rectangle(ideal_width/2 - 150, ideal_height - 30 + yypos, ideal_width/2 + 150, ideal_height - 10 + yypos, 0);
	draw_set_valign(fa_middle);
	draw_set_colour(c_white);
	draw_text(ideal_width/2, ideal_height - 17 + yypos, "Continue");
}
draw_set_valign(fa_top);
draw_set_alpha(ad_al[1]);
if(ad_al[1] > 0){
	var yypos = -ideal_height/2 + (ideal_height/2)*ad_al[1];
	draw_sprite_ext(spr_epilepsy_logo, 0, xppos, 50 + yypos, 1, 1, 0, -1, ad_al[1]);
	draw_text_ext_transformed(xppos, 100 + yypos, txt[1], -1, ideal_width-20, 0.8, 0.8, 0);
	if(event == -1 && point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), ideal_width/2 - 150, ideal_height - 30, ideal_width/2 + 150, ideal_height - 10)){
		if(mouse_check_button(mb_left)) draw_set_color(make_color_hsv(0, 0, 200));
		else draw_set_color(make_color_hsv(0, 0, 150));
		
		if(mouse_check_button_released(mb_left)){
			event = -3;
			alarm[1] = 45;
		}
	} else {
		draw_set_color(make_color_hsv(0, 0, 100));
	}
	draw_rectangle(ideal_width/2 - 150, ideal_height - 30 + yypos, ideal_width/2 + 150, ideal_height - 10 + yypos, 0);
	draw_set_valign(fa_middle);
	draw_set_colour(c_white);
	draw_text(ideal_width/2, ideal_height - 17 + yypos, "Continue");
}
draw_set_alpha(1);
draw_set_valign(-1);
draw_set_halign(-1);
draw_set_font(-1);
draw_set_color(-1);

if(end_intro){
	xp1 = lerp(xp1, ideal_width+5, 0.2);
	xp2 = lerp(xp2, -6, 0.2);
	draw_set_colour(c_white);
	draw_rectangle(-1, 0, xp1, ideal_height/2, 0);
	draw_rectangle(ideal_width, ideal_height/2, xp2, ideal_height, 0);
}