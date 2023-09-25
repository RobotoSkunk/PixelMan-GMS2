/// @description Tamaño y propiedades del archivo
var file_size, lvl_size_nmb, lvl_size_tp, data_size_arr;

if(final_size == -1){
	lvl_size = "FATAL_ERROR_FSIZE1";
} else {
	file_size = final_size;
	lvl_size_nmb = "";
	lvl_size_tp = "ERROR";
	data_size_arr = [power(2, 10), power(2, 20)];

	var file_buffer = buffer_load(directory[0] + file + "data.pmd");
	file_size += buffer_get_size(file_buffer);
	buffer_delete(file_buffer);

	if(file_size < data_size_arr[0]){ //Bytes
		lvl_size_nmb = string(file_size);
		lvl_size_tp = " B";
	} else if(file_size < data_size_arr[1]){ //Kilobytes
		lvl_size_nmb = string(file_size/data_size_arr[0]);
		lvl_size_tp = " KB";
	} else { //Megabytes
		lvl_size_nmb = string(file_size/data_size_arr[1]);
		lvl_size_tp = " MB";
	}
	lvl_size = lvl_size_nmb + lvl_size_tp;
}
searched = true;
