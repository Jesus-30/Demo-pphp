-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2020 a las 02:00:29
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bicicleta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicicleta`
--

CREATE TABLE `bicicleta` (
  `idBicicleta` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `tipoBicicleta` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclo`
--

CREATE TABLE `ciclo` (
  `idResponsable` int(11) NOT NULL,
  `idBicicleta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idUsuario` int(11) NOT NULL,
  `idBicicleta` int(11) NOT NULL,
  `fechaPrestamos` date NOT NULL,
  `fechaDevolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `idResponsable` int(11) NOT NULL,
  `nombre1` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`idResponsable`, `nombre1`, `telefono`) VALUES
(1, 'Jenny', '7868-0322'),
(2, 'Adalberto', '7614-9919'),
(3, 'Juan', '9984-6587');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre2` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `edad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  ADD PRIMARY KEY (`idBicicleta`);

--
-- Indices de la tabla `ciclo`
--
ALTER TABLE `ciclo`
  ADD KEY `idResponsable` (`idResponsable`),
  ADD KEY `idBicicleta` (`idBicicleta`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idBicicleta` (`idBicicleta`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`idResponsable`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  MODIFY `idBicicleta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `idResponsable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciclo`
--
ALTER TABLE `ciclo`
  ADD CONSTRAINT `ciclo_ibfk_1` FOREIGN KEY (`idResponsable`) REFERENCES `responsable` (`idResponsable`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciclo_ibfk_2` FOREIGN KEY (`idBicicleta`) REFERENCES `bicicleta` (`idBicicleta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`idBicicleta`) REFERENCES `bicicleta` (`idBicicleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
