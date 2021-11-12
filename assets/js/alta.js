//operativa de alta de paciente

//listener del boton de alta
document.querySelector('#alta').onclick = altaPaciente;

//función de alta
function altaPaciente() {
	//recuperar datos
	let nif = document.querySelector('#nif').value.trim()
	let nombre = document.querySelector('#nombre').value.trim()
	let apellidos = document.querySelector('#apellidos').value.trim()
	let fechaingreso = document.querySelector('#fechaingreso').value.trim()

	//confeccionar parametros petición
	let servicio = 'servicios/controllers/hospitalcontroller.php';

	let datos = new FormData();
	datos.append('peticion', 'A');
	datos.append('nif', nif)
	datos.append('nombre', nombre)
	datos.append('apellidos', apellidos)
	datos.append('fechaingreso', fechaingreso)

	let parametros = {
		method: 'post',
		body: datos
	}

	//petición ajax y respuesta de la petición
	llamadaAjax(servicio, parametros, 'json')
	.then(
		(mensaje) => {respuestaAlta(mensaje)},
		(error) => {alert(error)}
	)
}

function respuestaAlta(mensaje) {
	let codigo = mensaje[0];
	let texto = mensaje[1];

	alert(texto)

	if (codigo == '00') {
		//limpiar el formulario
		document.querySelector('#formulario').reset();
	}
}
