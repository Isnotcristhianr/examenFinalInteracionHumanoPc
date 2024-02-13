-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2024 a las 01:04:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbd_prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `CLI_ID` int(11) NOT NULL,
  `CLI_NOMBRE` varchar(100) DEFAULT NULL,
  `CLI_APELLIDO` varchar(100) DEFAULT NULL,
  `CLI_CORREO` varchar(100) DEFAULT NULL,
  `CLI_TELEFONO` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`CLI_ID`, `CLI_NOMBRE`, `CLI_APELLIDO`, `CLI_CORREO`, `CLI_TELEFONO`) VALUES
(1, 'Cliente Juan', 'Perez', 'juan@example.com', '123456789'),
(2, 'Cliente \n Maria', 'Gonzalez', 'maria@example.com', '987654321'),
(3, 'Cliente \n Carlos', 'Lopez', 'carlos@example.com', '456789123'),
(4, 'Cliente \n Laura', 'Martinez', 'laura@example.com', '321654987'),
(5, 'Cliente \n Pedro', 'Sanchez', 'pedro@example.com', '789123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_pedidos`
--

CREATE TABLE `tbl_detalle_pedidos` (
  `DET_ID` int(11) NOT NULL,
  `PED_ID` int(11) DEFAULT NULL,
  `PROD_ID` int(11) DEFAULT NULL,
  `DET_CANTIDAD` int(11) DEFAULT NULL,
  `DET_PRECIO_UNITARIO` decimal(10,2) DEFAULT NULL,
  `DET_TOTAL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_detalle_pedidos`
--

INSERT INTO `tbl_detalle_pedidos` (`DET_ID`, `PED_ID`, `PROD_ID`, `DET_CANTIDAD`, `DET_PRECIO_UNITARIO`, `DET_TOTAL`) VALUES
(16, 1, 1, 2, 10.50, 21.00),
(17, 1, 2, 3, 15.75, 47.25),
(18, 2, 3, 1, 20.00, 20.00),
(19, 2, 4, 2, 8.99, 17.98),
(20, 3, 5, 4, 5.25, 21.00),
(21, 6, 1, 2, 10.50, 21.00),
(22, 6, 2, 3, 15.75, 47.25),
(23, 7, 3, 1, 20.00, 20.00),
(24, 7, 4, 4, 8.99, 35.96),
(25, 8, 1, 3, 10.50, 31.50),
(26, 8, 5, 5, 5.25, 26.25),
(27, 9, 2, 2, 15.75, 31.50),
(28, 9, 4, 3, 8.99, 26.97),
(29, 10, 3, 2, 20.00, 40.00),
(30, 10, 5, 5, 5.25, 26.25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleados`
--

CREATE TABLE `tbl_empleados` (
  `EMP_ID` int(11) NOT NULL,
  `EMP_NOMBRE` varchar(100) DEFAULT NULL,
  `EMP_APELLIDO` varchar(100) DEFAULT NULL,
  `EMP_CORREO` varchar(100) DEFAULT NULL,
  `EMP_TELEFONO` varchar(15) DEFAULT NULL,
  `EMP_SALARIO` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_empleados`
--

INSERT INTO `tbl_empleados` (`EMP_ID`, `EMP_NOMBRE`, `EMP_APELLIDO`, `EMP_CORREO`, `EMP_TELEFONO`, `EMP_SALARIO`) VALUES
(1, 'Pedro', 'Gomez', 'pedro@example.com', '111222333', 1500.00),
(2, 'Ana', 'Rodriguez', 'ana@example.com', '444555666', 1800.00),
(3, 'Luis', 'Fernandez', 'luis@example.com', '777888999', 1700.00),
(4, 'Maria', 'Diaz', 'maria@example.com', '123456789', 1600.00),
(5, 'Jorge', 'Lopez', 'jorge@example.com', '987654321', 1550.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedidos`
--

CREATE TABLE `tbl_pedidos` (
  `PED_ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `CLI_ID` int(11) DEFAULT NULL,
  `PED_FECHA` date DEFAULT NULL,
  `PED_TOTAL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_pedidos`
--

INSERT INTO `tbl_pedidos` (`PED_ID`, `EMP_ID`, `CLI_ID`, `PED_FECHA`, `PED_TOTAL`) VALUES
(1, 5, 1, '2024-02-01', 68.25),
(2, 3, 2, '2024-02-02', 37.98),
(3, 1, 3, '2024-02-03', 20.00),
(5, 4, 5, '2024-02-05', 21.00),
(6, 3, 1, '2024-02-12', 120.25),
(7, 5, 2, '2024-02-12', 65.45),
(8, 1, 3, '2024-02-12', 115.50),
(9, 2, 4, '2024-02-12', 47.95),
(10, 5, 5, '2024-02-12', 54.75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `PROD_ID` int(11) NOT NULL,
  `PROD_NOMBRE` varchar(100) DEFAULT NULL,
  `PROD_DESCRIPCION` text DEFAULT NULL,
  `PROD_PRECIO` decimal(10,2) DEFAULT NULL,
  `PROD_STOCK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`PROD_ID`, `PROD_NOMBRE`, `PROD_DESCRIPCION`, `PROD_PRECIO`, `PROD_STOCK`) VALUES
(1, 'Producto A', 'Descripción del Producto A', 10.50, 50),
(2, 'Producto B', 'Descripción del Producto B', 15.75, 30),
(3, 'Producto C', 'Descripción del Producto C', 20.00, 20),
(4, 'Producto D', 'Descripción del Producto D', 8.99, 40),
(5, 'Producto E', 'Descripción del Producto E', 5.25, 60);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`CLI_ID`);

--
-- Indices de la tabla `tbl_detalle_pedidos`
--
ALTER TABLE `tbl_detalle_pedidos`
  ADD PRIMARY KEY (`DET_ID`),
  ADD KEY `PED_ID` (`PED_ID`),
  ADD KEY `PROD_ID` (`PROD_ID`);

--
-- Indices de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD PRIMARY KEY (`EMP_ID`);

--
-- Indices de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD PRIMARY KEY (`PED_ID`),
  ADD KEY `CLI_ID` (`CLI_ID`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`PROD_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `CLI_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_detalle_pedidos`
--
ALTER TABLE `tbl_detalle_pedidos`
  MODIFY `DET_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  MODIFY `EMP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  MODIFY `PED_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `PROD_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_detalle_pedidos`
--
ALTER TABLE `tbl_detalle_pedidos`
  ADD CONSTRAINT `tbl_detalle_pedidos_ibfk_1` FOREIGN KEY (`PED_ID`) REFERENCES `tbl_pedidos` (`PED_ID`),
  ADD CONSTRAINT `tbl_detalle_pedidos_ibfk_2` FOREIGN KEY (`PROD_ID`) REFERENCES `tbl_productos` (`PROD_ID`);

--
-- Filtros para la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD CONSTRAINT `tbl_pedidos_ibfk_1` FOREIGN KEY (`CLI_ID`) REFERENCES `tbl_clientes` (`CLI_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
