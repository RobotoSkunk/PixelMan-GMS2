/// @description Inicializar
timer = array_create(10, -1);

if(!variable_global_exists("lvl_data")){
	globalvar lvl_data;

	//Viewing level, index, level_data
	lvl_data = [false, 0, ""];
	lvl_nmb = 0;
	finding_lvls = false;
} else {
	timer[0] = 5;
	lvl_nmb = -1;
	finding_lvls = true;
}

lvl_al = 0;

page = 0;
sz = array_create(sprite_get_number(spr_menu_select_button)+2, 1);

al = [0, 0, 0, 0];
can_use = [0, 0, 0, 0];

page_x = 0;
file = "";
lvls = undefined;
lvls_col = undefined;
aa = "";
y_btn = 0;
y_to = 0;

btn_sz_sel = [0.8, 0.8];

sload = 0;
line = -1;
wait = 2;

chg_name = false;
new_name = "";
chg_desc = false;
new_desc = "";
line_sz = [0, 0, 0];
btn_lvl_sz[4] = 1;

new_lvl = false;
new_lvl_chg = false;
ul_al = 0;
new_lvl_name = "";
process_lvl = false;

going_to_dlt = false;
deleting = false;
al_dlt = 0;
del_dir = "";
file_del = "";
files_deleted = 0;
