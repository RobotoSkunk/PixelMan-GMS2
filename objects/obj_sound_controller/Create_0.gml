/// @description Valores iniciales por defecto
globalvar aud, mus, snd_length, msc_length;
volume_in_game = 0;

aud = [snd_bullet_destroy, snd_death, snd_detected, snd_explosion, snd_gravity, snd_jump, snd_laser, snd_launch_bullet, snd_launch_rocket, snd_open_door, snd_rocket_fire, snd_spring, snd_switch, snd_saw];
mus = [msc_random_01];
snd_length = array_length_1d(aud);
msc_length = array_length_1d(mus);
