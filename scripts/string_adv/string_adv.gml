///string_adv(string, width);
///@param string {string}
///@param width {real}
var str = argument0,
	width = argument1,
	str_length = string_length(str),
	final_string = "",
	last_newline = 1,
	space_at = 0;

for(var i = 1; i <= str_length; i++){
	if(string_width(string_copy(final_string, last_newline, i)) > width){
		if(string_char_at(str, i) == " "){
			final_string += " \n";
			last_newline = i;
		} else {
			space_at = string_lastchar_at(final_string, " ");
			if(string_width(string_copy(final_string, space_at, i)) > width){
				final_string += " \n" + string_char_at(str, i);
				last_newline = i;
			} else {
				final_string = string_insert(" \n", final_string, space_at+1) + string_char_at(str, i);
				last_newline = space_at;
			}
		}
	} else {
		final_string += string_char_at(str, i);
	}
}

return final_string;
