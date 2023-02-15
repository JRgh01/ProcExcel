-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-02-2023 a las 18:24:07
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sipre`
--
CREATE DATABASE IF NOT EXISTS `SiPre` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `SiPre`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidadpago`
--

DROP TABLE IF EXISTS `capacidadpago`;
CREATE TABLE IF NOT EXISTS `capacidadpago` (
  `ID_CapPago` int NOT NULL AUTO_INCREMENT,
  `ID_Persona` int NOT NULL DEFAULT '0',
  `Fecha` date NOT NULL,
  `Monto` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `Procedencia` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_CapPago`),
  KEY `ID_Persona` (`ID_Persona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE IF NOT EXISTS `comentario` (
  `ID_Comentario` int NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID_Comentario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo`
--

DROP TABLE IF EXISTS `correo`;
CREATE TABLE IF NOT EXISTS `correo` (
  `ID_Correo` int NOT NULL AUTO_INCREMENT,
  `ID_Persona` int NOT NULL,
  `Correo` varchar(60) NOT NULL,
  `Procedencia` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Correo`),
  KEY `ID_Correo_Persona` (`ID_Persona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
CREATE TABLE IF NOT EXISTS `domicilio` (
  `ID_Domicilio` int NOT NULL AUTO_INCREMENT,
  `ID_Persona` int NOT NULL,
  `DomCalle` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DomColonia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DomCP` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DomMun` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DomEdo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Domicilio`),
  KEY `ID_Persona` (`ID_Persona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `excarchivo`
--

DROP TABLE IF EXISTS `excarchivo`;
CREATE TABLE IF NOT EXISTS `excarchivo` (
  `ID_Excel` int NOT NULL AUTO_INCREMENT,
  `NomArchivo` varchar(40) NOT NULL,
  `Leidos` int NOT NULL,
  `Guardados` int NOT NULL,
  PRIMARY KEY (`ID_Excel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `excpersona`
--

DROP TABLE IF EXISTS `excpersona`;
CREATE TABLE IF NOT EXISTS `excpersona` (
  `ID_ExcPer` int NOT NULL AUTO_INCREMENT,
  `ID_Persona` int NOT NULL,
  `ID_Excel` int NOT NULL,
  PRIMARY KEY (`ID_ExcPer`),
  KEY `ID_Persona` (`ID_Persona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `ID_Persona` int NOT NULL AUTO_INCREMENT,
  `NSS` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CURP` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RFC` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Titular` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ApPaterno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ApMaterno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Liquido` varchar(20) DEFAULT NULL,
  `Proceso` int NOT NULL DEFAULT '0',
  `ID_Comentario` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Persona`),
  KEY `NSS` (`NSS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamovig`
--

DROP TABLE IF EXISTS `prestamovig`;
CREATE TABLE IF NOT EXISTS `prestamovig` (
  `ID_PreVig` int NOT NULL AUTO_INCREMENT,
  `ID_Persona` int NOT NULL DEFAULT '0',
  `PrestamoVig` varchar(160) DEFAULT NULL,
  `Procedencia` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_PreVig`),
  KEY `ID_Persona` (`ID_Persona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `ID_Telefono` int NOT NULL AUTO_INCREMENT,
  `ID_Persona` int NOT NULL,
  `Telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Extension` varchar(5) DEFAULT NULL,
  `Procedencia` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Telefono`),
  KEY `ID_Persona` (`ID_Persona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
