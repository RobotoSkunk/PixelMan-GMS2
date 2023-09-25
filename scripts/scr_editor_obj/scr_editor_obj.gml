obj_sprites = [spr_block, spr_player_stand, spr_springboard, spr_gravity, spr_special_block_1, spr_saw, spr_saw_base, spr_killzone, spr_gun, spr_cannon, spr_spike, spr_laser_gun, spr_final_door, spr_switch, spr_platform_0, spr_mobile_saw_base, spr_gun_wall, spr_bomb, spr_letter];
			//0				1					2				3				4				5			6				7			8		9			10			11				12				13			14				15					16			17			18
	// 0    1   2  3  4  5  6   7   8  9 10 11  12  13 14 15 16 17 18
dp = [-11, -10, 1, 1, 1, 2, 1, -12, 1, 1, 0, 1, -9, -9, 1, 0, 1, 2, 9];
what_is = [text[19], text[20], text[21], text[22], text[23], text[24], text[25], text[26], text[27], text[28], text[29], text[30], text[32], text[33], text[94], text[95], text[96], text[97], text[98]];
if(argument0){
	resize =		[1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1];
	can_angle =		[0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1];
	can_change =	[1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1];
	free_aspect =	[1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	editor_obj_nmb = array_length_1d(obj_sprites);
	block_array = [spr_block, spr_block_default];
	platform_array = [spr_platform_0, spr_platform_1, spr_platform_2];
	#region Opciones del menú
	men_z =			[1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
	men_options =	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1];
	men_bool =		[0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0];
	men_camptxt =	[0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0];
	#endregion
}
