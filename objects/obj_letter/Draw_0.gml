/// @description Símbolos
draw_self();
switch(symbol){
	case 1:
		fix_y = -0.5;
		break;
	case 2:
		fix_y = -0.5;
		break;
	case 3:
		fix_y = -0.5;
		break;
	case 4:
		fix_x = -0.5;
		fix_y = -0.5;
		break;
	case 5:
		fix_x = 0.5;
		fix_y = -0.5;
		break;
	case 6:
		fix_x = -0.5;
		fix_y = -0.5;
		break;
	case 7:
		fix_x = 0.5;
		break;
	case 8:
		fix_y = -0.5;
		break;
	case 9:
		fix_x = -0.5;
		break;
	case 10:
		fix_x = 0.5;
		fix_y = -1;
		break;
	case 11:
		fix_x = -0.5;
		break;
	case 12:
		fix_x = -0.5;
		break;
	case 13:
		fix_x = -0.5;
		break;
	case 14:
		fix_x = -0.5;
		break;
	case 16:
		fix_x = -0.5;
		break;
	default:
		fix_x = 0;
		fix_y = 0;
		break;
}
xpos = (5.5*cos(degtorad(image_angle+90))+fix_y*cos(degtorad(image_angle+90))+fix_x*sin(degtorad(image_angle+90)))*image_xscale;
ypos = (5.5*sin(degtorad(image_angle+90))+fix_y*sin(degtorad(image_angle+90))-fix_x*cos(degtorad(image_angle+90)))*image_yscale;
draw_sprite_ext(spr_letter_symbols, symbol, x+xpos, y-ypos, image_xscale, image_yscale, image_angle, -1, 1);

//image_angle += (keyboard_check(ord("Q")) - keyboard_check(ord("E")))*5;