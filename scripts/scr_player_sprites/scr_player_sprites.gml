/// @param sprite_index* {real}

spr_player_array = [spr_player_stand, spr_player_stand_1, spr_player_stand_2, spr_player_stand_3];
spr_player_array_run = [spr_player_running, spr_player_running_1, spr_player_running_2, spr_player_running_3];
spr_player_array_fall = [spr_player_falling, spr_player_falling_1, spr_player_falling_2, spr_player_falling_3];
spr_player_array_jump = [spr_player_jumping, spr_player_jumping_1, spr_player_jumping_2, spr_player_jumping_3];
spr_max = array_length_1d(spr_player_array);

if(argument_count == 1){
	var spr = argument[0];
} else {
	var spr = spr_player;
}

if(spr > 0 && spr < spr_max){
	player_stand = spr_player_array[spr];
	player_run = spr_player_array_run[spr];
	player_fall = spr_player_array_fall[spr];
	player_jump = spr_player_array_jump[spr];
} else {
	player_stand = spr_player_array[0];
	player_run = spr_player_array_run[0];
	player_fall = spr_player_array_fall[0];
	player_jump = spr_player_array_jump[0];
}
