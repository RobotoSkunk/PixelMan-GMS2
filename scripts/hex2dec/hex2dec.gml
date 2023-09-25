/// @param string {string}

var chars = "0123456789abcdef",
	str = string_lower(argument0),
	num = 0,
	i1 = 0;

for(var i = string_length(str); i > 0; i--){
	var ch_pos = string_pos(string_char_at(str, i), chars);
	
	if(ch_pos > 0){
		num += (ch_pos - 1)*power(16, i1);
	} else {
		return 0;
	}
	
	i1++;
}

return num;
