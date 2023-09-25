/// @param x {real}
var float, value, int;

value = argument0;
float = frac(value);

int = value + float*sign(-value);

return int;