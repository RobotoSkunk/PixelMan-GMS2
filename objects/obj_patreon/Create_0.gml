/// @description Inicializar
switch(languaje){
	case "Español":
		txt = @"¡PixelMan necesita tu ayuda!

		¡RobotoSkunk está trabajando en un servidor
		pagado para abandonar 000webhost y poder tener
		mayor libertad para el juego! Además de buscar
		comprar Game Maker Studio 2 para evitar problemas
		legales con YoyoGames. Sin embargo, todo esto requiere
		de un gasto y por eso pedimos tu ayuda.

		Al donar en nuestra página de Patreon, ¡estarás ayudando
		a RobotoSkunk para poder mejorar tanto PixelMan como
		otros de sus proyectos futuros!

		¡Por favor, ayúdanos a mejorar PixelMan!";
		btn_txt = "Ir a Patreon";
		break;
	case "Inglés":
		txt = @"PixelMan needs your help!

		RobotoSkunk is working on a server
		paid to leave 000webhost and have
		more freedom for the game! In addition to searching
		buy Game Maker Studio 2 to avoid legal problems
		with YoyoGames. However, all this requires
		of an expense and that's why we ask for your help.

		By donating on our Patreon page, you will be helping
		to RobotoSkunk to improve both PixelMan and
		others of his future projects!

		Please help us improve PixelMan!";
		btn_txt = "Go to Patreon";
		break;
	case "Portugués":
		txt = @"PixelMan precisa de sua ajuda!

		RobotoSkunk está trabalhando em um servidor
		pago para deixar 000webhost e ter
		mais liberdade para o jogo! Além de pesquisar
		compre o Game Maker Studio 2 para evitar problemas legais
		com YoyoGames. No entanto, tudo isso requer
		de uma despesa e é por isso que pedimos sua ajuda.

		Ao doar na nossa página do Patreon, você estará ajudando
		para RobotoSkunk para melhorar o PixelMan e
		outros de seus futuros projetos!

		Por favor, ajude-nos a melhorar o PixelMan!";
		btn_txt = "Vá para Patreon";
		break;
	default:
		txt = "ERROR_PATREONTXT";
		btn_txt = "ERROR_PATREONBTNTXT";
		break;
}
//https://patreon.com/RobotoSkunk