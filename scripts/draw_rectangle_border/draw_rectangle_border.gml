///@func draw_rectangle_border(x1, y1, x2, y2, size);
///@param {real} x1
///@param {real} y1
///@param {real} x2
///@param {real} y2
///@param {real} width

var repair, ssz, x1, y1, x2, y2, width;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
width = argument4;

ssz = 1.5;
repair[0] = clamp(sign(x2-x1), 0, 1);
repair[1] = clamp(sign(x1-x2), 0, 1);
repair[2] = clamp(sign(y2-y1), 0, 1);
repair[3] = clamp(sign(y1-y2), 0, 1);
repair[4] = sign(x2-x1)*ssz;
repair[5] = sign(x1-x2)*ssz;
repair[6] = sign(y2-y1)*ssz;
repair[7] = sign(y1-y2)*ssz;

draw_primitive_begin(pr_trianglestrip);

draw_vertex(x1+repair[1], y1+repair[3]);
	draw_vertex(x1+repair[4]*width+repair[1], y1+repair[6]*width+repair[3]);
draw_vertex(x2+repair[0], y1+repair[3]);
	draw_vertex(x2-repair[4]*width+repair[0], y1+repair[6]*width+repair[3]);
draw_vertex(x2+repair[0], y2+repair[2]);
	draw_vertex(x2-repair[4]*width+repair[0], y2+repair[7]*width+repair[2]);
draw_vertex(x1+repair[1], y2+repair[2]);
	draw_vertex(x1-repair[5]*width+repair[1], y2+repair[7]*width+repair[2]);
draw_vertex(x1+repair[1], y1+repair[3]);
	draw_vertex(x1+repair[4]*width+repair[1], y1+repair[6]*width+repair[3]);
	
draw_primitive_end();