///draw_text_colour_outline(x, y, string, textColor1, textColor2, textAlpha, outlineColor1, outlineColor2, outlineAlpha, outlineThickness, outlineQuality, xscale, yscale, angle);
//By Blokatt - @blokatt, blokatt.net
/// @func draw_text_colour_outline(x, y, string, textColor1, textColor2, textAlpha, outlineColor1, outlineColor2, outlineAlpha, outlineThickness, outlineQuality, xscale, yscale, angle);
///@param {real} x
///@param {real} y
///@param {string} string
///@param {real} col1
///@param {real} col2
///@param {real} text_alpha
///@param {real} outline_col1
///@param {real} outline_col2
///@param {real} outline_alpha
///@param {real} outline_thickness
///@param {real} outline_quality
///@param {real} xscale
///@param {real} yscale
///@param {real} angle

var i;
for (i = 0; i < 360; i += 360 / argument10){
    draw_text_transformed_color(argument0 + lengthdir_x(argument9, i), argument1 + lengthdir_y(argument9, i), string(argument2), argument11, argument12, argument13, argument6, argument6, argument7, argument7, argument8);
}
draw_text_transformed_color(argument0, argument1, string(argument2), argument11, argument12, argument13, argument3, argument3, argument4, argument4, argument5);