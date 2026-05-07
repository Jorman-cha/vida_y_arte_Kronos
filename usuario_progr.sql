-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 07-05-2026 a las 18:29:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_vida`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_progr`
--

CREATE TABLE `usuario_progr` (
  `id_usu_pro` int(100) NOT NULL,
  `id_usu` int(11) DEFAULT NULL,
  `id_prog` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_progr`
--

INSERT INTO `usuario_progr` (`id_usu_pro`, `id_usu`, `id_prog`) VALUES
(1, 1, 1),
(2, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario_progr`
--
ALTER TABLE `usuario_progr`
  ADD PRIMARY KEY (`id_usu_pro`),
  ADD KEY `id_prog` (`id_prog`),
  ADD KEY `id_usu` (`id_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario_progr`
--
ALTER TABLE `usuario_progr`
  MODIFY `id_usu_pro` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario_progr`
--
ALTER TABLE `usuario_progr`
  ADD CONSTRAINT `usuario_progr_ibfk_1` FOREIGN KEY (`id_prog`) REFERENCES `programa` (`id_prog`),
  ADD CONSTRAINT `usuario_progr_ibfk_2` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
