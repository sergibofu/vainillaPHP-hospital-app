<?php
	//incorporar el fichero del modelo
	require '../models/hospitalmodel.php';

	//recuperar los datos de la vista
	try {
		if (!$peticion = filter_input(INPUT_POST, 'peticion')) {
			throw new Exception("Petición obligatoria", 10);
		}

		//instanciar un objeto del modelo
		$hospital = new HospitalModel();

		//ejecutar el método del modelo correspondiente
		switch ($peticion) {
			case 'A':
				//recuperar datos del alta
				$nif = $_POST['nif'];
				$nombre = $_POST['nombre'];
				$apellidos = $_POST['apellidos'];
				$fechaingreso = $_POST['fechaingreso'];

				//informar un array con los datos del alta
				$datos = compact('nif', 'nombre', 'apellidos', 'fechaingreso');

				//variable con el método a ejecutar
				$metodo = 'alta';

				break;
			
			case 'C':
				//recuperar id del paciente
				$idpaciente = $_POST['idpaciente'];	
				//recuperar la pagina
				$pagina = $_POST['pagina'];

				//informar un array con los datos de la consulta
				$datos = compact('idpaciente', 'pagina');

				//variable con el método a ejecutar
				$metodo = 'consulta';

				break;
			
			case 'B':
				//recuperar id del paciente
				$idpaciente = $_POST['idpaciente'];

				//informar un array con los datos del alta
				$datos = compact('idpaciente');

				//variable con el método a ejecutar
				$metodo = 'baja';

				break;
			
			case 'M':
				//recuperar datos de la modificación
				$nif = $_POST['nif'];
				$nombre = $_POST['nombre'];
				$apellidos = $_POST['apellidos'];
				$fechaingreso = $_POST['fechaingreso'];
				$fechaalta = $_POST['fechaalta'];
				$idpaciente = $_POST['idpaciente'];

				//informar un array con los datos del alta
				$datos = compact('idpaciente', 'nif', 'nombre', 'apellidos', 'fechaingreso', 'fechaalta');

				//variable con el método a ejecutar
				$metodo = 'modificacion';

				break;
			
			default:
				throw new Exception("Opción incorrecta", 11);
		}
		//instanciacion
		//ejecutar al método del modelo de forma dinámica
		$respuesta = call_user_func(array($hospital, $metodo), $datos);

	} catch (Exception $e) {
		$respuesta = array($e->getCode(), $e->getMessage());
	}

	//enviar la respuesta a la vista
	echo json_encode($respuesta);
	
?>