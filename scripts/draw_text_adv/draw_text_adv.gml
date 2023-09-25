///draw_text_adv(x, y, string, xscale, yscale, angle, width);
///@param x {real}
///@param y {real}
///@param string {string}
///@param xscale {real}
///@param yscale {real}
///@param angle {real}
///@param width {real}
var _x = argument0, 
	_y = argument1,
	str = argument2,
	xscale = argument3,
	yscale = argument4,
	angle = argument5,
	width = argument6,
	final_string = "";

final_string = string_adv(str, width);

draw_text_transformed(_x, _y, final_string, xscale, yscale, angle);
