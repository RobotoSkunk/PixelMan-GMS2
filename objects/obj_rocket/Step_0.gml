/// @description Procesador
if(restart){
	instance_destroy();
}

if (pause){
    speed = 0;
    image_speed = 0;
	audio_pause_sound(snd);
    exit;
} else {
	audio_resume_sound(snd);
}
#region después de explotar
if (explode){
    sprite_index = spr_explosion_1;
    if (is_player) kill = true;
    depth = 5;
    speed = 0;
    image_angle = 0;
    image_speed = 0.4;
    image_xscale = scale;
    image_yscale = scale;
	audio_stop_sound(snd);
    if (image_index > image_number-1) instance_destroy();
    exit;
}
#endregion
image_speed = 0.2;
if(!hide_particles){
	pp = instance_create(x, y, obj_pixel_rocket);
	scale = random_range(1, 1.2)*image_xscale;
	pp.image_xscale = scale;
	pp.image_yscale = scale;
}

#region Dirección
if (!IsDead){
	dir =  point_direction(x,y, player_id.x, player_id.y);
	direction += sin(degtorad(dir - direction))*6;
	speed = v;
    image_angle = direction;
} else {
	direction += sin(degtorad(dir - direction))*6;
	speed = v;
    image_angle = direction;
    if (distance_to_object(player_id) < 25){
        explode = true;
		if(!hide_particles){
	        repeat(25){
	            pixel = instance_create(x, y, obj_pixel_explosion);
	        }
		}
        image_index = 0;
        is_player = 1;
        out_room = true;
    }
}
#endregion
#region Explosión
if (place_meeting(x, y, player_id) or place_meeting(x, y, obj_block) or place_meeting(x, y, obj_rocket) or place_meeting(x, y, obj_laser)){
    if (place_meeting(x, y, player_id) and !IsDead){
        shake_bool = true;
		audio_play_sound(snd_explosion, 100, 0);
		if(!hide_particles){
	        repeat(25){
	            pixel = instance_create(x, y, obj_pixel_explosion);
				S = choose(random(0.4), 1)*image_xscale;
				pixel.image_xscale = S;
				pixel.image_yscale = S;
				pixel.X = choose(random(50), random(-50))*image_xscale;
				pixel.Y = choose(random(50), random(-50))*image_xscale;
				pixel.M = -0.05*image_xscale;
	        }
		}
        is_player = 1;
    } else if (place_meeting(x, y, obj_block) or place_meeting(x, y, obj_rocket) or place_meeting(x, y, obj_laser)){
        shake_bool = true;
		audio_play_sound(snd_explosion, 100, 0);
		if(!hide_particles){
	        repeat(25){
	            pixel = instance_create(x, y, obj_pixel_explosion);
				S = choose(random(0.4), 1)*image_xscale;
				pixel.image_xscale = S;
				pixel.image_yscale = S;
				pixel.X = choose(random(50), random(-50))*image_xscale;
				pixel.Y = choose(random(50), random(-50))*image_xscale;
				pixel.M = -0.05*image_xscale;
	        }
		}
    }
    explode = true;
    image_index = 0;
}
#endregion
