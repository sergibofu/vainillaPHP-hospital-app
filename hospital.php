<?php
	//componente por defecto
	$componente = 'index';

	if (isset($_GET['alta'])) {
		$componente = 'alta';
	} else if (isset($_GET['mantenimiento'])) {
		$componente = 'mantenimiento';
	} else if (isset($_GET['consulta'])) {
		$componente = 'consulta';
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Hospital</title>
	<link rel="stylesheet" type="text/css" href="assets/css/hospital.css">
	<script type="text/javascript" src='assets/js/ajax.js'></script>
</head>
<body>
<div class="container">
	<header>
		<h1 id="title">HOSPITAL</h1>
	</header>
	<nav>
		<h3>Menu opciones:</h3>
		<a href="?consulta">Consulta pacientes</a><br><br>
		<a href="?alta">Alta paciente</a><br><br>
		<a href="?mantenimiento">Baja/modificación paciente</a><br><br>
	</nav>
	<section id='contenido'>
		<?php readfile("componentes/$componente.html"); ?>
	</section>
</div>
</body>
</html>