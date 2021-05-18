-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2021 at 06:16 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `tamalesnortenos`
--

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(80) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `imagenProducto` varchar(200) DEFAULT NULL,
  `sku` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `precio`, `existencia`, `descripcion`, `imagenProducto`, `sku`) VALUES
(1, 'Colorado', 17, 10, 'Masa hidratada con un ligero color rojizo relleno de carne de cerdo desmenuzada guisada con chile guajillo', 'img/tamales-sabor-4.png', 'colorado'),
(2, 'Verde de pollo', 17, 10, 'Masa delgada, rellena con pollo desmenuzado en salsa verde', 'img/tamales-sabor-2.png', 'verde'),
(3, 'Rajas con queso', 17, 10, 'Masa rellena de rajas en escabeche con queso panela', 'img/tamales-sabor-5.png', 'rajas'),
(4, 'Chicharron', 17, 10, 'Tamal de masa muy delgada relleno de un guiso de chicharrón tipo carnitas', 'img/tamales-sabor-3.png', 'chicharron'),
(5, 'Frijoles norteños', 17, 10, 'Masa delgada rellena de frijoles norteños (guisado con chile guajillo) y queso panela', 'img/tamales-sabor-6.png', 'frijoles'),
(6, 'Dulce', 17, 10, 'Tamal con pasas, coco y naranja, sin colorantes', 'img/tamales-sabor-1.png', 'dulce');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);
