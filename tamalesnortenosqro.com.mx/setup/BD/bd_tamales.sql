-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2021 at 04:31 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `tamalesnortenos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `correoElectronico` varchar(100) DEFAULT NULL,
  `referenciaDomicilio` varchar(200) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `idDistribucion` int(11) NOT NULL,
  `password` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `apellidos`, `direccion`, `correoElectronico`, `referenciaDomicilio`, `telefono`, `idDistribucion`, `password`) VALUES
(1600, 'Eduardo\'', 'Blanco\'', 'Av. Industrias 403\'', 'Arbol de naranjas en la entrada\'', 'blanco@gmail.com\'', '4425998745\'', 8384, 'hola123'),
(1601, 'Eva\'', 'Espinoza\'', 'Himlaya 501\'', 'Al lado de un dentista\'', 'espinoza@gmail.com\'', '4425874126\'', 8385, 'hola123'),
(1602, 'Gemma\'', 'Frias\'', 'Constitucion 420\'', 'Atras del HEB\'', 'frias@gmail.com\'', '4425896354\'', 8386, 'hola123'),
(1603, 'Pablo\'', 'Farre\'', 'Av. Juarez 60\'', 'Casa rosa\'', 'farre@gmail.com\'', '4425893358\'', 8387, 'hola123'),
(1604, 'Samira\'', 'Llano\'', 'Av. Lopez Mateos 59\'', 'Casa con un domo\'', 'llano@gmail.com\'', '4425896542\'', 8388, 'hola123'),
(1605, 'Angelica\'', 'Ripol\'', 'Emiliano Zapata 83\'', 'Al lado de una pasteleria\'', 'ripol@gmail.com\'', '4425874569\'', 8389, 'hola123'),
(1606, 'Andrea\'', 'Zaragoza\'', '5 de Mayo 852\'', 'Puerta roja con negro\'', 'zaragoza@gmail.com\'', '4425896325\'', 8390, 'hola123'),
(1613, 'Javier', 'Martinez', 'Av Eugenio Garza Sada 628', 'javier@itesm.mx', 'Enfrente al Tec de Monterrey', '4499048658', 8384, '$2a$12$0/4ILwOUfk.Wes.ZYbK77uZJlolmt.czDGMEcC8pCrdVqsfzlH6/y');

-- --------------------------------------------------------

--
-- Table structure for table `descuento`
--

CREATE TABLE `descuento` (
  `idDescuento` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `Porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `descuento`
--

INSERT INTO `descuento` (`idDescuento`, `descripcion`, `Porcentaje`) VALUES
(10501, '15 porciento de descuento\'', 15),
(10502, '15 porciento de descuento\'', 15),
(10503, '15 porciento de descuento\'', 15),
(10504, '15 porciento de descuento\'', 15),
(10505, '15 porciento de descuento\'', 15),
(10506, '15 porciento de descuento\'', 15),
(10507, '15 porciento de descuento\'', 15);

-- --------------------------------------------------------

--
-- Table structure for table `distribucion`
--

CREATE TABLE `distribucion` (
  `idDistribucion` int(11) NOT NULL,
  `diaDeEntrega` varchar(15) DEFAULT NULL,
  `nombreDeColonia` varchar(50) DEFAULT NULL,
  `horaInicioEntrega` time DEFAULT NULL,
  `horaFinalEntrega` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distribucion`
--

INSERT INTO `distribucion` (`idDistribucion`, `diaDeEntrega`, `nombreDeColonia`, `horaInicioEntrega`, `horaFinalEntrega`) VALUES
(8384, 'Viernes', 'Tejeda', '17:00:00', '19:00:00'),
(8385, 'Miercoles', 'Jurica', '17:00:00', '19:00:00'),
(8386, 'Jueves', 'El Refugio', '17:00:00', '19:00:00'),
(8387, 'Sábado', 'Juriquilla', '17:00:00', '19:00:00'),
(8388, 'Jueves', 'La Vista', '17:00:00', '19:00:00'),
(8389, 'Viernes', 'Sonterra', '17:00:00', '19:00:00'),
(8390, 'Viernes', 'Balvanegra', '17:00:00', '19:00:00'),
(8391, 'Miercoles', 'Zibata', '17:00:00', '19:00:00'),
(8392, 'Jueves', 'Zakia', '17:00:00', '19:00:00'),
(8393, 'Viernes', 'Vista Real', '17:00:00', '19:00:00'),
(8394, 'Viernes', 'Mirador', '17:00:00', '19:00:00'),
(8395, 'Viernes', 'Milenio', '17:00:00', '19:00:00'),
(8396, 'Lunes', 'Campanario', '19:00:00', '20:00:00'),
(8397, 'Miercoles', 'Cimatario', '17:00:00', '19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `etiqueta` int(11) NOT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `tipoDeEntrega` varchar(200) DEFAULT NULL,
  `cantidadTotal` int(11) DEFAULT NULL,
  `costoTotal` float DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idPromocion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`idPedido`, `etiqueta`, `fechaEntrega`, `estatus`, `descripcion`, `tipoDeEntrega`, `cantidadTotal`, `costoTotal`, `idCliente`, `idPromocion`) VALUES
(10001, 20001, '2021-05-02', 'entregado\'', '2 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 10, 170, 1591, 2001),
(10002, 20002, '2021-05-02', 'entregado\'', '3 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 11, 187, 1592, 2001),
(10003, 20003, '2021-05-02', 'entregado\'', '4 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 12, 204, 1593, 2001),
(10004, 20004, '2021-05-02', 'entregado\'', '5 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 13, 221, 1594, 2001),
(10005, 20005, '2021-05-02', 'entregado\'', '6 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 14, 238, 1595, 2001),
(10006, 20006, '2021-05-02', 'entregado\'', '7 tamales colorados, 3 verdes, 5 rajas\'', 'sucursal\'', 15, 255, 1596, 2001),
(10007, 20007, '2021-05-03', 'entregado\'', '8 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 16, 272, 1597, 2001),
(10008, 20008, '2021-05-03', 'entregado\'', '9 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 17, 289, 1598, 2001),
(10009, 20009, '2021-05-03', 'entregado\'', '10 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 18, 306, 1599, 2001),
(10010, 20010, '2021-05-03', 'entregado\'', '11 tamales colorados, 3 verdes, 5 rajas\'', 'sucursal\'', 19, 323, 1600, 2001),
(10011, 20011, '2021-05-03', 'entregado\'', '12 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 20, 340, 1601, 2001),
(10012, 20012, '2021-05-03', 'entregado\'', '13 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 21, 357, 1602, 2001),
(10013, 20013, '2021-05-03', 'entregado\'', '14 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio prioritario\'', 22, 374, 1603, 2001),
(10014, 20014, '2021-05-03', 'entregado\'', '15 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 23, 391, 1604, 2001),
(10015, 20015, '2021-05-03', 'entregado\'', '16 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 24, 408, 1605, 2001),
(10016, 20016, '2021-05-03', 'entregado\'', '17 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio prioritario\'', 25, 425, 1606, 2001),
(10017, 20017, '2021-05-03', 'entregado\'', '18 tamales colorados, 3 verdes, 5 rajas\'', 'sucursal\'', 26, 442, 1607, 2001),
(10018, 20018, '2021-05-04', 'entregado\'', '19 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 27, 459, 1608, 2001),
(10019, 20019, '2021-05-04', 'entregado\'', '20 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 28, 476, 1609, 2001),
(10020, 20020, '2021-05-04', 'entregado\'', '21 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio prioritario\'', 29, 493, 1610, 2001),
(10021, 20021, '2021-05-04', 'entregado\'', '22 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 30, 510, 1611, 2001),
(10022, 20022, '2021-05-04', 'entregado\'', '23 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 31, 527, 1591, 2001),
(10023, 20023, '2021-05-04', 'entregado\'', '24 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 32, 544, 1592, 2001),
(10024, 20024, '2021-05-04', 'entregado\'', '25 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio prioritario\'', 33, 561, 1593, 2001),
(10025, 20025, '2021-05-04', 'entregado\'', '26 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 34, 578, 1594, 2001),
(10026, 20026, '2021-05-04', 'entregado\'', '27 tamales colorados, 3 verdes, 5 rajas\'', 'sucursal\'', 35, 595, 1595, 2001),
(10027, 20027, '2021-05-04', 'entregado\'', '28 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio prioritario\'', 36, 612, 1596, 2001),
(10028, 20028, '2021-05-04', 'entregado\'', '29 tamales colorados, 3 verdes, 5 rajas\'', 'domicilio\'', 37, 629, 1597, 2001),
(10029, 20029, '2021-05-04', 'entregado\'', '30 tamales colorados, 3 verdes, 5 rajas\'', 'sucursal\'', 38, 646, 1598, 2001),
(10030, 20030, '2021-05-04', 'entregado\'', '4 tamles rajas, 6 dulces\'', 'domicilio\'', 10, 170, 1599, 2002),
(10031, 20031, '2021-05-04', 'entregado\'', '5 tamles rajas, 6 dulces\'', 'domicilio prioritario\'', 11, 187, 1600, 2002),
(10032, 20032, '2021-05-04', 'entregado\'', '6 tamles rajas, 6 dulces\'', 'domicilio\'', 12, 204, 1601, 2002),
(10033, 20033, '2021-05-04', 'entregado\'', '7 tamles rajas, 6 dulces\'', 'domicilio\'', 13, 221, 1602, 2002),
(10034, 20034, '2021-05-04', 'entregado\'', '8 tamles rajas, 6 dulces\'', 'domicilio prioritario\'', 14, 238, 1603, 2002),
(10035, 20035, '2021-05-05', 'entregado\'', '9 tamles rajas, 6 dulces\'', 'domicilio\'', 15, 255, 1604, 2002),
(10036, 20036, '2021-05-05', 'en proceso\'', '10 tamles rajas, 6 dulces\'', 'domicilio prioritario\'', 16, 272, 1605, 2002),
(10037, 20037, '2021-05-05', 'en proceso\'', '11 tamles rajas, 6 dulces\'', 'domicilio\'', 17, 289, 1606, 2002),
(10038, 20038, '2021-05-05', 'en proceso\'', '12 tamles rajas, 6 dulces\'', 'domicilio\'', 18, 306, 1607, 2002),
(10039, 20039, '2021-05-05', 'en proceso\'', '13 tamles rajas, 6 dulces\'', 'domicilio\'', 19, 323, 1608, 2002),
(10040, 20040, '2021-05-05', 'en proceso\'', '14 tamles rajas, 6 dulces\'', 'sucursal\'', 20, 340, 1609, 2002),
(10041, 20041, '2021-05-05', 'en proceso\'', '15 tamles rajas, 6 dulces\'', 'domicilio\'', 21, 357, 1610, 2002),
(10042, 20042, '2021-05-05', 'en proceso\'', '16 tamles rajas, 6 dulces\'', 'domicilio\'', 22, 374, 1611, 2002),
(10043, 20043, '2021-05-06', 'en proceso\'', '17 tamles rajas, 6 dulces\'', 'domicilio\'', 23, 391, 1591, 2002),
(10044, 20044, '2021-05-06', 'en proceso\'', '18 tamles rajas, 6 dulces\'', 'sucursal\'', 24, 408, 1592, 2002),
(10045, 20045, '2021-05-06', 'en proceso\'', '19 tamles rajas, 6 dulces\'', 'domicilio\'', 25, 425, 1593, 2002),
(10046, 20046, '2021-05-06', 'falta de pago\'', '20 tamles rajas, 6 dulces\'', 'sucursal\'', 26, 442, 1594, 2002),
(10047, 20047, '2021-05-06', 'falta de pago\'', '21 tamles rajas, 6 dulces\'', 'sucursal\'', 27, 459, 1595, 2002),
(10048, 20048, '2021-05-06', 'falta de pago\'', '22 tamles rajas, 6 dulces\'', 'domicilio\'', 28, 476, 1596, 2002),
(10049, 20049, '2021-05-06', 'falta de pago\'', '23 tamles rajas, 6 dulces\'', 'domicilio\'', 29, 493, 1597, 2002),
(10050, 20050, '2021-05-06', 'falta de pago\'', '24 tamles rajas, 6 dulces\'', 'domicilio\'', 30, 510, 1598, 2002);

-- --------------------------------------------------------

--
-- Table structure for table `pedidoproducto`
--

CREATE TABLE `pedidoproducto` (
  `idProducto` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `fechaPedido` date NOT NULL,
  `cantidadPorProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedidoproducto`
--

INSERT INTO `pedidoproducto` (`idProducto`, `idPedido`, `fechaPedido`, `cantidadPorProducto`) VALUES
(1, 10001, '2021-05-02', 2),
(1, 10002, '2021-05-02', 3),
(1, 10003, '2021-05-02', 4),
(1, 10004, '2021-05-02', 5),
(1, 10005, '2021-05-02', 6),
(1, 10006, '2021-05-02', 7),
(1, 10007, '2021-05-03', 8),
(1, 10008, '2021-05-03', 9),
(1, 10009, '2021-05-03', 10),
(1, 10010, '2021-05-03', 11),
(1, 10011, '2021-05-03', 12),
(1, 10012, '2021-05-03', 13),
(1, 10013, '2021-05-03', 14),
(1, 10014, '2021-05-03', 15),
(1, 10015, '2021-05-03', 16),
(1, 10016, '2021-05-03', 17),
(1, 10017, '2021-05-03', 18),
(1, 10018, '2021-05-04', 19),
(1, 10019, '2021-05-04', 20),
(1, 10020, '2021-05-04', 21),
(1, 10021, '2021-05-04', 22),
(1, 10022, '2021-05-04', 23),
(1, 10023, '2021-05-04', 24),
(1, 10024, '2021-05-04', 25),
(1, 10025, '2021-05-04', 26),
(1, 10026, '2021-05-04', 27),
(1, 10027, '2021-05-04', 28),
(1, 10028, '2021-05-04', 29),
(1, 10029, '2021-05-04', 30),
(2, 10001, '2021-05-02', 3),
(2, 10002, '2021-05-02', 3),
(2, 10003, '2021-05-02', 3),
(2, 10004, '2021-05-02', 3),
(2, 10005, '2021-05-02', 3),
(2, 10006, '2021-05-02', 3),
(2, 10007, '2021-05-03', 3),
(2, 10008, '2021-05-03', 3),
(2, 10009, '2021-05-03', 3),
(2, 10010, '2021-05-03', 3),
(2, 10011, '2021-05-03', 3),
(2, 10012, '2021-05-03', 3),
(2, 10013, '2021-05-03', 3),
(2, 10014, '2021-05-03', 3),
(2, 10015, '2021-05-03', 3),
(2, 10016, '2021-05-03', 3),
(2, 10017, '2021-05-03', 3),
(2, 10018, '2021-05-04', 3),
(2, 10019, '2021-05-04', 3),
(2, 10020, '2021-05-04', 3),
(2, 10021, '2021-05-04', 3),
(2, 10022, '2021-05-04', 3),
(2, 10023, '2021-05-04', 3),
(2, 10024, '2021-05-04', 3),
(2, 10025, '2021-05-04', 3),
(2, 10026, '2021-05-04', 3),
(2, 10027, '2021-05-04', 3),
(2, 10028, '2021-05-04', 3),
(2, 10029, '2021-05-04', 3),
(3, 10001, '2021-05-02', 5),
(3, 10002, '2021-05-02', 5),
(3, 10003, '2021-05-02', 5),
(3, 10004, '2021-05-02', 5),
(3, 10005, '2021-05-02', 5),
(3, 10006, '2021-05-02', 5),
(3, 10007, '2021-05-03', 5),
(3, 10008, '2021-05-03', 5),
(3, 10009, '2021-05-03', 5),
(3, 10010, '2021-05-03', 5),
(3, 10011, '2021-05-03', 5),
(3, 10012, '2021-05-03', 5),
(3, 10013, '2021-05-03', 5),
(3, 10014, '2021-05-03', 5),
(3, 10015, '2021-05-03', 5),
(3, 10016, '2021-05-03', 5),
(3, 10017, '2021-05-03', 5),
(3, 10018, '2021-05-04', 5),
(3, 10019, '2021-05-04', 5),
(3, 10020, '2021-05-04', 5),
(3, 10021, '2021-05-04', 5),
(3, 10022, '2021-05-04', 5),
(3, 10023, '2021-05-04', 5),
(3, 10024, '2021-05-04', 5),
(3, 10025, '2021-05-04', 5),
(3, 10026, '2021-05-04', 5),
(3, 10027, '2021-05-04', 5),
(3, 10028, '2021-05-04', 5),
(3, 10029, '2021-05-04', 5),
(3, 10030, '2021-05-04', 4),
(3, 10031, '2021-05-04', 5),
(3, 10032, '2021-05-04', 6),
(3, 10033, '2021-05-04', 7),
(3, 10034, '2021-05-04', 8),
(3, 10035, '2021-05-05', 9),
(3, 10036, '2021-05-05', 10),
(3, 10037, '2021-05-05', 11),
(3, 10038, '2021-05-05', 12),
(3, 10039, '2021-05-05', 13),
(3, 10040, '2021-05-05', 14),
(3, 10041, '2021-05-05', 15),
(3, 10042, '2021-05-05', 16),
(3, 10043, '2021-05-06', 17),
(3, 10044, '2021-05-06', 18),
(3, 10045, '2021-05-06', 19),
(3, 10046, '2021-05-06', 20),
(3, 10047, '2021-05-06', 21),
(3, 10048, '2021-05-06', 22),
(3, 10049, '2021-05-06', 23),
(3, 10050, '2021-05-06', 24),
(6, 10030, '2021-05-04', 6),
(6, 10031, '2021-05-04', 6),
(6, 10032, '2021-05-04', 6),
(6, 10033, '2021-05-04', 6),
(6, 10034, '2021-05-04', 6),
(6, 10035, '2021-05-05', 6),
(6, 10036, '2021-05-05', 6),
(6, 10037, '2021-05-05', 6),
(6, 10038, '2021-05-05', 6),
(6, 10039, '2021-05-05', 6),
(6, 10040, '2021-05-05', 6),
(6, 10041, '2021-05-05', 6),
(6, 10042, '2021-05-05', 6),
(6, 10043, '2021-05-06', 6),
(6, 10044, '2021-05-06', 6),
(6, 10045, '2021-05-06', 6),
(6, 10046, '2021-05-06', 6),
(6, 10047, '2021-05-06', 6),
(6, 10048, '2021-05-06', 6),
(6, 10049, '2021-05-06', 6),
(6, 10050, '2021-05-06', 6);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `NombreProducto` varchar(80) DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL,
  `Existencia` int(11) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `ImagenProducto` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`idProducto`, `NombreProducto`, `Precio`, `Existencia`, `Descripcion`, `ImagenProducto`) VALUES
(1, 'Colorado', 17, 10, 'Masa hidratada con un ligero color rojizo relleno de carne de cerdo desmenuzada guisada con chile guajillo', NULL),
(2, 'Verde depollo', 17, 10, 'Masa delgada, rellena con pollo desmenuzado en salsa verde', NULL),
(3, 'Rajas con queso', 17, 10, 'Masa rellena de rajas en escabeche con queso panela', NULL),
(4, 'Chicharron', 17, 10, 'Tamal de masa muy delgada relleno de un guiso de chicharrón tipo carnitas', NULL),
(5, 'Frijoles norteños', 17, 10, 'Masa delgada rellena de frijoles norteños (guisado con chile guajillo) y queso panela', NULL),
(6, 'Dulce', 17, 10, 'Tamal con pasas, coco y naranja, sin colorantes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promocion`
--

CREATE TABLE `promocion` (
  `idPromocion` int(11) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `FechaFinal` date DEFAULT NULL,
  `ImagenPromocion` varchar(200) DEFAULT NULL,
  `idDescuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promocion`
--

INSERT INTO `promocion` (`idPromocion`, `descripcion`, `fechaInicio`, `FechaFinal`, `ImagenPromocion`, `idDescuento`) VALUES
(2001, ' 2 x 1 en tamales dulces \'', '2021-05-20', '2021-06-20', '', 10501),
(2002, ' 3 x 1 en tamales de rajas \'', '2021-05-20', '2021-06-20', '', 10501),
(2003, ' 4 x 1 en tamales colorados \'', '2021-05-20', '2021-06-20', '', 10501);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `idCliente` (`idCliente`),
  ADD UNIQUE KEY `correoElectronico` (`correoElectronico`);

--
-- Indexes for table `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`idDescuento`);

--
-- Indexes for table `distribucion`
--
ALTER TABLE `distribucion`
  ADD PRIMARY KEY (`idDistribucion`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idPromocion` (`idPromocion`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indexes for table `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD PRIMARY KEY (`idProducto`,`idPedido`,`fechaPedido`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1614;

ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10031;

