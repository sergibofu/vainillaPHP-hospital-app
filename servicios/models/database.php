<?php
	//transformar los errores en excepciones
	mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

	class Database {
		//parámetros conexión bbddd
		const DSN = "mysql:host=localhost;dbname=hospital;charset=UTF8";

		protected $conexion;

		public function __construct() {
			try {
				//conexión bbdd
				$this->conexion = new PDO(self::DSN, 'root', '');

				//en caso de error lanzar excepciones
				$this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			} catch (PDOException $e) {
				throw new PDOException($e->getMessage(), $e->getCode());
			}
		}
	}

	//probador de la conexion
	//$hospital = new Database(); 
	

?>