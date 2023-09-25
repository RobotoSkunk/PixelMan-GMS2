/// @description Inicializar
if(!variable_global_exists("menu_active")){
	globalvar menu_active;
	menu_active = -1;
}
depth = 5;
/*********************
-1 = default (menu)
0 = exit
1 = selector
	1.1 = worlds
	1.2 = online
	1.3 = editor
2 = customize
3 = settings
4 = account
5 = info
**********************/
al = 0;

btn_nmb = 3;
x_arr = array_create(btn_nmb, -25);
can_use = false;
goto = -1;

x_arr_2 = array_create(3, 1);

stv = 2;
st1 = 0;
st2 = 90;

al_exit = 0;

arr_btn2 = scr_array2d([[-1, -1, 129, 50],
						[0, ideal_height-50, 129, ideal_height],
						[ideal_width-129, ideal_height-50, ideal_width, ideal_height]]);

timer = array_create(10, 0);
