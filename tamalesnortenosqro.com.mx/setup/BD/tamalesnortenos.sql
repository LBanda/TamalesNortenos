-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2021 at 11:35 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `tamalesnortenos`
--

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `etiqueta` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `tipoDeEntrega` varchar(200) DEFAULT NULL,
  `cantidadTotal` int(11) DEFAULT NULL,
  `costoTotal` float DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idPromocion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`idPedido`, `etiqueta`, `fechaEntrega`, `estatus`, `descripcion`, `tipoDeEntrega`, `cantidadTotal`, `costoTotal`, `idCliente`, `idPromocion`) VALUES
(10001, 20001, '2021-05-02', 'entregado', '2 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 10, 170, 1600, 2001),
(10002, 20002, '2021-05-02', 'entregado', '3 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 11, 187, 1603, 2001),
(10003, 20003, '2021-05-02', 'entregado', '4 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 12, 204, 1606, 2001),
(10004, 20004, '2021-05-02', 'entregado', '5 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 13, 221, 1602, 2001),
(10005, 20005, '2021-05-02', 'entregado', '6 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 14, 238, 1600, 2001),
(10006, 20006, '2021-05-02', 'entregado', '7 tamales colorados, 3 verdes, 5 rajas', 'sucursal', 15, 255, 1596, 2001),
(10007, 20007, '2021-05-03', 'entregado', '8 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 16, 272, 1597, 2001),
(10008, 20008, '2021-05-03', 'entregado', '9 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 17, 289, 1598, 2001),
(10009, 20009, '2021-05-03', 'entregado', '10 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 18, 306, 1599, 2001),
(10010, 20010, '2021-05-03', 'entregado', '11 tamales colorados, 3 verdes, 5 rajas', 'sucursal', 19, 323, 1600, 2001),
(10011, 20011, '2021-05-03', 'entregado', '12 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 20, 340, 1601, 2001),
(10012, 20012, '2021-05-03', 'entregado', '13 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 21, 357, 1602, 2001),
(10013, 20013, '2021-05-03', 'entregado', '14 tamales colorados, 3 verdes, 5 rajas', 'domicilio prioritario', 22, 374, 1603, 2001),
(10014, 20014, '2021-05-03', 'entregado', '15 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 23, 391, 1604, 2001),
(10015, 20015, '2021-05-03', 'entregado', '16 tamales colorados, 3 verdes, 5 rajas', 'domicilio', 24, 408, 1605, 2001),
(10016, 20016, '2021-05-03', 'entregado', '17 tamales colorados, 3 verdes, 5 rajas', 'domicilio prioritario', 25, 425, 1606, 2001);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idPromocion` (`idPromocion`),
  ADD KEY `idCliente` (`idCliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10017;
