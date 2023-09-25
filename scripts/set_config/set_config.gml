///@param i
///@param i1
var cam_x, cam_y;
cam_x = obj_editor.xprevious;
cam_y = obj_editor.yprevious;

var i = argument0, i1 = argument1;
if i1 == 0 {x = string2real(arg_txt[i]); obj_editor.x = cam_x+(x-cam_x);}
else if i1 == 1 {y = string2real(arg_txt[i]); obj_editor.y = cam_y+(y-cam_y);}
else if i1 == 2 _depth = string(clamp(string2real(arg_txt[i]), -255, 90));
else if i1 == 3 {image_xscale = string2real(arg_txt[i]); image_yscale = real(arg_txt[i]);}
else if i1 == 4 image_xscale = string2real(arg_txt[i]);
else if i1 == 5 image_yscale = string2real(arg_txt[i]);
else if i1 == 6 image_angle = string2real(arg_txt[i]);
else if i1 == 9 time = string2real(arg_txt[i]);
else if i1 == 12 start_time = string2real(arg_txt[i]);
else if i1 == 15 obj_speed = string2real(arg_txt[i]);