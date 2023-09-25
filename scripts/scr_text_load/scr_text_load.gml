///@param number {real}
///@param max {real}
///@param load/save {bool}
var txt = [];
var arg0 = clamp(argument0, 0, argument1);

if(!argument2){
	switch(languaje){
		case "Español":
			txt = [string(round((arg0*100)/argument1)) + "% cargado...",
				   string(arg0 + 1) + "/" + string(argument1) + " instancias cargadas..."];
			break;
		case "Inglés":
			txt = [string(round((arg0*100)/argument1)) + "% loaded...",
				   string(arg0 + 1) + "/" + string(argument1) + " instances loaded..."];
			break;
		case "Portugués":
			txt = [string(round((arg0*100)/argument1)) + "% carregado...",
				   string(arg0 + 1) + "/" + string(argument1) + " instâncias carregadas..."];
			break;
		default:
			text_change = 1;
			languaje = "Inglés";
			break;
	}
} else {
	switch(languaje){
		case "Español":
			txt = [string(round((arg0*100)/argument1)) + "% guardado...",
				   string(arg0 + 1) + "/" + string(argument1) + " instancias cargadas..."];
			break;
		case "Inglés":
			txt = [string(round((arg0*100)/argument1)) + "% saved...",
				   string(arg0 + 1) + "/" + string(argument1) + " instances saved..."];
			break;
		case "Portugués":
			txt = [string(round((arg0*100)/argument1)) + "% salvo...",
				   string(arg0 + 1) + "/" + string(argument1) + " instâncias salvas..."];
			break;
		default:
			text_change = 1;
			languaje = "Inglés";
			break;
	}
}

return txt[prec_data];
