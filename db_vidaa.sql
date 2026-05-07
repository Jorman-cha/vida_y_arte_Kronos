-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2026 a las 00:58:22
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
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id_clas` int(11) NOT NULL,
  `id_nivel` int(11) DEFAULT NULL,
  `id_sal` int(11) DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `hora_ini` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_clas`, `id_nivel`, `id_sal`, `dia`, `hora_ini`, `hora_fin`) VALUES
(1, 1, 1, '2026-05-12', '07:00:00', '09:00:00'),
(2, 1, 2, '2026-05-12', '09:00:00', '11:00:00'),
(3, 1, 3, '2026-05-13', '07:00:00', '09:00:00'),
(4, 2, 1, '2026-05-13', '09:00:00', '11:00:00'),
(5, 2, 2, '2026-05-14', '07:00:00', '09:00:00'),
(6, 2, 3, '2026-05-14', '09:00:00', '11:00:00'),
(7, 3, 1, '2026-05-15', '07:00:00', '09:00:00'),
(8, 3, 2, '2026-05-15', '09:00:00', '11:00:00'),
(9, 3, 3, '2026-05-16', '07:00:00', '09:00:00'),
(10, 1, 1, '2026-05-16', '11:00:00', '13:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faceta`
--

CREATE TABLE `faceta` (
  `id_faceta` int(11) NOT NULL,
  `nom_face` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `faceta`
--

INSERT INTO `faceta` (`id_faceta`, `nom_face`) VALUES
(1, 'Artistica Semiprofesional'),
(2, 'Humana'),
(3, 'Pedagogica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrumento`
--

CREATE TABLE `instrumento` (
  `id_inst` int(100) NOT NULL,
  `nom_inst` text DEFAULT NULL,
  `id_prog` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `instrumento`
--

INSERT INTO `instrumento` (`id_inst`, `nom_inst`, `id_prog`) VALUES
(1, 'Violín', 2),
(2, 'Guitarra', 2),
(3, 'Piano', 2),
(4, 'Saxofón', 2),
(5, 'Batería', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id_local` int(11) NOT NULL,
  `nom_local` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id_local`, `nom_local`) VALUES
(1, 'Kennedy'),
(2, 'Suba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_mat` int(100) NOT NULL,
  `nom_mat` text DEFAULT NULL,
  `id_prog` int(11) DEFAULT NULL,
  `id_faceta` int(11) DEFAULT NULL,
  `id_sem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_mat`, `nom_mat`, `id_prog`, `id_faceta`, `id_sem`) VALUES
(1, 'Instrumento principal', 1, 1, 1),
(2, 'Gramática iniciación', 1, 1, 1),
(3, 'Exploratorio', 1, 2, 1),
(4, 'Apreciación musical', 1, 2, 1),
(5, 'Coro', 1, 1, 1),
(6, 'Instrumento principal', 1, 1, 2),
(7, 'Gramática básica I', 1, 1, 2),
(8, 'Conversatorio', 1, 2, 2),
(9, 'Apreciación musical', 1, 2, 2),
(10, 'Coro', 1, 1, 2),
(11, 'Ensamble institucional I', 1, 1, 2),
(12, 'Instrumento principal', 1, 1, 3),
(13, 'Solfeo básico II', 1, 1, 3),
(14, 'Armonía Teórica II', 1, 1, 3),
(15, 'Socialización', 1, 2, 3),
(16, 'Instrumento secundario', 1, 1, 3),
(17, 'Coro', 1, 1, 3),
(18, 'Ensamble institucional II', 1, 1, 3),
(19, 'Instrumento principal', 1, 1, 4),
(20, 'Solfeo básico III', 1, 1, 4),
(21, 'Armonía teórica III', 1, 1, 4),
(22, 'Contextualización', 1, 2, 4),
(23, 'Instrumento secundario', 1, 1, 4),
(24, 'Coro', 1, 1, 4),
(25, 'Ensamble institucional III', 1, 1, 4),
(26, 'Instrumento principal', 1, 1, 5),
(27, 'Solfeo intermedio I', 1, 1, 5),
(28, 'Armonía teórica IV', 1, 1, 5),
(29, 'Armonía aplicada I', 1, 1, 5),
(30, 'Pensamiento constructivo', 1, 2, 5),
(31, 'Instrumento secundario', 1, 1, 5),
(32, 'Ensamble propio', 1, 1, 5),
(33, 'Instrumento principal', 1, 1, 6),
(34, 'Solfeo intermedio II', 1, 1, 6),
(35, 'Armonía aplicada II', 1, 1, 6),
(36, 'Pensamiento constructivo II', 1, 2, 6),
(37, 'Pedagogía', 1, 3, 6),
(38, 'Instrumento secundario', 1, 1, 6),
(39, 'Ensamble propio', 1, 1, 6),
(40, 'Instrumento principal', 1, 1, 7),
(41, 'Solfeo intermedio III', 1, 1, 7),
(42, 'Armonía ensamble I', 1, 1, 7),
(43, 'Debate', 1, 2, 7),
(44, 'Metodología', 1, 3, 7),
(45, 'Instrumento secundario', 1, 1, 7),
(46, 'Ensamble propio', 1, 1, 7),
(47, 'Instrumento principal', 1, 1, 8),
(48, 'Solfeo Avanzado I', 1, 1, 8),
(49, 'Armonía ensamble II', 1, 1, 8),
(50, 'Debate II', 1, 2, 8),
(51, 'Programa FVyA', 1, 2, 8),
(52, 'Instrumento secundario', 1, 1, 8),
(53, 'Ensamble propio', 1, 1, 8),
(54, 'Instrumento principal', 1, 1, 9),
(55, 'Solfeo Avanzado II', 1, 1, 9),
(56, 'Armonía Composición I', 1, 1, 9),
(57, 'Espacio Vida y Arte', 1, 2, 9),
(58, 'Programa FVyA II', 1, 2, 9),
(59, 'Instrumento secundario', 1, 1, 9),
(60, 'Ensamble propio', 1, 1, 9),
(61, 'Instrumento principal', 1, 1, 10),
(62, 'Solfeo Avanzado III', 1, 1, 10),
(63, 'Armonía Composición II', 1, 1, 10),
(64, 'Espacio Vida y Arte', 1, 2, 10),
(65, 'Instrumento secundario', 1, 1, 10),
(66, 'Ensamble propio', 1, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `id_nivel` int(11) NOT NULL,
  `nom_nivel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id_nivel`, `nom_nivel`) VALUES
(1, 'Basico'),
(2, 'Intermedio'),
(3, 'Avanzado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_per` int(11) NOT NULL,
  `id_tipo_doc` int(11) DEFAULT NULL,
  `id_usu` int(11) DEFAULT NULL,
  `id_local` int(11) DEFAULT NULL,
  `primer_nombre` text DEFAULT NULL,
  `primer_apelli` text DEFAULT NULL,
  `telelefono` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `num_doc` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_per`, `id_tipo_doc`, `id_usu`, `id_local`, `primer_nombre`, `primer_apelli`, `telelefono`, `direccion`, `num_doc`) VALUES
(1, 1, 1, 1, 'Janny', 'Rodriguez', '32078654348', 'Calle 98', 1019345678),
(2, 2, 2, 2, 'Juan', 'Cruz', '32078654399', 'Calle 67', 1019345600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor_instru`
--

CREATE TABLE `profesor_instru` (
  `id_pro_ins` int(100) NOT NULL,
  `id_usu` int(11) DEFAULT NULL,
  `id_inst` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `profesor_instru`
--

INSERT INTO `profesor_instru` (`id_pro_ins`, `id_usu`, `id_inst`) VALUES
(1, 2, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor_materia`
--

CREATE TABLE `profesor_materia` (
  `id_pro_mat` int(100) NOT NULL,
  `id_usu` int(11) DEFAULT NULL,
  `id_mat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `profesor_materia`
--

INSERT INTO `profesor_materia` (`id_pro_mat`, `id_usu`, `id_mat`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 6),
(5, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `id_prog` int(11) NOT NULL,
  `nom_prog` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`id_prog`, `nom_prog`) VALUES
(1, 'Líderes'),
(2, 'Instrumentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_inst_clas`
--

CREATE TABLE `pro_inst_clas` (
  `id_pro_inst_clas` int(100) NOT NULL,
  `id_pro_ins` int(11) DEFAULT NULL,
  `id_clas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pro_inst_clas`
--

INSERT INTO `pro_inst_clas` (`id_pro_inst_clas`, `id_pro_ins`, `id_clas`) VALUES
(1, 1, 7),
(2, 2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_mat_clas`
--

CREATE TABLE `pro_mat_clas` (
  `id_pro_mat_clas` int(100) NOT NULL,
  `id_clas` int(11) DEFAULT NULL,
  `id_pro_mat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pro_mat_clas`
--

INSERT INTO `pro_mat_clas` (`id_pro_mat_clas`, `id_clas`, `id_pro_mat`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_rol`
--

CREATE TABLE `p_rol` (
  `id_p_rol` int(11) NOT NULL,
  `id_per` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `p_rol`
--

INSERT INTO `p_rol` (`id_p_rol`, `id_per`, `id_rol`) VALUES
(1, 1, 2),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nom_rol` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nom_rol`) VALUES
(1, 'Administrador'),
(2, 'Estudiante'),
(3, 'Profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

CREATE TABLE `salon` (
  `id_sal` int(11) NOT NULL,
  `nom_sal` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `salon`
--

INSERT INTO `salon` (`id_sal`, `nom_sal`) VALUES
(1, 'salon 1'),
(2, 'salon 2'),
(3, 'salon 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id_sem` int(11) NOT NULL,
  `nom_sem` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id_sem`, `nom_sem`) VALUES
(1, 'semestre I'),
(2, 'semestre II'),
(3, 'semestre III'),
(4, 'Semestre IV'),
(5, 'Semestre V'),
(6, 'Semestre VI'),
(7, 'Semestre VII'),
(8, 'Semestre VIII'),
(9, 'Semestre IX'),
(10, 'Semestre X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_doc` int(11) NOT NULL,
  `nom_doc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_doc`, `nom_doc`) VALUES
(1, 'CC'),
(2, 'TI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usu` int(11) NOT NULL,
  `nom_usu` text DEFAULT NULL,
  `correo_usu` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usu`, `nom_usu`, `correo_usu`, `contrasena`) VALUES
(1, 'Jan', 'jan@gmail.com', '123.'),
(2, 'Juan', 'juan@gmail.com', '345.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_clase`
--

CREATE TABLE `usuario_clase` (
  `id_usu_clas` int(100) NOT NULL,
  `id_usu` int(11) DEFAULT NULL,
  `id_clas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_clase`
--

INSERT INTO `usuario_clase` (`id_usu_clas`, `id_usu`, `id_clas`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

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
(1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id_clas`),
  ADD KEY `id_nivel` (`id_nivel`),
  ADD KEY `id_sal` (`id_sal`);

--
-- Indices de la tabla `faceta`
--
ALTER TABLE `faceta`
  ADD PRIMARY KEY (`id_faceta`);

--
-- Indices de la tabla `instrumento`
--
ALTER TABLE `instrumento`
  ADD PRIMARY KEY (`id_inst`),
  ADD KEY `id_prog` (`id_prog`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id_local`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_mat`),
  ADD KEY `id_prog` (`id_prog`),
  ADD KEY `id_faceta` (`id_faceta`),
  ADD KEY `id_sem` (`id_sem`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_per`),
  ADD KEY `id_tipo_doc` (`id_tipo_doc`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_local` (`id_local`);

--
-- Indices de la tabla `profesor_instru`
--
ALTER TABLE `profesor_instru`
  ADD PRIMARY KEY (`id_pro_ins`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_inst` (`id_inst`);

--
-- Indices de la tabla `profesor_materia`
--
ALTER TABLE `profesor_materia`
  ADD PRIMARY KEY (`id_pro_mat`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_mat` (`id_mat`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`id_prog`);

--
-- Indices de la tabla `pro_inst_clas`
--
ALTER TABLE `pro_inst_clas`
  ADD PRIMARY KEY (`id_pro_inst_clas`),
  ADD KEY `id_pro_ins` (`id_pro_ins`),
  ADD KEY `id_clas` (`id_clas`);

--
-- Indices de la tabla `pro_mat_clas`
--
ALTER TABLE `pro_mat_clas`
  ADD PRIMARY KEY (`id_pro_mat_clas`),
  ADD KEY `id_clas` (`id_clas`),
  ADD KEY `id_pro_mat` (`id_pro_mat`);

--
-- Indices de la tabla `p_rol`
--
ALTER TABLE `p_rol`
  ADD PRIMARY KEY (`id_p_rol`),
  ADD KEY `id_per` (`id_per`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`id_sal`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_sem`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipo_doc`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usu`);

--
-- Indices de la tabla `usuario_clase`
--
ALTER TABLE `usuario_clase`
  ADD PRIMARY KEY (`id_usu_clas`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_clas` (`id_clas`);

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
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id_clas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `faceta`
--
ALTER TABLE `faceta`
  MODIFY `id_faceta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `instrumento`
--
ALTER TABLE `instrumento`
  MODIFY `id_inst` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_mat` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `id_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profesor_instru`
--
ALTER TABLE `profesor_instru`
  MODIFY `id_pro_ins` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profesor_materia`
--
ALTER TABLE `profesor_materia`
  MODIFY `id_pro_mat` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `id_prog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pro_inst_clas`
--
ALTER TABLE `pro_inst_clas`
  MODIFY `id_pro_inst_clas` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pro_mat_clas`
--
ALTER TABLE `pro_mat_clas`
  MODIFY `id_pro_mat_clas` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `p_rol`
--
ALTER TABLE `p_rol`
  MODIFY `id_p_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salon`
--
ALTER TABLE `salon`
  MODIFY `id_sal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id_sem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipo_doc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario_clase`
--
ALTER TABLE `usuario_clase`
  MODIFY `id_usu_clas` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_progr`
--
ALTER TABLE `usuario_progr`
  MODIFY `id_usu_pro` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id_nivel`),
  ADD CONSTRAINT `clase_ibfk_2` FOREIGN KEY (`id_sal`) REFERENCES `salon` (`id_sal`);

--
-- Filtros para la tabla `instrumento`
--
ALTER TABLE `instrumento`
  ADD CONSTRAINT `instrumento_ibfk_1` FOREIGN KEY (`id_prog`) REFERENCES `programa` (`id_prog`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_prog`) REFERENCES `programa` (`id_prog`),
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`id_faceta`) REFERENCES `faceta` (`id_faceta`),
  ADD CONSTRAINT `materia_ibfk_3` FOREIGN KEY (`id_sem`) REFERENCES `semestre` (`id_sem`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`id_tipo_doc`) REFERENCES `tipo_documento` (`id_tipo_doc`),
  ADD CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `persona_ibfk_4` FOREIGN KEY (`id_local`) REFERENCES `localidad` (`id_local`),
  ADD CONSTRAINT `persona_ibfk_5` FOREIGN KEY (`id_local`) REFERENCES `localidad` (`id_local`);

--
-- Filtros para la tabla `profesor_instru`
--
ALTER TABLE `profesor_instru`
  ADD CONSTRAINT `profesor_instru_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `profesor_instru_ibfk_2` FOREIGN KEY (`id_inst`) REFERENCES `instrumento` (`id_inst`);

--
-- Filtros para la tabla `profesor_materia`
--
ALTER TABLE `profesor_materia`
  ADD CONSTRAINT `profesor_materia_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `profesor_materia_ibfk_2` FOREIGN KEY (`id_mat`) REFERENCES `materia` (`id_mat`);

--
-- Filtros para la tabla `pro_inst_clas`
--
ALTER TABLE `pro_inst_clas`
  ADD CONSTRAINT `pro_inst_clas_ibfk_1` FOREIGN KEY (`id_pro_ins`) REFERENCES `profesor_instru` (`id_pro_ins`),
  ADD CONSTRAINT `pro_inst_clas_ibfk_2` FOREIGN KEY (`id_clas`) REFERENCES `clase` (`id_clas`);

--
-- Filtros para la tabla `pro_mat_clas`
--
ALTER TABLE `pro_mat_clas`
  ADD CONSTRAINT `pro_mat_clas_ibfk_1` FOREIGN KEY (`id_clas`) REFERENCES `clase` (`id_clas`),
  ADD CONSTRAINT `pro_mat_clas_ibfk_2` FOREIGN KEY (`id_pro_mat`) REFERENCES `profesor_materia` (`id_pro_mat`);

--
-- Filtros para la tabla `p_rol`
--
ALTER TABLE `p_rol`
  ADD CONSTRAINT `p_rol_ibfk_1` FOREIGN KEY (`id_per`) REFERENCES `persona` (`id_per`),
  ADD CONSTRAINT `p_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `usuario_clase`
--
ALTER TABLE `usuario_clase`
  ADD CONSTRAINT `usuario_clase_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `usuario_clase_ibfk_2` FOREIGN KEY (`id_clas`) REFERENCES `clase` (`id_clas`);

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
