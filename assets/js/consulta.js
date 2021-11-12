//variables globales
var pagina = 1;

//función de consulta de pacientes
function consultaPacientes(id=0) {
	
	//realizar la petición ajax
	let servicio = 'servicios/controllers/hospitalcontroller.php';

	//datos de la petición
	let datos = new FormData();
	datos.append('peticion', 'C');
	datos.append('idpaciente', id);
	datos.append('pagina', pagina)

	let parametros = {
		method: 'post',
		body: datos
	}

	llamadaAjax(servicio, parametros, 'json')
	.then(
		(mensaje) => {
			id==0 ? informarTabla(mensaje) : informarFormulario(mensaje);
		},
		(error) => {alert(error)}
	)
}

function informarTabla(mensaje) {
	console.log(mensaje)
	let codigo = mensaje[0];

	if (codigo != '00') {
		alert(mensaje[1]);
		return;
	}

	let pacientes = mensaje[1];

	//confeccionar la tabla de pacientes
	let tabla = '<tr><th></th><th>Nif</th><th>Nombre</th><th>Apellidos</th></tr>';

	pacientes.forEach(function(item, index) {
		tabla += `<tr>`;
		if (index==0) {
			tabla += `<td><input type='radio' value='${item.idpaciente}' name='radios' checked class='radiospaciente'></td>`
		} else {
			tabla += `<td><input type='radio' value='${item.idpaciente}' name='radios' class='radiospaciente'></td>`
		}
		
		tabla += `<td>${item.nif}</td>`
		tabla += `<td>${item.nombre}</td>`
		tabla += `<td>${item.apellidos}</td>`
		tabla += `</tr>`;
	})

	//mensaje por si no existen pacientes
	if (pacientes.length == 0) {
		alert('No existen pacientes en la base de datos')
		tabla = '';
	}

	document.querySelector('#pacientes').innerHTML = tabla;

	//montar los enlaces de paginacion
	let paginas = mensaje[2];

	let enlaces = '';

	for (e=1; e<=paginas; e++) {
		//resaltar el numero de página donde nos encontremos
		if (e == pagina) {
			enlaces += `<input type='button' value='${e}' class='resaltarpagina'>`;
		} else {
			enlaces += `<input type='button' value='${e}'>`;
		}
	}

	document.querySelector('#paginas').innerHTML = enlaces;
}


function informarFormulario(mensaje) {
	//console.log(mensaje)
	let codigo = mensaje[0];

	if (codigo != '00') {
		alert(mensaje[1]);
		return;
	}

	let paciente = mensaje[1];

	//trasladar los datos al formulario
	document.querySelector('#nif').value = paciente[0].nif
	document.querySelector('#nombre').value = paciente[0].nombre
	document.querySelector('#apellidos').value = paciente[0].apellidos
	document.querySelector('#fechaingreso').value = paciente[0].fechaingreso
	document.querySelector('#fechaalta').value = paciente[0].fechaalta
	document.querySelector('#idpaciente').value = paciente[0].idpaciente
}
