function bajaPaciente() {
	//recuperar los datos
	let idpaciente = document.querySelector('#idpaciente').value
	
	//realizar la petición ajax
	let servicio = 'servicios/controllers/hospitalcontroller.php';

	let datos = new FormData();
	datos.append('peticion', 'B')
	datos.append('idpaciente', idpaciente);

	let parametros = {
		method: 'post',
		body: datos
	}

	llamadaAjax(servicio, parametros, 'json')
	.then(
		(mensaje) => {respuestaBaja(mensaje)},
		(error) => {alert(error)}
	)
}

function respuestaBaja(mensaje) {
	let codigo = mensaje[0];
	let texto = mensaje[1];

	alert(texto)

	if (codigo == '00') {
		//borrar el id del storage
		sessionStorage.removeItem('idpaciente')
		//cargar el componente de consulta
		window.location.href = '?consulta';
	}
}