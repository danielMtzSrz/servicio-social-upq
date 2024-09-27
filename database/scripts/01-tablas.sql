-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-09-2024 a las 04:23:46
-- Versión del servidor: 5.7.33
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estanciaii`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `id` bigint(20) NOT NULL,
  `tipo_anuncio_id` bigint(20) DEFAULT NULL,
  `empresa_id` bigint(20) DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesorias`
--

CREATE TABLE `asesorias` (
  `id` bigint(20) NOT NULL,
  `materia_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id` bigint(20) NOT NULL,
  `edificio_id` bigint(20) DEFAULT NULL,
  `tipo_aula_id` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `horarios` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas_reservacion`
--

CREATE TABLE `aulas_reservacion` (
  `id` bigint(20) NOT NULL,
  `aula_id` bigint(20) DEFAULT NULL,
  `solicitante_id` bigint(20) DEFAULT NULL,
  `horario_inicio` datetime(3) DEFAULT NULL,
  `horario_final` datetime(3) DEFAULT NULL,
  `asunto` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonias`
--

CREATE TABLE `colonias` (
  `id` bigint(20) NOT NULL,
  `municipio_id` bigint(20) DEFAULT NULL,
  `cp` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convocatorias`
--

CREATE TABLE `convocatorias` (
  `id` bigint(20) NOT NULL,
  `periodo_id` bigint(20) DEFAULT NULL,
  `tipo_convocatoria_id` bigint(20) DEFAULT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) NOT NULL,
  `colonia_id` bigint(20) DEFAULT NULL,
  `calle` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `numero_exterior` int(11) DEFAULT NULL,
  `numero_interior` int(11) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `nombre_empresa` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `rfc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` bigint(20) NOT NULL,
  `pais_id` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `habilidades_blandas` json DEFAULT NULL,
  `habilidades_profesionales` json DEFAULT NULL,
  `experiencia_profesional` json DEFAULT NULL,
  `educacion` json DEFAULT NULL,
  `idiomas` json DEFAULT NULL,
  `contacto` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `connection` text COLLATE utf8mb4_bin NOT NULL,
  `queue` text COLLATE utf8mb4_bin NOT NULL,
  `payload` longtext COLLATE utf8mb4_bin NOT NULL,
  `exception` longtext COLLATE utf8mb4_bin NOT NULL,
  `failed_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id` bigint(20) NOT NULL,
  `carrera_id` bigint(20) DEFAULT NULL,
  `aula_id` bigint(20) DEFAULT NULL,
  `tutor_id` bigint(20) DEFAULT NULL,
  `periodo_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `horarios` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_materia`
--

CREATE TABLE `grupo_materia` (
  `id` bigint(20) NOT NULL,
  `profesor_id` bigint(20) DEFAULT NULL,
  `materia_id` bigint(20) DEFAULT NULL,
  `grupo_id` bigint(20) DEFAULT NULL,
  `periodo_id` bigint(20) DEFAULT NULL,
  `horarios` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapas_curriculares`
--

CREATE TABLE `mapas_curriculares` (
  `id` bigint(20) NOT NULL,
  `clave_mapa_curricular` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `total_cuatrimestres` int(11) DEFAULT NULL,
  `total_horas` int(11) DEFAULT NULL,
  `total_creditos` int(11) DEFAULT NULL,
  `total_materias` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `vigencia` int(11) DEFAULT NULL,
  `fecha_revision` datetime(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` bigint(20) NOT NULL,
  `cuatrimestre_id` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_estudios_id` bigint(20) DEFAULT NULL,
  `color` text COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` bigint(20) NOT NULL,
  `estado_id` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nacionalidad` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id` bigint(20) NOT NULL,
  `tipo_periodo_id` bigint(20) DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `fecha_inicio` datetime(3) DEFAULT NULL,
  `fecha_fin` datetime(3) DEFAULT NULL,
  `periodo_activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `tokenable_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `abilities` text COLLATE utf8mb4_bin,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_estudio`
--

CREATE TABLE `planes_estudio` (
  `id` bigint(20) NOT NULL,
  `carrera_id` bigint(20) DEFAULT NULL,
  `mapa_curricular_id` bigint(20) DEFAULT NULL,
  `estatus` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_bin,
  `payload` text COLLATE utf8mb4_bin NOT NULL,
  `last_activity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_anuncio`
--

CREATE TABLE `tipos_anuncio` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_convocatoria`
--

CREATE TABLE `tipos_convocatoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `contenido` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_periodo`
--

CREATE TABLE `tipos_periodo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `colonia_id` bigint(20) DEFAULT NULL,
  `tipo_sangre_id` bigint(20) DEFAULT NULL,
  `estado_civil_id` bigint(20) DEFAULT NULL,
  `generos_id` bigint(20) DEFAULT NULL,
  `nacionalidad_id` bigint(20) DEFAULT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `apellido_materno` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `curp` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `rfc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nss` bigint(20) DEFAULT NULL,
  `telefono_local` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `telefono_celular` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `calle` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `numero_exterior` int(11) DEFAULT NULL,
  `numero_interior` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `cv` json DEFAULT NULL,
  `horarios` json DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_bin,
  `two_factor_recovery_codes` text COLLATE utf8mb4_bin,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `current_team_id` bigint(20) DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_anuncio_id` (`tipo_anuncio_id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Indices de la tabla `asesorias`
--
ALTER TABLE `asesorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aulas_reservacion`
--
ALTER TABLE `aulas_reservacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aula_id` (`aula_id`),
  ADD KEY `solicitante_id` (`solicitante_id`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipio_id` (`municipio_id`);

--
-- Indices de la tabla `convocatorias`
--
ALTER TABLE `convocatorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periodo_id` (`periodo_id`),
  ADD KEY `tipo_convocatoria_id` (`tipo_convocatoria_id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `colonia_id` (`colonia_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pais_id` (`pais_id`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `aula_id` (`aula_id`),
  ADD KEY `tutor_id` (`tutor_id`);

--
-- Indices de la tabla `grupo_materia`
--
ALTER TABLE `grupo_materia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profesor_id` (`profesor_id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `grupo_id` (`grupo_id`),
  ADD KEY `periodo_id` (`periodo_id`);

--
-- Indices de la tabla `mapas_curriculares`
--
ALTER TABLE `mapas_curriculares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_estudios_id` (`plan_estudios_id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD KEY `permission_id` (`permission_id`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_periodo_id` (`tipo_periodo_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planes_estudio`
--
ALTER TABLE `planes_estudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrera_id` (`carrera_id`),
  ADD KEY `mapa_curricular_id` (`mapa_curricular_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_anuncio`
--
ALTER TABLE `tipos_anuncio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_convocatoria`
--
ALTER TABLE `tipos_convocatoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_periodo`
--
ALTER TABLE `tipos_periodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `colonia_id` (`colonia_id`),
  ADD KEY `nacionalidad_id` (`nacionalidad_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asesorias`
--
ALTER TABLE `asesorias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aulas_reservacion`
--
ALTER TABLE `aulas_reservacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colonias`
--
ALTER TABLE `colonias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `convocatorias`
--
ALTER TABLE `convocatorias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo_materia`
--
ALTER TABLE `grupo_materia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mapas_curriculares`
--
ALTER TABLE `mapas_curriculares`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planes_estudio`
--
ALTER TABLE `planes_estudio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_anuncio`
--
ALTER TABLE `tipos_anuncio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_convocatoria`
--
ALTER TABLE `tipos_convocatoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_periodo`
--
ALTER TABLE `tipos_periodo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `anuncios_ibfk_1` FOREIGN KEY (`tipo_anuncio_id`) REFERENCES `tipos_anuncio` (`id`),
  ADD CONSTRAINT `anuncios_ibfk_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Filtros para la tabla `asesorias`
--
ALTER TABLE `asesorias`
  ADD CONSTRAINT `asesorias_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `asesorias_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `aulas_reservacion`
--
ALTER TABLE `aulas_reservacion`
  ADD CONSTRAINT `aulas_reservacion_ibfk_1` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`),
  ADD CONSTRAINT `aulas_reservacion_ibfk_2` FOREIGN KEY (`solicitante_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD CONSTRAINT `colonias_ibfk_1` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`);

--
-- Filtros para la tabla `convocatorias`
--
ALTER TABLE `convocatorias`
  ADD CONSTRAINT `convocatorias_ibfk_1` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`),
  ADD CONSTRAINT `convocatorias_ibfk_2` FOREIGN KEY (`tipo_convocatoria_id`) REFERENCES `tipos_convocatoria` (`id`);

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`colonia_id`) REFERENCES `colonias` (`id`);

--
-- Filtros para la tabla `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `estados_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`);

--
-- Filtros para la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`),
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`),
  ADD CONSTRAINT `grupos_ibfk_3` FOREIGN KEY (`tutor_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `grupo_materia`
--
ALTER TABLE `grupo_materia`
  ADD CONSTRAINT `grupo_materia_ibfk_1` FOREIGN KEY (`profesor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `grupo_materia_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `grupo_materia_ibfk_3` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `grupo_materia_ibfk_4` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`plan_estudios_id`) REFERENCES `planes_estudio` (`id`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`);

--
-- Filtros para la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD CONSTRAINT `periodos_ibfk_1` FOREIGN KEY (`tipo_periodo_id`) REFERENCES `tipos_periodo` (`id`);

--
-- Filtros para la tabla `planes_estudio`
--
ALTER TABLE `planes_estudio`
  ADD CONSTRAINT `planes_estudio_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`),
  ADD CONSTRAINT `planes_estudio_ibfk_2` FOREIGN KEY (`mapa_curricular_id`) REFERENCES `mapas_curriculares` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`colonia_id`) REFERENCES `colonias` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`nacionalidad_id`) REFERENCES `paises` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
