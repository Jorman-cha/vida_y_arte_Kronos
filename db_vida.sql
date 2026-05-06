-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 05-05-2026 a las 19:10:37
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
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(100) NOT NULL,
  `dia` date DEFAULT NULL,
  `hora_ini` time(6) DEFAULT NULL,
  `hora_fin` time(6) DEFAULT NULL,
  `id_usu` int(11) DEFAULT NULL,
  `id_inst` int(11) DEFAULT NULL,
  `id_sal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

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
(1, 'Violin', 2),
(2, 'Tecnica Vocal', 2),
(3, 'Guitarra', 2);

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
(1, 'Gramatica Iniciacion', 1, 1, 1),
(2, 'Conversatorio', 1, 2, 2),
(3, 'Metodologia', 1, 3, 3);

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
(1, 1, 1),
(2, 2, 1),
(3, 2, 2);

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
(1, 'Lideres'),
(2, 'Instrumentos');

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
(1, 2, 1),
(2, 1, 2),
(3, 1, 3);

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
(3, 'semestre III');

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
-- Indices de la tabla `faceta`
--
ALTER TABLE `faceta`
  ADD PRIMARY KEY (`id_faceta`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_inst` (`id_inst`),
  ADD KEY `id_sal` (`id_sal`);

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
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`id_prog`);

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
-- AUTO_INCREMENT de la tabla `faceta`
--
ALTER TABLE `faceta`
  MODIFY `id_faceta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instrumento`
--
ALTER TABLE `instrumento`
  MODIFY `id_inst` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_mat` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id_pro_ins` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `id_prog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `p_rol`
--
ALTER TABLE `p_rol`
  MODIFY `id_p_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id_sem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT de la tabla `usuario_progr`
--
ALTER TABLE `usuario_progr`
  MODIFY `id_usu_pro` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`id_inst`) REFERENCES `instrumento` (`id_inst`),
  ADD CONSTRAINT `id_sal` FOREIGN KEY (`id_sal`) REFERENCES `salon` (`id_sal`);

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
-- Filtros para la tabla `p_rol`
--
ALTER TABLE `p_rol`
  ADD CONSTRAINT `p_rol_ibfk_1` FOREIGN KEY (`id_per`) REFERENCES `persona` (`id_per`),
  ADD CONSTRAINT `p_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

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
