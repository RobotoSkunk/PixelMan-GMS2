/// @description Procesador principal
#region Variables pause, won, IsDead
if(restart){
	x = init_pos[0];
	y = init_pos[1];
	vdirect = "up";
	hdirect = "right";
	IsDead = false;
	can_jump = true;
	grav = init_grav;
	kill = false;
	cjh = true;
	already_explode = false;
	image_alpha = 1;
	vv = 0;
	vh = 0;
	if(is_scnd_player){
		scr_player_sprites(irandom(spr_max-1));
		image_blend = make_color_hsv(irandom(255), irandom(255), 235 + irandom(20));
	}
	sprite_index = player_jump;
	yscale = grav;
	image_xscale = 1;
	image_index = image_number-1;
	timer[0] = 0;
	exit;
}

if (won){
	if(room == rm_editor) {
		IsDead = true;
	}
}

if (IsDead){
    vspeed = 0;
    hspeed = 0;
    image_alpha = 0;
	image_speed = 0;
	if(!already_explode && !hide_particles){
		repeat(15){
	        var pix_death = instance_create(x, y, obj_pixel_IsDead);
			pix_death.image_blend = image_blend;
	    }
		already_explode = true;
	}
    exit;
}

if (pause){
    vspeed = 0;
    hspeed = 0;
    image_speed = 0;
    exit;
}
#endregion
#region Controles y variables extra
    //Controles
var dU, U, L, R, colX, col_lineX, colY, col_lineY, inherit_col, plat_colY, plat_col_lineY;
inherit_col = place_meeting(x, y, obj_springboard);
if(pant_div){
	if (!won){
		if(!is_scnd_player){
			U = (keyboard_check_pressed(ord("W"))) && !inherit_col;
			dU = (keyboard_check(ord("W"))) && !inherit_col;
			L = keyboard_check(ord("A"));
			R = keyboard_check(ord("D"));
		} else {
			U = (keyboard_check_pressed(vk_up)) && !inherit_col;
			dU = (keyboard_check(vk_up)) && !inherit_col;
			L = keyboard_check(vk_left);
			R = keyboard_check(vk_right);
		}
	} else {
		L = false;
		U = false;
		dU = false;
		R = false;
	}
} else {
	if (!won){
		U = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(device, gp_face1)) && !inherit_col;
		dU = (keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(device, gp_face1)) && !inherit_col;
		L = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_axis_value(device, gp_axislh)<-0.7;
		R = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_axis_value(device, gp_axislh)>0.7;
	} else {
		L = false;
		U = false;
		dU = false;
		R = false;
	}
}
    //Colisiones X
colX = place_meeting(x+vh+2, y, obj_block) || place_meeting(x+sign(vh)/2, y, obj_block) || place_meeting(x+vh-2, y, obj_block);
col_lineX = collision_line(x, y, x+vh^2, y, obj_block, true, false);
desblock = collision_rectangle(x+4, y+8, x-4, y-8, obj_block, false, false);
    //Colisiones Y
colY = place_meeting(x, y+(vv+2)*grav, obj_block) || place_meeting(x, y+sign(vv*grav)/2, obj_block);
col_lineY = collision_line(x, y, x, y+vv*grav, obj_block, true, false);

plat_colY = place_meeting(x, y+(vv+2)*grav, obj_platform) || place_meeting(x, y+sign(vv*grav)/2, obj_platform);
plat_col_lineY = collision_line(x, y, x, y+vv*grav, obj_platform, true, false);
#endregion
#region Sprites

if (hspeed < 0){
    hdirect = "left";
} else if (hspeed > 0) {
    hdirect = "right";
}

if (vspeed*grav < 0){
    vdirect = "up";
} else if (vspeed*grav > 0) {
    vdirect = "down";
} else vdirect = "none";
if (speed != 0) {scr_player_walking(R, L);}
else {scr_player_stop();}
#endregion
#region Velocidades
	//Desatascar al jugador
if (desblock != noone){
	for (var i = 0; i<abs(power(vv, 2)); i++){
		if (!place_meeting(x, y+sign(vv*grav), obj_block)) then break;
		y += sign(-vv*grav);
	}
	for (var i = 0; i<abs(vh*vh); i++){
		if (!place_meeting(x+sign(vh), y, obj_block)) then break;
		x += sign(-vh);
	}
}

#region Salto
var pl = collision_rectangle(x+4, y+10+vspeed, x-4, y-10+vspeed, obj_platform, false, false);
if(pl != noone){
	var pl_col1 = ((round(bbox_bottom + 1) < (pl.bbox_top)) && (pl.gr == 1) && grav == 1);
	var pl_col2 = ((round(bbox_top + 1) > (pl.bbox_bottom)) && (pl.gr == -1) && grav == -1);
} else {
	var pl_col1 = false;
	var pl_col2 = false;
}


var pl_con = ((plat_col_lineY || plat_colY) && (pl_col1 ^^ pl_col2));
if ((colY || col_lineY) || pl_con){
	if(pl_con){
		//var vvr = pl_col2 - pl_col1;
		for (var i = 0; i<abs(vv); i++){
	        if (place_meeting(x, y+sign(vv*-grav)/2, obj_platform)) then break;
	        y += sign(vv*-grav)/2;
	    }
	}
    for (var i = 0; i<abs(vv); i++){
        if (place_meeting(x, y+sign(vv*grav)/2, obj_block)) then break;
        y += sign(vv*grav)/2;
    }
    vv = 0;
    vv += U * -vvsp * 0.3;
	if(U) audio_play_sound(snd_jump, 100, 0);
	cjh = true;
	can_jump = true;
} else {
	if ((vv < -vvsp*0.7) || !dU) can_jump = false;
    if((vv < 0) && can_jump) vv += -vvsp*0.08;
	else vv += 0.5;
	
	vv = clamp(vv, -vvsp*2, vvsp);
}
#endregion
#region Movimiento horizontal
var can_move = true;
if(inherit_col){
	tfix++;
	tfix = clamp(tfix, 0, 5);
	can_move = (tfix == 5);
} else {
	tfix = 0;
}


if(can_move){
	if(cjh){
		if R - L != 0 cjh = true;
		prox_vh = lerp(prox_vh, vhmax*(R - L), 0.3);
		if(pl_con){
			var new_vh = pl.hspeed;
			vh = new_vh + prox_vh;
		} else {
			vh = prox_vh;
		}
	} else {
		prox_vh = 0;
		vh = lerp(vh, vhmax*(R - L), cjr);
	}
} else {
	vh = lerp(vh, 0, 0.01);
	prox_vh = 0;
}

if (colX || col_lineX || (x <= 0) || (x >= room_width)){
    for (var i = 0; i<abs(vh); i++){
        if (place_meeting(x+sign(vh), y, obj_block)) then break;
        x += sign(vh);
    }
	if(x < -8) x = 0;
	else if(x > room_width+8) x = room_width;
    vh = 0;
    prox_vh = 0;
	cjh = true;
}
#endregion

vspeed = vv*grav;
hspeed = vh;

#endregion
#region Si colisiona con un Killzone o se cae
if(!won){
	if (grav = 1) out_room = y > room_height;
	else out_room = y < 0;

	if (place_meeting(x, y, obj_killzone) or out_room or kill){
		if(room != rm_editor){
			alarm[0] = room_speed;
		}
	    IsDead = true;
		audio_play_sound(snd_death, 100, 0);
	}
}
img = image_index;
#endregion
#region Detalles
if(timer[0] < 25){
	timer[0]++;
	timer[1]++;
	if(timer[1] > 2){
		switch(image_alpha){
			case 1: image_alpha = 0; break;
			default: image_alpha = 1; break;
		}
		timer[1] = 0;
	}
} else if(image_alpha == 0){
	image_alpha = 1;
}
#endregion
x = clamp(x, 0, room_width);
