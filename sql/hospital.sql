-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2021 a las 12:28:28
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_paciente`
--

DROP TABLE IF EXISTS `log_paciente`;
CREATE TABLE IF NOT EXISTS `log_paciente` (
`idlogpaciente` int(11) NOT NULL,
  `accion` char(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idpaciente` int(11) NOT NULL,
  `nif` char(9) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `fechaingreso` date NOT NULL,
  `fechaalta` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `log_paciente`
--

INSERT INTO `log_paciente` (`idlogpaciente`, `accion`, `timestamp`, `idpaciente`, `nif`, `nombre`, `apellidos`, `fechaingreso`, `fechaalta`) VALUES
(3, 'I', '2017-05-22 15:36:45', 0, '55556677h', 'pablo', 'marmol', '2017-03-01', NULL),
(4, 'U', '2017-05-22 15:37:08', 0, '5649588', 'Adolph', 'Suareznegger', '2010-02-03', NULL),
(5, 'D', '2017-05-22 15:37:24', 0, '555555555', 'Faemino', ' y Cansado', '1942-01-01', NULL),
(8, 'U', '2020-08-22 15:47:44', 0, '75646555', 'Jaimita', 'Pinganillo', '2014-03-03', NULL),
(9, 'U', '2020-08-22 15:48:03', 0, '536367778', 'Doctor', 'maligno', '2011-01-01', NULL),
(10, 'D', '2020-08-22 15:48:18', 0, '746464665', 'Juana', 'La Loca', '1900-12-12', NULL),
(11, 'D', '2020-08-22 15:49:45', 0, '5649588', 'Adolph', 'Suareznegger', '2010-02-03', NULL),
(12, 'D', '2020-08-22 15:51:24', 0, '75646555', 'Jaimita', 'Pinganillo', '2014-03-03', '2020-08-26'),
(13, 'I', '2020-08-28 10:33:23', 0, '10000006H', 'Peter', 'Griffin', '2020-08-05', NULL),
(14, 'U', '2020-08-28 10:37:25', 0, '33333333', 'Fina', 'Gramenower', '2012-02-02', NULL),
(15, 'U', '2020-08-28 10:37:32', 0, '33333333', 'Fina', 'Gramenower', '2012-02-02', '0000-00-00'),
(16, 'U', '2020-09-03 06:55:52', 0, '536367778', 'Doctor', 'Maligno', '2011-01-01', '0000-00-00'),
(17, 'U', '2020-09-03 06:57:02', 0, '5656455', 'Jose Luis', 'Torrente', '2012-12-15', NULL),
(18, 'U', '2020-09-03 06:57:14', 0, '574647856', 'Mariana', 'Cuchufletas', '2003-02-01', NULL),
(19, 'U', '2020-09-03 06:57:22', 0, '11111111', 'Juanito', 'Pepinillo', '2000-02-02', NULL),
(20, 'U', '2020-09-03 06:57:30', 0, '33333333', 'Fina', 'Gramenower', '2012-02-02', '2020-08-27'),
(21, 'U', '2020-09-03 06:57:37', 0, '45000000D', 'Fina', 'Gramenower', '2012-02-02', '2020-08-27'),
(22, 'U', '2020-09-03 06:57:45', 0, '857373838', 'Perico', 'el de los palotes', '2008-10-10', NULL),
(23, 'U', '2020-09-03 06:57:52', 0, '74462888', 'Johny', 'Mentero', '2001-04-02', NULL),
(24, 'U', '2020-09-03 06:57:59', 0, '536367778', 'Doctor', 'Maligno', '2011-01-01', '2020-09-08'),
(25, 'U', '2020-09-03 06:58:07', 0, '575757575', 'Marianico', 'el corto', '2000-01-01', NULL),
(26, 'U', '2020-09-03 06:58:18', 0, '74646355', 'Igor', 'Fronkonstin', '1980-12-23', NULL),
(27, 'U', '2020-09-03 06:58:23', 0, '55556677h', 'pablo', 'marmol', '2017-03-01', NULL),
(28, 'I', '2020-09-03 08:18:45', 0, '40000014L', 'John', 'Rambo', '2020-09-02', NULL),
(29, 'I', '2020-09-03 08:19:18', 0, '40000016Y', 'Louis', 'Griffin', '2020-09-24', NULL),
(30, 'I', '2020-09-03 08:32:48', 0, '40880014L', 'Filemón', 'Pi', '2020-09-29', NULL),
(31, 'I', '2020-09-03 08:50:34', 0, '40888014L', 'Mortadelo', 'Pi', '2020-09-02', NULL),
(32, 'U', '2020-09-03 12:51:58', 0, '40000016Y', 'Louis', 'Griffin', '2020-09-24', NULL),
(33, 'U', '2020-09-03 12:53:45', 0, '[object H', 'Louisa', 'Griffin', '2020-09-24', '0000-00-00'),
(34, 'U', '2020-09-03 12:54:02', 0, '44000888F', 'Louisa', 'Griffin', '2020-09-24', '0000-00-00'),
(35, 'U', '2020-09-03 12:57:50', 0, '44000888F', 'Louis', 'Griffin', '2020-09-24', '0000-00-00'),
(36, 'U', '2020-09-03 12:58:15', 0, '44000888F', 'Louisa', 'Griffin', '2020-09-24', '0000-00-00'),
(37, 'U', '2020-09-03 12:58:27', 0, '44000888F', 'Louisa', 'Griffin', '2020-09-24', NULL),
(38, 'U', '2020-09-03 12:58:51', 0, '44000888F', 'Louis', 'Griffin', '2020-09-24', '0000-00-00'),
(39, 'U', '2020-09-03 12:59:20', 0, '44000888F', 'Louis', 'Griffin', '2020-09-24', NULL),
(40, 'D', '2020-09-03 13:04:17', 0, '44000888F', 'Louis', 'Griffin', '2020-09-24', '2020-10-07'),
(41, 'U', '2020-09-04 07:34:37', 0, '40000014L', 'John', 'Rambo', '2020-09-02', NULL),
(42, 'U', '2020-09-04 07:35:13', 0, '48000000I', 'Igor', 'Fronkonstin', '1980-12-23', NULL),
(45, 'D', '2020-09-04 08:03:22', 0, '48000000I', 'Igor', 'Fronkonstin', '1980-12-01', '0000-00-00'),
(46, 'U', '2020-09-04 08:32:09', 0, '47000000H', 'Marianico', 'el corto', '2000-01-01', NULL),
(47, 'U', '2020-09-04 08:32:33', 0, '47000000H', 'Marianico', 'el corto', '2000-01-06', '0000-00-00'),
(48, 'U', '2020-09-17 18:20:20', 0, '43000000D', 'Fina', 'Gramenower', '2012-02-02', '2020-08-27'),
(49, 'U', '2020-09-17 18:20:29', 0, '43000000D', 'Fina', 'Gramenower', '2012-02-02', '2020-08-31'),
(50, 'U', '2020-09-17 18:20:35', 0, '43000000D', 'Fina', 'Gramenower', '2012-02-02', '2020-08-31'),
(51, 'U', '2020-09-17 18:21:11', 0, '43000000D', 'Fina', 'Gramenower', '2012-02-02', '2020-08-31'),
(52, 'D', '2020-09-17 18:21:31', 0, '43000000D', 'Fina', 'Gramenower', '2012-02-02', '2020-09-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
`idpaciente` int(11) NOT NULL,
  `nif` varchar(10) CHARACTER SET latin1 NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 NOT NULL,
  `fechaingreso` date NOT NULL,
  `fechaalta` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`idpaciente`, `nif`, `nombre`, `apellidos`, `fechaingreso`, `fechaalta`) VALUES
(19, '40000000A', 'Jose Luis', 'Torrente', '2012-12-15', NULL),
(38, '41000000B', 'Mariana', 'Cuchufletas', '2003-02-01', NULL),
(40, '42000000C', 'Juanito', 'Pepinillo', '2000-02-02', NULL),
(49, '44000000E', 'Perico', 'el de los palotes', '2008-10-10', NULL),
(50, '45000000F', 'Johny', 'Mentero', '2001-04-02', NULL),
(51, '46000000G', 'Doctor', 'Maligno', '2011-01-01', '2020-09-08'),
(56, '47000000H', 'Marianico', 'el corto', '2000-01-06', '2020-09-07'),
(59, '55556677H', 'pablo', 'marmol', '2017-03-01', NULL),
(60, '10000006H', 'Peter', 'Griffin', '2020-08-05', NULL),
(61, '43330014L', 'John', 'Rambo', '2020-09-01', '2020-09-04'),
(63, '40880014L', 'Filemón', 'Pi', '2020-09-29', NULL),
(64, '40888014L', 'Mortadelo', 'Pi', '2020-09-02', NULL);

--
-- Disparadores `paciente`
--
DROP TRIGGER IF EXISTS `deletepaciente`;
DELIMITER //
CREATE TRIGGER `deletepaciente` AFTER DELETE ON `paciente`
 FOR EACH ROW INSERT INTO log_paciente VALUES (NULL, 'D', CURRENT_TIMESTAMP, OLD.nif, OLD.nombre, OLD.apellidos, OLD.fechaingreso, OLD.fechaalta)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `insertpaciente`;
DELIMITER //
CREATE TRIGGER `insertpaciente` AFTER INSERT ON `paciente`
 FOR EACH ROW INSERT INTO log_paciente VALUES (NULL, 'I', CURRENT_TIMESTAMP, NEW.nif, NEW.nombre, NEW.apellidos, NEW.fechaingreso, NEW.fechaalta)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `updatepaciente`;
DELIMITER //
CREATE TRIGGER `updatepaciente` BEFORE UPDATE ON `paciente`
 FOR EACH ROW INSERT INTO log_paciente VALUES (NULL, 'U', CURRENT_TIMESTAMP, OLD.nif, OLD.nombre, OLD.apellidos, OLD.fechaingreso, OLD.fechaalta)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
`idusuario` int(11) NOT NULL,
  `nif` char(9) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nif`, `nombre`, `apellidos`, `password`) VALUES
(1, '40000001A', 'david', 'alcolea', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `log_paciente`
--
ALTER TABLE `log_paciente`
 ADD PRIMARY KEY (`idlogpaciente`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
 ADD PRIMARY KEY (`idpaciente`), ADD UNIQUE KEY `nif_UNIQUE` (`nif`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`idusuario`), ADD UNIQUE KEY `nif` (`nif`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `log_paciente`
--
ALTER TABLE `log_paciente`
MODIFY `idlogpaciente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
MODIFY `idpaciente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
