/// @description Cargar créditos
var special_thanks = ["@AnimaToonsYt", "@NicolaOwO", "@SynieD", "@GarciaJorgell", "@TheNachoBIT",
"@BootDarkGames", "@YotoGames", "@sofiayoshik2", "@qorg11", "@SaraLaGrrrl"],
final_thanks = "";
for(var i = 0; i < array_length_1d(special_thanks); i++){
	final_thanks = final_thanks + special_thanks[i] + "\n";
}

switch(languaje){
	case "Español":
		credits = @"&B-Desarrollador-
		RobotoSkunk
		 
		&B-Diseño de sprites-
		RobotoSkunk
		@NicolaOwO
		 
		&B-Música-
		@diegoforce49
		 
		&B-Sonidos FX-
		RobotoSkunk
		 
		&B-Agradecimientos especiales-
		"+ final_thanks +
		@"¡¡Y muchos más!!
		
		Gracias por apoyarme descargando
		este juego <3
		 
		Versión " + string(GM_version) + @"
		©RobotoSkunk " + string(date_get_year(date_current_datetime())) + @"
		
		
		Programado en";
		break;
	case "Inglés":
		credits = @"&B-Developer-
		RobotoSkunk
		 
		&B-Sprites designs-
		RobotoSkunk
		@NicolaOwO
		 
		&B-Music-
		@diegoforce49
		 
		&B-FX sounds-
		RobotoSkunk
		 
		&B-Special thanks-
		"+ final_thanks +
		@"And more!!
		 
		Thanks for supporting me
		downloading this game <3
		 
		Version " + string(GM_version) + @"
		©RobotoSkunk " + string(date_get_year(date_current_datetime())) + @"
		
		
		Programmed in";
		break;
	case "Portugués":
		credits = @"&B-Desenvolvedor-
		RobotoSkunk
		 
		&B-Sprites design-
		RobotoSkunk
		@NicolaOwO
		 
		&B-Música-
		@diegoforce49
		 
		&B-FX sounds-
		RobotoSkunk
		 
		&B-Agradecimentos especiais-
		" + final_thanks +		
		@"E mais!!
		 
		Obrigado por me apoiar baixando
		este jogo <3
		 
		Versão " + string(GM_version) + @"
		©RobotoSkunk " + string(date_get_year(date_current_datetime())) + @"
		
		
		Programado no";
		break;
}
//credits = credits + "\n";
credits = string_replace_all(credits, "	", "");

var new_txt = "", arr, new_orig_txt = credits;
arr = scr_string_split(credits, "\n");

//Procesar texto
for(var i = 0; i < array_length_1d(arr); i++){
	if(string_copy(arr[i], 1, 2) == "&B"){
		new_txt = new_txt + string_replace(arr[i], "&B", "") + "\n";
		
		for(var a = i + 1; a < array_length_1d(arr); a++){
			if(string_copy(arr[a], 1, 2) == "&B") then break;
			new_txt = new_txt + " \n";
		}
		
		if(i != 0) new_orig_txt = string_replace(new_orig_txt, arr[i], " ");
		else new_orig_txt = string_replace(new_orig_txt, arr[i], "");
	}
}

credits = new_orig_txt;
headers = new_txt;
