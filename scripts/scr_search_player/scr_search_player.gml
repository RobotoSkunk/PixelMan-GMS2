var player_searched, player_distance, player_nmb;
player_nmb = instance_number(obj_player);
if(player_nmb > 1){
	for(var i = 0; i < player_nmb; i++){
		player_searched[i] = instance_find(obj_player, i);
		player_distance[i] = point_distance(x, y, player_searched[i].x, player_searched[i].y);
	}
	if(player_distance[0] < player_distance[1]){
		return player_searched[0];
	} else {
		return player_searched[1];
	}
} else {
	return obj_player.id;
}