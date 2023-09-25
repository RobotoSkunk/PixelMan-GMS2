/// @description Valores iniciales por defecto
player_color = hex2col(hex_col);
rgb = [colour_get_red(player_color), colour_get_green(player_color), colour_get_blue(player_color)];
hsv = [color_get_hue(player_color), color_get_saturation(player_color), color_get_value(player_color)];

player_color = make_colour_hsv(hsv[0], hsv[1], hsv[2]);
mod_color = 0;

scr_player_sprites();
for(var i = 0; i < spr_max; i++){
	bt_col[i] = -1;
	bt_sz[i] = 1;
}
f = 0;
prev_act = 0;
prev_zoom = 5;
prev_zoom_in = 4;
prev_anim = false;
sel_sz = [0, 0];

in_use = -1;
btn_col_sz[3] = 1;

posX = 0;
posY = 0;
angle = 0;

al = 0;
can_use = false;

new_hex = hex_col;

image_alpha = 0;
image_speed = 0;
image_index = 0;
x = 0;
y = 0;