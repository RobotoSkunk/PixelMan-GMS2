/// @description Procesador
if(restart){
	mask_index = spr_bomb;
	sprite_index = spr_bomb;
	explode = false;
	exit;
}

if pause exit;

if(explode){
	sprite_index = spr_explosion_1;
	image_speed = 0.4;
	depth = 5;
	if (image_index > image_number-1) {mask_index = -1; sprite_index = -1; image_alpha = 0;}
}

if((place_meeting(x, y, obj_player)) && !explode){
	shake_bool = true;
	audio_play_sound(snd_explosion, 100, 0);
	explode = true;
	kill = true;
	if(!hide_particles){
		repeat(25){
			var pixel = instance_create(x, y, obj_pixel_explosion);
			var S = choose(random(0.4), 1)*image_xscale;
			pixel.image_xscale = S;
			pixel.image_yscale = S;
			pixel.X = choose(random(50), random(-50))*image_xscale;
			pixel.Y = choose(random(50), random(-50))*image_xscale;
			pixel.M = -0.05*image_xscale;
		}
	}
} else if((place_meeting(x, y, obj_rocket) || place_meeting(x, y, obj_laser)) && !explode){
	shake_bool = true;
	audio_play_sound(snd_explosion, 100, 0);
	explode = true;
	if(!hide_particles){
		repeat(25){
			var pixel = instance_create(x, y, obj_pixel_explosion);
			var S = choose(random(0.4), 1)*image_xscale;
			pixel.image_xscale = S;
			pixel.image_yscale = S;
			pixel.X = choose(random(50), random(-50))*image_xscale;
			pixel.Y = choose(random(50), random(-50))*image_xscale;
			pixel.M = -0.05*image_xscale;
		}
	}
}