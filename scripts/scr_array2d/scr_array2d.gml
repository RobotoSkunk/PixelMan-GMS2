///@param array
var array = [], final_array;
final_array[0, 0] = undefined;
array = argument0;

for(var i = 0; i < array_length_1d(array); i++){
	var array_2 = array[i];
	for(var j = 0; j < array_length_1d(array_2); j++){
		final_array[i, j] = array_2[j];
	}
}

return final_array;
