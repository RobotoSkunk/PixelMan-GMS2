/// @description Procesador
if (pause || restart){
    exit;
}
var player_id = scr_search_player();
if(time <= 0){
	time = 0.05;
}
#region Encontrar jugador
if (!collision_line(x, y, player_id.x, player_id.y, obj_block, 0, 0) && point_distance(x, y, player_id.x, player_id.y) < (rad-5)*image_xscale && !IsDead){
    angle = point_direction(x,y, player_id.x, player_id.y);
	image_angle += sin(degtorad(angle - image_angle))*15;
    if (t < room_speed*time){
        t++;
    } else {
        new_inst = instance_create_depth(x+lengthdir_x(21, image_angle)*image_xscale, y+lengthdir_y(14, image_angle)*image_yscale, depth+0.1, obj_rocket);
        if(instance_exists(new_inst)){
			new_inst.image_xscale = image_xscale;
			new_inst.image_yscale = image_yscale;
			new_inst.scale = image_xscale*1.5;
			new_inst.v = 2+image_xscale;
			new_inst.direction = image_angle;
			new_inst.player_id = player_id;
		}
		audio_play_sound(snd_launch_rocket, 100, 0);
		t = 0;
    }
} else {
    t = room_speed*(time-0.5);
    angle += 1;
	image_angle += sin(degtorad(angle - image_angle))*10;
}
#endregion
#region Advertencias

if (rad1 < (rad/2)*image_xscale){
    al += 0.006;
} else {al += -0.005;}
if (rad1 < rad*image_xscale){
        rad1 += 2.5*image_xscale;
    } else {rad1 = 0; al = 0;}
#endregion