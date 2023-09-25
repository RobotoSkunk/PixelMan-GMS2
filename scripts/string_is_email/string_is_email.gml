///scr_string_is_email(string)
 
/**
 * Returns whether the given string is formatted as an email address
 * 
 * @param  string  The input string
 * @return Returns true if the given string is formatted as an email address
 */
 
var _email, _email_reverse, _email_alphanum, _email_at_position, _email_at_count, _email_dot_position, 
_email_dot_count, _email_domain, _email_domain_reverse, _i;
 
_email = argument[0];
_email_reverse = "";
 
for (_i = string_length(_email); _i > 0; _i--) {
    _email_reverse += string_char_at(_email, _i);
}
 
_email_alphanum = _email;
_email_alphanum = string_replace_all(_email_alphanum, "@", "");
_email_alphanum = string_replace_all(_email_alphanum, ".", "");
_email_alphanum = string_replace_all(_email_alphanum, "_", "");
_email_alphanum = string_replace_all(_email_alphanum, "-", "");
 
if (string_pos("@.", _email) || string_pos("@_", _email) || string_pos("@-", _email)){
    return 0;
}
 
if (string_length(_email_alphanum) > string_length(string_lettersdigits(_email_alphanum))) {
    return 0;
}
 
_email_at_position = string_pos("@", _email);
_email_at_count = string_count("@", _email);
 
_email_dot_position = string_pos(".", _email);
_email_dot_count = string_count(".", _email);
 
_email_domain = string_copy(_email, _email_at_position+1, string_length(_email));
_email_domain_reverse = "";
 
for (_i = string_length(_email_domain); _i > 0; _i--) {
    _email_domain_reverse += string_char_at(_email_domain, _i);
}
 
if ((_email_at_count == 1) and
	(string_pos("@", _email) != 1) and
	(string_pos("@", _email_reverse) != 1) and
	(string_pos(".", _email) != 1) and
	(string_pos(".", _email_reverse) != 1) and
	(string_pos("_", _email) != 1) and 
	(string_pos("_", _email_reverse) != 1) and 
	(string_pos("-", _email) != 1) and 
	(string_pos("-", _email_reverse) != 1)) {
	
	if (_email_dot_count < 2) {
		if ((_email_at_position > _email_dot_position)) {
			return 0;
		}
	}
	
	if ((string_pos(".", _email_domain_reverse) > 2) and (_email_domain != "") and  (_email_domain != " ")) {
		return 1;
	} else {
		return 0;
	}
} else {
	return 0;
}