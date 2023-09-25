///@func string2real(string);
///@param {string} string
var arg = argument0, allow, rslt = 0.0, char, final_string = "";
allow = "0123456789.";

if(string_copy(arg, 1, 1) == "-"){
	final_string = "-";
}

for(var i = 1; i <= string_length(arg); i++){
	char = string_copy(arg, i, 1);
	if(string_pos(char, allow) > 0){
		final_string = final_string + char;
	}
}

if(string_digits(final_string) != ""){
	rslt = real(final_string);
}

return rslt;
