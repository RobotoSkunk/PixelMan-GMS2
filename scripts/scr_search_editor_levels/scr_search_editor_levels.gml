var i = 0, i1 = 0;
var fileName = file_find_first(directory[0] + "*", fa_directory);

while(fileName != ""){
	if(file_exists(directory[0] + fileName + "\\data.pmd")){
		new_inst[i1] = instance_create(x_camera+20, y_camera+20*i, obj_level_selector);
	    new_inst[i1].file = fileName + "\\";
		new_inst[i1].pos = i1;
		new_inst[i1].t = i1*5;
		i1++;
	}
	
    fileName = file_find_next();
    i++;
}
file_find_close();

if((room_height/2-ideal_height/2)+20+70*i1 > ideal_height){
	cam = instance_create_depth(0, 0, -1, obj_camera_menu);
	cam.slider = 1;
	cam.length = (room_height/2-ideal_height/2)+20+70*(i1)-ideal_height/2;
} else {
	instance_create_depth(0, 0, -1, obj_camera_menu);
}
