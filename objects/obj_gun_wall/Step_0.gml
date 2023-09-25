/// @description Procesador
if(restart){
	alarm[0] = 2;
	alarm[1] = -1;
	t = 0;
	exit;
}
if(pause){
	if(t > 0){
		alarm_list = ds_list_create();
		for(var i = 0; i < 2; i++){
			ds_list_add(alarm_list, alarm[i]);
			alarm[i] = -1;
		}
	}
	t = 0;
	if(!lvl_start){
		alarm[0] = 2;
		alarm[1] = -1;
	}
	exit;
}
t++;
t = clamp(t, 0, 2);

if(t = 1){
	var len = ds_list_size(alarm_list);
	for(var i = 0; i < len; i++){
		alarm[i] = ds_list_find_value(alarm_list, i);
	}
	ds_list_destroy(alarm_list);
}