/// @function scr_string_split(my_string, explode)
/// @param {string} my_string
/// @param {string} explode
var my_string, explode, array, numbers, pos;
my_string = argument0;
explode = argument1;

numbers = string_count(explode, my_string);

for(var i = 0; i < numbers; i++){
    pos = string_pos(explode, my_string);
    array[i] = string(string_copy(my_string, 1, pos-1));
    my_string = string_delete(my_string, 1, pos);
}

return array;