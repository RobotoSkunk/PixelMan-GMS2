/// @description Detecta una colisión en la GUI
/// @function point_in_rectangle_to_gui(px, py, x1, y1, x2, y2)
/// @param {real} px
/// @param {real} py
/// @param {real} x1
/// @param {real} y1
/// @param {real} x2
/// @param {real} y2

var px = argument0;
var py = argument1;
var x1 = argument2;
var y1 = argument3;
var x2 = argument4;
var y2 = argument5;

if(px >= x1 and px <= x2 and py >= y1 and py <= y2){
	return true;
} else {
	return false;
}