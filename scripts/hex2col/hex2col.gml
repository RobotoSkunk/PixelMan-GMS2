/// @param hex {string}

var hex = argument0, r, g, b;

r = hex2dec(string_copy(hex, 1, 2));
g = hex2dec(string_copy(hex, 3, 2));
b = hex2dec(string_copy(hex, 5, 2));

return make_color_rgb(r, g, b);
