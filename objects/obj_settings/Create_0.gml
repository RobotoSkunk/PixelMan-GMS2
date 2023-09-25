/// @description Inicializar
set_menu = 0;
for(var i = 0; i < 10; i++){
	btn_set_size[i] = 1;
}
for(var i1 = 0; i1 < 4; i1++){
	for(var i2 = 0; i2 < 10; i2++){
		txt_array2d[i1, i2] = "";
		set_array2d[i1, i2] = 0;
	}
}
switch(languaje){
	case "Español": lang = 0; break;
	case "Inglés": lang = 1; break;
	case "Portugués": lang = 2; break;
}
in_use = [0, 0, 0];
//display_data_page = 0;

al = 0;
can_use = false;

x = 0;
y = 0;
image_speed = 0;
image_alpha = 0;