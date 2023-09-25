/// @description Debug
if(room == rm_initializer){
	surface_resize(application_surface, display_get_width(), display_get_height());
	display_set_gui_size(display_get_width(), display_get_height());
	var prop, os_prop = "";
	for(var i = 0; i < os_map_size; i++){
		os_prop = os_prop + string(os_map_data[i]) + "\n";
	}
	prop = 
@"----------------------------------------
               Properties
----------------------------------------
Timezone: " + string(timezone_local) + @"
OS: " + string(os_type) + @"
Is Android: " + string(os_type == os_android) + @"
Is iOS: " + string(os_type == os_ios) + @"
Is Windows: " + string(os_type == os_windows) + @"
Is MacOSX: " + string(os_type == os_macosx) + @"
Is Linux: " + string(os_type == os_linux) + @"
Runtime: " + string(GM_runtime_version) + @"

----------------------------------------
             OS properties
----------------------------------------
" +
 os_prop
+ @"----------------------------------------
RobotoSkunk initializer engine (c)" + string(date_get_year(date_current_datetime())) + @" RSIE

Initializing...";
			
	draw_set_font(fnt_console);
	draw_set_color(c_white);
	draw_text(5, 5, prop);
	draw_set_font(-1);
}
