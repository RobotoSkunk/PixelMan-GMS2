/// @function scr_compare_versions(v1, v2)
/// @param v1 {string}
/// @param v2 {string}
//MAJOR.MINOR.PATCH.ALPHA
var v1 = argument0, v2 = argument1, vnum1 = 0, vnum2 = 0, i = 0, j = 0;

for( ; (j < string_length(v1) || i < string_length(v2)); ){
	while(i < string_length(v1) && string_char_at(v1, i) != "."){
		vnum1 = vnum1*10 + (real(string_char_at(v1, i) - "0"));
		i++;
	}
	
	while(j < string_length(v2) && string_char_at(v2, j) != "."){
		vnum2 = vnum2*10 + (real(string_char_at(v2, j) - "0"));
		j++;
	}
	
	if(vnum1 > vnum2) return 1;
	if(vnum2 > vnum1) return -1;
	
	vnum1 = 0;
	vnum2 = 0;
	i++;
	j++;
}

return 0;
