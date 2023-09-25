/// @description Inserte aquí la descripción
if(restart){
	instance_destroy();
}
if (pause) {image_speed = 0; speed = 0; exit;}
image_speed = 0.5;
speed = 3+image_xscale
//Eliminar
condition = place_meeting(x, y, obj_player) or place_meeting(x, y, obj_block);
if (condition){
	if (place_meeting(x, y, obj_player)) kill = true;
	if(!hide_particles){
		repeat(8){
			pixel = instance_create(x, y, obj_pixel_explosion_bullet);
			S = choose(random(0.2)+0.8)*image_xscale;
			pixel.image_xscale = S;
			pixel.image_yscale = S;
			pixel.X = choose(random(25), random(-25))*image_xscale;
			pixel.Y = choose(random(25), random(-25))*image_xscale;
			pixel.M = -0.06*image_xscale;
	    }
	}
	audio_play_sound(snd_bullet_destroy, 100, 0);
	instance_destroy();
}
if(x > room_width or x < 0 or y > room_height or y < 0) instance_destroy();
//Otros aspectos
image_angle = direction;