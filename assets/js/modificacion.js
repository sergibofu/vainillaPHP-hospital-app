function modificarPaciente() {
	//recuperar los datos
	let nif = document.querySelector('#nif').value.trim()
	let nombre = document.querySelector('#nombre').value.trim()
	let apellidos = document.querySelector('#apellidos').value.trim()
	let fechaingreso = document.querySelector('#fechaingreso').value.trim()
	let fechaalta = document.querySelector('#fechaalta').value.trim()
	let idpaciente = document.querySelector('#idpaciente').value

	//realizar la petición ajax
	let servicio = 'servicios/controllers/hospitalcontroller.php';

	let datos = new FormData();
	datos.append('peticion', 'M')
	datos.append('nif', nif)
	datos.append('nombre', nombre)
	datos.append('apellidos', apellidos)
	datos.append('fechaingreso', fechaingreso)
	datos.append('fechaalta', fechaalta)
	datos.append('idpaciente', idpaciente)

	let parametros = {
		method: 'post',
		body: datos
	}

	llamadaAjax(servicio, parametros, 'json')
	.then(
		(mensaje) => {respuestaModi(mensaje)},
		(error) => {alert(error)}
	)
}

function respuestaModi(mensaje) {
	let codigo = mensaje[0];
	let texto = mensaje[1];

	alert(texto)
}