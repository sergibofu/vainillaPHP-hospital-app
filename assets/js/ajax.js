//llamadas ajax a los servicios

function llamadaAjax(servicio, parametros, tipoResp) {
	//obligatorio utilizar una promesa debido a la asincronia
	return new Promise((aceptar, rechazar) => {
		fetch(servicio, parametros)
		.then((respuesta) => {
			if (respuesta.ok) {
				switch (tipoResp) {
					case 'json':
						return respuesta.json();
					default:	
						throw ('tipo de respuesta no válido')
				}
			} else {
				console.log(respuesta)
				throw ('algo ha ido mal en la petición');
			}
		})
		.then((mensaje) => {
			console.log(mensaje)
			aceptar(mensaje)
		})
		.catch((error) => {
			console.log(error)
			rechazar(error)
		})
	})
	
}