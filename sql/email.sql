-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2013 a las 22:02:01
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `email`
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
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
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

INSERT INTO `adm_users` (`id`, `fecha_carga`, `fecha_modificacion`, `firstname`, `lastname`, `username`, `password`, `rol_id`, `email`) VALUES
(4, '2012-09-04 15:59:07', NULL, 'Administrador', '0', 'administrador', '793b0dd277d6f1c41d452a05db8f3fae298aa975', 1, 'admin@eideos.com.ar');

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
  `personas_tipo_envio` varchar(500) NOT NULL,
  `personas_barrio` varchar(500) DEFAULT NULL,
  `personas_comuna` varchar(500) DEFAULT NULL,
  `personas_poblaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `encuesta_id` (`encuesta_id`),
  KEY `user_id` (`user_id`),
  KEY `evento_id` (`evento_id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cam_campanias`
--

INSERT INTO `cam_campanias` (`id`, `fecha_carga`, `fecha_modificacion`, `activa`, `prioridad`, `fecha_envio`, `user_id`, `server_id`, `tipo`, `nombre`, `estado`, `encuesta_id`, `evento_id`, `email`, `sms`, `cuerpo_sms`, `asunto_email`, `cuerpo_email`, `personas_sexo`, `personas_edad`, `personas_tipo_envio`, `personas_barrio`, `personas_comuna`, `personas_poblaciones`) VALUES
(1, '2013-07-04 15:09:18', '2013-07-04 18:33:56', 'Si', 3, '2013-07-04 15:33:56', 4, 1, 'Newsletter', 'Campaña de Prueba', 'Enviada', NULL, NULL, 'Si', 'No', '', 'Campaña de Prueba', '&lt;meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" /&gt;&lt;title&gt;comuna4&lt;/title&gt;\r\n&lt;style type="text/css"&gt;&amp;lt;!--\r\n.style1 {font-size: 18px}\r\n--&amp;gt;\r\n&lt;/style&gt;\r\n\r\n\r\n&lt;table align="center" border="0" cellpadding="0" cellspacing="0" width="620"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img height="15" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_top.jpg" width="621" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;table align="center" border="0" cellpadding="0" cellspacing="0" width="620"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_iz01b.jpg" width="10"&gt;&lt;/td&gt;&lt;td&gt;&lt;table border="0" cellpadding="0" cellspacing="0" width="600"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;a href="http://www.buenosaires.gob.ar/" target="_blank"&gt;&lt;img alt="" border="0" height="75" src="http://email/files/wysiwyg/header1.jpg" width="602" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor="#cccccc" height="50" style="padding:0px 21px;"&gt;&lt;p align="left" style="font-size:14px;font-family:Arial, Helvetica, sans-serif;"&gt;&lt;br /&gt;&lt;strong&gt;&lt;a class="style1" href="http://www.buenosaires.gov.ar/areas/descentralizacion/" style="color:#000000;text-decoration:none;"&gt;Comuna 4&lt;/a&gt;&lt;br /&gt;&lt;/strong&gt;&lt;a href="http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230" style="color:#000000;text-decoration:none;"&gt;La Boca, Barracas, Parque Patricios, y Nueva Pompeya&lt;/a&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor="#ffffff" height="21" style="padding:0px 0px 0px 21px;font-size:11px;"&gt;&lt;div align="left"&gt;&lt;span style="font-family:Arial, Helvetica, sans-serif;"&gt;Gacetilla - 6 de marzo de 2013&lt;/span&gt; &lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/globa.jpg" bgcolor="#FFFFFF" height="226" width="600"&gt;&lt;div align="center"&gt;&lt;img alt="" height="166" src="http://email/files/wysiwyg/644378_575335909143633_2098529071_n.jpg" width="552" /&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height="106"&gt;&lt;table border="0" cellpadding="0" cellspacing="0" width="600"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td height="13" style="padding:0px 21px;"&gt;&lt;div align="left"&gt;&lt;span style="font-family:Arial, Helvetica, sans-serif;font-size:14px;font-weight:bold;font-size:14px;"&gt;Puesta en valor del Espacio Verde Magaldi&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height="15" style="padding:0px 21px;"&gt;&lt;div align="left"&gt;&lt;span style="font-family:Arial, Helvetica, sans-serif;"&gt;&lt;a href="#" style="font-family:Arial, Helvetica, sans-serif;text-decoration:none;font-size:13px;color:#666;font-weight:bold;text-decoration:none;"&gt;Comenzarán los trabajos de obra&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style="padding:2px 21px;"&gt;&lt;div align="justify"&gt;&lt;p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;"&gt;Les contamos a los vecinos que comenzarán los trabajos de puesta en valor del Espacio Verde Agustín Magaldi, en el barrio de Barracas.&lt;/p&gt;&lt;p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;"&gt;Las obras consisten en reformular los espacios de esparcimiento y recreación, con la incorporación de nuevo mobiliario urbano y espacios de juego. &lt;/p&gt;&lt;p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;"&gt;Las pérgolas de hierro galvanizado brindarán sombra y evitarán la apropiación del espacio por autos y motos, también habrá un espacio semicubierto donde se podrán organizar desde bailes hasta reuniones vecinales. En el playón central se ubicarán mesas y sillas, espacios para jugar al ajedrez y sector de ping-pong con una pequeña tribuna. Se incorporarán también cestos de residuos, bebederos y canillas para riego.Se adaptarán para niños los juegos existentes, con su perímetro de reja y su acceso actual, y se construirá un nuevo espacio para triciclos. Además, se propone el aumento de iluminación reemplazando la existente, y se agregarán a los sectores de juegos, reflectores con luz especial.&lt;/p&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height="15" style="padding:0px 21px;"&gt;&lt;div align="left"&gt;&lt;span style="font-family:Arial, Helvetica, sans-serif;"&gt;&lt;a href="http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/" style="font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold;color:#000;text-decoration:none;"&gt;[+]&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;img height="8" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/linea_puntos.jpg" width="600" /&gt;&lt;table border="0" cellpadding="0" cellspacing="0" width="600"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img height="9" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/barra_pie.jpg" width="602" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor="#FFD300"&gt;&lt;table border="0" cellpadding="0" cellspacing="0" width="600"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;a href="mailto:comuna4@buenosaires.gob.ar"&gt;&lt;img align="right" alt="#" border="0" height="88" src="http://email/files/wysiwyg/c4_JApreda_mapa.jpg" width="157" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td&gt;&lt;a href="http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230"&gt;&lt;img align="right" border="0" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie_atencion.jpg" width="298" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td&gt;&lt;img align="right" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/piense_antes.jpg" width="147" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/pie.jpg" height="25"&gt;&lt;table background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie.jpg" border="0" cellpadding="0" cellspacing="0" width="602"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style="padding:5px 21px;" width="448"&gt;&lt;div align="left"&gt;&lt;span style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;"&gt;&lt;a href="#URL_UNSUBSCRIBE#" style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;" target="_blank"&gt;Suscribir / Borrar suscripción&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;td style="padding:2px 0px 0px 0px;" width="78"&gt;&lt;a href="http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4"&gt;&lt;img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/fb.jpg" width="78" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td style="padding:2px 0px 0px 0px;" width="74"&gt;&lt;a href="https://twitter.com/bacomuna4"&gt;&lt;img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/twitter.jpg" width="74" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_de01a.jpg" width="10"&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_bottom.jpg" width="620" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;', NULL, '20,25', '', NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cam_campanias_personas`
--

INSERT INTO `cam_campanias_personas` (`id`, `campania_id`, `persona_id`, `estado`, `lectura`, `acceso`, `respuesta`, `error`, `error_tipo`) VALUES
(1, 1, 9, 'Enviada', '2013-07-04 15:35:27', NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `cam_links`
--

INSERT INTO `cam_links` (`id`, `campania_id`, `link`) VALUES
(1, 1, 'http://www.buenosaires.gob.ar/'),
(2, 1, 'http://www.buenosaires.gov.ar/areas/descentralizacion/'),
(3, 1, 'http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230'),
(4, 1, 'http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/'),
(6, 1, 'http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230'),
(7, 1, 'http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4'),
(8, 1, 'https://twitter.com/bacomuna4'),
(17, 1, 'mailto:comuna4@buenosaires.gob.ar');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `msg_mensajes`
--

INSERT INTO `msg_mensajes` (`id`, `fecha_carga`, `fecha_envio`, `prioridad`, `server_id`, `html`, `destino`, `asunto`, `cuerpo`, `headers`, `adjuntos`, `estado`, `intentos`, `error`) VALUES
(1, '2013-07-04 15:10:23', '2013-07-04 15:10:23', 3, 1, 'Si', 'federicobouzas@gmail.com', 'Campaña de Prueba', '<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" /><title>comuna4</title>\r\n<style type="text/css">&lt;!--\r\n.style1 {font-size: 18px}\r\n--&gt;\r\n</style>\r\n\r\n\r\n<table align="center" border="0" cellpadding="0" cellspacing="0" width="620"><tbody><tr><td><img height="15" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_top.jpg" width="621" /></td></tr><tr><td><table align="center" border="0" cellpadding="0" cellspacing="0" width="620"><tbody><tr><td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_iz01b.jpg" width="10"></td><td><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><a href="http://www.buenosaires.gob.ar/" target="_blank"><img alt="" border="0" height="75" src="http://email/files/wysiwyg/header1.jpg" width="602" /></a></td></tr><tr><td bgcolor="#cccccc" height="50" style="padding:0px 21px;"><p align="left" style="font-size:14px;font-family:Arial, Helvetica, sans-serif;"><br /><strong><a class="style1" href="http://www.buenosaires.gov.ar/areas/descentralizacion/" style="color:#000000;text-decoration:none;">Comuna 4</a><br /></strong><a href="http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230" style="color:#000000;text-decoration:none;">La Boca, Barracas, Parque Patricios, y Nueva Pompeya</a></p></td></tr><tr><td bgcolor="#ffffff" height="21" style="padding:0px 0px 0px 21px;font-size:11px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;">Gacetilla - 6 de marzo de 2013</span> </div></td></tr><tr><td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/globa.jpg" bgcolor="#FFFFFF" height="226" width="600"><div align="center"><img alt="" height="166" src="http://email/files/wysiwyg/644378_575335909143633_2098529071_n.jpg" width="552" /></div></td></tr><tr><td height="106"><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td height="13" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;font-size:14px;font-weight:bold;font-size:14px;">Puesta en valor del Espacio Verde Magaldi</span></div></td></tr><tr><td height="15" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;"><a href="#" style="font-family:Arial, Helvetica, sans-serif;text-decoration:none;font-size:13px;color:#666;font-weight:bold;text-decoration:none;">Comenzarán los trabajos de obra</a></span></div></td></tr><tr><td style="padding:2px 21px;"><div align="justify"><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Les contamos a los vecinos que comenzarán los trabajos de puesta en valor del Espacio Verde Agustín Magaldi, en el barrio de Barracas.</p><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Las obras consisten en reformular los espacios de esparcimiento y recreación, con la incorporación de nuevo mobiliario urbano y espacios de juego. </p><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Las pérgolas de hierro galvanizado brindarán sombra y evitarán la apropiación del espacio por autos y motos, también habrá un espacio semicubierto donde se podrán organizar desde bailes hasta reuniones vecinales. En el playón central se ubicarán mesas y sillas, espacios para jugar al ajedrez y sector de ping-pong con una pequeña tribuna. Se incorporarán también cestos de residuos, bebederos y canillas para riego.Se adaptarán para niños los juegos existentes, con su perímetro de reja y su acceso actual, y se construirá un nuevo espacio para triciclos. Además, se propone el aumento de iluminación reemplazando la existente, y se agregarán a los sectores de juegos, reflectores con luz especial.</p></div></td></tr><tr><td height="15" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;"><a href="http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/" style="font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold;color:#000;text-decoration:none;">[+]</a></span></div></td></tr></tbody></table></td></tr></tbody></table><img height="8" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/linea_puntos.jpg" width="600" /><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><img height="9" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/barra_pie.jpg" width="602" /></td></tr><tr><td bgcolor="#FFD300"><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><a href="mailto:comuna4@buenosaires.gob.ar"><img align="right" alt="#" border="0" height="88" src="http://email/files/wysiwyg/c4_JApreda_mapa.jpg" width="157" /></a></td><td><a href="http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230"><img align="right" border="0" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie_atencion.jpg" width="298" /></a></td><td><img align="right" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/piense_antes.jpg" width="147" /></td></tr></tbody></table></td></tr><tr><td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/pie.jpg" height="25"><table background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie.jpg" border="0" cellpadding="0" cellspacing="0" width="602"><tbody><tr><td style="padding:5px 21px;" width="448"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;"><a href="javascript:void(0);" style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;" target="_blank">Suscribir / Borrar suscripción</a></span></div></td><td style="padding:2px 0px 0px 0px;" width="78"><a href="http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4"><img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/fb.jpg" width="78" /></a></td><td style="padding:2px 0px 0px 0px;" width="74"><a href="https://twitter.com/bacomuna4"><img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/twitter.jpg" width="74" /></a></td></tr></tbody></table></td></tr></tbody></table></td><td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_de01a.jpg" width="10"></td></tr></tbody></table></td></tr><tr><td><img src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_bottom.jpg" width="620" /></td></tr></tbody></table>', '[]', '[]', 'Enviado', 0, NULL),
(2, '2013-07-04 15:33:56', '2013-07-04 15:33:56', 3, 1, 'Si', 'federicobouzas@gmail.com', 'Campaña de Prueba', '<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" /><title>comuna4</title>\r\n<style type="text/css">&lt;!--\r\n.style1 {font-size: 18px}\r\n--&gt;\r\n</style>\r\n\r\n\r\n<table align="center" border="0" cellpadding="0" cellspacing="0" width="620"><tbody><tr><td><img height="15" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_top.jpg" width="621" /></td></tr><tr><td><table align="center" border="0" cellpadding="0" cellspacing="0" width="620"><tbody><tr><td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_iz01b.jpg" width="10"></td><td><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><a href="http://email/campanias/followLink/1/9/b7777a3b9c7ae08295ef4090fbff7864" target="_blank"><img alt="" border="0" height="75" src="http://email/files/wysiwyg/header1.jpg" width="602" /></a></td></tr><tr><td bgcolor="#cccccc" height="50" style="padding:0px 21px;"><p align="left" style="font-size:14px;font-family:Arial, Helvetica, sans-serif;"><br /><strong><a class="style1" href="http://email/campanias/followLink/2/9/b7777a3b9c7ae08295ef4090fbff7864" style="color:#000000;text-decoration:none;">Comuna 4</a><br /></strong><a href="http://email/campanias/followLink/3/9/b7777a3b9c7ae08295ef4090fbff7864" style="color:#000000;text-decoration:none;">La Boca, Barracas, Parque Patricios, y Nueva Pompeya</a></p></td></tr><tr><td bgcolor="#ffffff" height="21" style="padding:0px 0px 0px 21px;font-size:11px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;">Gacetilla - 6 de marzo de 2013</span> </div></td></tr><tr><td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/globa.jpg" bgcolor="#FFFFFF" height="226" width="600"><div align="center"><img alt="" height="166" src="http://email/files/wysiwyg/644378_575335909143633_2098529071_n.jpg" width="552" /></div></td></tr><tr><td height="106"><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td height="13" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;font-size:14px;font-weight:bold;font-size:14px;">Puesta en valor del Espacio Verde Magaldi</span></div></td></tr><tr><td height="15" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;"><a href="#" style="font-family:Arial, Helvetica, sans-serif;text-decoration:none;font-size:13px;color:#666;font-weight:bold;text-decoration:none;">Comenzarán los trabajos de obra</a></span></div></td></tr><tr><td style="padding:2px 21px;"><div align="justify"><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Les contamos a los vecinos que comenzarán los trabajos de puesta en valor del Espacio Verde Agustín Magaldi, en el barrio de Barracas.</p><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Las obras consisten en reformular los espacios de esparcimiento y recreación, con la incorporación de nuevo mobiliario urbano y espacios de juego. </p><p style="font-family:Arial, Helvetica, sans-serif;font-size:12px;">Las pérgolas de hierro galvanizado brindarán sombra y evitarán la apropiación del espacio por autos y motos, también habrá un espacio semicubierto donde se podrán organizar desde bailes hasta reuniones vecinales. En el playón central se ubicarán mesas y sillas, espacios para jugar al ajedrez y sector de ping-pong con una pequeña tribuna. Se incorporarán también cestos de residuos, bebederos y canillas para riego.Se adaptarán para niños los juegos existentes, con su perímetro de reja y su acceso actual, y se construirá un nuevo espacio para triciclos. Además, se propone el aumento de iluminación reemplazando la existente, y se agregarán a los sectores de juegos, reflectores con luz especial.</p></div></td></tr><tr><td height="15" style="padding:0px 21px;"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;"><a href="http://email/campanias/followLink/4/9/b7777a3b9c7ae08295ef4090fbff7864" style="font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold;color:#000;text-decoration:none;">[+]</a></span></div></td></tr></tbody></table></td></tr></tbody></table><img height="8" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/linea_puntos.jpg" width="600" /><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><img height="9" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/barra_pie.jpg" width="602" /></td></tr><tr><td bgcolor="#FFD300"><table border="0" cellpadding="0" cellspacing="0" width="600"><tbody><tr><td><a href="http://email/campanias/followLink/17/9/b7777a3b9c7ae08295ef4090fbff7864"><img align="right" alt="#" border="0" height="88" src="http://email/files/wysiwyg/c4_JApreda_mapa.jpg" width="157" /></a></td><td><a href="http://email/campanias/followLink/6/9/b7777a3b9c7ae08295ef4090fbff7864"><img align="right" border="0" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie_atencion.jpg" width="298" /></a></td><td><img align="right" height="89" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/piense_antes.jpg" width="147" /></td></tr></tbody></table></td></tr><tr><td background="Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/pie.jpg" height="25"><table background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie.jpg" border="0" cellpadding="0" cellspacing="0" width="602"><tbody><tr><td style="padding:5px 21px;" width="448"><div align="left"><span style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;"><a href="http://email/campanias/unsubscribe/1/9/b7777a3b9c7ae08295ef4090fbff7864" style="font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;" target="_blank">Suscribir / Borrar suscripción</a></span></div></td><td style="padding:2px 0px 0px 0px;" width="78"><a href="http://email/campanias/followLink/7/9/b7777a3b9c7ae08295ef4090fbff7864"><img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/fb.jpg" width="78" /></a></td><td style="padding:2px 0px 0px 0px;" width="74"><a href="http://email/campanias/followLink/8/9/b7777a3b9c7ae08295ef4090fbff7864"><img align="right" border="0" height="21" src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/twitter.jpg" width="74" /></a></td></tr></tbody></table></td></tr></tbody></table></td><td background="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_de01a.jpg" width="10"></td></tr></tbody></table></td></tr><tr><td><img src="http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_bottom.jpg" width="620" /></td></tr></tbody></table><img src="http://email/campanias/lectura/1/9/b7777a3b9c7ae08295ef4090fbff7864" style="border:0;width:1px;height:1px;" />', '{"X-Hash":"b7777a3b9c7ae08295ef4090fbff7864","X-Campania":"1","X-Persona":"9","List-Unsubscribe":"<http:\\/\\/email\\/campanias\\/unsubscribe\\/1\\/9\\/b7777a3b9c7ae08295ef4090fbff7864>"}', '[]', 'Enviado', 0, NULL);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `msg_servers`
--

INSERT INTO `msg_servers` (`id`, `fecha_carga`, `fecha_modificacion`, `estado`, `tipo`, `tls`, `ssl`, `adicionales`, `host`, `puerto`, `usuario`, `clave`, `cuenta`, `remitente`, `responder`, `return_path`) VALUES
(1, '2013-05-20 17:14:41', NULL, 'Activo', 'SMTP', 'No', 'No', NULL, 'smtp.buenosaires.gob.ar', 25, 'atciudadana@buenosaires.gob.ar', 've4a2u2e', 'atciudadana@buenosaires.gob.ar', 'Atención Ciudadana', NULL, NULL),
(2, '2013-05-21 16:40:34', NULL, 'Activo', 'POP3', 'No', 'Si', NULL, 'pop.buenosaires.gob.ar', 995, 'atciudadana@buenosaires.gob.ar', 've4a2u2e', 'atciudadana@buenosaires.gob.ar', '', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `per_personas`
--

INSERT INTO `per_personas` (`id`, `fecha_carga`, `fecha_modificacion`, `activa`, `errores`, `user_id`, `nombre`, `apellido`, `sexo`, `fecha_nacimiento`, `email`, `telefono_particular`, `telefono_celular`, `calle`, `altura`, `piso`, `barrio`, `comuna`, `coordenadas`) VALUES
(9, '2013-07-04 14:59:53', '2013-07-04 18:40:51', 'Si', 0, 4, 'Federico', 'Bouzas', 'masculino', '1989-01-13', 'federicobouzas@gmail.com', NULL, NULL, 'Riglos', 1135, '', 'Parque Chacabuco', 7, '-34.6322479, -58.43478140000002'),
(10, '2013-07-04 15:35:17', '2013-07-05 12:55:23', 'Si', 0, 4, 'Martin', '', '', NULL, 'martin@asasl.com', NULL, NULL, '', NULL, '', '', 16, ''),
(11, '2013-07-12 16:53:26', '2013-07-12 19:54:16', 'Si', 0, 4, NULL, NULL, NULL, NULL, 'mtesta@buenosaires.gob.ar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2013-07-12 16:53:26', '2013-07-12 19:54:16', 'Si', 0, 4, NULL, NULL, NULL, NULL, 'marianatdl@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2013-07-12 16:53:26', '2013-07-12 19:54:16', 'Si', 0, 4, NULL, NULL, NULL, NULL, 'noexisteestacuenta@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2013-07-12 16:53:26', '2013-07-12 19:54:16', 'Si', 0, 4, NULL, NULL, NULL, NULL, 'noexisteestacuenta@noexisteestedominio.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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

--
-- Volcado de datos para la tabla `per_personas_poblaciones`
--

INSERT INTO `per_personas_poblaciones` (`persona_id`, `poblacion_id`) VALUES
(9, 1),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `per_poblaciones`
--

INSERT INTO `per_poblaciones` (`id`, `fecha_carga`, `fecha_modificacion`, `activa`, `user_id`, `nombre`) VALUES
(1, '2013-07-04 14:04:48', '2013-07-04 17:05:04', 'Si', 4, 'Secretarios'),
(2, '2013-07-04 14:04:55', '0000-00-00 00:00:00', 'Si', 4, 'Ministros');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
(1, '2013-07-04 18:09:39', 'GCBA', '', '', 'atciudadana@buenosaires.gob.ar', 'email', 'Sistema de Email Marketing', 1, 0, 10, 5);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sys_logins`
--

INSERT INTO `sys_logins` (`id`, `fecha_carga`, `ip`, `username`, `password`) VALUES
(1, '2013-07-12 16:58:43', '127.0.0.1', 'admin', '1234');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `sys_logs`
--

INSERT INTO `sys_logs` (`id`, `fecha_carga`, `user_id`, `model`, `action`, `model_id`) VALUES
(1, '2013-07-04 14:04:51', 4, 'Poblacion', 'add', 1),
(2, '2013-07-04 14:04:59', 4, 'Poblacion', 'add', 2),
(3, '2013-07-04 14:05:04', 4, 'Poblacion', 'edit', 1),
(4, '2013-07-04 14:33:30', 4, 'Persona', 'edit', 1),
(5, '2013-07-04 15:00:33', 4, 'Persona', 'edit', 9),
(6, '2013-07-04 15:01:12', 4, 'Persona', 'edit', 9),
(7, '2013-07-04 15:09:39', 4, 'Configuration', 'edit', 1),
(8, '2013-07-04 15:10:08', 4, 'Campania', 'add', 1),
(9, '2013-07-04 15:40:51', 4, 'Persona', 'edit', 9),
(10, '2013-07-05 09:55:23', 4, 'Persona', 'edit', 10);

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
