/// @param x {real}

var num = argument0,
	hex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"],
	rtrn = "";

while(num > 0){
	var i = num % 16;
	rtrn = hex[i] + rtrn;
	num /= 16;
	num = int64(num)
}

if(string_length(rtrn) > 0){
	return rtrn;
} else {
	return "0";
}
