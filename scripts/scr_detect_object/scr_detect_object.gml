type = argument0;

switch(type){
	case -1:
		var obj = obj_room_properties;
		break;
	case 0:
		var obj = obj_block;
		break;
	case 1:
		var obj = obj_player;
		break;
	case 2:
		var obj = obj_springboard;
		break;
	case 3:
		var obj = obj_power_gravity;
		break;
	case 4:
		var obj = obj_special_block_1;
		break;
	case 5:
		var obj = obj_saw;
		break;
	case 6:
		var obj = obj_saw_base;
		break;
	case 7:
		var obj = obj_killzone;
		break;
	case 8:
		var obj = obj_gun;
		break;
	case 9:
		var obj = obj_cannon;
		break;
	case 10:
		var obj = obj_spike;
		break;
	case 11:
		var obj = obj_laser_gun;
		break;
	case 12:
		var obj = obj_final_door;
		break;
	case 13:
		var obj = obj_switch;
		break;
	case 14:
		var obj = obj_platform;
		break;
	case 15:
		var obj = obj_mobile_saw_base;
		break;
	case 16:
		var obj = obj_gun_wall;
		break;
	case 17:
		var obj = obj_bomb;
		break;
	case 18:
		var obj = obj_letter;
		break;
	default:
		var obj = obj_editor_bug;
		break;
}
return obj;