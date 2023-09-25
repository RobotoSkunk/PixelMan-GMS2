/// @description Valores iniciales por defecto
image_alpha = 0;
image_speed = 0;
xpos = ideal_width + sprite_get_width(spr_Alex) + 1;
ypos = ideal_height+40;
new_ypos = ideal_height+40;
ym = 0;
in_use = false;
time_to_wait = 0;

credits = "";
headers = "";

for(var i = 0; i < sprite_get_number(spr_social_button); i++){
	sb[i] = 1;
}
al = 0;
can_use = false;

alarm[0] = 1;
