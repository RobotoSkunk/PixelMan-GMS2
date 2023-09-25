///@func string_lastchar_at(string, char)
///@param string {string}
///@param char {char}

for(var i = string_length(argument0); i > 0; i--){
	if(string_char_at(argument0, i) == argument1) then break;
}

return i;
