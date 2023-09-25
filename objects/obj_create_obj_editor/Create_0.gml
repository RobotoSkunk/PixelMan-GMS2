/// @description Inicializar
image_speed = 0;

xg = 0;
yg = 0;
grab = false;
can_grab = true;

type = 0;
free_aspect = false;
resize = false;
select = false;
can_change = true;
can_angle = true;
duplicated = false;
mult_select = false;

menu = false;
al = 0;
an = 0;
st = -1;

is_mobile = os_type == os_android || os_type == os_ios;

for(var i = 0; i < 10; i++){
	arg[i] = 0;
	arg_txt[i] = "?????";
}
_depth = 0;

scr_editor_obj(true);

can_chg = true;
can_ang = true;
rz = true;
free_asp = true;
wht_is = "FATAL_ERROR_EDITOR_0";
b = false;
xsz = 0;
ysz = 0;
rx = 1;
ry = 1;

image_alpha = 0;
alarm[0] = 2;

//Variables de instancias
start_time = 0;
time = 1;
ID = 0;
block_random = round(random(8));
spawn_saw = true;
start_in = 0; //[0, 2]
tp = 0; //[0, 2]
symbol = 0;
gr = 1;
obj_speed = 2;

is_scnd_player = false;
