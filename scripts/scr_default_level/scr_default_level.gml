var obj_def_lvl;
obj_def_lvl = "{ \"obj_type\": 1.000000, \"x\": 384.000000, \"y\": 224.000000 }|"; //Jugador

for(var i = 0; i < 7; i++){
	obj_def_lvl = obj_def_lvl +
	"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\":" + 
	string(336 + 16*i) + 
	", \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"
}

obj_def_lvl = obj_def_lvl +
"{ \"image_yscale\": 1.000000, \"obj_type\": 12.000000, \"image_angle\": 0.000000, \"x\": 416.000000, \"image_xscale\": 1.000000, \"y\": 256.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 13.000000, \"image_angle\": 0.000000, \"x\": 352.000000, \"image_xscale\": 1.000000, \"y\": 240.000000 }|"+
"{ \"obj_type\": -1.000000, \"x\": 768.000000, \"y\": 496.000000 }|"

return obj_def_lvl;

/*return base64_encode(
"{ \"obj_type\": 1.000000, \"x\": 384.000000, \"y\": 224.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\": 336.000000, \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\": 352.000000, \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\": 368.000000, \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\": 384.000000, \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\": 400.000000, \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\": 416.000000, \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 0.000000, \"image_angle\": 0.000000, \"x\": 432.000000, \"image_xscale\": 1.000000, \"ID\": 0.000000, \"y\": 272.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 12.000000, \"image_angle\": 0.000000, \"x\": 416.000000, \"image_xscale\": 1.000000, \"y\": 256.000000 }|"+
"{ \"image_yscale\": 1.000000, \"obj_type\": 13.000000, \"image_angle\": 0.000000, \"x\": 352.000000, \"image_xscale\": 1.000000, \"y\": 240.000000 }|"+
"{ \"obj_type\": -1.000000, \"x\": 768.000000, \"y\": 496.000000 }|");*/