<?php
	//incorporar metodos comunes
	require 'metodoscomunes.php';
	//incorporar el fichero de conexión
	require 'database.php';

	//definir la clase modelo
	class HospitalModel extends Database {
		//atributo numero de pacientes a mostrar
		private $max_filas_a_mostrar = 10;

		//usar los métodos comnes
		use metodosComunes;

		//método de alta
		public function alta($datos) {
			try {
				//extraer los datos del array
				extract($datos);

				//validar valores informados
				$this->validarDatos($nif, $nombre, $apellidos, $fechaingreso);

				//confeccionar la sentencia SQL
				$sql = "INSERT INTO paciente VALUES (NULL, :nif, :nombre, :apellidos, :fechaingreso, NULL)";

				//preparar la sentencia
				$stmt = $this->conexion->prepare($sql);

				//realizar el bind de los parámetros
				$stmt->bindParam(':nif', $nif);
				$stmt->bindParam(':nombre', $nombre);
				$stmt->bindParam(':apellidos', $apellidos);
				$stmt->bindParam(':fechaingreso', $fechaingreso);

				//ejecutar la sentencia
				$stmt->execute();

				//recuperar la clave primaria asignada
				$id = $this->conexion->lastInsertId();

				//respuesta al controlador
				return array('00', "Paciente dado de alta con el id $id");

			} catch (PDOException $e) {
				//control de errores
				$this->controlErroresPDO($e);	
			} catch (Exception $e) {
				//control de errores
				$this->controlErroresPropios($e);	
			}
		}
		
		//método de consulta
		public function consulta($datos) {
			try {
				//extraer los datos del array
				extract($datos);

				//calcular a que fila en la bbdd corresponde con la página
				$fila_a_mostrar = ($pagina - 1) * $this->max_filas_a_mostrar;

				$max_filas = $this->max_filas_a_mostrar;

				//confeccionar la sentencia SQL
				if ($idpaciente == 0) {
					$sql = "SELECT * FROM paciente ORDER BY nombre, apellidos LIMIT $fila_a_mostrar, $max_filas";
				} else {
					$sql = "SELECT * FROM paciente WHERE idpaciente=$idpaciente";
				}

				//ejecutar la sentencia
				$stmt = $this->conexion->query($sql);

				//decidir el formato de los datos
				$stmt->setFetchMode(PDO::FETCH_ASSOC);

				//recuperar todas las filas de la tabla
				$pacientes = $stmt->fetchAll();

				if ($idpaciente == 0) {
					$paginas = $this->calcularPaginas();
					//respuesta al controlador
					return array('00', $pacientes, $paginas);
				} else {
					//respuesta al controlador
					return array('00', $pacientes);
				}
			} catch (PDOException $e) {
				//control de errores
				$this->controlErroresPDO($e);	
			} catch (Exception $e) {
				//control de errores
				$this->controlErroresPropios($e);	
			}
		}
		
		//método de modificación
		public function modificacion($datos) {
			try {
				//extraer los datos del array
				extract($datos);

				//validar valores informados
				$this->validarId($idpaciente);

				$this->validarDatos($nif, $nombre, $apellidos, $fechaingreso);

				//confeccionar la sentencia SQL
				$sql = "UPDATE paciente SET nif = :nif, nombre = :nombre, apellidos = :apellidos, fechaingreso = :fechaingreso, fechaalta = :fechaalta WHERE idpaciente = :idpaciente";

				//preparar la sentencia
				$stmt = $this->conexion->prepare($sql);

				//realizar el bind de los parámetros
				$stmt->bindParam(':nif', $nif);
				$stmt->bindParam(':nombre', $nombre);
				$stmt->bindParam(':apellidos', $apellidos);
				$stmt->bindParam(':fechaingreso', $fechaingreso);
				$stmt->bindParam(':fechaalta', $fechaalta);
				$stmt->bindParam(':idpaciente', $idpaciente);

				//ejecutar la sentencia
				$stmt->execute();

				//comprobar si se ha modificado alguna fila
				if ($stmt->rowCount() == 0) {
					throw new Exception("Paciente no existe o no se han modificado datos", 35);
				}

				//respuesta al controlador
				return array('00', "Paciente modificado en la base de datos");

			} catch (PDOException $e) {
				//control de errores
				$this->controlErroresPDO($e);	
			} catch (Exception $e) {
				//control de errores
				$this->controlErroresPropios($e);	
			}
		}
		
		//método de baja
		public function baja($datos) {
			try {
				//extraer los datos del array
				extract($datos);
				
				//validar valores informados
				$this->validarId($idpaciente);

				//confeccionar la sentencia SQL
				$sql = "DELETE FROM paciente WHERE idpaciente = $idpaciente";

				//ejecutar la sentencia
				$stmt = $this->conexion->query($sql);

				if ($stmt->rowCount() == 0) {
					throw new Exception("Paciente no existe", 35);
				}

				//respuesta al controlador
				return array('00', "Paciente borrado en la base de datos");

			} catch (PDOException $e) {
				//control de errores
				$this->controlErroresPDO($e);	
			} catch (Exception $e) {
				//control de errores
				$this->controlErroresPropios($e);	
			}
		}
		
		//otros métodos
		private function validarDatos($nif, $nombre, $apellidos, $fechaingreso) {
			if (empty($nif)) {
				throw new Exception("Nif obligatorio", 10);
			}

			//validar que el NIF/NIE tenga formato correcto

			if (empty($nombre)) {
				throw new Exception("Nombre obligatorio", 11);
			}

			if (empty($apellidos)) {
				throw new Exception("Apellidos obligatorios", 12);
			}

			if (empty($fechaingreso)) {
				throw new Exception("Fecha ingreso obligatoria", 10);
			}
		}

		private function validarId($idpaciente) {
			if (empty($idpaciente) || !is_numeric($idpaciente) || $idpaciente == 0) {
				throw new Exception("Se debe seleccionar un paciente", 14);
			}
		}

		private function calcularPaginas() {
			//calcular el número de páginas
			$sql = "SELECT COUNT(*) AS filastotales FROM paciente";

			//ejecutar la sentencia
			$stmt = $this->conexion->query($sql);

			//decidir el formato de los datos
			$stmt->setFetchMode(PDO::FETCH_ASSOC);

			//recuperar todas las filas de la tabla
			$fila = $stmt->fetch();

			//calcular paginas redondeando al alza 
			return ceil($fila['filastotales']/$this->max_filas_a_mostrar);
		}
		
	}

	//probar el modelo
	/*
	$hospital = new HospitalModel();

	try {
		//$respuesta = $hospital->alta(array('nif'=>'12345678K', 'nombre'=>'Pau', 'apellidos'=>'Pep Pou', 'fechaingreso'=>'2020-01-28'));
		$respuesta = $hospital->consulta(array('idpaciente'=>0, 'pagina'=>1));
		echo '<pre>';
		print_r($respuesta);
		echo '</pre>';
	} catch (Exception $e) {
		echo $e->getMessage();
	}
	*/
?>