-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2013 a las 21:59:30
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `email_limpia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adm_buttons`
--

CREATE TABLE IF NOT EXISTS `adm_buttons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `query` text,
  `display_order` varchar(100) DEFAULT NULL,
  `refresh` varchar(2) NOT NULL,
  `counter_box` varchar(100) DEFAULT NULL,
  `icon` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `adm_buttons`
--

INSERT INTO `adm_buttons` (`id`, `fecha_carga`, `fecha_modificacion`, `query`, `display_order`, `refresh`, `counter_box`, `icon`, `url`, `description`, `status`) VALUES
(1, '2012-07-19 15:48:07', '2012-07-19 19:21:15', '', 'persona1', 'No', '', 'home-boton-agregar-usuarios.png', 'personas/add', 'Cargar Personas', 'Activo'),
(2, '2012-07-19 15:49:36', '2012-07-19 19:21:32', 'SELECT COUNT(*) as cant FROM per_personas', 'persona2', 'No', 'consultar_personas', 'home-boton-ver-usuarios.png', 'personas/index', 'Consultar Personas', 'Activo'),
(3, '2013-03-06 19:52:17', NULL, NULL, 'persona3', 'No', NULL, 'home-boton-importar-excel.png', 'personas/import', 'Importar Personas', 'Activo'),
(4, '2013-03-06 19:54:02', NULL, NULL, 'campania1', 'No', NULL, 'home-boton-agregar-campanias.png', 'campanias/add', 'Cargar Campaña', 'Activo'),
(5, '2013-03-06 19:54:39', NULL, 'SELECT COUNT(*) AS cant FROM cam_campanias WHERE activa=''Si'' AND estado = ''Sin enviar''', 'campania2', 'Si', 'consultar_campanias', 'home-boton-ver-campanias.png', 'campanias/index', 'Consultar Campañas', 'Activo'),
(6, '2013-06-03 10:05:07', NULL, NULL, 'campania3', 'No', NULL, 'home-boton-reporte.png', 'campanias/report', 'Reportes de Campañas', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adm_buttons_rols`
--

CREATE TABLE IF NOT EXISTS `adm_buttons_rols` (
  `button_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL,
  PRIMARY KEY (`button_id`,`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `adm_buttons_rols`
--

INSERT INTO `adm_buttons_rols` (`button_id`, `rol_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adm_permisos`
--

CREATE TABLE IF NOT EXISTS `adm_permisos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `controller` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `global` varchar(2) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Volcado de datos para la tabla `adm_permisos`
--

INSERT INTO `adm_permisos` (`id`, `nombre`, `controller`, `action`, `global`) VALUES
(1, 'Usuarios COMPLETO', 'users', '*', 'No'),
(5, 'Roles COMPLETO', 'rols', '*', 'No'),
(9, 'Permisos COMPLETO', 'permisos', '*', 'No'),
(13, 'Editar Configuración', 'configurations', 'edit', 'No'),
(21, 'Botones COMPLETO', 'buttons', '*', 'No'),
(25, 'Servidores COMPLETO', 'servers', '*', 'No'),
(26, 'Mensajes COMPLETO', 'mensajes', '*', 'No'),
(27, 'Homepage', 'pages', 'display', 'Si'),
(28, 'Botones Homepage', 'buttons', 'ajax_buttons', 'Si'),
(29, 'Datos Personales', 'users', 'datosPersonales', 'Si'),
(30, 'Request a Presentations por AJAX', 'remotes', 'request', 'Si'),
(31, 'ajaxID (para tablas asociadas muchos a muchos)', '*', 'ajaxid', 'Si'),
(32, 'Poblaciones COMPLETO', 'poblacions', '*', 'No'),
(33, 'Personas COMPLETO', 'personas', '*', 'No'),
(34, 'Encuestas COMPLETO', 'encuestas', '*', 'No'),
(35, 'Preguntas COMPLETO', 'preguntas', '*', 'No'),
(36, 'Respuestas COMPLETO', 'respuestas', '*', 'No'),
(37, 'Eventos COMPLETO', 'eventos', '*', 'No'),
(39, 'Campañas COMPLETO', 'campanias', '*', 'No'),
(40, 'Roles Aplicación COMPLETO', 'approls', '*', 'No'),
(41, 'Logs COMPLETO', 'logs', '*', 'No'),
(42, 'Entrantes COMPLETO', 'entrantes', '*', 'No'),
(43, 'Estados COMPLETO', 'estados', '*', 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adm_permisos_rols`
--

CREATE TABLE IF NOT EXISTS `adm_permisos_rols` (
  `permiso_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL,
  PRIMARY KEY (`permiso_id`,`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `adm_permisos_rols`
--

INSERT INTO `adm_permisos_rols` (`permiso_id`, `rol_id`) VALUES
(1, 1),
(5, 1),
(9, 1),
(13, 1),
(21, 1),
(25, 1),
(26, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adm_rols`
--

CREATE TABLE IF NOT EXISTS `adm_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `adm_rols`
--

INSERT INTO `adm_rols` (`id`, `fecha_carga`, `fecha_modificacion`, `nombre`) VALUES
(1, '1900-01-01 19:00:00', '2012-08-27 13:30:16', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adm_users`
--

CREATE TABLE IF NOT EXISTS `adm_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rol_id` int(10) NOT NULL,
  `email` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UsersRol` (`rol_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `adm_users`
--

INSERT INTO `adm_users` (`id`, `fecha_carga`, `fecha_modificacion`, `name`, `username`, `password`, `rol_id`, `email`) VALUES
(4, '2012-09-04 15:59:07', NULL, 'Administrador', 'administrador', '793b0dd277d6f1c41d452a05db8f3fae298aa975', 1, 'admin@eideos.com.ar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adm_users_recovers`
--

CREATE TABLE IF NOT EXISTS `adm_users_recovers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_campanias`
--

CREATE TABLE IF NOT EXISTS `cam_campanias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  `personas_barrio` varchar(50) DEFAULT NULL,
  `personas_comuna` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `encuesta_id` (`encuesta_id`),
  KEY `user_id` (`user_id`),
  KEY `evento_id` (`evento_id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_campanias_personas`
--

CREATE TABLE IF NOT EXISTS `cam_campanias_personas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `campania_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Sin enviar',
  `lectura` datetime DEFAULT NULL,
  `acceso` datetime DEFAULT NULL,
  `respuesta` datetime DEFAULT NULL,
  `error` varchar(5) DEFAULT NULL,
  `error_tipo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campania_id` (`campania_id`,`persona_id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_campanias_poblaciones`
--

CREATE TABLE IF NOT EXISTS `cam_campanias_poblaciones` (
  `campania_id` int(10) NOT NULL,
  `poblacion_id` int(10) NOT NULL,
  PRIMARY KEY (`campania_id`,`poblacion_id`),
  KEY `poblacion_id` (`poblacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_encuestas`
--

CREATE TABLE IF NOT EXISTS `cam_encuestas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_encuestas_preguntas`
--

CREATE TABLE IF NOT EXISTS `cam_encuestas_preguntas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `encuesta_id` int(10) NOT NULL,
  `orden` int(2) NOT NULL,
  `pregunta` varchar(200) NOT NULL,
  `tipo` enum('lista','simple','multiple','texto') NOT NULL,
  `opciones` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `encuesta_id` (`encuesta_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_encuestas_respuestas`
--

CREATE TABLE IF NOT EXISTS `cam_encuestas_respuestas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `campania_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `pregunta_id` int(10) NOT NULL,
  `respuesta` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pregunta_id` (`pregunta_id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_eventos`
--

CREATE TABLE IF NOT EXISTS `cam_eventos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  `coordenadas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_eventos_asistencias`
--

CREATE TABLE IF NOT EXISTS `cam_eventos_asistencias` (
  `evento_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `asiste` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`evento_id`,`persona_id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_links`
--

CREATE TABLE IF NOT EXISTS `cam_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `campania_id` int(10) NOT NULL,
  `link` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campania_id` (`campania_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cam_links_personas`
--

CREATE TABLE IF NOT EXISTS `cam_links_personas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `link_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `fecha_acceso` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_id` (`link_id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_entrantes`
--

CREATE TABLE IF NOT EXISTS `msg_entrantes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_mensaje` varchar(100) NOT NULL,
  `server_id` int(10) NOT NULL,
  `remitente` varchar(100) NOT NULL,
  `asunto` varchar(500) NOT NULL,
  `cuerpo` text NOT NULL,
  `error` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_mensajes`
--

CREATE TABLE IF NOT EXISTS `msg_mensajes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `prioridad` int(1) NOT NULL DEFAULT '3',
  `server_id` int(10) NOT NULL,
  `html` varchar(2) NOT NULL DEFAULT 'Si',
  `destino` varchar(100) NOT NULL,
  `asunto` varchar(500) NOT NULL,
  `cuerpo` text NOT NULL,
  `headers` varchar(1000) NOT NULL DEFAULT '[]',
  `adjuntos` varchar(200) NOT NULL DEFAULT '[]',
  `estado` varchar(20) NOT NULL DEFAULT 'Sin enviar',
  `intentos` int(1) NOT NULL DEFAULT '0',
  `error` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_servers`
--

CREATE TABLE IF NOT EXISTS `msg_servers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado` varchar(8) NOT NULL DEFAULT 'Activo',
  `tipo` varchar(10) NOT NULL,
  `tls` varchar(2) NOT NULL,
  `ssl` varchar(2) NOT NULL,
  `adicionales` varchar(100) DEFAULT NULL,
  `host` varchar(100) NOT NULL,
  `puerto` int(5) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `cuenta` varchar(100) NOT NULL,
  `remitente` varchar(500) NOT NULL,
  `responder` varchar(100) DEFAULT NULL,
  `return_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`,`cuenta`,`tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `msg_servers`
--

INSERT INTO `msg_servers` (`id`, `fecha_carga`, `fecha_modificacion`, `estado`, `tipo`, `tls`, `ssl`, `adicionales`, `host`, `puerto`, `usuario`, `clave`, `cuenta`, `remitente`, `responder`, `return_path`) VALUES
(1, '2013-05-20 17:14:41', NULL, 'Activo', 'SMTP', 'No', '', NULL, 'mail.buenosaires.gob.ar', 25, 'atciudadana@buenosaires.gob.ar', 've4a2u2e', 'atciudadana@buenosaires.gob.ar', 'Atención Ciudadana', NULL, 'federicobouzas@gmail.com'),
(2, '2013-05-21 16:40:34', NULL, 'Activo', 'POP', 'No', '', NULL, 'mail.buenosaires.gob.ar', 993, 'atciudadana@buenosaires.gob.ar', 've4a2u2e', 'atciudadana@buenosaires.gob.ar', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msg_templates`
--

CREATE TABLE IF NOT EXISTS `msg_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `cuerpo_html` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_personas`
--

CREATE TABLE IF NOT EXISTS `per_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activa` varchar(2) NOT NULL DEFAULT 'Si',
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
  `coordenadas` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefono_celular` (`telefono_celular`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_personas_poblaciones`
--

CREATE TABLE IF NOT EXISTS `per_personas_poblaciones` (
  `persona_id` int(11) NOT NULL,
  `poblacion_id` int(11) NOT NULL,
  PRIMARY KEY (`persona_id`,`poblacion_id`),
  KEY `poblacion_id` (`poblacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_poblaciones`
--

CREATE TABLE IF NOT EXISTS `per_poblaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activa` varchar(20) NOT NULL DEFAULT 'Si',
  `user_id` int(10) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pob_nombre` (`nombre`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `per_poblaciones_rols`
--

CREATE TABLE IF NOT EXISTS `per_poblaciones_rols` (
  `poblacion_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL,
  PRIMARY KEY (`poblacion_id`,`rol_id`),
  KEY `rol_id` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_bans`
--

CREATE TABLE IF NOT EXISTS `sys_bans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_bloqueos`
--

CREATE TABLE IF NOT EXISTS `sys_bloqueos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `model` varchar(50) NOT NULL,
  `model_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_configurations`
--

CREATE TABLE IF NOT EXISTS `sys_configurations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `empresa` varchar(250) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `footer` varchar(200) NOT NULL,
  `server_emails` int(2) NOT NULL,
  `server_sms` int(2) NOT NULL,
  `max_emails` int(5) NOT NULL DEFAULT '1',
  `max_emails_dominio` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sys_configurations`
--

INSERT INTO `sys_configurations` (`id`, `fecha_modificacion`, `empresa`, `telefono`, `fax`, `email`, `web`, `footer`, `server_emails`, `server_sms`, `max_emails`, `max_emails_dominio`) VALUES
(1, '2013-06-05 19:16:36', 'GCBA', '', '', 'noreply@buenosaires.gob.ar', 'email', 'Sistema de Email Marketing', 1, 0, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_estados`
--

CREATE TABLE IF NOT EXISTS `sys_estados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `valor` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `sys_estados`
--

INSERT INTO `sys_estados` (`id`, `nombre`, `valor`) VALUES
(1, 'enviando_emails', '0'),
(2, 'parsing_bounces', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_files`
--

CREATE TABLE IF NOT EXISTS `sys_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `model` varchar(50) NOT NULL,
  `model_id` int(10) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(100) NOT NULL,
  `size` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_logins`
--

CREATE TABLE IF NOT EXISTS `sys_logins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_logs`
--

CREATE TABLE IF NOT EXISTS `sys_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `model` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `model_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_timestamps`
--

CREATE TABLE IF NOT EXISTS `sys_timestamps` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `timestamp` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adm_users`
--
ALTER TABLE `adm_users`
  ADD CONSTRAINT `UsersRol` FOREIGN KEY (`rol_id`) REFERENCES `adm_rols` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `adm_users_recovers`
--
ALTER TABLE `adm_users_recovers`
  ADD CONSTRAINT `adm_users_recovers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`);

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
-- Filtros para la tabla `msg_mensajes`
--
ALTER TABLE `msg_mensajes`
  ADD CONSTRAINT `msg_mensajes_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `msg_servers` (`id`);

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
-- Filtros para la tabla `sys_logs`
--
ALTER TABLE `sys_logs`
  ADD CONSTRAINT `sys_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
