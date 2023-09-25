///@func scr_randpass(length);
///@desc random password generator
///@param {real} length
var pass_txt, new_pass;
//pass_txt = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ()[]{}<>+-*^_.:;,!#$%&=?¡¿@~|";
pass_txt = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
new_pass = "";

for(var i = 0; i < argument0; i++){
	new_pass = new_pass + string_char_at(pass_txt, irandom_range(1, string_length(pass_txt)));
}

new_pass = new_pass + " random_password_" + string(irandom(255));

return new_pass;
