if (string_lettersdigits(argument[0]) != "") {
	var levelfile = directory[0] + argument[1];
	var levelname = argument[0];
} else {
	var levelfile = directory[0] + "Unnamed" + ".pml";
	var levelname = "Unnamed";
}

var level_exists = true;
var i = 1;

if (file_exists(directory[0] + argument[0] + ".pml")) {
	while(level_exists){
		if(string_lettersdigits(argument[0]) != ""){
			var levelname = argument[0] + string(i);
		} else {
			var levelname = "Unnamed" + string(i);
		}
		
		if(file_exists(levelname)){
			i++;
		} else {
			file_rename(levelfile, directory[0] + levelname + ".pml");
			level_name = levelname + ".pml";
			return levelname;
			level_exists = false;
		}
	}
} else {
	file_rename(levelfile, directory[0] + levelname + ".pml");
	level_name = levelname + ".pml";
	return levelname;
	level_exists = false;
}
