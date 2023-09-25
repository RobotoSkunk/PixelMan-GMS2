/// @description Variables iniciales

//Player animation
yspeed = 0;
xs = 0;
ys = 0;
frame = 0;
lx = 0;
sz = 1.5;

//Circle
r = 0;

//Transition 1
al = 1;

//Transition 2s
xp1 = -1;
xp2 = ideal_width+1;

//Animation event
event = -2;
end_intro = false;

//Shake
shake = true;
sx = 0;
sy = 0;

//Timeline
timeline_index = tml_intro;
timeline_loop = false;
timeline_running = false;

switch(languaje){
	case "Español":
		txt = ["-Juego en fase beta-\n\nEste videojuego está todavía en desarrollo. Es posible que la versión que esté a punto de jugar sea muy inestable y algunas funciones y/o archivos del juego dejarán de funcionar en futuras versiones.\n\nLamentamos las molestias.",
		"-Advertencia de ataques epilepticos fotosensivos-\n\nEste juego contiene cambios de colores rápidos, por favor juegue con una luz encendida y manténgase alejado de la pantalla."];
		break;
	case "Inglés":
		txt = ["-Game in beta-\n\nThis game is still in development. It is possible that the version that is about to play is very unstable and some features and/or game files will stop working in future versions.\n\nWe apologize for the inconvenience.",
		"-Warning of photosensitive epileptic seizures-\n\nThis game contains quick color changes, please play with a light on and stay away from the screen."];
		break;
	case "Portugués":
		txt = ["-Game em beta-\n\nEste jogo ainda está em desenvolvimento. É possível que a versão que está prestes a ser reproduzida seja muito instável e alguns recursos e/ou arquivos do jogo parem de funcionar em versões futuras.\n\nPedimos desculpas pelo inconveniente.",
		"-Advertência de convulsões epilépticas fotossensíveis-\n\nEste jogo contém mudanças rápidas de cor, por favor, jogue com uma luz acesa e fique longe da tela."];
		break;
}
ad_al = [0, 0];
window_set_cursor(cr_default);
