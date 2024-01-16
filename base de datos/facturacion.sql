-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2021 a las 04:49:04
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--
CREATE DATABASE IF NOT EXISTS `facturacion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `facturacion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id_fac` int(100) NOT NULL,
  `Id_usu_fac` int(100) NOT NULL,
  `Fecha_fac` varchar(100) NOT NULL,
  `Nom_fac` varchar(100) NOT NULL,
  `Concep_hospedaje_fac` varchar(100) NOT NULL,
  `Concep_transporte_fac` varchar(100) NOT NULL,
  `Concep_alimento_fac` varchar(100) NOT NULL,
  `Concep_otros_fac` varchar(100) NOT NULL,
  `MXN_hospedaje_fac` double NOT NULL,
  `MXN_transporte_fac` double NOT NULL,
  `MXN_alimento_fac` double NOT NULL,
  `MXN_otros_fac` double NOT NULL,
  `Total_fac` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`Id_fac`, `Id_usu_fac`, `Fecha_fac`, `Nom_fac`, `Concep_hospedaje_fac`, `Concep_transporte_fac`, `Concep_alimento_fac`, `Concep_otros_fac`, `MXN_hospedaje_fac`, `MXN_transporte_fac`, `MXN_alimento_fac`, `MXN_otros_fac`, `Total_fac`) VALUES
(12, 1, '2021/11/21 20:02:43', 'Friki Plaza', '---', 'Transporte publico', 'Ramen', 'Accesorios', 0, 50, 150, 700, 900),
(25, 15, '2021/11/23 17:56:39', 'Salida Acapulco_prueba', 'Hotel a las estrellas ', 'Gasolina', 'General', 'Accesorios', 12332, 1500, 45, 234, 14111),
(27, 13, '2021/11/24 20:14:20', 'Salida Acapulco2.0', 'hotel', 'Carro', 'papitas', 'otros', 1223, 100, 879, 963, 3165);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_factura`
--

CREATE TABLE `usuario_factura` (
  `Id_usu` int(100) NOT NULL,
  `Tipo_usu` int(100) NOT NULL,
  `Nom_usu` varchar(100) NOT NULL,
  `App_usu` varchar(100) NOT NULL,
  `Apm_usu` varchar(100) NOT NULL,
  `Correo_usu` varchar(100) NOT NULL,
  `Contra_usu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_factura`
--

INSERT INTO `usuario_factura` (`Id_usu`, `Tipo_usu`, `Nom_usu`, `App_usu`, `Apm_usu`, `Correo_usu`, `Contra_usu`) VALUES
(1, 0, 'Admin', 'Admin', 'Admin', 'Admin@admin.com', 'admin'),
(2, 1, 'Oscar', 'Quintero', 'Hernandez', 'oscarquintero159@gmail.com', 'quintero'),
(3, 1, 'Lizette', 'Luis', 'Carlos', 'valencia@gmal.com', 'carlos'),
(10, 1, 'Enrique', 'Quintero', 'Hernandez', 'enrique@heue', '12345'),
(11, 1, 'Antonio', 'Velazquez', 'Garcia', 'anto@sgfdjsfd', '12345'),
(12, 1, 'Pepe', 'Quintero', 'Hernandez', 'pepe@eeee', '12345'),
(13, 1, 'Valencia', 'Tadeo', 'Lizette', 'valencializettet@gmail.com', '321'),
(14, 1, 'Lizettet', 'Valencia', 'Tadeo', 'valencia1@gmal.com', '789'),
(15, 1, 'Osva', 'Trejo', 'Mendoza', 'Mendoza@gmail.com', '123'),
(16, 1, 'Oscar', 'Quintero', 'Hernandez', 'pepe@eeeeaead', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id_fac`);

--
-- Indices de la tabla `usuario_factura`
--
ALTER TABLE `usuario_factura`
  ADD PRIMARY KEY (`Id_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `Id_fac` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `usuario_factura`
--
ALTER TABLE `usuario_factura`
  MODIFY `Id_usu` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
