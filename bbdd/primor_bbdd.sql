-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-02-2024 a las 07:08:07
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
-- Base de datos: `primor_bbdd`
--
CREATE DATABASE IF NOT EXISTS `primor_bbdd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `primor_bbdd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `nombre`, `descripcion`) VALUES
(1, 'TEST', ''),
(2, 'Delicias del mar', ''),
(3, 'Sabores de la tierra', ''),
(4, 'Con un toque floral', ''),
(5, 'Sorpresas al paladar', ''),
(6, 'Dulces secretos', ''),
(7, 'Placeres veganos', ''),
(8, 'Clásicos infalibles', ''),
(9, 'Del mundo', ''),
(10, 'Mer À Versailles', ''),
(11, 'Ecrasant Des Feuilles', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `comentario_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `valoracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`comentario_id`, `user_id`, `titulo`, `comentario`, `valoracion`) VALUES
(1, 3, 'Me gustan mucho los macarrones con queso', 'Los macarrones con queso que pedí estaban muy buenos; la cantidad era la correcta, la salsa y el queso eran realmente deliciosos. ¡Volveré a pedir! PD: como recomendación al chef, ¿podríais echarle 3 veces más queso, por favor? PPD: Me gusta mucho el ques', 5),
(2, 2, 'Experiencia auténtica en comida italiana', 'Soy un amante de la comida italiana y este restaurante superó mis expectativas. La pasta estaba perfectamente cocida, la salsa tenía el equilibrio justo de sabores y el ambiente recordaba a las auténticas trattorias en Italia. Si buscas una experiencia cu', 5),
(3, 4, 'Una sorpresa culinaria en cada bocado', 'La experiencia en este restaurante fue excepcional. Desde la entrada hasta el postre, la combinación de sabores y la presentación cuidadosa hicieron que la cena fuera memorable. El servicio también estuvo a la altura, ¡Pediremos pronto!', 5),
(4, 6, 'Dulce placer en cada postre pero...', 'Los postres de este lugar son una obra maestra. Probé varios y cada uno era una explosión de sabores, cada plato fue una delicia para el paladar. Imprescindible para los amantes de los postres. La unica pega son los precios, un poco caro para tiempos del ', 4),
(5, 5, 'Un viaje culinario a Oriente para el paladar', 'La frescura de los ingredientes y la atención al detalle en la presentación hacen que este lugar se destaque. Sin duda, es una joya para los amantes de la cocina asiática. Ya no hacen mi plato favorito, por ello tengo que dejar una mala reseña.', 2),
(6, 2, 'dsfdsf', 'sdfdsdsfdsfdsf', 3),
(7, 2, 'dsfds', 'fdsfdsfdsfds', 5),
(8, 2, 'No logueado', 'Comentario sin loguear', 1),
(9, 2, 'Ya va!', 'Ole ole loh caracoleh', 1),
(10, 2, 'a', 'a', 1),
(11, 2, 'Prueba', 'prueba', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credenciales`
--

CREATE TABLE `credenciales` (
  `user_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `credenciales`
--

INSERT INTO `credenciales` (`user_id`, `password`) VALUES
(1, '$2y$10$fSAsimsOtBKTdWGoUrxT1OUSybmcxIUaez/gjKKqhcdAavgolaqbS'),
(2, '$2y$10$9QCJedVXTSqPFtQs73RgO.BHAznofdWFOkB3fXHGKYze.pgNui622'),
(3, '$2y$10$y16/Ia6oxVhjnmkmg46ihusvdq9rwLLTuPkYE3H8aVniZ9OyZU0Ta'),
(7, '$2y$10$qnNwjhurhwwJWTflUdN9deU/BgsA7Btal2j4n31X7eUFkjA6SE61C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `codigo` varchar(255) NOT NULL,
  `descuento` decimal(2,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descuentos`
--

INSERT INTO `descuentos` (`codigo`, `descuento`) VALUES
('ENERO10', 0.90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pedido` text NOT NULL,
  `precio` float(10,2) NOT NULL,
  `propina` float(10,2) NOT NULL,
  `puntos_utilizados` int(11) NOT NULL,
  `puntos_obtenidos` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `user_id`, `pedido`, `precio`, `propina`, `puntos_utilizados`, `puntos_obtenidos`, `fecha`) VALUES
(28, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(29, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(30, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(31, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(32, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(33, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(34, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(35, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(36, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(37, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(38, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(39, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(40, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(41, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(42, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(43, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(44, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(45, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(46, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-01-17'),
(47, 2, '\"[1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 13.00, 0.00, 0, 0, '2024-01-18'),
(48, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(49, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(50, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(51, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(52, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(53, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(54, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(55, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(56, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(57, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(58, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(59, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(60, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(61, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(62, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.00, 0.00, 0, 0, '2024-01-24'),
(63, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(64, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(65, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(66, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(67, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(68, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(69, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(70, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(71, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(72, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(73, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(74, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(75, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(76, 2, '\"[4|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-01-24'),
(77, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 81.00, 0.00, 0, 0, '2024-01-24'),
(78, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 81.00, 0.00, 0, 0, '2024-01-24'),
(79, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 81.00, 0.00, 0, 0, '2024-01-24'),
(80, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 81.00, 0.00, 0, 0, '2024-01-24'),
(81, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 81.00, 0.00, 0, 0, '2024-01-24'),
(82, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 81.00, 0.00, 0, 0, '2024-01-24'),
(83, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 81.00, 0.00, 0, 0, '2024-01-24'),
(84, 2, '\"[2|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 28.00, 0.00, 0, 0, '2024-01-29'),
(85, 2, '\"[1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][2|Migas de galleta con castaña y zumo de mandarina|Ecrasant Des Feuilles|migas.png|8.95]\"', 31.00, 0.00, 0, 0, '2024-02-02'),
(86, 2, '\"[10|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][2|Migas de galleta con castaña y zumo de mandarina|Ecrasant Des Feuilles|migas.png|8.95]\"', 157.00, 0.00, 0, 0, '2024-02-02'),
(87, 2, '\"[10|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][2|Migas de galleta con castaña y zumo de mandarina|Ecrasant Des Feuilles|migas.png|8.95]\"', 157.00, 0.00, 0, 0, '2024-02-02'),
(88, 2, '\"[10|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][2|Migas de galleta con castaña y zumo de mandarina|Ecrasant Des Feuilles|migas.png|8.95]\"', 314.00, 0.00, 0, 0, '2024-02-02'),
(89, 2, '\"[1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 27.00, 0.00, 0, 0, '2024-02-02'),
(90, 2, '\"[1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 27.00, 0.00, 0, 0, '2024-02-02'),
(91, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 17.00, 0.00, 0, 0, '2024-02-05'),
(92, 2, '\"[2|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 38.00, 0.00, 0, 0, '2024-02-05'),
(93, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(94, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(95, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(96, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(97, 2, '\"[2|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\\n[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\\n[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\\n\"', 38.00, 0.00, 0, 0, '2024-02-05'),
(98, 2, '\"[2|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 38.00, 0.00, 0, 0, '2024-02-05'),
(99, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 17.00, 0.00, 0, 0, '2024-02-05'),
(100, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 17.00, 0.00, 0, 0, '2024-02-05'),
(101, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 23.00, 0.00, 0, 0, '2024-02-05'),
(102, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 23.00, 0.00, 0, 0, '2024-02-05'),
(103, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(104, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(105, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(106, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 27.00, 0.00, 0, 0, '2024-02-05'),
(107, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 40.00, 0.00, 0, 0, '2024-02-05'),
(108, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-06'),
(109, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-06'),
(110, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-06'),
(111, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 26.00, 0.00, 0, 0, '2024-02-06'),
(112, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 26.00, 0.00, 0, 0, '2024-02-06'),
(113, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 26.00, 0.00, 0, 0, '2024-02-06'),
(114, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 26.00, 0.00, 0, 0, '2024-02-06'),
(115, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-06'),
(116, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-06'),
(117, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(118, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(119, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(120, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(121, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(122, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(123, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(124, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(125, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(126, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(127, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(128, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(129, 2, '\"[20|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 199.00, 0.00, 0, 0, '2024-02-06'),
(130, 3, '\"[2|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 34.00, 0.00, 0, 0, '2024-02-07'),
(131, 2, '\"[3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-02-07'),
(132, 2, '\"[3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-02-07'),
(133, 2, '\"[3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 46.00, 0.00, 0, 0, '2024-02-07'),
(134, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 92.00, 0.00, 0, 0, '2024-02-08'),
(135, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 30.00, 0.00, 0, 0, '2024-02-08'),
(136, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 33.00, 0.00, 0, 0, '2024-02-08'),
(137, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 33.00, 0.00, 0, 0, '2024-02-08'),
(138, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 30.00, 0.00, 0, 0, '2024-02-08'),
(139, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 32.00, 0.00, 0, 0, '2024-02-08'),
(140, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 32.00, 0.00, 0, 0, '2024-02-08'),
(141, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 31.00, 0.00, 0, 0, '2024-02-08'),
(142, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 154.00, 0.00, 0, 0, '2024-02-08'),
(143, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 3.00, 0.00, 0, 0, '2024-02-08'),
(144, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 7.00, 0.00, 0, 0, '2024-02-08'),
(145, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 7.00, 0.00, 0, 0, '2024-02-08'),
(146, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 243.00, 0.00, 0, 0, '2024-02-08'),
(147, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 3.00, 0.00, 0, 0, '2024-02-08'),
(148, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 50.00, 0.00, 0, 0, '2024-02-08'),
(149, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 51.00, 0.00, 0, 0, '2024-02-08'),
(150, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 243.00, 0.00, 0, 0, '2024-02-08'),
(151, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 48.00, 0.00, 0, 0, '2024-02-08'),
(152, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(153, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 7.00, 0.00, 0, 0, '2024-02-08'),
(154, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 7.00, 0.00, 0, 0, '2024-02-08'),
(155, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 22.00, 0.00, 0, 0, '2024-02-08'),
(156, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 21.00, 0.00, 0, 0, '2024-02-08'),
(157, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 21.00, 0.00, 0, 0, '2024-02-08'),
(158, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 22.00, 0.00, 0, 0, '2024-02-08'),
(159, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 21.00, 0.00, 0, 0, '2024-02-08'),
(160, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 22.00, 0.00, 0, 0, '2024-02-08'),
(161, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 19.00, 0.00, 0, 0, '2024-02-08'),
(162, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 22.00, 0.00, 0, 0, '2024-02-08'),
(163, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 22.00, 0.00, 0, 0, '2024-02-08'),
(164, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 21.00, 0.00, 0, 0, '2024-02-08'),
(165, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 21.00, 0.00, 0, 0, '2024-02-08'),
(166, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 22.00, 0.00, 0, 0, '2024-02-08'),
(167, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 20872.00, 0.00, 0, 0, '2024-02-08'),
(168, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 20871.00, 0.00, 0, 0, '2024-02-08'),
(169, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 20871.00, 0.00, 0, 0, '2024-02-08'),
(170, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 231.00, 0.00, 0, 0, '2024-02-08'),
(171, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 231.00, 0.00, 0, 0, '2024-02-08'),
(172, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 231.00, 0.00, 0, 0, '2024-02-08'),
(173, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(174, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(175, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(176, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(177, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 231.00, 0.00, 0, 0, '2024-02-08'),
(178, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 231.00, 0.00, 0, 0, '2024-02-08'),
(179, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 231.00, 0.00, 0, 0, '2024-02-08'),
(180, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(181, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(182, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(183, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(184, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(185, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(186, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(187, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(188, 2, '\"[3|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(189, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 0.00, 0.00, 0, 0, '2024-02-08'),
(190, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 0.00, 0.00, 0, 0, '2024-02-09'),
(191, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 0.00, 0.00, 0, 0, '2024-02-09'),
(192, 2, '\"[5|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-09'),
(193, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(194, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(195, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(196, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(197, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(198, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(199, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(200, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(201, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(202, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(203, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(204, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(205, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(206, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(207, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(208, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(209, 2, '\"[2|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(210, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 0.00, 0.00, 0, 0, '2024-02-11'),
(211, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 28.00, 0.00, 0, 0, '2024-02-11'),
(212, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 29.00, 0.00, 0, 0, '2024-02-11'),
(213, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 27.00, 0.00, 0, 0, '2024-02-11'),
(214, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 27.00, 0.00, 0, 0, '2024-02-11'),
(215, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 27.00, 0.00, 0, 0, '2024-02-11'),
(216, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 59.00, 0.00, 0, 0, '2024-02-13'),
(217, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 59.00, 0.00, 0, 0, '2024-02-13'),
(218, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 62.00, 0.00, 0, 0, '2024-02-13'),
(219, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][18|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 180.00, 0.00, 0, 0, '2024-02-13'),
(220, 2, '\"[6|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 109.00, 0.00, 0, 0, '2024-02-14'),
(221, 2, '\"[1|Bocaditos crujientes de boniato, trufa y cereal |Ecrasant Des Feuilles|bocaditos.png|16.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 41.00, 0.00, 0, 0, '2024-02-14'),
(222, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 52.00, 0.00, 0, 0, '2024-02-16'),
(223, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 52.00, 0.00, 0, 0, '2024-02-16'),
(224, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 52.00, 0.00, 0, 0, '2024-02-16'),
(225, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 59.00, 0.00, 0, 0, '2024-02-16'),
(226, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 59.00, 0.00, 0, 0, '2024-02-16'),
(227, 2, '\"[5|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 59.00, 0.00, 0, 0, '2024-02-16'),
(228, 2, '\"[6|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][5|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 132.00, 0.00, 0, 0, '2024-02-16'),
(229, 2, '\"[6|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][5|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 132.00, 0.00, 0, 0, '2024-02-16'),
(230, 2, '\"[6|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][5|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 132.00, 0.00, 0, 0, '2024-02-16'),
(231, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 22.00, 0.00, 0, 0, '2024-02-16'),
(232, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 44.00, 0.00, 0, 0, '2024-02-16'),
(233, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 44.00, 0.00, 0, 0, '2024-02-16'),
(234, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 44.00, 0.00, 0, 0, '2024-02-16'),
(235, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 44.00, 0.00, 0, 0, '2024-02-16'),
(236, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 44.00, 0.00, 0, 0, '2024-02-16'),
(237, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 44.00, 0.00, 0, 0, '2024-02-16'),
(238, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][3|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 44.00, 0.00, 0, 0, '2024-02-16'),
(239, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.00, 0.00, 0, 0, '2024-02-16'),
(240, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.00, 0.00, 0, 0, '2024-02-16'),
(241, 2, '\"[3|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 65.00, 0.00, 0, 0, '2024-02-16'),
(242, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 51.00, 0.00, 0, 0, '2024-02-16'),
(243, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 56.00, 0.00, 0, 0, '2024-02-16'),
(244, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 56.00, 0.00, 0, 0, '2024-02-16'),
(245, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 56.00, 0.00, 0, 0, '2024-02-16'),
(246, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 56.00, 0.00, 0, 0, '2024-02-16'),
(247, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 56.00, 0.00, 0, 0, '2024-02-16'),
(248, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95]\"', 51.00, 0.00, 0, 0, '2024-02-16'),
(249, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 37.00, 0.00, 0, 0, '2024-02-16'),
(250, 2, '\"[1|Pollo tandoori y hummus|Delicias del mar|pollo-tandoori.png|9.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 37.00, 0.00, 0, 0, '2024-02-16'),
(251, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(252, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(253, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16');
INSERT INTO `pedidos` (`pedido_id`, `user_id`, `pedido`, `precio`, `propina`, `puntos_utilizados`, `puntos_obtenidos`, `fecha`) VALUES
(254, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(255, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(256, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(257, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(258, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(259, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(260, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 9.00, 0.00, 0, 0, '2024-02-16'),
(261, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 19.00, 0.00, 0, 0, '2024-02-16'),
(262, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 19.00, 0.00, 0, 0, '2024-02-16'),
(263, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 19.00, 0.00, 0, 0, '2024-02-16'),
(264, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 19.00, 0.00, 0, 0, '2024-02-16'),
(265, 2, '\"[7|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 69.00, 0.00, 0, 0, '2024-02-16'),
(266, 2, '\"[7|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 69.00, 0.00, 0, 0, '2024-02-16'),
(267, 2, '\"[7|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 69.00, 0.00, 0, 0, '2024-02-16'),
(268, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(269, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(270, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(271, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(272, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(273, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(274, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 0.00, 0.00, 0, 0, '2024-02-16'),
(275, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 0.00, 0.00, 0, 0, '2024-02-16'),
(276, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(277, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(278, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(279, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(280, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(281, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(282, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(283, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(284, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(285, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(286, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(287, 2, '\"[9|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 89.00, 0.00, 0, 0, '2024-02-16'),
(288, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(289, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(290, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(291, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 99.00, 0.00, 0, 0, '2024-02-16'),
(292, 2, '\"[10|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 109.00, 9.00, 0, 0, '2024-02-16'),
(293, 2, '\"[11|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 114.92, 5.47, 0, 0, '2024-02-16'),
(294, 2, '\"[11|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', -56.71, 10.95, 0, 0, '2024-02-16'),
(295, 2, '\"[11|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 120.40, 10.95, 0, 0, '2024-02-16'),
(296, 2, '\"[15|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 160.19, 10.95, 0, 0, '2024-02-16'),
(297, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 0.00, 10.95, 0, 0, '2024-02-16'),
(298, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.94, 1.00, 0, 0, '2024-02-16'),
(299, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.94, 1.00, 9, 0, '2024-02-16'),
(300, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.94, 1.00, 9, 9, '2024-02-16'),
(301, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.94, 1.00, 36, 9, '2024-02-16'),
(302, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 16.90, 0.00, 0, 16, '2024-02-16'),
(303, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.94, 1.00, 16, 9, '2024-02-17'),
(304, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 10.94, 1.00, 16, 9, '2024-02-17'),
(305, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 41.79, 1.00, 34, 40, '2024-02-17'),
(306, 2, '\"[1|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 16.90, 0.00, 74, 16, '2024-02-17'),
(307, 2, '\"[2|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 41.79, 1.00, 34, 40, '2024-02-17'),
(308, 7, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 6.95, 0.00, 1, 6, '2024-02-17'),
(309, 7, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 6.95, 0.00, 1, 6, '2024-02-17'),
(310, 7, '\"[15|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 104.46, 0.21, 1, 6, '2024-02-17'),
(311, 3, '\"[8|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 111.60, 0.00, 0, 111, '2024-02-17'),
(312, 7, '\"[15|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 104.46, 0.21, 19, 104, '2024-02-17'),
(313, 2, '\"[8|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 56.30, 0.70, 330, 55, '2024-02-17'),
(314, 2, '\"[8|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 56.30, 0.70, 330, 55, '2024-02-17'),
(315, 2, '\"[8|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 56.30, 0.70, 330, 55, '2024-02-17'),
(316, 2, '\"[1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 10.95, 0.00, 495, 10, '2024-02-17'),
(317, 7, '\"[12|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 119.90, 0.50, 123, 109, '2024-02-17'),
(318, 7, '\"[12|Albondigas con salsa pouluette y verduras al vapor|Delicias del mar|albondigas-pouluette.png|9.95]\"', 119.90, 0.50, 123, 109, '2024-02-17'),
(319, 2, '\"[1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95]\"', 6.95, 0.00, 50, 6, '2024-02-17'),
(320, 2, '\"[3|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 26.04, 4.19, 200, 41, '2024-02-17'),
(321, 2, '\"[3|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 63.94, 4.19, 0, 59, '2024-02-17'),
(322, 2, '\"[3|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95][1|Crema de pizza|Sorpresas al paladar|crema-pizza.png|6.95][1|Ternera con salsa nicoise y patatas al horno|Delicias del mar|ternera-nicoise.png|10.95]\"', 63.94, 4.19, 59, 59, '2024-02-17'),
(323, 2, '\"[1|Almejas al wok con salsa verde|Delicias del mar|almejas.png|13.95]\"', 13.95, 0.00, 118, 13, '2024-02-17');

--
-- Disparadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `ajustar_precio` BEFORE INSERT ON `pedidos` FOR EACH ROW BEGIN
    IF NEW.precio < 0 THEN
        SET NEW.precio = 0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre`, `precio`, `stock`, `imagen`, `categoria_id`) VALUES
(1, 'Bouillabaisse con algas nori y pétalos de rosa', 15.95, 100, 'bouillabaisse.png', 10),
(2, 'Lotte con purée de manioc y lima', 15.95, 100, 'lotte.png', 10),
(3, 'Bouillon de langosta, algas y boletus', 15.95, 100, 'bouillon.png', 10),
(4, 'Mousse de marisco con mayonesa de rosa ', 15.95, 100, 'mousse.png', 10),
(5, 'Macaron espumoso de cacao y togarashi', 15.95, 100, 'macaron.png', 10),
(6, 'Créme de calabaza, manzana, nueces y pétalos de dália', 15.95, 100, 'creme.png', 11),
(7, 'Reducción de guiso de calabaza y remolacha', 13.95, 100, 'reduccion.png', 11),
(8, 'Raviolis de lenteja roja rellenos de boletus y trufa ', 16.95, 100, 'raviolis.png', 11),
(9, 'Bocaditos crujientes de boniato, trufa y cereal ', 16.95, 100, 'bocaditos.png', 11),
(10, 'Migas de galleta con castaña y zumo de mandarina', 8.95, 100, 'migas.png', 11),
(11, 'Pollo tandoori y hummus', 9.95, 100, 'pollo-tandoori.png', 2),
(12, 'Ternera con salsa nicoise y patatas al horno', 10.95, 100, 'ternera-nicoise.png', 2),
(13, 'Crema de pizza', 6.95, 100, 'crema-pizza.png', 5),
(14, 'Albondigas con salsa pouluette y verduras al vapor', 9.95, 100, 'albondigas-pouluette.png', 2),
(15, 'Almejas al wok con salsa verde', 13.95, 100, 'almejas.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` int(11) NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT 1,
  `permisos_admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user_id`, `usuario`, `email`, `nombre`, `apellidos`, `direccion`, `telefono`, `puntos`, `permisos_admin`) VALUES
(1, 'admin@primor.com', 'admin@primor.com', 'admin', 'admin', 'admin', 0, 100, 1),
(2, 'maria@gmail.com', 'maria@gmail.com', 'Maria', 'Gisberto', 'Carrer Verdaguer 9D', 633221398, 131, 0),
(3, 'isa@gmail.com', 'isa@gmail.com', 'Isa', 'Bel', 'C/ Tigresa nur', 640102030, 1, 0),
(4, 'joseluis@gmail.com', 'joseluis@gmail.com', 'jose Luís', 'Rodríguez Perez', 'Plaza constitución 3A', 931002123, 1, 0),
(5, 'alejo33@gmail.com', 'alejo33@gmail.com', 'Alejo', 'Muñon Zancadilla', 'Passeig dels pins 21, pis 2, porta 1', 654134366, 1, 0),
(6, 'anibal666@gmail.com', 'anibal666@gmail.com', 'Marta', 'del Palacio Díaz', 'N/A', 722140808, 1, 0),
(7, 'santfeliw14@gmail.com', 'santfeliw14@gmail.com', 'AITOR', 'MARMOL', 'NO DIRECCION', 0, 341, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`comentario_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indices de la tabla `credenciales`
--
ALTER TABLE `credenciales`
  ADD KEY `cliente_id` (`user_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `comentario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`user_id`);

--
-- Filtros para la tabla `credenciales`
--
ALTER TABLE `credenciales`
  ADD CONSTRAINT `cliente_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`user_id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
