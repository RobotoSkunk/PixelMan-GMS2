/// @description Valores iniciales por defecto
image_angle = point_direction(x, y, obj_player.x, obj_player.y);
scale = 1.5;
time = 0;
depth = 2;
v = 3;
xpos = random(room_width);
ypos = random(room_height);
destroy = false;
explode = false;
is_player = 0;
player_id = obj_player.id;
dir = 0;
snd = audio_play_sound(snd_rocket_fire, 100, 1);