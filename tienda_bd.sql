-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2021 a las 22:08:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `identificacion` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `tipo_identificacion` varchar(2) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `correo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`identificacion`, `nombre`, `apellido`, `genero`, `tipo_identificacion`, `telefono`, `direccion`, `correo`) VALUES
(11, 'roberto', 'figueroa', 'Masculino', 'CC', '1221656', 'dada', 'sdasda@a'),
(122, 'hdhdh', 'ywyw', 'Masculino', 'CC', '53343', '11d', 'ww'),
(1021, 'carolina \"', 'castro', 'Femenino', 'CC', '31422', 'j1 d2', 'carol@s'),
(2122, 'camila', 'sanz', 'Femenino', 'CC', '313222', 'c5 h 1', 'ljfujw@d'),
(11111, 'clara', 'lopez', 'Femenino', 'CC', '736473647', 'asaja', 'kdkdkdk@fkf'),
(77747, 'jsjsj', 'aasss', 'Masculino', 'CE', '88383', 'aaxx', 'ssq'),
(122222, 'aaaa', 'aaas', 'Femenino', 'TI', '4848', 'aa', 'ss'),
(162727, 'carlos', 'sandoval', 'Masculino', 'CC', '5878787', 'las maldivas', 'lhgsh@dhdh'),
(454545, 'marianela', 'fernandez', 'Femenino', 'CC', '778655665', 'hjhsab asasa', 'jsdkhdhja@fs'),
(1233333, 'jose', 'rodrigez', 'Masculino', 'TI', '55552', 'jjjs sss', 'hshs@ss');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_prod` int(11) NOT NULL,
  `nombre_prod` int(11) NOT NULL,
  `precio_prod` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_prov` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_prov` int(11) NOT NULL,
  `nombre_prov` varchar(150) NOT NULL,
  `teléfono_prov` varchar(10) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usu` varchar(70) NOT NULL,
  `apellido_usu` varchar(100) NOT NULL,
  `usuarios` varchar(12) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `tipo_usuario` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usu`, `apellido_usu`, `usuarios`, `contraseña`, `tipo_usuario`) VALUES
(1, 'Luis', 'Castilla', 'lgcastilla', 'lg1234', 'Administrador'),
(2, 'Yulieth', 'Palomino', 'ypalomino', '1234', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_prod`),
  ADD KEY `id_prov` (`id_prov`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_prov` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `proveedor` (`id_prov`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
