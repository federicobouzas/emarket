-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2015 a las 16:58:07
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS = 0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `emarket`
--
DROP DATABASE IF EXISTS `emarket`;
CREATE DATABASE `emarket`;
USE `emarket`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_buttons`
--

CREATE TABLE IF NOT EXISTS `acc_buttons` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `global` varchar(2) NOT NULL DEFAULT 'No',
  `query` text,
  `display_order` varchar(100) DEFAULT NULL,
  `refresh` varchar(2) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_buttons`
--

INSERT INTO `acc_buttons` (`id`, `fecha_carga`, `fecha_modificacion`, `user_id`, `global`, `query`, `display_order`, `refresh`, `icon`, `url`, `description`, `status`) VALUES
(1, '2015-06-12 17:45:42', '2015-08-11 14:56:51', NULL, 'No', '', '90', 'No', 'consultar_usuarios.png', 'fmw_acceso/users/index', 'Usuarios', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_buttons_rols`
--

CREATE TABLE IF NOT EXISTS `acc_buttons_rols` (
  `button_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_buttons_rols`
--

INSERT INTO `acc_buttons_rols` (`button_id`, `rol_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_permisos`
--

CREATE TABLE IF NOT EXISTS `acc_permisos` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `controller` varchar(100) NOT NULL,
  `action` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_permisos`
--

INSERT INTO `acc_permisos` (`id`, `fecha_carga`, `fecha_modificacion`, `user_id`, `nombre`, `plugin`, `controller`, `action`) VALUES
(1, '2015-06-12 17:45:42', '2015-08-11 02:13:07', 1, 'Homepage', '*', 'pages', 'display'),
(2, '2015-06-12 17:45:42', '2015-06-12 17:45:42', 1, 'Botones Homepage', 'fmw_acceso', 'buttons', 'ajax_buttons'),
(3, '2015-06-12 17:45:42', '2015-08-11 02:13:21', 1, 'Datos Personales', 'fmw_acceso', 'users', 'datos_personales'),
(4, '2015-06-12 17:45:42', '2015-06-12 17:45:42', 1, 'Request a Presentations por AJAX', '*', 'remotes', '*'),
(5, '2015-06-12 17:45:42', '2015-06-12 17:45:42', 1, 'ajaxID (para tablas asociadas muchos a muchos)', '*', '*', 'ajax_id'),
(6, '2015-06-12 17:45:42', '2015-06-12 17:45:42', 1, 'Ajax - Fecha', '*', 'fmw', 'ajax_fecha'),
(7, '2015-06-12 17:45:42', '2015-06-12 17:45:42', 1, 'Ajax - Recibir Notificaciones', 'fmw_messaging', 'notifications', 'ajax_get_notification_by_id'),
(8, '2015-06-12 17:45:42', '2015-06-04 13:59:10', 1, 'Dashboard', 'fmw_dashboard', 'dashboard', 'index,ajax_get_chart,ajax_get_gauge,ajax_get_kpi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_rights`
--

CREATE TABLE IF NOT EXISTS `acc_rights` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_rights`
--

INSERT INTO `acc_rights` (`id`, `fecha_carga`, `fecha_modificacion`, `user_id`, `nombre`) VALUES
(1, '2015-06-12 17:45:42', '2015-06-12 17:45:42', NULL, 'MÓDULO FMW_ACCESO'),
(2, '2015-06-12 17:45:42', '2015-06-12 17:45:42', NULL, 'MÓDULO FMW_MESSAGING'),
(3, '2015-06-12 17:45:42', '2015-06-12 17:45:42', NULL, 'MÓDULO FMW_SYSTEM'),
(4, '2015-06-12 17:45:42', '2015-06-12 17:45:42', 1, 'MÓDULO FMW_DASHBOARD'),
(9, '2015-08-11 11:15:43', '2015-08-11 14:26:44', 1, 'ADMINISTRACIÓN SISTEMA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_rights_rols`
--

CREATE TABLE IF NOT EXISTS `acc_rights_rols` (
  `right_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_rights_rols`
--

INSERT INTO `acc_rights_rols` (`right_id`, `rol_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_right_permisos`
--

CREATE TABLE IF NOT EXISTS `acc_right_permisos` (
`id` int(10) NOT NULL,
  `right_id` int(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `controller` varchar(100) NOT NULL,
  `action` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_right_permisos`
--

INSERT INTO `acc_right_permisos` (`id`, `right_id`, `plugin`, `controller`, `action`) VALUES
(1, 1, 'fmw_acceso', 'users', '*'),
(2, 1, 'fmw_acceso', 'rols', '*'),
(3, 1, 'fmw_acceso', 'rights', '*'),
(4, 1, 'fmw_acceso', 'permisos', '*'),
(5, 2, 'fmw_messaging', 'entrantes', '*'),
(6, 2, 'fmw_messaging', 'mensajes', '*'),
(7, 2, 'fmw_messaging', 'servers', '*'),
(8, 1, 'fmw_acceso', 'buttons', '*'),
(9, 3, 'fmw_system', 'configurations', 'edit'),
(10, 3, 'fmw_system', 'logs', '*'),
(11, 3, 'fmw_system', 'estados', '*'),
(12, 1, 'fmw_acceso', 'centros_costos', '*'),
(13, 1, 'fmw_acceso', 'dependencias', '*'),
(14, 3, 'fmw_system', 'bloqueos', '*'),
(15, 2, 'fmw_messaging', 'notification_messages', '*'),
(16, 4, 'fmw_dashboard', 'charts', '*'),
(17, 4, 'fmw_dashboard', 'dashboard', '*'),
(18, 4, 'fmw_dashboard', 'gauges', '*'),
(19, 4, 'fmw_dashboard', 'kpis', '*'),
(38, 9, '', 'poblaciones', '*'),
(39, 9, '', 'campanias', '*'),
(40, 9, '', 'encuestas', '*'),
(41, 9, '', 'eventos', '*'),
(42, 9, '', 'personas', '*');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_rols`
--

CREATE TABLE IF NOT EXISTS `acc_rols` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_rols`
--

INSERT INTO `acc_rols` (`id`, `fecha_carga`, `fecha_modificacion`, `user_id`, `nombre`) VALUES
(1, '2015-06-12 17:45:42', '2015-08-11 14:15:58', NULL, 'ADMINISTRADOR GENERAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_users`
--

CREATE TABLE IF NOT EXISTS `acc_users` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `foto_perfil` varchar(500) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `tienda_id` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_users`
--

INSERT INTO `acc_users` (`id`, `fecha_carga`, `fecha_modificacion`, `firstname`, `lastname`, `username`, `password`, `email`, `fecha_nacimiento`, `foto_perfil`, `fecha_ingreso`, `tienda_id`, `estado`) VALUES
(1, '2015-06-15 14:21:05', '2015-07-14 13:27:22', 'Administrador', 'Sistema', 'admin', '793b0dd277d6f1c41d452a05db8f3fae298aa975', 'admin@erp-eideos.com.ar', NULL, '[{"file":"e7b5a46bf091014e93752a079a095be1.jpg","name":"avatar2.jpg","type":"image\\/jpeg","size":91493}]', '2015-06-01', 3, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_users_recovers`
--

CREATE TABLE IF NOT EXISTS `acc_users_recovers` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `hash` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_users_rols`
--

CREATE TABLE IF NOT EXISTS `acc_users_rols` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acc_users_rols`
--

INSERT INTO `acc_users_rols` (`id`, `user_id`, `rol_id`) VALUES
(19, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_campanias`
--

CREATE TABLE IF NOT EXISTS `cam_campanias` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activa` varchar(2) NOT NULL DEFAULT 'Si',
  `prioridad` int(1) NOT NULL DEFAULT '3',
  `fecha_envio` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `server_id` int(10) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Sin enviar',
  `encuesta_id` int(10) DEFAULT NULL,
  `evento_id` int(10) DEFAULT NULL,
  `email` varchar(2) NOT NULL DEFAULT 'No',
  `sms` varchar(2) NOT NULL DEFAULT 'No',
  `cuerpo_sms` varchar(200) NOT NULL,
  `asunto_email` text,
  `cuerpo_email` text NOT NULL,
  `personas_sexo` varchar(10) DEFAULT NULL,
  `personas_edad` varchar(5) DEFAULT NULL,
  `personas_tipo_envio` varchar(500) NOT NULL,
  `personas_barrio` varchar(500) DEFAULT NULL,
  `personas_comuna` varchar(500) DEFAULT NULL,
  `personas_poblaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_campanias_personas`
--

CREATE TABLE IF NOT EXISTS `cam_campanias_personas` (
`id` int(10) NOT NULL,
  `campania_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Sin enviar',
  `lectura` datetime DEFAULT NULL,
  `acceso` datetime DEFAULT NULL,
  `respuesta` datetime DEFAULT NULL,
  `error` varchar(5) DEFAULT NULL,
  `error_tipo` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_campanias_poblaciones`
--

CREATE TABLE IF NOT EXISTS `cam_campanias_poblaciones` (
  `campania_id` int(10) NOT NULL,
  `poblacion_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_encuestas`
--

CREATE TABLE IF NOT EXISTS `cam_encuestas` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_encuestas_preguntas`
--

CREATE TABLE IF NOT EXISTS `cam_encuestas_preguntas` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `encuesta_id` int(10) NOT NULL,
  `orden` int(2) DEFAULT NULL,
  `pregunta` varchar(200) NOT NULL,
  `tipo` enum('lista','simple','multiple','texto') NOT NULL,
  `opciones` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_encuestas_respuestas`
--

CREATE TABLE IF NOT EXISTS `cam_encuestas_respuestas` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `campania_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `pregunta_id` int(10) NOT NULL,
  `respuesta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_eventos`
--

CREATE TABLE IF NOT EXISTS `cam_eventos` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(2) NOT NULL DEFAULT 'No',
  `sms` varchar(2) NOT NULL DEFAULT 'No',
  `descripcion` text NOT NULL,
  `fecha_hora_evento` datetime NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `barrio` varchar(200) NOT NULL,
  `ciudad` varchar(200) NOT NULL,
  `provincia` varchar(200) NOT NULL,
  `coordenadas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_eventos_asistencias`
--

CREATE TABLE IF NOT EXISTS `cam_eventos_asistencias` (
  `evento_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `asiste` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_links`
--

CREATE TABLE IF NOT EXISTS `cam_links` (
`id` int(10) NOT NULL,
  `campania_id` int(10) NOT NULL,
  `link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_links_personas`
--

CREATE TABLE IF NOT EXISTS `cam_links_personas` (
`id` int(10) NOT NULL,
  `link_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `fecha_acceso` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `das_charts`
--

CREATE TABLE IF NOT EXISTS `das_charts` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Activo',
  `type` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `y_axis_field` varchar(100) NOT NULL,
  `y_axis_field_function` varchar(100) NOT NULL,
  `y_axis_group_type` varchar(100) NOT NULL,
  `x_axis_field` varchar(100) NOT NULL,
  `x_axis_field_function` varchar(100) NOT NULL,
  `series_field` varchar(100) NOT NULL,
  `series_field_function` varchar(100) NOT NULL,
  `order_field` varchar(100) DEFAULT NULL,
  `order_type` varchar(4) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `das_gauges`
--

CREATE TABLE IF NOT EXISTS `das_gauges` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(200) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Activo',
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `group_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `das_kpis`
--

CREATE TABLE IF NOT EXISTS `das_kpis` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `model` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `field_group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_entrantes`
--

CREATE TABLE IF NOT EXISTS `msg_entrantes` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_mensaje` varchar(100) NOT NULL,
  `server_id` int(10) NOT NULL,
  `remitente` varchar(100) NOT NULL,
  `asunto` varchar(500) NOT NULL,
  `cuerpo` text NOT NULL,
  `error` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_mensajes`
--

CREATE TABLE IF NOT EXISTS `msg_mensajes` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `prioridad` int(1) NOT NULL DEFAULT '3',
  `server_id` int(10) NOT NULL,
  `html` varchar(2) NOT NULL DEFAULT 'Si',
  `destino` varchar(100) NOT NULL,
  `asunto` varchar(500) NOT NULL,
  `cuerpo` text NOT NULL,
  `layout` varchar(100) DEFAULT NULL,
  `vista` varchar(100) DEFAULT NULL,
  `variables` mediumtext,
  `headers` varchar(1000) NOT NULL DEFAULT '[]',
  `adjuntos` varchar(200) NOT NULL DEFAULT '[]',
  `estado` varchar(20) NOT NULL DEFAULT 'Sin enviar',
  `intentos` int(1) NOT NULL DEFAULT '0',
  `error` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_notifications`
--

CREATE TABLE IF NOT EXISTS `msg_notifications` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `read` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_notifications_messages`
--

CREATE TABLE IF NOT EXISTS `msg_notifications_messages` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `model` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_notifications_users`
--

CREATE TABLE IF NOT EXISTS `msg_notifications_users` (
`id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_servers`
--

CREATE TABLE IF NOT EXISTS `msg_servers` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` varchar(8) NOT NULL DEFAULT 'Activo',
  `tipo` varchar(10) NOT NULL,
  `tls` varchar(2) NOT NULL,
  `host` varchar(100) NOT NULL,
  `puerto` int(5) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `cuenta` varchar(100) NOT NULL,
  `remitente` varchar(500) NOT NULL,
  `responder` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_personas`
--

CREATE TABLE IF NOT EXISTS `per_personas` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activa` int(1) NOT NULL DEFAULT '0',
  `errores` int(10) NOT NULL DEFAULT '0',
  `user_id` int(10) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `telefono_particular` int(20) DEFAULT NULL,
  `telefono_celular` int(20) DEFAULT NULL,
  `calle` varchar(200) DEFAULT NULL,
  `altura` int(5) DEFAULT NULL,
  `piso` varchar(10) DEFAULT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `comuna` int(2) DEFAULT NULL,
  `coordenadas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_personas_poblaciones`
--

CREATE TABLE IF NOT EXISTS `per_personas_poblaciones` (
  `persona_id` int(11) NOT NULL,
  `poblacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_poblaciones`
--

CREATE TABLE IF NOT EXISTS `per_poblaciones` (
`id` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activa` varchar(20) NOT NULL DEFAULT 'Si',
  `user_id` int(10) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_poblaciones_rols`
--

CREATE TABLE IF NOT EXISTS `per_poblaciones_rols` (
  `poblacion_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_bans`
--

CREATE TABLE IF NOT EXISTS `sys_bans` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `ip` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_bloqueos`
--

CREATE TABLE IF NOT EXISTS `sys_bloqueos` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `model` varchar(50) NOT NULL,
  `model_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_compilations`
--

CREATE TABLE IF NOT EXISTS `sys_compilations` (
`id` int(10) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `md5` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_configurations`
--

CREATE TABLE IF NOT EXISTS `sys_configurations` (
`id` int(10) NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `empresa` varchar(250) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `footer` varchar(200) NOT NULL,
  `server_emails` int(2) NOT NULL,
  `server_sms` int(2) DEFAULT NULL,
  `max_emails` int(5) NOT NULL DEFAULT '1',
  `max_emails_dominio` int(5) NOT NULL DEFAULT '1',
  `version` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_configurations`
--

INSERT INTO `sys_configurations` (`id`, `fecha_modificacion`, `empresa`, `telefono`, `fax`, `email`, `web`, `footer`, `server_emails`, `server_sms`, `max_emails`, `max_emails_dominio`, `version`) VALUES
(1, '2015-08-11 14:17:25', 'Plataforma Email Marketing', '', '', 'noreply@eideos.com.ar', 'emarket', 'Plataforma Email Marketing', 0, NULL, 1, 1, '1.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_crons`
--

CREATE TABLE IF NOT EXISTS `sys_crons` (
`id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `clase_shell` varchar(100) NOT NULL,
  `fecha_ultima_ejecucion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_estados`
--

CREATE TABLE IF NOT EXISTS `sys_estados` (
`id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `valor` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_estados`
--

INSERT INTO `sys_estados` (`id`, `nombre`, `valor`) VALUES
(1, 'enviando_emails', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_files`
--

CREATE TABLE IF NOT EXISTS `sys_files` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `model` varchar(100) NOT NULL,
  `model_id` int(10) NOT NULL,
  `file` varchar(100) NOT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(100) NOT NULL,
  `size` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_logins`
--

CREATE TABLE IF NOT EXISTS `sys_logins` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_logs`
--

CREATE TABLE IF NOT EXISTS `sys_logs` (
`id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `model_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sys_logs`
--

INSERT INTO `sys_logs` (`id`, `fecha_carga`, `user_id`, `model`, `action`, `model_id`) VALUES
(1, '2015-08-11 11:56:51', 1, 'Button', 'edit', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acc_buttons`
--
ALTER TABLE `acc_buttons`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `acc_buttons_rols`
--
ALTER TABLE `acc_buttons_rols`
 ADD PRIMARY KEY (`button_id`,`rol_id`), ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `acc_permisos`
--
ALTER TABLE `acc_permisos`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `acc_rights`
--
ALTER TABLE `acc_rights`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `acc_rights_rols`
--
ALTER TABLE `acc_rights_rols`
 ADD PRIMARY KEY (`right_id`,`rol_id`), ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `acc_right_permisos`
--
ALTER TABLE `acc_right_permisos`
 ADD PRIMARY KEY (`id`), ADD KEY `right_id` (`right_id`);

--
-- Indices de la tabla `acc_rols`
--
ALTER TABLE `acc_rols`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `acc_users`
--
ALTER TABLE `acc_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `acc_users_recovers`
--
ALTER TABLE `acc_users_recovers`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `acc_users_rols`
--
ALTER TABLE `acc_users_rols`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`,`rol_id`), ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `cam_campanias`
--
ALTER TABLE `cam_campanias`
 ADD PRIMARY KEY (`id`), ADD KEY `encuesta_id` (`encuesta_id`), ADD KEY `user_id` (`user_id`), ADD KEY `evento_id` (`evento_id`), ADD KEY `server_id` (`server_id`);

--
-- Indices de la tabla `cam_campanias_personas`
--
ALTER TABLE `cam_campanias_personas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `campania_id` (`campania_id`,`persona_id`), ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `cam_campanias_poblaciones`
--
ALTER TABLE `cam_campanias_poblaciones`
 ADD PRIMARY KEY (`campania_id`,`poblacion_id`), ADD KEY `poblacion_id` (`poblacion_id`);

--
-- Indices de la tabla `cam_encuestas`
--
ALTER TABLE `cam_encuestas`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cam_encuestas_preguntas`
--
ALTER TABLE `cam_encuestas_preguntas`
 ADD PRIMARY KEY (`id`), ADD KEY `encuesta_id` (`encuesta_id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cam_encuestas_respuestas`
--
ALTER TABLE `cam_encuestas_respuestas`
 ADD PRIMARY KEY (`id`), ADD KEY `pregunta_id` (`pregunta_id`), ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `cam_eventos`
--
ALTER TABLE `cam_eventos`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cam_eventos_asistencias`
--
ALTER TABLE `cam_eventos_asistencias`
 ADD PRIMARY KEY (`evento_id`,`persona_id`), ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `cam_links`
--
ALTER TABLE `cam_links`
 ADD PRIMARY KEY (`id`), ADD KEY `campania_id` (`campania_id`);

--
-- Indices de la tabla `cam_links_personas`
--
ALTER TABLE `cam_links_personas`
 ADD PRIMARY KEY (`id`), ADD KEY `link_id` (`link_id`), ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `das_charts`
--
ALTER TABLE `das_charts`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `das_gauges`
--
ALTER TABLE `das_gauges`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `das_kpis`
--
ALTER TABLE `das_kpis`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `msg_entrantes`
--
ALTER TABLE `msg_entrantes`
 ADD PRIMARY KEY (`id`), ADD KEY `server_id` (`server_id`);

--
-- Indices de la tabla `msg_mensajes`
--
ALTER TABLE `msg_mensajes`
 ADD PRIMARY KEY (`id`), ADD KEY `server_id` (`server_id`);

--
-- Indices de la tabla `msg_notifications`
--
ALTER TABLE `msg_notifications`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `msg_notifications_messages`
--
ALTER TABLE `msg_notifications_messages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `model` (`model`,`action`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `msg_notifications_users`
--
ALTER TABLE `msg_notifications_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `notificacion_id` (`notification_id`,`user_id`), ADD KEY `user_id` (`user_id`), ADD KEY `read` (`read`);

--
-- Indices de la tabla `msg_servers`
--
ALTER TABLE `msg_servers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `host` (`host`,`cuenta`);

--
-- Indices de la tabla `per_personas`
--
ALTER TABLE `per_personas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `telefono_celular` (`telefono_celular`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `per_personas_poblaciones`
--
ALTER TABLE `per_personas_poblaciones`
 ADD PRIMARY KEY (`persona_id`,`poblacion_id`), ADD KEY `poblacion_id` (`poblacion_id`);

--
-- Indices de la tabla `per_poblaciones`
--
ALTER TABLE `per_poblaciones`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `pob_nombre` (`nombre`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `per_poblaciones_rols`
--
ALTER TABLE `per_poblaciones_rols`
 ADD PRIMARY KEY (`poblacion_id`,`rol_id`), ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `sys_bans`
--
ALTER TABLE `sys_bans`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ip` (`ip`);

--
-- Indices de la tabla `sys_bloqueos`
--
ALTER TABLE `sys_bloqueos`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `sys_compilations`
--
ALTER TABLE `sys_compilations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `filename` (`filename`);

--
-- Indices de la tabla `sys_configurations`
--
ALTER TABLE `sys_configurations`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_crons`
--
ALTER TABLE `sys_crons`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `clase_shell` (`clase_shell`);

--
-- Indices de la tabla `sys_estados`
--
ALTER TABLE `sys_estados`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `sys_files`
--
ALTER TABLE `sys_files`
 ADD PRIMARY KEY (`id`), ADD KEY `model` (`model`,`model_id`);

--
-- Indices de la tabla `sys_logins`
--
ALTER TABLE `sys_logins`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sys_logs`
--
ALTER TABLE `sys_logs`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acc_buttons`
--
ALTER TABLE `acc_buttons`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `acc_permisos`
--
ALTER TABLE `acc_permisos`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `acc_rights`
--
ALTER TABLE `acc_rights`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `acc_right_permisos`
--
ALTER TABLE `acc_right_permisos`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `acc_rols`
--
ALTER TABLE `acc_rols`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `acc_users`
--
ALTER TABLE `acc_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `acc_users_recovers`
--
ALTER TABLE `acc_users_recovers`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `acc_users_rols`
--
ALTER TABLE `acc_users_rols`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `cam_campanias`
--
ALTER TABLE `cam_campanias`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cam_campanias_personas`
--
ALTER TABLE `cam_campanias_personas`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cam_encuestas`
--
ALTER TABLE `cam_encuestas`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cam_encuestas_preguntas`
--
ALTER TABLE `cam_encuestas_preguntas`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cam_encuestas_respuestas`
--
ALTER TABLE `cam_encuestas_respuestas`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cam_eventos`
--
ALTER TABLE `cam_eventos`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cam_links`
--
ALTER TABLE `cam_links`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cam_links_personas`
--
ALTER TABLE `cam_links_personas`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `das_charts`
--
ALTER TABLE `das_charts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `das_gauges`
--
ALTER TABLE `das_gauges`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `das_kpis`
--
ALTER TABLE `das_kpis`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `msg_entrantes`
--
ALTER TABLE `msg_entrantes`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `msg_mensajes`
--
ALTER TABLE `msg_mensajes`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `msg_notifications`
--
ALTER TABLE `msg_notifications`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `msg_notifications_messages`
--
ALTER TABLE `msg_notifications_messages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `msg_notifications_users`
--
ALTER TABLE `msg_notifications_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `msg_servers`
--
ALTER TABLE `msg_servers`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `per_personas`
--
ALTER TABLE `per_personas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `per_poblaciones`
--
ALTER TABLE `per_poblaciones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sys_bans`
--
ALTER TABLE `sys_bans`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sys_bloqueos`
--
ALTER TABLE `sys_bloqueos`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sys_compilations`
--
ALTER TABLE `sys_compilations`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sys_configurations`
--
ALTER TABLE `sys_configurations`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sys_crons`
--
ALTER TABLE `sys_crons`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sys_estados`
--
ALTER TABLE `sys_estados`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sys_files`
--
ALTER TABLE `sys_files`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sys_logins`
--
ALTER TABLE `sys_logins`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sys_logs`
--
ALTER TABLE `sys_logs`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acc_buttons`
--
ALTER TABLE `acc_buttons`
ADD CONSTRAINT `acc_buttons_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `acc_buttons_rols`
--
ALTER TABLE `acc_buttons_rols`
ADD CONSTRAINT `acc_buttons_rols_ibfk_1` FOREIGN KEY (`button_id`) REFERENCES `acc_buttons` (`id`),
ADD CONSTRAINT `acc_buttons_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `acc_rols` (`id`);

--
-- Filtros para la tabla `acc_permisos`
--
ALTER TABLE `acc_permisos`
ADD CONSTRAINT `acc_permisos_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `acc_rights`
--
ALTER TABLE `acc_rights`
ADD CONSTRAINT `acc_rights_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `acc_rights_rols`
--
ALTER TABLE `acc_rights_rols`
ADD CONSTRAINT `acc_rights_rols_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `acc_rights` (`id`),
ADD CONSTRAINT `acc_rights_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `acc_rols` (`id`);

--
-- Filtros para la tabla `acc_right_permisos`
--
ALTER TABLE `acc_right_permisos`
ADD CONSTRAINT `acc_right_permisos_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `acc_rights` (`id`);

--
-- Filtros para la tabla `acc_rols`
--
ALTER TABLE `acc_rols`
ADD CONSTRAINT `acc_rols_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `acc_users_recovers`
--
ALTER TABLE `acc_users_recovers`
ADD CONSTRAINT `acc_users_recovers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `acc_users_rols`
--
ALTER TABLE `acc_users_rols`
ADD CONSTRAINT `acc_users_rols_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`),
ADD CONSTRAINT `acc_users_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `acc_rols` (`id`);

--
-- Filtros para la tabla `cam_campanias`
--
ALTER TABLE `cam_campanias`
ADD CONSTRAINT `cam_campanias_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`),
ADD CONSTRAINT `cam_campanias_ibfk_2` FOREIGN KEY (`encuesta_id`) REFERENCES `cam_encuestas` (`id`),
ADD CONSTRAINT `cam_campanias_ibfk_3` FOREIGN KEY (`evento_id`) REFERENCES `cam_eventos` (`id`);

--
-- Filtros para la tabla `cam_campanias_personas`
--
ALTER TABLE `cam_campanias_personas`
ADD CONSTRAINT `cam_campanias_personas_ibfk_1` FOREIGN KEY (`campania_id`) REFERENCES `cam_campanias` (`id`),
ADD CONSTRAINT `cam_campanias_personas_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`);

--
-- Filtros para la tabla `cam_campanias_poblaciones`
--
ALTER TABLE `cam_campanias_poblaciones`
ADD CONSTRAINT `cam_campanias_poblaciones_ibfk_1` FOREIGN KEY (`campania_id`) REFERENCES `cam_campanias` (`id`),
ADD CONSTRAINT `cam_campanias_poblaciones_ibfk_2` FOREIGN KEY (`poblacion_id`) REFERENCES `per_poblaciones` (`id`);

--
-- Filtros para la tabla `cam_encuestas`
--
ALTER TABLE `cam_encuestas`
ADD CONSTRAINT `cam_encuestas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`);

--
-- Filtros para la tabla `cam_encuestas_preguntas`
--
ALTER TABLE `cam_encuestas_preguntas`
ADD CONSTRAINT `cam_encuestas_preguntas_ibfk_1` FOREIGN KEY (`encuesta_id`) REFERENCES `cam_encuestas` (`id`);

--
-- Filtros para la tabla `cam_encuestas_respuestas`
--
ALTER TABLE `cam_encuestas_respuestas`
ADD CONSTRAINT `cam_encuestas_respuestas_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`),
ADD CONSTRAINT `cam_encuestas_respuestas_ibfk_3` FOREIGN KEY (`pregunta_id`) REFERENCES `cam_encuestas_preguntas` (`id`);

--
-- Filtros para la tabla `cam_eventos`
--
ALTER TABLE `cam_eventos`
ADD CONSTRAINT `cam_eventos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`);

--
-- Filtros para la tabla `cam_eventos_asistencias`
--
ALTER TABLE `cam_eventos_asistencias`
ADD CONSTRAINT `cam_eventos_asistencias_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `cam_eventos` (`id`),
ADD CONSTRAINT `cam_eventos_asistencias_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`);

--
-- Filtros para la tabla `cam_links`
--
ALTER TABLE `cam_links`
ADD CONSTRAINT `cam_links_ibfk_1` FOREIGN KEY (`campania_id`) REFERENCES `cam_campanias` (`id`);

--
-- Filtros para la tabla `cam_links_personas`
--
ALTER TABLE `cam_links_personas`
ADD CONSTRAINT `cam_links_personas_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `cam_links` (`id`);

--
-- Filtros para la tabla `msg_entrantes`
--
ALTER TABLE `msg_entrantes`
ADD CONSTRAINT `msg_entrantes_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `msg_servers` (`id`);

--
-- Filtros para la tabla `msg_notifications`
--
ALTER TABLE `msg_notifications`
ADD CONSTRAINT `msg_notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `msg_notifications_messages`
--
ALTER TABLE `msg_notifications_messages`
ADD CONSTRAINT `msg_notifications_messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `msg_notifications_users`
--
ALTER TABLE `msg_notifications_users`
ADD CONSTRAINT `msg_notifications_users_ibfk_3` FOREIGN KEY (`notification_id`) REFERENCES `msg_notifications` (`id`),
ADD CONSTRAINT `msg_notifications_users_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `per_personas`
--
ALTER TABLE `per_personas`
ADD CONSTRAINT `per_personas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`);

--
-- Filtros para la tabla `per_personas_poblaciones`
--
ALTER TABLE `per_personas_poblaciones`
ADD CONSTRAINT `per_personas_poblaciones_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`),
ADD CONSTRAINT `per_personas_poblaciones_ibfk_2` FOREIGN KEY (`poblacion_id`) REFERENCES `per_poblaciones` (`id`);

--
-- Filtros para la tabla `per_poblaciones_rols`
--
ALTER TABLE `per_poblaciones_rols`
ADD CONSTRAINT `per_poblaciones_rols_ibfk_1` FOREIGN KEY (`poblacion_id`) REFERENCES `per_poblaciones` (`id`),
ADD CONSTRAINT `per_poblaciones_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `adm_rols` (`id`);

--
-- Filtros para la tabla `sys_bloqueos`
--
ALTER TABLE `sys_bloqueos`
ADD CONSTRAINT `sys_bloqueos_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

--
-- Filtros para la tabla `sys_logs`
--
ALTER TABLE `sys_logs`
ADD CONSTRAINT `sys_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET FOREIGN_KEY_CHECKS = 1;
