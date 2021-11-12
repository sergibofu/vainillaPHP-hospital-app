//consulta de pacientes al cargar el componente
consultaPacientes();

//activar los enlaces de paginación
document.querySelector('#paginas').onclick = function(event) {
	if (event.target !== this) {
		//recuperar número de página
		pagina = event.target.value;
		//consulta pacientes
		consultaPacientes()
	}
}

//activar listener consulta detalle
document.querySelector('#consultar').onclick = function() {
	//recuperar el id del paciente del radio seleccionado
	let id = document.querySelector('.radiospaciente:checked').value

	//guardar el id en el sesion storage
	sessionStorage.setItem("idpaciente", id);

	//enlazar con la pantalla de consulta de paciente
	window.location.href = '?mantenimiento';
}
