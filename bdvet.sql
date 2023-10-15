-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2023 a las 07:48:01
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
-- Base de datos: `bdvet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesorios`
--

CREATE TABLE `accesorios` (
  `IDAccesorio` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `CantidadInventario` int(11) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `accesorios`
--

INSERT INTO `accesorios` (`IDAccesorio`, `Nombre`, `Descripcion`, `CantidadInventario`, `Precio`) VALUES
(1, 'Pelota para Perros', 'Pelota de goma resistente para perros', 50, 9.99),
(2, 'Hueso de Cuero', 'Hueso de cuero natural para masticar', 30, 5.49),
(3, 'Juguete de Plumas', 'Juguete interactivo con plumas para gatos', 75, 3.99),
(4, 'Correa para Paseos', 'Correa resistente para pasear a perros', 40, 12.75),
(5, 'Comedero Automático', 'Comedero programable para mascotas', 60, 19.99),
(6, 'Collar Reflectante', 'Collar con material reflectante para mayor visibilidad', 25, 7.99),
(7, 'Cama para Mascotas', 'Cama cómoda y acolchada para descansar', 90, 24.50),
(8, 'Rascador de Gatos', 'Rascador con postes y superficies para gatos', 70, 14.25),
(9, 'Arnés Ajustable', 'Arnés ajustable para perros de diferentes tallas', 55, 8.99),
(10, 'Bola de Lana', 'Juguete de lana para entretener a gatos', 45, 2.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `ID` int(11) NOT NULL,
  `RazonCita` varchar(50) NOT NULL,
  `FechaCita` date NOT NULL,
  `DniCliente` varchar(8) NOT NULL,
  `IdMascota` int(11) NOT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`ID`, `RazonCita`, `FechaCita`, `DniCliente`, `IdMascota`, `Estado`) VALUES
(1, 'Revisión anual', '2023-10-14', '12345678', 1, 'Pendiente'),
(2, 'Vacunación', '2023-10-15', '23456789', 2, 'Atendida'),
(3, 'Desparasitación', '2023-10-16', '34567890', 3, 'Pendiente'),
(4, 'Control de salud', '2023-10-17', '45678901', 4, 'Cancelada'),
(6, 'prueba', '2023-10-01', '12345678', 1, 'Pendiente'),
(7, 'pruebapruebaprueba', '2023-10-03', '12345678', 6, 'Pendiente'),
(8, 'xxxxxxx', '2023-10-01', '12345678', 6, 'Pendiente'),
(9, 'aaaaaaaa', '2023-10-01', '12345678', 6, 'Pendiente'),
(10, 'editadoooo', '2023-10-16', '12345678', 1, 'Atendida'),
(11, 'holaaasssssssssdd', '2023-10-18', '23456789', 6, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `DNI` varchar(8) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`DNI`, `Nombre`) VALUES
('12345678', 'Juan Pérez'),
('23456789', 'María López'),
('34567890', 'Pedro Gómez'),
('45678901', 'Ana Martínez'),
('74164575', 'Miranda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `ID` int(11) NOT NULL,
  `NombreAnimal` varchar(50) NOT NULL,
  `SexoAnimal` varchar(50) NOT NULL,
  `Raza` varchar(50) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Especie` varchar(50) NOT NULL,
  `DniCliente` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`ID`, `NombreAnimal`, `SexoAnimal`, `Raza`, `Color`, `Especie`, `DniCliente`) VALUES
(1, 'Max', 'Macho', 'Labrador', 'Dorado', 'Canino', '12345678'),
(2, 'Luna', 'Hembra', 'Bulldog', 'Blanco', 'Canino', '23456789'),
(3, 'Rocky', 'Macho', 'Dálmata', 'Negro y Blanco', 'Canino', '34567890'),
(4, 'Molly', 'Hembra', 'Siamesa', 'Gris', 'Felino', '45678901'),
(6, 'Chulapi', 'Macho', 'bonita', 'chaufa', 'canina', '12345678'),
(11, 'Bronx', 'macho', 'pitbullo', 'rojo', 'canina', '74164575');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `IDMedicamento` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `CantidadInventario` int(11) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`IDMedicamento`, `Nombre`, `Descripcion`, `CantidadInventario`, `FechaVencimiento`, `Precio`) VALUES
(1, 'Pastillas de Calcio', 'Suplemento de calcio para mascotas', 50, '2023-11-30', 12.99),
(2, 'Vacuna Canina', 'Vacuna para prevenir enfermedades en perros', 30, '2023-12-15', 18.49),
(3, 'Galletas para Gatos', 'Snack de galletas para gatos', 75, '2024-03-10', 5.99),
(4, 'Antipulgas y Garrapatas', 'Tratamiento contra pulgas y garrapatas', 40, '2025-02-28', 24.75),
(5, 'Shampoo Antialérgico', 'Shampoo suave para pieles sensibles', 60, '2024-07-20', 9.25),
(6, 'Juguete Interactivo', 'Juguete interactivo para entretener mascotas', 25, '2023-10-01', 8.99),
(7, 'Suplemento de Omega-3', 'Suplemento para la salud de la piel y el pelaje', 90, '2024-05-05', 15.50),
(8, 'Cepillo de Dientes', 'Cepillo de dientes para perros y gatos', 70, '2023-11-10', 7.25),
(9, 'Alimento Premium', 'Alimento balanceado de alta calidad', 55, '2024-08-15', 32.99),
(10, 'Antiestrés para Mascotas', 'Suplemento calmante para situaciones estresantes', 45, '2025-01-25', 13.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `cargo` varchar(100) NOT NULL,
  `tipo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `nombre`, `telefono`, `usuario`, `contrasena`, `cargo`, `tipo`) VALUES
(1, 'admin', 'Teléfono1', 'admin', 'admin', 'Cargo1', 1),
(2, 'Nombre2', 'Teléfono2', 'Usuario2', 'Contraseña2', 'Cargo2', 2),
(3, 'Nombre3', 'Teléfono3', 'Usuario3', 'Contraseña3', 'Cargo3', 3),
(4, 'Nombre4', 'Teléfono4', 'Usuario4', 'Contraseña4', 'Cargo4', 4),
(5, 'Nombre5', 'Teléfono5', 'Usuario5', 'Contraseña5', 'Cargo5', 5),
(15, 'admin', '987654321', 'admin', '123', 'doc', 0),
(16, 'Caousen', '987654321', 'adminnn', '123', 'doctor', 0),
(17, 'admin', '987654321', 'admin', '123', 'docc', 0),
(18, 'gian', '123456789', 'gian', '123', 'doc', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesorios`
--
ALTER TABLE `accesorios`
  ADD PRIMARY KEY (`IDAccesorio`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DniCliente` (`DniCliente`),
  ADD KEY `IdMascota` (`IdMascota`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DniCliente` (`DniCliente`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`IDMedicamento`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesorios`
--
ALTER TABLE `accesorios`
  MODIFY `IDAccesorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `IDMedicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`DniCliente`) REFERENCES `clientes` (`DNI`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`IdMascota`) REFERENCES `mascotas` (`ID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`DniCliente`) REFERENCES `clientes` (`DNI`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
