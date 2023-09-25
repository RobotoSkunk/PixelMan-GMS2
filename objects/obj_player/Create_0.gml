/// @description Valores por defecto
globalvar vvsp, IsDead, kill, won;

scr_player_sprites();

image_speed = 0;
depth = -10;
image_blend = hex2col(hex_col);
sprite_index = player_jump;
image_index = image_number-1;
yscale = 1;

vv = 0;
vh = 0;
vhmax = 3;
vvsp = 8;
IsDead = false;
can_jump = true;
img = image_index;
grav = 1;
won = false;
kill = false;
cjh = true;
already_explode = false;
cjr = 0.3;
prox_vh = 0;

//Estado de movimiento
vdirect = "noone";
hdirect = "right";
init_grav = 1;

randomize();
if(!instance_exists(obj_camera) && room != rm_editor){
	camera_id = instance_create(random_range(x-25, x+25), random_range(y-25, y+25), obj_camera);
} else {
	camera_id = obj_camera.id;
}

pant_div = false;
player_2 = [x, y];
is_scnd_player = false;
alarm[1] = 3;
alarm[2] = 2;
alarm[3] = 2;
tfix = 0;
init_pos = [x, y];
obj_id_arr = [];

timer = [25, 0];

//touchpad_id = instance_create(x, y, obj_touchpad);
