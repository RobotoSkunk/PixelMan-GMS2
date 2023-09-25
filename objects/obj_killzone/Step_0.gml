/// @description Procesador
if(room == rm_editor){
	al = 1-((distance_to_object(obj_player)-10)/100);
	image_alpha = lerp(image_alpha, al, 0.1);
}