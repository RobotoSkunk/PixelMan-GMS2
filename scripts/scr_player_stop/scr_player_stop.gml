/// @description Procesador de velocidades
image_speed = 0;
image_index = 0;
sprite_index = player_stand;

switch hdirect {
    case "left":
        image_xscale = -1;
        break;
    case "right":
        image_xscale = 1;
        break;
}
switch (grav){
    case 1:
        yscale = 1;
        break;
    default:
        yscale = -1;
        break;
}
