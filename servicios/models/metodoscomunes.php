<?php
	trait metodosComunes {
		private function controlErroresPDO($e) {
			//control de errores
			if ($e->errorInfo[1] == 1062) {
				throw new Exception('Este paciente ya existe en la base de datos', 30);
			} else if ($e->errorInfo[1] == 1451) {
				throw new Exception('El paciente tiene relaciones y no se puede borrar', 30);
			} else {
				//el valor que retornan los métodos getMessage y getCode de la clase PDOException hay que convertirlos a string y entero respectivcamente (realizar un casting)
				throw new Exception('PDO: '.(string)$e->getMessage(), (int)$e->getCode());
			}
		}

		private function controlErroresPropios($e) {
			throw new Exception('Propio: '.$e->getMessage(), $e->getCode());
		}
	}
?>