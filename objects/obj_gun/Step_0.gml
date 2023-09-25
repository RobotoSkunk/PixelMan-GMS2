/// @description Procesador
if (pause || restart) {exit;}
var player_id = scr_search_player();
ang = point_direction(x, y, player_id.x, player_id.y);
if(time <= 0){
	time = 0.05;
}
#region Contador
if (!collision_line(x, y, player_id.x, player_id.y, obj_block, 0, 0) && !IsDead && point_distance(x, y, player_id.x, player_id.y) < (rad-5)*image_xscale){
	t++;
	image_angle += sin(degtorad(ang - image_angle))*10;
	if (t > room_speed*time){
		new_inst = instance_create_depth(x+lengthdir_x(23, image_angle)*image_xscale, y+lengthdir_y(23, image_angle)*image_yscale, depth+0.1, obj_bullet);
		if(instance_exists(new_inst)){
			new_inst.direction = image_angle;
			new_inst.image_xscale = image_xscale;
			new_inst.image_yscale = image_yscale;
		}
		audio_play_sound(snd_launch_bullet, 100, 0);
		t = 0;
	}
} else t = room_speed*0.2;
#endregion
#region Advertencias

if (rad1 < (rad/2)*image_xscale){
    al += 0.006;
} else {al += -0.005;}
if (rad1 < rad*image_xscale){
        rad1 += 2.5*image_xscale;
    } else {rad1 = 0; al = 0;}
#endregion
