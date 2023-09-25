// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -10; // obj_player
global.__objectDepths[1] = 0; // obj_block
global.__objectDepths[2] = 1; // obj_springboard
global.__objectDepths[3] = 0; // obj_power_gravity
global.__objectDepths[4] = 2; // obj_saw
global.__objectDepths[5] = 1; // obj_saw_base
global.__objectDepths[6] = 0; // obj_spike
global.__objectDepths[7] = 1; // obj_cannon
global.__objectDepths[8] = 2; // obj_rocket
global.__objectDepths[9] = 0; // obj_killzone
global.__objectDepths[10] = 0; // obj_display_controller
global.__objectDepths[11] = 999; // obj_camera
global.__objectDepths[12] = 0; // obj_credits_controller
global.__objectDepths[13] = 0; // obj_camera_menu
global.__objectDepths[14] = 0; // obj_game_data
global.__objectDepths[15] = -10; // obj_pixel_IsDead
global.__objectDepths[16] = 10; // obj_pixel_explosion
global.__objectDepths[17] = 4; // obj_pixel_rocket
global.__objectDepths[18] = 4; // obj_pixel_walk
global.__objectDepths[19] = 0; // obj_color
global.__objectDepths[20] = 0; // obj_color_change


global.__objectNames[0] = "obj_player";
global.__objectNames[1] = "obj_block";
global.__objectNames[2] = "obj_springboard";
global.__objectNames[3] = "obj_power_gravity";
global.__objectNames[4] = "obj_saw";
global.__objectNames[5] = "obj_saw_base";
global.__objectNames[6] = "obj_spike";
global.__objectNames[7] = "obj_cannon";
global.__objectNames[8] = "obj_rocket";
global.__objectNames[9] = "obj_killzone";
global.__objectNames[10] = "obj_display_controller";
global.__objectNames[11] = "obj_camera";
global.__objectNames[12] = "obj_credits_controller";
global.__objectNames[13] = "obj_camera_menu";
global.__objectNames[14] = "obj_game_data";
global.__objectNames[15] = "obj_pixel_IsDead";
global.__objectNames[16] = "obj_pixel_explosion";
global.__objectNames[17] = "obj_pixel_rocket";
global.__objectNames[18] = "obj_pixel_walk";
global.__objectNames[19] = "obj_color";
global.__objectNames[20] = "obj_color_change";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for