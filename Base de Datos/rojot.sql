-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-12-2017 a las 09:28:47
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rojot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrito`
--

CREATE TABLE `Carrito` (
  `CarroID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `InventarioID` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Total` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Direcciones`
--

CREATE TABLE `Direcciones` (
  `UsuarioID` int(11) NOT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `Numero` varchar(255) DEFAULT NULL,
  `Colonia` varchar(255) DEFAULT NULL,
  `CP` int(6) DEFAULT NULL,
  `Ciudad` varchar(255) DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Pais` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Direcciones`
--

INSERT INTO `Direcciones` (`UsuarioID`, `Calle`, `Numero`, `Colonia`, `CP`, `Ciudad`, `Estado`, `Pais`) VALUES
(20, 'Agua Zarca', '473', 'Manantiales', 58186, 'Morelia', 'Michoacan', 'MÃ©xico'),
(21, 'Agua Zarca', '473', 'Manantiales', 58186, 'Morelia', 'Michoacan', 'MÃ©xico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Inventario`
--

CREATE TABLE `Inventario` (
  `InventarioID` int(11) NOT NULL,
  `ProductoNom` varchar(255) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Precio` double(4,2) DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Inventario`
--

INSERT INTO `Inventario` (`InventarioID`, `ProductoNom`, `Stock`, `Precio`, `Imagen`) VALUES
(2, 'Te Verde', 85, 15.50, 'Inventario/te1.jpg'),
(18, 'Te Rojo', 8, 10.50, 'Inventario/te2.jpg'),
(19, 'Te de Manzanilla', 97, 9.00, 'Inventario/te3.jpg'),
(20, 'Te Oolong', 40, 25.00, 'Inventario/te4.jpg'),
(21, 'Te de Limon', 50, 5.00, 'Inventario/te5.jpg'),
(22, 'Te de Menta', 29, 4.50, 'Inventario/te6.jpg'),
(23, 'Te de Romero', 40, 12.00, 'Inventario/te7.jpg'),
(24, 'Te Negro', 70, 13.50, 'Inventario/te9.jpg'),
(25, 'Te de Tila', 50, 12.50, 'Inventario/te10.jpg'),
(26, 'Te de Valeriana', 40, 12.00, 'Inventario/te11.jpg'),
(27, 'Te de Manzana', 35, 15.00, 'Inventario/te12.jpg'),
(28, 'Te de Zarzamora', 32, 20.00, 'Inventario/te13.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `VentaID` int(11) NOT NULL,
  `InventarioID` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Total` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Pedidos`
--

INSERT INTO `Pedidos` (`VentaID`, `InventarioID`, `Cantidad`, `Total`) VALUES
(25, 2, 5, 77.50),
(25, 19, 3, 27.00),
(26, 20, 1, 25.00),
(26, 22, 1, 4.50),
(26, 28, 2, 40.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `UsuarioID` int(11) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Contra` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellidos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`UsuarioID`, `Correo`, `Contra`, `Nombre`, `Apellidos`) VALUES
(20, '2506deccf01f9ca9fa1ef2f4096f2178', '760f4ceffb8cf58ddc5e0e661385ebd9', 'Daniel', 'Cornejo'),
(21, '466247d81af7a8e7e9800e80b7b7be2d', 'e10adc3949ba59abbe56e057f20f883e', 'Fernando', 'Giovanni');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `VentaID` int(11) NOT NULL,
  `IDUsuario` int(11) DEFAULT NULL,
  `FechaVenta` date DEFAULT NULL,
  `Total` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Ventas`
--

INSERT INTO `Ventas` (`VentaID`, `IDUsuario`, `FechaVenta`, `Total`) VALUES
(25, 20, '2017-12-11', 104.50),
(26, 20, '2017-12-12', 69.50);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Carrito`
--
ALTER TABLE `Carrito`
  ADD PRIMARY KEY (`CarroID`),
  ADD KEY `ID Inventario Relacion` (`InventarioID`),
  ADD KEY `Usuario Relacion` (`UsuarioID`);

--
-- Indices de la tabla `Direcciones`
--
ALTER TABLE `Direcciones`
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- Indices de la tabla `Inventario`
--
ALTER TABLE `Inventario`
  ADD PRIMARY KEY (`InventarioID`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`VentaID`,`InventarioID`),
  ADD KEY `InventarioID` (`InventarioID`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`UsuarioID`,`Correo`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`VentaID`),
  ADD KEY `IDUsuario` (`IDUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Carrito`
--
ALTER TABLE `Carrito`
  MODIFY `CarroID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `Inventario`
--
ALTER TABLE `Inventario`
  MODIFY `InventarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `VentaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Carrito`
--
ALTER TABLE `Carrito`
  ADD CONSTRAINT `ID Inventario Relacion` FOREIGN KEY (`InventarioID`) REFERENCES `Inventario` (`InventarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Usuario Relacion` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuario` (`UsuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Direcciones`
--
ALTER TABLE `Direcciones`
  ADD CONSTRAINT `Direcciones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuario` (`UsuarioID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `Ventas` (`VentaID`),
  ADD CONSTRAINT `Pedidos_ibfk_2` FOREIGN KEY (`InventarioID`) REFERENCES `Inventario` (`InventarioID`);

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`IDUsuario`) REFERENCES `Usuario` (`UsuarioID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
