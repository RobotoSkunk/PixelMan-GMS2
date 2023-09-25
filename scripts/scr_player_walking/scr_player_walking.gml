/// @description Procesador de velocidades
var R, L;
R = argument0;
L = argument1;
switch hdirect{
    case "left":
        if(R - L != 0) image_xscale = -1;
        break;
    case "right":
        if(R - L != 0) image_xscale = 1;
        break;
}
switch (grav){
    case 1:
        yscale = 1;
        break;
    default:
        yscale = -1;
        break;
}

if (vv != 0){
    switch vdirect {
        case "up":
            sprite_index = player_jump;
            image_speed = 0.2;
            if (image_index > image_number-1){
                image_index = image_number-1;
            }
            break;
        case "down":
            sprite_index = player_fall;
            image_speed = 0.5;
            if (image_index > image_number-1){
                image_index = image_number-1;
            }
            break;
    }
} else if(R - L != 0){
    sprite_index = player_run;
    image_speed = 0.4;
    if (vh != 0 && random(3) < 1 && place_meeting(x, y+2*grav, obj_block) && !hide_particles){
		var new_px = instance_create(x, y+(sprite_get_height(spr_player_mask)/2)*grav, obj_pixel_walk);
		new_px.xdir = random(0.6)*sign(vv);
		new_px.ydir = random(0.6)*-grav;
		new_px.image_blend = image_blend;
    }
} else {
	sprite_index = player_stand;
	image_speed = 0;
}
