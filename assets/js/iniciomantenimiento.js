//recuperar el id a consultar del local storage
if (sessionStorage.getItem('idpaciente') == undefined) {
	//cargar el componente de consulta
	window.location.href = '?consulta';
} else {
	//recuperar el id
	let id = sessionStorage.getItem('idpaciente');
	//consultar el id seleccionado en la pantalla de consulta
	consultaPacientes(id)
}

//activar listeners
document.querySelector('#modificacion').onclick = modificarPaciente;
document.querySelector('#baja').onclick = bajaPaciente;