/// @description Procesador
if(restart){
	instance_destroy();
}
if (pause) {image_speed = 0; exit;}
image_speed = 0.5;
image_yscale += sp;
if (image_yscale <= 0) {instance_destroy();}