/// @param string {string}
/// @param char {char}
/// @param length {real}

var str = argument0,
	char = argument1,
	length = argument2,
	str_length = string_length(str);

if(str_length < length){
	var loop = abs(length - str_length);
	
	repeat(loop){
		str = char + str;
	}
	
	return str;
} else {
	return str;
}
