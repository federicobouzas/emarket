CREATE DATABASE  IF NOT EXISTS `emarket` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `emarket`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: emarket
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acc_buttons`
--

DROP TABLE IF EXISTS `acc_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_buttons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  `status` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `acc_buttons_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_buttons`
--

LOCK TABLES `acc_buttons` WRITE;
/*!40000 ALTER TABLE `acc_buttons` DISABLE KEYS */;
INSERT INTO `acc_buttons` VALUES (1,'2015-06-12 17:45:42','2015-08-11 02:14:22',NULL,'No','','90','No','consultar_usuarios.png','app_users_back/index','Usuarios','Activo');
/*!40000 ALTER TABLE `acc_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_buttons_rols`
--

DROP TABLE IF EXISTS `acc_buttons_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_buttons_rols` (
  `button_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL,
  PRIMARY KEY (`button_id`,`rol_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `acc_buttons_rols_ibfk_1` FOREIGN KEY (`button_id`) REFERENCES `acc_buttons` (`id`),
  CONSTRAINT `acc_buttons_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `acc_rols` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_buttons_rols`
--

LOCK TABLES `acc_buttons_rols` WRITE;
/*!40000 ALTER TABLE `acc_buttons_rols` DISABLE KEYS */;
INSERT INTO `acc_buttons_rols` VALUES (1,1);
/*!40000 ALTER TABLE `acc_buttons_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_permisos`
--

DROP TABLE IF EXISTS `acc_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_permisos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `controller` varchar(100) NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `acc_permisos_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_permisos`
--

LOCK TABLES `acc_permisos` WRITE;
/*!40000 ALTER TABLE `acc_permisos` DISABLE KEYS */;
INSERT INTO `acc_permisos` VALUES (1,'2015-06-12 17:45:42','2015-08-11 02:13:07',1,'Homepage','*','pages','display'),(2,'2015-06-12 17:45:42','2015-06-12 17:45:42',1,'Botones Homepage','fmw_acceso','buttons','ajax_buttons'),(3,'2015-06-12 17:45:42','2015-08-11 02:13:21',1,'Datos Personales','fmw_acceso','users','datos_personales'),(4,'2015-06-12 17:45:42','2015-06-12 17:45:42',1,'Request a Presentations por AJAX','*','remotes','*'),(5,'2015-06-12 17:45:42','2015-06-12 17:45:42',1,'ajaxID (para tablas asociadas muchos a muchos)','*','*','ajax_id'),(6,'2015-06-12 17:45:42','2015-06-12 17:45:42',1,'Ajax - Fecha','*','fmw','ajax_fecha'),(7,'2015-06-12 17:45:42','2015-06-12 17:45:42',1,'Ajax - Recibir Notificaciones','fmw_messaging','notifications','ajax_get_notification_by_id'),(8,'2015-06-12 17:45:42','2015-06-04 13:59:10',1,'Dashboard','fmw_dashboard','dashboard','index,ajax_get_chart,ajax_get_gauge,ajax_get_kpi');
/*!40000 ALTER TABLE `acc_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_right_permisos`
--

DROP TABLE IF EXISTS `acc_right_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_right_permisos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `right_id` int(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `controller` varchar(100) NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `right_id` (`right_id`),
  CONSTRAINT `acc_right_permisos_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `acc_rights` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_right_permisos`
--

LOCK TABLES `acc_right_permisos` WRITE;
/*!40000 ALTER TABLE `acc_right_permisos` DISABLE KEYS */;
INSERT INTO `acc_right_permisos` VALUES (1,1,'fmw_acceso','users','*'),(2,1,'fmw_acceso','rols','*'),(3,1,'fmw_acceso','rights','*'),(4,1,'fmw_acceso','permisos','*'),(5,2,'fmw_messaging','entrantes','*'),(6,2,'fmw_messaging','mensajes','*'),(7,2,'fmw_messaging','servers','*'),(8,1,'fmw_acceso','buttons','*'),(9,3,'fmw_system','configurations','edit'),(10,3,'fmw_system','logs','*'),(11,3,'fmw_system','estados','*'),(12,1,'fmw_acceso','centros_costos','*'),(13,1,'fmw_acceso','dependencias','*'),(14,3,'fmw_system','bloqueos','*'),(15,2,'fmw_messaging','notification_messages','*'),(16,4,'fmw_dashboard','charts','*'),(17,4,'fmw_dashboard','dashboard','*'),(18,4,'fmw_dashboard','gauges','*'),(19,4,'fmw_dashboard','kpis','*');
/*!40000 ALTER TABLE `acc_right_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_rights`
--

DROP TABLE IF EXISTS `acc_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_rights` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `acc_rights_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_rights`
--

LOCK TABLES `acc_rights` WRITE;
/*!40000 ALTER TABLE `acc_rights` DISABLE KEYS */;
INSERT INTO `acc_rights` VALUES (1,'2015-06-12 17:45:42','2015-06-12 17:45:42',NULL,'MÓDULO FMW_ACCESO'),(2,'2015-06-12 17:45:42','2015-06-12 17:45:42',NULL,'MÓDULO FMW_MESSAGING'),(3,'2015-06-12 17:45:42','2015-06-12 17:45:42',NULL,'MÓDULO FMW_SYSTEM'),(4,'2015-06-12 17:45:42','2015-06-12 17:45:42',1,'MÓDULO FMW_DASHBOARD');
/*!40000 ALTER TABLE `acc_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_rights_rols`
--

DROP TABLE IF EXISTS `acc_rights_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_rights_rols` (
  `right_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL,
  PRIMARY KEY (`right_id`,`rol_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `acc_rights_rols_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `acc_rights` (`id`),
  CONSTRAINT `acc_rights_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `acc_rols` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_rights_rols`
--

LOCK TABLES `acc_rights_rols` WRITE;
/*!40000 ALTER TABLE `acc_rights_rols` DISABLE KEYS */;
INSERT INTO `acc_rights_rols` VALUES (1,1),(2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `acc_rights_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_rols`
--

DROP TABLE IF EXISTS `acc_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `acc_rols_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_rols`
--

LOCK TABLES `acc_rols` WRITE;
/*!40000 ALTER TABLE `acc_rols` DISABLE KEYS */;
INSERT INTO `acc_rols` VALUES (1,'2015-06-12 17:45:42','2015-07-10 17:42:56',NULL,'ADMINISTRADOR GENERAL');
/*!40000 ALTER TABLE `acc_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_users`
--

DROP TABLE IF EXISTS `acc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_users`
--

LOCK TABLES `acc_users` WRITE;
/*!40000 ALTER TABLE `acc_users` DISABLE KEYS */;
INSERT INTO `acc_users` VALUES (1,'2015-06-15 14:21:05','2015-07-14 13:27:22','Administrador','Sistema','admin','793b0dd277d6f1c41d452a05db8f3fae298aa975','admin@erp-eideos.com.ar',NULL,'[{\"file\":\"e7b5a46bf091014e93752a079a095be1.jpg\",\"name\":\"avatar2.jpg\",\"type\":\"image\\/jpeg\",\"size\":91493}]','2015-06-01',3,'Activo');
/*!40000 ALTER TABLE `acc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_users_recovers`
--

DROP TABLE IF EXISTS `acc_users_recovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_users_recovers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `acc_users_recovers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_users_recovers`
--

LOCK TABLES `acc_users_recovers` WRITE;
/*!40000 ALTER TABLE `acc_users_recovers` DISABLE KEYS */;
INSERT INTO `acc_users_recovers` VALUES (1,'2015-07-13 11:50:21',1,'255c8b626dc946ddabc568f016adf0c8'),(7,'2015-07-14 10:23:55',1,'255c8b626dc946ddabc568f016adf0c8');
/*!40000 ALTER TABLE `acc_users_recovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_users_rols`
--

DROP TABLE IF EXISTS `acc_users_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_users_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`rol_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `acc_users_rols_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`),
  CONSTRAINT `acc_users_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `acc_rols` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_users_rols`
--

LOCK TABLES `acc_users_rols` WRITE;
/*!40000 ALTER TABLE `acc_users_rols` DISABLE KEYS */;
INSERT INTO `acc_users_rols` VALUES (19,1,1);
/*!40000 ALTER TABLE `acc_users_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_campanias`
--

DROP TABLE IF EXISTS `cam_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_campanias` (
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
  KEY `server_id` (`server_id`),
  CONSTRAINT `cam_campanias_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`),
  CONSTRAINT `cam_campanias_ibfk_2` FOREIGN KEY (`encuesta_id`) REFERENCES `cam_encuestas` (`id`),
  CONSTRAINT `cam_campanias_ibfk_3` FOREIGN KEY (`evento_id`) REFERENCES `cam_eventos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_campanias`
--

LOCK TABLES `cam_campanias` WRITE;
/*!40000 ALTER TABLE `cam_campanias` DISABLE KEYS */;
INSERT INTO `cam_campanias` VALUES (1,'2013-07-04 15:09:18','2013-07-04 18:33:56','Si',3,'2013-07-04 15:33:56',4,1,'Newsletter','Campaña de Prueba','Enviada',NULL,NULL,'Si','No','','Campaña de Prueba','&lt;meta content=\"text/html; charset=iso-8859-1\" http-equiv=\"Content-Type\" /&gt;&lt;title&gt;comuna4&lt;/title&gt;\r\n&lt;style type=\"text/css\"&gt;&amp;lt;!--\r\n.style1 {font-size: 18px}\r\n--&amp;gt;\r\n&lt;/style&gt;\r\n\r\n\r\n&lt;table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img height=\"15\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_top.jpg\" width=\"621\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td background=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_iz01b.jpg\" width=\"10\"&gt;&lt;/td&gt;&lt;td&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;a href=\"http://www.buenosaires.gob.ar/\" target=\"_blank\"&gt;&lt;img alt=\"\" border=\"0\" height=\"75\" src=\"http://email/files/wysiwyg/header1.jpg\" width=\"602\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor=\"#cccccc\" height=\"50\" style=\"padding:0px 21px;\"&gt;&lt;p align=\"left\" style=\"font-size:14px;font-family:Arial, Helvetica, sans-serif;\"&gt;&lt;br /&gt;&lt;strong&gt;&lt;a class=\"style1\" href=\"http://www.buenosaires.gov.ar/areas/descentralizacion/\" style=\"color:#000000;text-decoration:none;\"&gt;Comuna 4&lt;/a&gt;&lt;br /&gt;&lt;/strong&gt;&lt;a href=\"http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230\" style=\"color:#000000;text-decoration:none;\"&gt;La Boca, Barracas, Parque Patricios, y Nueva Pompeya&lt;/a&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor=\"#ffffff\" height=\"21\" style=\"padding:0px 0px 0px 21px;font-size:11px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;\"&gt;Gacetilla - 6 de marzo de 2013&lt;/span&gt; &lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td background=\"Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/globa.jpg\" bgcolor=\"#FFFFFF\" height=\"226\" width=\"600\"&gt;&lt;div align=\"center\"&gt;&lt;img alt=\"\" height=\"166\" src=\"http://email/files/wysiwyg/644378_575335909143633_2098529071_n.jpg\" width=\"552\" /&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=\"106\"&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td height=\"13\" style=\"padding:0px 21px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;font-weight:bold;font-size:14px;\"&gt;Puesta en valor del Espacio Verde Magaldi&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=\"15\" style=\"padding:0px 21px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;\"&gt;&lt;a href=\"#\" style=\"font-family:Arial, Helvetica, sans-serif;text-decoration:none;font-size:13px;color:#666;font-weight:bold;text-decoration:none;\"&gt;Comenzarán los trabajos de obra&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\"padding:2px 21px;\"&gt;&lt;div align=\"justify\"&gt;&lt;p style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"&gt;Les contamos a los vecinos que comenzarán los trabajos de puesta en valor del Espacio Verde Agustín Magaldi, en el barrio de Barracas.&lt;/p&gt;&lt;p style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"&gt;Las obras consisten en reformular los espacios de esparcimiento y recreación, con la incorporación de nuevo mobiliario urbano y espacios de juego. &lt;/p&gt;&lt;p style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"&gt;Las pérgolas de hierro galvanizado brindarán sombra y evitarán la apropiación del espacio por autos y motos, también habrá un espacio semicubierto donde se podrán organizar desde bailes hasta reuniones vecinales. En el playón central se ubicarán mesas y sillas, espacios para jugar al ajedrez y sector de ping-pong con una pequeña tribuna. Se incorporarán también cestos de residuos, bebederos y canillas para riego.Se adaptarán para niños los juegos existentes, con su perímetro de reja y su acceso actual, y se construirá un nuevo espacio para triciclos. Además, se propone el aumento de iluminación reemplazando la existente, y se agregarán a los sectores de juegos, reflectores con luz especial.&lt;/p&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=\"15\" style=\"padding:0px 21px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;\"&gt;&lt;a href=\"http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/\" style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold;color:#000;text-decoration:none;\"&gt;[+]&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;img height=\"8\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/linea_puntos.jpg\" width=\"600\" /&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img height=\"9\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/barra_pie.jpg\" width=\"602\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor=\"#FFD300\"&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;a href=\"mailto:comuna4@buenosaires.gob.ar\"&gt;&lt;img align=\"right\" alt=\"#\" border=\"0\" height=\"88\" src=\"http://email/files/wysiwyg/c4_JApreda_mapa.jpg\" width=\"157\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td&gt;&lt;a href=\"http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230\"&gt;&lt;img align=\"right\" border=\"0\" height=\"89\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie_atencion.jpg\" width=\"298\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td&gt;&lt;img align=\"right\" height=\"89\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/piense_antes.jpg\" width=\"147\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td background=\"Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/pie.jpg\" height=\"25\"&gt;&lt;table background=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie.jpg\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"602\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=\"padding:5px 21px;\" width=\"448\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;\"&gt;&lt;a href=\"#URL_UNSUBSCRIBE#\" style=\"font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;\" target=\"_blank\"&gt;Suscribir / Borrar suscripción&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;td style=\"padding:2px 0px 0px 0px;\" width=\"78\"&gt;&lt;a href=\"http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4\"&gt;&lt;img align=\"right\" border=\"0\" height=\"21\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/fb.jpg\" width=\"78\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td style=\"padding:2px 0px 0px 0px;\" width=\"74\"&gt;&lt;a href=\"https://twitter.com/bacomuna4\"&gt;&lt;img align=\"right\" border=\"0\" height=\"21\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/twitter.jpg\" width=\"74\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;td background=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_de01a.jpg\" width=\"10\"&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_bottom.jpg\" width=\"620\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;',NULL,'20,25','',NULL,NULL,NULL),(2,'2013-08-16 11:24:22','2013-08-16 14:27:34','Si',3,'2013-08-16 11:27:34',4,1,'Newsletter','Prueba nueva','Enviada',NULL,NULL,'Si','No','','Prueba nueva','&lt;meta content=\"text/html; charset=iso-8859-1\" http-equiv=\"Content-Type\" /&gt;&lt;title&gt;comuna4&lt;/title&gt;\r\n&lt;style type=\"text/css\"&gt;&amp;lt;!--\r\n.style1 {font-size: 18px}\r\n--&amp;gt;\r\n&lt;/style&gt;\r\n\r\n\r\n&lt;table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img height=\"15\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_top.jpg\" width=\"621\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td background=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_iz01b.jpg\" width=\"10\"&gt;&lt;/td&gt;&lt;td&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;a href=\"http://www.buenosaires.gob.ar/\" target=\"_blank\"&gt;&lt;img alt=\"\" border=\"0\" height=\"75\" src=\"http://email/files/wysiwyg/header1.jpg\" width=\"602\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor=\"#cccccc\" height=\"50\" style=\"padding:0px 21px;\"&gt;&lt;p align=\"left\" style=\"font-size:14px;font-family:Arial, Helvetica, sans-serif;\"&gt;&lt;br /&gt;&lt;strong&gt;&lt;a class=\"style1\" href=\"http://www.buenosaires.gov.ar/areas/descentralizacion/\" style=\"color:#000000;text-decoration:none;\"&gt;Comuna 4&lt;/a&gt;&lt;br /&gt;&lt;/strong&gt;&lt;a href=\"http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230\" style=\"color:#000000;text-decoration:none;\"&gt;La Boca, Barracas, Parque Patricios, y Nueva Pompeya&lt;/a&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor=\"#ffffff\" height=\"21\" style=\"padding:0px 0px 0px 21px;font-size:11px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;\"&gt;Gacetilla - 6 de marzo de 2013&lt;/span&gt; &lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td background=\"Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/globa.jpg\" bgcolor=\"#FFFFFF\" height=\"226\" width=\"600\"&gt;&lt;div align=\"center\"&gt;&lt;img alt=\"\" height=\"166\" src=\"http://email/files/wysiwyg/644378_575335909143633_2098529071_n.jpg\" width=\"552\" /&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=\"106\"&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td height=\"13\" style=\"padding:0px 21px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;font-weight:bold;font-size:14px;\"&gt;Puesta en valor del Espacio Verde Magaldi&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=\"15\" style=\"padding:0px 21px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;\"&gt;&lt;a href=\"#\" style=\"font-family:Arial, Helvetica, sans-serif;text-decoration:none;font-size:13px;color:#666;font-weight:bold;text-decoration:none;\"&gt;Comenzarán los trabajos de obra&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\"padding:2px 21px;\"&gt;&lt;div align=\"justify\"&gt;&lt;p style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"&gt;Les contamos a los vecinos que comenzarán los trabajos de puesta en valor del Espacio Verde Agustín Magaldi, en el barrio de Barracas.&lt;/p&gt;&lt;p style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"&gt;Las obras consisten en reformular los espacios de esparcimiento y recreación, con la incorporación de nuevo mobiliario urbano y espacios de juego. &lt;/p&gt;&lt;p style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;\"&gt;Las pérgolas de hierro galvanizado brindarán sombra y evitarán la apropiación del espacio por autos y motos, también habrá un espacio semicubierto donde se podrán organizar desde bailes hasta reuniones vecinales. En el playón central se ubicarán mesas y sillas, espacios para jugar al ajedrez y sector de ping-pong con una pequeña tribuna. Se incorporarán también cestos de residuos, bebederos y canillas para riego.Se adaptarán para niños los juegos existentes, con su perímetro de reja y su acceso actual, y se construirá un nuevo espacio para triciclos. Además, se propone el aumento de iluminación reemplazando la existente, y se agregarán a los sectores de juegos, reflectores con luz especial.&lt;/p&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=\"15\" style=\"padding:0px 21px;\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;\"&gt;&lt;a href=\"http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/\" style=\"font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold;color:#000;text-decoration:none;\"&gt;[+]&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;img height=\"8\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/linea_puntos.jpg\" width=\"600\" /&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img height=\"9\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/barra_pie.jpg\" width=\"602\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td bgcolor=\"#FFD300\"&gt;&lt;table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;a href=\"mailto:comuna4@buenosaires.gob.ar\"&gt;&lt;img align=\"right\" alt=\"#\" border=\"0\" height=\"88\" src=\"http://email/files/wysiwyg/c4_JApreda_mapa.jpg\" width=\"157\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td&gt;&lt;a href=\"http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230\"&gt;&lt;img align=\"right\" border=\"0\" height=\"89\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie_atencion.jpg\" width=\"298\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td&gt;&lt;img align=\"right\" height=\"89\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/piense_antes.jpg\" width=\"147\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td background=\"Historial Boletines y Gacetillas/ceci/Desktop/Dropbox/gov.ar/gov.ar/disenio/jpg de nuevos boletines/boletines/imagenes/pie.jpg\" height=\"25\"&gt;&lt;table background=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/pie.jpg\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"602\"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=\"padding:5px 21px;\" width=\"448\"&gt;&lt;div align=\"left\"&gt;&lt;span style=\"font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;\"&gt;&lt;a href=\"#URL_UNSUBSCRIBE#\" style=\"font-family:Arial, Helvetica, sans-serif;font-size:10px;color:#808080;\" target=\"_blank\"&gt;Suscribir / Borrar suscripción&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;td style=\"padding:2px 0px 0px 0px;\" width=\"78\"&gt;&lt;a href=\"http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4\"&gt;&lt;img align=\"right\" border=\"0\" height=\"21\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/fb.jpg\" width=\"78\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;td style=\"padding:2px 0px 0px 0px;\" width=\"74\"&gt;&lt;a href=\"https://twitter.com/bacomuna4\"&gt;&lt;img align=\"right\" border=\"0\" height=\"21\" src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/twitter.jpg\" width=\"74\" /&gt;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;td background=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_de01a.jpg\" width=\"10\"&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;img src=\"http://www.buenosaires.gob.ar/areas/com_social/email/nuevo_boletin_2010/sombra_bottom.jpg\" width=\"620\" /&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;',NULL,NULL,'comunas',NULL,'7',NULL);
/*!40000 ALTER TABLE `cam_campanias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_campanias_personas`
--

DROP TABLE IF EXISTS `cam_campanias_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_campanias_personas` (
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
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `cam_campanias_personas_ibfk_1` FOREIGN KEY (`campania_id`) REFERENCES `cam_campanias` (`id`),
  CONSTRAINT `cam_campanias_personas_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_campanias_personas`
--

LOCK TABLES `cam_campanias_personas` WRITE;
/*!40000 ALTER TABLE `cam_campanias_personas` DISABLE KEYS */;
INSERT INTO `cam_campanias_personas` VALUES (1,1,9,'Enviada','2013-07-04 15:35:27',NULL,NULL,NULL,NULL),(2,2,9,'Enviada','2013-08-16 11:35:38',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cam_campanias_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_campanias_poblaciones`
--

DROP TABLE IF EXISTS `cam_campanias_poblaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_campanias_poblaciones` (
  `campania_id` int(10) NOT NULL,
  `poblacion_id` int(10) NOT NULL,
  PRIMARY KEY (`campania_id`,`poblacion_id`),
  KEY `poblacion_id` (`poblacion_id`),
  CONSTRAINT `cam_campanias_poblaciones_ibfk_1` FOREIGN KEY (`campania_id`) REFERENCES `cam_campanias` (`id`),
  CONSTRAINT `cam_campanias_poblaciones_ibfk_2` FOREIGN KEY (`poblacion_id`) REFERENCES `per_poblaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_campanias_poblaciones`
--

LOCK TABLES `cam_campanias_poblaciones` WRITE;
/*!40000 ALTER TABLE `cam_campanias_poblaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cam_campanias_poblaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_encuestas`
--

DROP TABLE IF EXISTS `cam_encuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_encuestas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cam_encuestas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_encuestas`
--

LOCK TABLES `cam_encuestas` WRITE;
/*!40000 ALTER TABLE `cam_encuestas` DISABLE KEYS */;
INSERT INTO `cam_encuestas` VALUES (2,'2013-07-24 11:15:32','0000-00-00 00:00:00',4,'dfdf','');
/*!40000 ALTER TABLE `cam_encuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_encuestas_preguntas`
--

DROP TABLE IF EXISTS `cam_encuestas_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_encuestas_preguntas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `encuesta_id` int(10) NOT NULL,
  `orden` int(2) DEFAULT NULL,
  `pregunta` varchar(200) NOT NULL,
  `tipo` enum('lista','simple','multiple','texto') NOT NULL,
  `opciones` text,
  PRIMARY KEY (`id`),
  KEY `encuesta_id` (`encuesta_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cam_encuestas_preguntas_ibfk_1` FOREIGN KEY (`encuesta_id`) REFERENCES `cam_encuestas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_encuestas_preguntas`
--

LOCK TABLES `cam_encuestas_preguntas` WRITE;
/*!40000 ALTER TABLE `cam_encuestas_preguntas` DISABLE KEYS */;
INSERT INTO `cam_encuestas_preguntas` VALUES (1,'2013-07-24 11:16:34','2013-07-24 14:16:34',4,2,NULL,'ghj','texto','');
/*!40000 ALTER TABLE `cam_encuestas_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_encuestas_respuestas`
--

DROP TABLE IF EXISTS `cam_encuestas_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_encuestas_respuestas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `campania_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `pregunta_id` int(10) NOT NULL,
  `respuesta` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pregunta_id` (`pregunta_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `cam_encuestas_respuestas_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`),
  CONSTRAINT `cam_encuestas_respuestas_ibfk_3` FOREIGN KEY (`pregunta_id`) REFERENCES `cam_encuestas_preguntas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_encuestas_respuestas`
--

LOCK TABLES `cam_encuestas_respuestas` WRITE;
/*!40000 ALTER TABLE `cam_encuestas_respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cam_encuestas_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_eventos`
--

DROP TABLE IF EXISTS `cam_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_eventos` (
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
  KEY `user_id` (`user_id`),
  CONSTRAINT `cam_eventos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_eventos`
--

LOCK TABLES `cam_eventos` WRITE;
/*!40000 ALTER TABLE `cam_eventos` DISABLE KEYS */;
INSERT INTO `cam_eventos` VALUES (1,'2013-07-24 11:19:17','0000-00-00 00:00:00',4,'dsfdsf','No','No','','2013-07-24 00:00:00','av de mayo 519','','Buenos Aires','Pergamino','-33.8931973, -60.5714696');
/*!40000 ALTER TABLE `cam_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_eventos_asistencias`
--

DROP TABLE IF EXISTS `cam_eventos_asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_eventos_asistencias` (
  `evento_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `asiste` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`evento_id`,`persona_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `cam_eventos_asistencias_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `cam_eventos` (`id`),
  CONSTRAINT `cam_eventos_asistencias_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_eventos_asistencias`
--

LOCK TABLES `cam_eventos_asistencias` WRITE;
/*!40000 ALTER TABLE `cam_eventos_asistencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cam_eventos_asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_links`
--

DROP TABLE IF EXISTS `cam_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `campania_id` int(10) NOT NULL,
  `link` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campania_id` (`campania_id`),
  CONSTRAINT `cam_links_ibfk_1` FOREIGN KEY (`campania_id`) REFERENCES `cam_campanias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_links`
--

LOCK TABLES `cam_links` WRITE;
/*!40000 ALTER TABLE `cam_links` DISABLE KEYS */;
INSERT INTO `cam_links` VALUES (1,1,'http://www.buenosaires.gob.ar/'),(2,1,'http://www.buenosaires.gov.ar/areas/descentralizacion/'),(3,1,'http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230'),(4,1,'http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/'),(6,1,'http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230'),(7,1,'http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4'),(8,1,'https://twitter.com/bacomuna4'),(17,1,'mailto:comuna4@buenosaires.gob.ar'),(18,2,'http://www.buenosaires.gob.ar/'),(19,2,'http://www.buenosaires.gov.ar/areas/descentralizacion/'),(20,2,'http://www.buenosaires.gov.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230'),(21,2,'http://comunas.buenosaires.gob.ar/novedades/comuna-4-invitacion-del-museo-benito-quinquela-martin/'),(22,2,'mailto:comuna4@buenosaires.gob.ar'),(23,2,'http://www.buenosaires.gob.ar/areas/jef_gabinete/atencion_ciudadana/?menu_id=24230'),(24,2,'http://www.facebook.com/http://www.facebook.com/home.php?#!/bacomuna4'),(25,2,'https://twitter.com/bacomuna4');
/*!40000 ALTER TABLE `cam_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cam_links_personas`
--

DROP TABLE IF EXISTS `cam_links_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cam_links_personas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `link_id` int(10) NOT NULL,
  `persona_id` int(10) NOT NULL,
  `fecha_acceso` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_id` (`link_id`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `cam_links_personas_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `cam_links` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cam_links_personas`
--

LOCK TABLES `cam_links_personas` WRITE;
/*!40000 ALTER TABLE `cam_links_personas` DISABLE KEYS */;
INSERT INTO `cam_links_personas` VALUES (1,4,9,'2013-07-22 16:51:16'),(2,20,9,'2013-08-16 11:35:56');
/*!40000 ALTER TABLE `cam_links_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `das_charts`
--

DROP TABLE IF EXISTS `das_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `das_charts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `das_charts`
--

LOCK TABLES `das_charts` WRITE;
/*!40000 ALTER TABLE `das_charts` DISABLE KEYS */;
/*!40000 ALTER TABLE `das_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `das_gauges`
--

DROP TABLE IF EXISTS `das_gauges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `das_gauges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(200) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Activo',
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `group_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `das_gauges`
--

LOCK TABLES `das_gauges` WRITE;
/*!40000 ALTER TABLE `das_gauges` DISABLE KEYS */;
/*!40000 ALTER TABLE `das_gauges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `das_kpis`
--

DROP TABLE IF EXISTS `das_kpis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `das_kpis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `model` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `field_group` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `das_kpis`
--

LOCK TABLES `das_kpis` WRITE;
/*!40000 ALTER TABLE `das_kpis` DISABLE KEYS */;
/*!40000 ALTER TABLE `das_kpis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_entrantes`
--

DROP TABLE IF EXISTS `msg_entrantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_entrantes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_mensaje` varchar(100) NOT NULL,
  `server_id` int(10) NOT NULL,
  `remitente` varchar(100) NOT NULL,
  `asunto` varchar(500) NOT NULL,
  `cuerpo` text NOT NULL,
  `error` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `msg_entrantes_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `msg_servers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_entrantes`
--

LOCK TABLES `msg_entrantes` WRITE;
/*!40000 ALTER TABLE `msg_entrantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_entrantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_mensajes`
--

DROP TABLE IF EXISTS `msg_mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_mensajes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  `error` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_mensajes`
--

LOCK TABLES `msg_mensajes` WRITE;
/*!40000 ALTER TABLE `msg_mensajes` DISABLE KEYS */;
INSERT INTO `msg_mensajes` VALUES (1,'2015-07-13 11:50:21','2015-07-13 11:50:21',3,1,'Si','admin@erp-eideos.com.ar','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/1/255c8b626dc946ddabc568f016adf0c8\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',0,NULL),(2,'2015-07-13 14:19:58','2015-07-13 14:19:58',3,1,'Si','martincrespop@gmail.com','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/2/2a67a8a75a76afdeccf5956c5c757bba\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',0,NULL),(3,'2015-07-13 14:53:34','2015-07-13 14:53:34',3,1,'Si','martincrespop@gmail.com','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/3/2a67a8a75a76afdeccf5956c5c757bba\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',0,NULL),(4,'2015-07-13 14:55:47','2015-07-13 14:55:47',3,1,'Si','martincrespop@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"martincrespop\".<br />\r\n                         Su nueva clave es: <strong>zbsYXlGQ<strong><br />\r\n                         Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(5,'2015-07-13 14:56:11','2015-07-13 14:56:11',3,1,'Si','martincrespop@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"martincrespop\".<br />\r\n                         Su nueva clave es: <strong>uarHwOb2<strong><br />\r\n                         Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(6,'2015-07-13 14:56:27','2015-07-13 14:56:27',3,1,'Si','martincrespop@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"martincrespop\".<br />\r\n                         Su nueva clave es: <strong>PE4sgQzo<strong><br />\r\n                         Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(7,'2015-07-13 14:59:30','2015-07-13 14:59:30',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/4/2e887e109c9657155ef5ebf242897bb1\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',0,NULL),(8,'2015-07-13 14:59:48','2015-07-13 14:59:48',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>kh54xKov<strong><br />\r\n                         Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(9,'2015-07-13 15:03:00','2015-07-13 15:02:00',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/5/2e887e109c9657155ef5ebf242897bb1\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',2,NULL),(10,'2015-07-13 15:05:59','2015-07-13 15:05:59',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>rb5Yhp3B<strong><br />\r\n                         Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(11,'2015-07-13 15:12:30','2015-07-13 15:12:30',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>4AZurO9y<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(12,'2015-07-13 15:13:09','2015-07-13 15:13:09',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>XOAVTDRc<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(13,'2015-07-13 15:13:20','2015-07-13 15:13:20',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>58Gohz9v<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(14,'2015-07-13 15:15:17','2015-07-13 15:15:17',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>Qra0ZD9w<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(15,'2015-07-13 15:15:41','2015-07-13 15:15:41',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>4IKLTRPC<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(16,'2015-07-13 15:39:03','2015-07-13 15:39:03',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/6/2e887e109c9657155ef5ebf242897bb1\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',0,NULL),(17,'2015-07-13 15:39:51','2015-07-13 15:39:51',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>rnNqXluG<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(18,'2015-07-13 15:40:01','2015-07-13 15:40:01',3,1,'Si','amousquere@gmail.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"amousquere\".<br />\r\n                         Su nueva clave es: <strong>Kw4buG2J<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(19,'2015-07-14 10:23:55','2015-07-14 10:23:55',3,1,'Si','admin@erp-eideos.com.ar','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/7/255c8b626dc946ddabc568f016adf0c8\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',0,NULL),(20,'2015-07-14 10:26:45','2015-07-14 10:26:45',3,1,'Si','admin@erp-eideos.com.ar','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"admin\".<br />\r\n                         Su nueva clave es: <strong>BH60JKge<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL),(21,'2015-07-14 10:31:58','2015-07-14 10:31:58',3,1,'Si','tsunami@chanes.com','Recuperar contraseña','<strong>Recibimos la solicitud para restablecer la contraseña de su cuenta.</strong><br>\r\n                        En caso de no haberla solicitado ignore este mensaje.<br>\r\n                        Para generar automaticamente una nueva clave, por favor, diríjase a la siguiente dirección: \r\n                        <a href=\"http://elearning/fmw_acceso/users/do_recover/8/6ca2c7f3032df4d634cee8d22a013c2d\">Click acá<a/>.','default','default',NULL,'[]','[]','Enviado',0,NULL),(22,'2015-07-14 10:32:13','2015-07-14 10:32:13',3,1,'Si','tsunami@chanes.com','Recuperar contraseña','Se ha generado una nueva clave de acceso al sistema para el usuario \"tsunami\".<br />\r\n                         Su nueva clave es: <strong>s3hLz7lP<strong><br />Ingrese al sistema y proceda a cambiarla por una propia.','default','default',NULL,'[]','[]','Enviado',0,NULL);
/*!40000 ALTER TABLE `msg_mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_notifications`
--

DROP TABLE IF EXISTS `msg_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `read` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `msg_notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_notifications`
--

LOCK TABLES `msg_notifications` WRITE;
/*!40000 ALTER TABLE `msg_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_notifications_messages`
--

DROP TABLE IF EXISTS `msg_notifications_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_notifications_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `model` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `model` (`model`,`action`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `msg_notifications_messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_notifications_messages`
--

LOCK TABLES `msg_notifications_messages` WRITE;
/*!40000 ALTER TABLE `msg_notifications_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_notifications_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_notifications_users`
--

DROP TABLE IF EXISTS `msg_notifications_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_notifications_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notificacion_id` (`notification_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `read` (`read`),
  CONSTRAINT `msg_notifications_users_ibfk_3` FOREIGN KEY (`notification_id`) REFERENCES `msg_notifications` (`id`),
  CONSTRAINT `msg_notifications_users_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_notifications_users`
--

LOCK TABLES `msg_notifications_users` WRITE;
/*!40000 ALTER TABLE `msg_notifications_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_notifications_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_servers`
--

DROP TABLE IF EXISTS `msg_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_servers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  `responder` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`,`cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_servers`
--

LOCK TABLES `msg_servers` WRITE;
/*!40000 ALTER TABLE `msg_servers` DISABLE KEYS */;
INSERT INTO `msg_servers` VALUES (1,'2015-06-29 15:34:03','2015-06-29 19:26:53','Activo','SMTP','Si','smtp.gmail.com',587,'hpstorecomunity@gmail.com','sinapsistrade','hpstorecomunity@gmail.com','Comunidad HP Store','');
/*!40000 ALTER TABLE `msg_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_personas`
--

DROP TABLE IF EXISTS `per_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_personas` (
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
  KEY `user_id` (`user_id`),
  CONSTRAINT `per_personas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `adm_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_personas`
--

LOCK TABLES `per_personas` WRITE;
/*!40000 ALTER TABLE `per_personas` DISABLE KEYS */;
INSERT INTO `per_personas` VALUES (9,'2013-07-04 14:59:53','2013-07-04 18:40:51','Si',0,4,'Federico','Bouzas','masculino','1989-01-13','federicobouzas@gmail.com',NULL,NULL,'Riglos',1135,'','Parque Chacabuco',7,'-34.6322479, -58.43478140000002'),(10,'2013-07-04 15:35:17','2013-07-16 14:50:10','Si',0,4,'Martin','','',NULL,'martin@asasl.com',NULL,NULL,'',NULL,'','',6,''),(11,'2013-07-12 16:53:26','2013-07-12 19:54:16','Si',0,4,NULL,NULL,NULL,NULL,'mtesta@buenosaires.gob.ar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'2013-07-12 16:53:26','2013-07-12 19:54:16','Si',0,4,NULL,NULL,NULL,NULL,'marianatdl@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'2013-07-12 16:53:26','2013-07-12 19:54:16','Si',0,4,NULL,NULL,NULL,NULL,'noexisteestacuenta@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2013-07-12 16:53:26','2013-07-12 19:54:16','Si',0,4,NULL,NULL,NULL,NULL,'noexisteestacuenta@noexisteestedominio.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'dafneberman@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'daniela.alvarez@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'dlauria@buenosaires.gob.ar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'florenciasole@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'flormasci@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'fmoralesgorleri@buenosaires.gob.ar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'gsallent@buenosaires.gob.ar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'juanplache@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'llucero@buenosaires.gob.ar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'manuriver8@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'mercedesfasciolo@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'mericasro@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'pcalvano@buenosaires.gob.ar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'yasminolid@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'2013-07-15 14:59:16','2013-07-15 17:59:21','Si',0,4,NULL,NULL,NULL,NULL,'acqua1980@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'2013-07-22 11:09:00','2013-07-22 14:09:21','Si',0,4,'','','',NULL,'federicobouzas2@gmail.com',NULL,NULL,'',NULL,'','',NULL,'-34.6037232, -58.38159310000003'),(31,'2013-07-24 11:16:59','0000-00-00 00:00:00','Si',0,4,'','','',NULL,'federicobouzas3@gmail.com',NULL,NULL,'',NULL,'','',NULL,''),(32,'2013-08-14 17:21:16','0000-00-00 00:00:00','Si',0,4,'','','',NULL,'federicobouzas2323@gmail.com',NULL,NULL,'',NULL,'','',NULL,'');
/*!40000 ALTER TABLE `per_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_personas_poblaciones`
--

DROP TABLE IF EXISTS `per_personas_poblaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_personas_poblaciones` (
  `persona_id` int(11) NOT NULL,
  `poblacion_id` int(11) NOT NULL,
  PRIMARY KEY (`persona_id`,`poblacion_id`),
  KEY `poblacion_id` (`poblacion_id`),
  CONSTRAINT `per_personas_poblaciones_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `per_personas` (`id`),
  CONSTRAINT `per_personas_poblaciones_ibfk_2` FOREIGN KEY (`poblacion_id`) REFERENCES `per_poblaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_personas_poblaciones`
--

LOCK TABLES `per_personas_poblaciones` WRITE;
/*!40000 ALTER TABLE `per_personas_poblaciones` DISABLE KEYS */;
INSERT INTO `per_personas_poblaciones` VALUES (9,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(31,1),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2);
/*!40000 ALTER TABLE `per_personas_poblaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_poblaciones`
--

DROP TABLE IF EXISTS `per_poblaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_poblaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activa` varchar(20) NOT NULL DEFAULT 'Si',
  `user_id` int(10) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pob_nombre` (`nombre`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_poblaciones`
--

LOCK TABLES `per_poblaciones` WRITE;
/*!40000 ALTER TABLE `per_poblaciones` DISABLE KEYS */;
INSERT INTO `per_poblaciones` VALUES (1,'2013-07-04 14:04:48','2013-07-04 17:05:04','Si',4,'Secretarios'),(2,'2013-07-04 14:04:55','0000-00-00 00:00:00','Si',4,'Ministros'),(3,'2013-08-13 17:09:30','0000-00-00 00:00:00','Si',4,'1'),(4,'2013-08-14 17:23:51','0000-00-00 00:00:00','Si',4,'123');
/*!40000 ALTER TABLE `per_poblaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_poblaciones_rols`
--

DROP TABLE IF EXISTS `per_poblaciones_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_poblaciones_rols` (
  `poblacion_id` int(10) NOT NULL,
  `rol_id` int(10) NOT NULL,
  PRIMARY KEY (`poblacion_id`,`rol_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `per_poblaciones_rols_ibfk_1` FOREIGN KEY (`poblacion_id`) REFERENCES `per_poblaciones` (`id`),
  CONSTRAINT `per_poblaciones_rols_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `adm_rols` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_poblaciones_rols`
--

LOCK TABLES `per_poblaciones_rols` WRITE;
/*!40000 ALTER TABLE `per_poblaciones_rols` DISABLE KEYS */;
/*!40000 ALTER TABLE `per_poblaciones_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_bans`
--

DROP TABLE IF EXISTS `sys_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_bans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_bans`
--

LOCK TABLES `sys_bans` WRITE;
/*!40000 ALTER TABLE `sys_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_bloqueos`
--

DROP TABLE IF EXISTS `sys_bloqueos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_bloqueos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  `model` varchar(50) NOT NULL,
  `model_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_bloqueos_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_bloqueos`
--

LOCK TABLES `sys_bloqueos` WRITE;
/*!40000 ALTER TABLE `sys_bloqueos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_bloqueos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_compilations`
--

DROP TABLE IF EXISTS `sys_compilations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_compilations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `md5` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_compilations`
--

LOCK TABLES `sys_compilations` WRITE;
/*!40000 ALTER TABLE `sys_compilations` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_compilations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_configurations`
--

DROP TABLE IF EXISTS `sys_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_configurations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  `version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_configurations`
--

LOCK TABLES `sys_configurations` WRITE;
/*!40000 ALTER TABLE `sys_configurations` DISABLE KEYS */;
INSERT INTO `sys_configurations` VALUES (1,'2015-06-29 19:02:45','Sinapsis Trade','','','noreply@eideos.com.ar','elearning','Plataforma E-Learning',1,NULL,1,1,'0.1');
/*!40000 ALTER TABLE `sys_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_crons`
--

DROP TABLE IF EXISTS `sys_crons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_crons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `clase_shell` varchar(100) NOT NULL,
  `fecha_ultima_ejecucion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clase_shell` (`clase_shell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_crons`
--

LOCK TABLES `sys_crons` WRITE;
/*!40000 ALTER TABLE `sys_crons` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_crons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_estados`
--

DROP TABLE IF EXISTS `sys_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_estados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `valor` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_estados`
--

LOCK TABLES `sys_estados` WRITE;
/*!40000 ALTER TABLE `sys_estados` DISABLE KEYS */;
INSERT INTO `sys_estados` VALUES (1,'enviando_emails','0');
/*!40000 ALTER TABLE `sys_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_files`
--

DROP TABLE IF EXISTS `sys_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `model` varchar(100) NOT NULL,
  `model_id` int(10) NOT NULL,
  `file` varchar(100) NOT NULL,
  `name` varchar(500) NOT NULL,
  `type` varchar(100) NOT NULL,
  `size` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_files`
--

LOCK TABLES `sys_files` WRITE;
/*!40000 ALTER TABLE `sys_files` DISABLE KEYS */;
INSERT INTO `sys_files` VALUES (6,'2015-06-18 14:42:56','2015-06-18 17:42:56','Noticia',3,'d104615de348ca3b4b54af4c8cefe419.jpg','308x168_1c500cfcda33bcccbf112e58e170a14c23fd7a6d.jpg','image/jpeg',9760),(12,'2015-06-18 15:00:13','2015-06-18 18:00:13','AppUser',6,'43cdc12285792205e7de16857f13322e.jpg','avatar.jpg','image/jpeg',3159),(16,'2015-06-22 13:17:12','2015-06-22 16:17:12','AppUser',1,'e7b5a46bf091014e93752a079a095be1.jpg','avatar2.jpg','image/jpeg',91493),(17,'2015-06-24 10:42:58','2015-06-24 13:43:06','AppUser',1,'e7b5a46bf091014e93752a079a095be1.jpg','avatar2.jpg','image/jpeg',91493),(18,'2015-06-24 10:43:30','2015-06-24 13:43:37','AppUser',6,'43cdc12285792205e7de16857f13322e.jpg','avatar.jpg','image/jpeg',3159),(19,'2015-06-24 10:43:43','2015-06-24 13:43:50','AppUser',6,'43cdc12285792205e7de16857f13322e.jpg','avatar.jpg','image/jpeg',3159),(24,'2015-06-29 16:29:47','2015-06-29 19:29:46','AppUser',6,'43cdc12285792205e7de16857f13322e.jpg','avatar.jpg','image/jpeg',3159),(25,'2015-06-29 16:33:40','2015-06-29 19:33:39','AppUser',6,'43cdc12285792205e7de16857f13322e.jpg','avatar.jpg','image/jpeg',3159),(26,'2015-06-30 11:08:04','2015-06-30 14:08:02','AppUser',6,'43cdc12285792205e7de16857f13322e.jpg','avatar.jpg','image/jpeg',3159),(27,'2015-06-30 12:03:56','2015-06-30 15:03:54','AppUser',6,'43cdc12285792205e7de16857f13322e.jpg','avatar.jpg','image/jpeg',3159),(28,'2015-07-01 12:33:52','2015-07-01 15:33:48','Evaluacion',1,'60b04128146fe6a06f459abb82d7ef24.png','EvModulo1.png','image/png',1544356),(29,'2015-07-08 14:21:57','2015-07-08 17:21:57','AppUser',27,'2b4589f3ebaf08513d042205ab359459.jpg','avatar2.jpg','image/jpeg',91493),(30,'2015-07-10 14:32:30','2015-07-10 17:32:30','AppUser',32,'dad2f4d160a161c8076c2c9a459ff2fe.jpg','avatar.jpg','image/jpeg',3159),(31,'2015-07-10 15:27:56','2015-07-10 18:27:53','AppUser',33,'b8a414738bca82a4f0584d7d7036910f.jpg','foto.jpg','image/jpeg',6746),(32,'2015-07-10 16:00:03','2015-07-10 19:00:00','AppUser',34,'2a9c852991ad13eb8f6107971aeac12b.jpg','hinchada.jpg','image/jpeg',1043804),(33,'2015-07-10 16:07:27','2015-07-10 19:07:24','AppUser',35,'[{\"name\":\"foto.jpg\",\"type\":\"image\\/jpeg\",\"size\":6746,\"file\":\"b33fda7cb55cd1c7ca041ab5a0f83ffb.jpg\"}]','foto.jpg','image/jpeg',6746),(34,'2015-07-14 10:29:51','2015-07-14 13:29:56','AppUser',37,'[{\"name\":\"Imagen32.jpg\",\"type\":\"image\\/jpeg\",\"size\":56064,\"file\":\"119058fa81961a0c82796da48252fa94.j','Imagen32.jpg','image/jpeg',56064),(35,'2015-07-14 10:30:36','2015-07-14 13:30:41','AppUser',37,'119058fa81961a0c82796da48252fa94.jpg','Imagen32.jpg','image/jpeg',56064),(36,'2015-07-14 14:19:36','2015-07-14 17:19:40','Noticia',10,'[{\"name\":\"T-HewlettPackardEnterpriseFilesForm10_600x385--C-tcm227-2023388--CT-tcm227-1085601-32.jpg\"','T-HewlettPackardEnterpriseFilesForm10_600x385--C-tcm227-2023388--CT-tcm227-1085601-32.jpg','image/jpeg',45384),(37,'2015-07-14 14:20:58','2015-07-14 17:21:02','Noticia',11,'[{\"name\":\"images.jpg\",\"type\":\"image\\/jpeg\",\"size\":6375,\"file\":\"998b660b704517219da7820650033d59.jpg\"','images.jpg','image/jpeg',6375),(38,'2015-07-14 14:21:47','2015-07-14 17:21:51','Noticia',12,'[{\"name\":\"descarga.jpg\",\"type\":\"image\\/jpeg\",\"size\":6231,\"file\":\"7be85aa855f6567f31e8f7f61d448833.jp','descarga.jpg','image/jpeg',6231),(39,'2015-07-14 14:22:54','2015-07-14 17:22:59','Noticia',13,'[{\"name\":\"descarga (1).jpg\",\"type\":\"image\\/jpeg\",\"size\":9513,\"file\":\"d2a0a05d3b433db106ca7bb487d57aa','descarga (1).jpg','image/jpeg',9513),(40,'2015-07-14 14:23:49','2015-07-14 17:23:54','Noticia',14,'[{\"name\":\"descarga (2).jpg\",\"type\":\"image\\/jpeg\",\"size\":9211,\"file\":\"98374d4203d8dd532d01723555f28aa','descarga (2).jpg','image/jpeg',9211),(41,'2015-07-14 14:24:52','2015-07-14 17:24:56','Noticia',15,'[{\"name\":\"AM_HP_Sprout-3D-Capture-Stage625.jpg\",\"type\":\"image\\/jpeg\",\"size\":75886,\"file\":\"f9705d2e85','AM_HP_Sprout-3D-Capture-Stage625.jpg','image/jpeg',75886),(42,'2015-07-14 14:26:08','2015-07-14 17:26:12','Noticia',16,'[{\"name\":\"new-headquarters.jpg\",\"type\":\"image\\/jpeg\",\"size\":63877,\"file\":\"4433b1cf61e8f33892fa4c6a0f','new-headquarters.jpg','image/jpeg',63877),(43,'2015-07-14 14:27:23','2015-07-14 17:27:27','Noticia',17,'[{\"name\":\"descarga (3).jpg\",\"type\":\"image\\/jpeg\",\"size\":7491,\"file\":\"8dc72bf4bc8633c45bb15afb324eabf','descarga (3).jpg','image/jpeg',7491),(44,'2015-07-14 14:43:35','2015-07-14 17:43:35','Noticia',2,'[{\"original\":\"d27f0e0862ef806756550205505d0085.png\",\"name\":\"d27f0e0862ef806756550205505d0085.png\",\"t','d27f0e0862ef806756550205505d0085.png','image/png',186744),(45,'2015-07-14 14:45:19','2015-07-14 17:45:19','Noticia',7,'[{\"original\":\"b62e781d3f0e1d0280683ba2afc84a70.png\",\"name\":\"b62e781d3f0e1d0280683ba2afc84a70.png\",\"t','b62e781d3f0e1d0280683ba2afc84a70.png','image/png',198022),(46,'2015-07-14 14:45:32','2015-07-14 17:45:32','Noticia',8,'[{\"original\":\"a094ec25aca5f95bd48ffe22bf696400.jpg\",\"name\":\"a094ec25aca5f95bd48ffe22bf696400.jpg\",\"t','a094ec25aca5f95bd48ffe22bf696400.jpg','image/jpeg',20419),(47,'2015-07-14 14:45:43','2015-07-14 17:45:43','Noticia',9,'[{\"original\":\"4d371e3bf4be8bd044d175acdab40dcd.jpg\",\"name\":\"4d371e3bf4be8bd044d175acdab40dcd.jpg\",\"t','4d371e3bf4be8bd044d175acdab40dcd.jpg','image/jpeg',16657),(48,'2015-07-21 15:48:43','2015-07-21 18:48:43','Evaluacion',1,'c159a63000355c8723fc79e2501c47f7.mp4','oceans-clip.mp4','video/mp4',19448241),(49,'2015-07-21 15:48:58','2015-07-21 18:48:58','Evaluacion',1,'813e8cdac40a49331bd96eb565c0f625.jpg','avatar.jpg','image/jpeg',3159),(50,'2015-07-21 15:49:12','2015-07-21 18:49:12','Evaluacion',1,'319162cf1ab28be865fcc11b4293c306.mp4','oceans-clip.mp4','video/mp4',19448241);
/*!40000 ALTER TABLE `sys_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logins`
--

DROP TABLE IF EXISTS `sys_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logins`
--

LOCK TABLES `sys_logins` WRITE;
/*!40000 ALTER TABLE `sys_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logs`
--

DROP TABLE IF EXISTS `sys_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_carga` datetime NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `model_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `acc_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logs`
--

LOCK TABLES `sys_logs` WRITE;
/*!40000 ALTER TABLE `sys_logs` DISABLE KEYS */;
INSERT INTO `sys_logs` VALUES (1,'2015-06-12 14:49:01',1,'Configuration','edit',1),(2,'2015-06-12 14:49:06',1,'Configuration','edit',1),(3,'2015-06-12 14:49:10',1,'Configuration','edit',1),(4,'2015-06-12 14:49:24',1,'Configuration','edit',1),(5,'2015-06-12 14:49:47',1,'Configuration','edit',1),(6,'2015-06-12 14:49:50',1,'Configuration','edit',1),(7,'2015-06-12 14:49:55',1,'Configuration','edit',1),(8,'2015-06-12 14:50:19',1,'Configuration','edit',1),(9,'2015-06-12 14:50:55',1,'Configuration','edit',1),(10,'2015-06-12 15:35:23',1,'Button','edit',1),(11,'2015-06-15 14:35:32',1,'Right','add',5),(12,'2015-06-15 14:41:06',1,'Bloqueo','delete',30),(13,'2015-06-15 14:41:09',1,'Bloqueo','delete',31),(14,'2015-06-15 14:41:11',1,'Bloqueo','delete',32),(15,'2015-06-15 14:41:13',1,'Bloqueo','delete',33),(16,'2015-06-15 14:41:15',1,'Bloqueo','delete',34),(17,'2015-06-15 15:03:16',1,'Rol','edit',1),(18,'2015-06-15 15:07:50',1,'Rol','edit',1),(19,'2015-06-15 15:07:59',1,'Rol','edit',1),(20,'2015-06-15 15:08:33',1,'Right','edit',5),(21,'2015-06-15 15:17:16',1,'Right','add',6),(22,'2015-06-15 15:17:42',1,'Rol','edit',1),(23,'2015-06-15 15:43:11',1,'Right','add',7),(24,'2015-06-15 15:43:24',1,'Rol','edit',1),(25,'2015-06-15 17:40:43',1,'Right','edit',5),(26,'2015-06-16 10:52:53',1,'Partner','add',0),(27,'2015-06-16 10:58:34',1,'Pais','add',247),(28,'2015-06-16 11:45:19',1,'Configuration','edit',1),(29,'2015-06-16 11:57:50',1,'Tienda','add',0),(30,'2015-06-16 12:01:25',1,'Tienda','add',0),(31,'2015-06-16 12:18:16',1,'Tienda','edit',1),(32,'2015-06-16 12:22:16',1,'Tienda','edit',1),(33,'2015-06-16 12:23:13',1,'Tienda','edit',1),(34,'2015-06-16 12:44:31',1,'Tienda','edit',1),(35,'2015-06-16 13:12:15',1,'Tienda','edit',1),(36,'2015-06-16 13:12:45',1,'Tienda','delete',1),(37,'2015-06-16 13:13:45',1,'Tienda','add',0),(38,'2015-06-16 13:16:03',1,'Tienda','add',2),(39,'2015-06-16 13:16:09',1,'Tienda','delete',2),(40,'2015-06-16 13:16:12',1,'Tienda','delete',1),(41,'2015-06-16 13:16:43',1,'Tienda','add',3),(42,'2015-06-16 13:36:55',1,'Tienda','edit',3),(43,'2015-06-16 15:50:00',1,'Permiso','edit',1),(44,'2015-06-16 15:51:37',1,'Right','edit',5),(45,'2015-06-16 15:51:57',1,'Right','edit',5),(46,'2015-06-17 11:21:29',1,'Right','edit',7),(47,'2015-06-17 11:24:38',1,'MensajeMuro','add',1),(48,'2015-06-17 11:25:40',1,'MensajeMuro','add',1),(49,'2015-06-17 11:25:51',1,'MensajeMuro','add',2),(50,'2015-06-17 11:57:10',1,'AppUser','edit',1),(51,'2015-06-17 12:13:34',1,'MensajeMuro','add',3),(52,'2015-06-17 13:21:32',1,'Tienda','edit',3),(53,'2015-06-17 13:34:48',1,'Tienda','edit',3),(54,'2015-06-17 14:58:49',1,'Rol','add',2),(55,'2015-06-17 14:59:06',1,'Rol','delete',2),(56,'2015-06-17 15:08:26',1,'AppUser','edit',1),(57,'2015-06-17 15:12:11',1,'AppUser','edit',1),(58,'2015-06-17 15:12:41',1,'AppUser','edit',1),(59,'2015-06-17 15:31:56',1,'AppUser','edit',1),(60,'2015-06-17 15:33:41',1,'AppUser','edit',1),(61,'2015-06-17 15:33:51',1,'AppUser','edit',1),(62,'2015-06-17 15:52:06',1,'Right','edit',5),(63,'2015-06-17 15:54:20',1,'Button','edit',1),(64,'2015-06-17 16:27:48',1,'AppUser','add',2),(65,'2015-06-17 16:28:19',1,'AppUser','add',3),(66,'2015-06-17 16:28:48',1,'AppUser','add',4),(67,'2015-06-17 16:28:58',1,'AppUser','delete',4),(68,'2015-06-17 16:29:00',1,'AppUser','delete',3),(69,'2015-06-17 16:29:02',1,'AppUser','delete',2),(70,'2015-06-17 16:32:34',1,'AppUser','add',5),(71,'2015-06-17 16:37:53',1,'AppUser','delete',5),(72,'2015-06-18 10:41:39',1,'Right','edit',5),(73,'2015-06-18 10:41:48',1,'Right','edit',6),(74,'2015-06-18 10:41:57',1,'Right','edit',7),(75,'2015-06-18 10:42:44',1,'Right','edit',5),(76,'2015-06-18 10:51:49',1,'AppUser','add',6),(77,'2015-06-18 11:16:19',1,'Right','edit',7),(78,'2015-06-18 11:37:29',1,'AppUser','add',7),(79,'2015-06-18 11:43:47',1,'Right','edit',5),(80,'2015-06-18 11:45:33',1,'AppUser','delete',7),(81,'2015-06-18 12:06:30',1,'Right','edit',6),(82,'2015-06-18 12:07:40',1,'AppUser','add',8),(83,'2015-06-18 12:08:05',1,'AppUser','edit',8),(84,'2015-06-18 12:35:28',1,'ArchivoBiblioteca','add',1),(85,'2015-06-18 12:39:13',1,'Nivel','add',1),(86,'2015-06-18 12:39:39',1,'Nivel','add',2),(87,'2015-06-18 12:39:44',1,'Nivel','add',3),(88,'2015-06-18 12:41:32',1,'ArchivoBiblioteca','edit',1),(89,'2015-06-18 12:44:54',1,'Noticia','add',2),(90,'2015-06-18 12:46:45',1,'Noticia','edit',2),(91,'2015-06-18 13:22:32',1,'ArchivoBiblioteca','edit',1),(92,'2015-06-18 13:27:35',1,'Noticia','add',3),(93,'2015-06-18 13:30:16',1,'Noticia','edit',3),(94,'2015-06-18 13:30:42',1,'Noticia','edit',3),(95,'2015-06-18 14:19:49',1,'Noticia','edit',3),(96,'2015-06-18 14:31:54',1,'Noticia','edit',3),(97,'2015-06-18 14:38:08',1,'Noticia','edit',3),(98,'2015-06-18 14:40:30',1,'Noticia','edit',3),(99,'2015-06-18 14:42:45',1,'Noticia','edit',3),(100,'2015-06-18 14:42:56',1,'Noticia','edit',3),(101,'2015-06-18 14:44:04',1,'Noticia','delete',3),(102,'2015-06-18 14:47:19',1,'Noticia','add',4),(103,'2015-06-18 14:47:41',1,'Noticia','edit',4),(104,'2015-06-18 14:49:03',1,'Noticia','edit',4),(105,'2015-06-18 14:49:12',1,'Noticia','delete',4),(106,'2015-06-18 14:50:01',1,'Noticia','add',5),(107,'2015-06-18 14:50:07',1,'Noticia','delete',5),(108,'2015-06-18 14:50:35',1,'Noticia','add',6),(109,'2015-06-18 14:50:59',1,'Noticia','delete',6),(110,'2015-06-18 14:57:57',1,'Encuesta','add',1),(111,'2015-06-18 15:00:13',1,'AppUser','edit',6),(112,'2015-06-18 15:26:12',1,'Right','add',8),(113,'2015-06-18 15:26:44',1,'Rol','edit',1),(114,'2015-06-18 16:29:42',1,'Right','edit',8),(117,'2015-06-19 14:37:30',1,'Noticia','add',7),(118,'2015-06-19 14:38:01',1,'Noticia','add',8),(119,'2015-06-19 14:38:35',1,'Noticia','add',9),(120,'2015-06-22 13:17:12',1,'AppUser','edit',1),(121,'2015-06-22 13:18:45',1,'Right','edit',8),(122,'2015-06-22 15:08:53',1,'Right','edit',8),(124,'2015-06-24 10:43:06',1,'AppUser','edit',1),(125,'2015-06-24 10:43:37',1,'AppUser','edit',6),(126,'2015-06-24 10:43:50',1,'AppUser','edit',6),(127,'2015-06-24 10:44:36',1,'AppUser','add',9),(128,'2015-06-24 15:01:31',1,'Right','edit',8),(129,'2015-06-29 12:49:14',1,'Noticia','edit',2),(130,'2015-06-29 12:49:40',1,'Noticia','edit',7),(131,'2015-06-29 12:52:18',1,'Noticia','edit',8),(132,'2015-06-29 12:52:24',1,'Noticia','edit',9),(133,'2015-06-29 15:34:02',1,'Server','add',1),(134,'2015-06-29 16:02:22',1,'Configuration','edit',1),(135,'2015-06-29 16:02:43',1,'Configuration','edit',1),(136,'2015-06-29 16:07:37',1,'Server','edit',1),(137,'2015-06-29 16:08:52',1,'Server','edit',1),(138,'2015-06-29 16:09:15',1,'Server','edit',1),(139,'2015-06-29 16:15:08',1,'Server','edit',1),(140,'2015-06-29 16:16:51',1,'Server','edit',1),(141,'2015-06-29 16:17:09',1,'Server','edit',1),(142,'2015-06-29 16:17:34',1,'Server','edit',1),(143,'2015-06-29 16:20:16',1,'Server','edit',1),(144,'2015-06-29 16:21:37',1,'Server','edit',1),(145,'2015-06-29 16:22:44',1,'Server','edit',1),(146,'2015-06-29 16:23:10',1,'Server','edit',1),(147,'2015-06-29 16:26:03',1,'Server','edit',1),(148,'2015-06-29 16:26:51',1,'Server','edit',1),(149,'2015-06-29 16:29:46',1,'AppUser','edit',6),(152,'2015-06-30 11:12:05',1,'MensajeMuro','add',22),(153,'2015-06-30 11:33:52',1,'MensajeMuro','delete',23),(155,'2015-06-30 12:03:54',1,'AppUser','edit',6),(156,'2015-06-30 16:05:29',NULL,'AppUser','add',14),(157,'2015-06-30 16:06:33',1,'Rol','add',3),(158,'2015-07-01 12:33:48',1,'Evaluacion','add',1),(159,'2015-07-02 12:33:56',1,'Partner','edit',1),(160,'2015-07-02 12:34:11',1,'Partner','edit',1),(161,'2015-07-02 12:35:51',1,'Partner','add',0),(162,'2015-07-02 12:35:59',1,'Partner','edit',1),(163,'2015-07-02 13:50:50',1,'Pais','add',247),(164,'2015-07-02 13:51:02',1,'Pais','delete',247),(165,'2015-07-02 13:52:24',1,'Partner','edit',1),(166,'2015-07-02 13:52:39',1,'Partner','edit',2),(167,'2015-07-02 14:14:25',1,'Tienda','add',4),(168,'2015-07-02 14:18:38',1,'AppUser','add',24),(169,'2015-07-02 15:03:29',1,'Rol','delete',3),(170,'2015-07-08 12:24:48',1,'AppUser','delete',24),(171,'2015-07-08 12:24:56',1,'AppUser','delete',14),(172,'2015-07-08 12:25:00',1,'AppUser','delete',25),(173,'2015-07-08 12:27:59',NULL,'AppUser','add',26),(174,'2015-07-08 12:31:42',1,'AppUser','edit',26),(175,'2015-07-08 14:21:57',NULL,'AppUser','add',27),(176,'2015-07-10 12:33:03',1,'AppUser','edit',1),(177,'2015-07-10 12:40:12',1,'AppUser','edit',1),(178,'2015-07-10 14:32:30',NULL,'AppUser','add',32),(179,'2015-07-10 14:34:23',1,'Button','add',2),(180,'2015-07-10 14:34:51',1,'Button','add',3),(181,'2015-07-10 14:34:54',1,'Button','edit',2),(182,'2015-07-10 14:35:21',1,'Button','add',4),(183,'2015-07-10 14:35:51',1,'Rol','edit',1),(184,'2015-07-10 14:38:05',1,'Button','add',5),(185,'2015-07-10 14:38:10',1,'Button','edit',1),(186,'2015-07-10 14:38:14',1,'Button','edit',2),(187,'2015-07-10 14:38:18',1,'Button','edit',3),(188,'2015-07-10 14:38:23',1,'Button','edit',4),(189,'2015-07-10 14:39:54',1,'Button','add',6),(190,'2015-07-10 14:40:34',1,'Button','add',7),(191,'2015-07-10 14:40:48',1,'Button','edit',6),(192,'2015-07-10 14:40:53',1,'Button','edit',5),(193,'2015-07-10 14:41:28',1,'Button','add',8),(194,'2015-07-10 14:41:53',1,'Button','add',9),(195,'2015-07-10 14:42:11',1,'Button','add',10),(196,'2015-07-10 14:42:28',1,'Button','add',11),(197,'2015-07-10 14:42:56',1,'Rol','edit',1),(198,'2015-07-10 15:27:53',NULL,'AppUser','add',33),(199,'2015-07-10 15:28:30',1,'AppUser','delete',33),(200,'2015-07-10 16:00:00',NULL,'AppUser','add',34),(201,'2015-07-10 16:07:24',NULL,'AppUser','add',35),(202,'2015-07-13 14:03:26',1,'Permiso','add',9),(203,'2015-07-13 14:05:10',1,'Permiso','add',10),(204,'2015-07-13 14:05:33',1,'Permiso','add',11),(205,'2015-07-13 14:05:37',1,'Permiso','edit',9),(206,'2015-07-13 14:05:44',1,'Permiso','edit',10),(207,'2015-07-13 14:16:28',1,'User','edit',1),(208,'2015-07-13 14:16:59',1,'User','edit',1),(209,'2015-07-13 14:23:03',NULL,'AppUser','add',36),(210,'2015-07-13 14:24:51',1,'AppUser','edit',36),(211,'2015-07-13 14:25:52',1,'User','edit',1),(212,'2015-07-13 14:26:54',1,'Permiso','edit',3),(215,'2015-07-13 14:50:01',1,'Bloqueo','delete',30),(216,'2015-07-14 10:27:27',1,'User','edit',1),(217,'2015-07-14 10:29:56',NULL,'AppUser','add',37),(218,'2015-07-14 10:30:41',1,'AppUser','edit',37),(220,'2015-07-14 14:19:40',1,'Noticia','add',10),(221,'2015-07-14 14:21:02',1,'Noticia','add',11),(222,'2015-07-14 14:21:51',1,'Noticia','add',12),(223,'2015-07-14 14:22:59',1,'Noticia','add',13),(224,'2015-07-14 14:23:54',1,'Noticia','add',14),(225,'2015-07-14 14:24:56',1,'Noticia','add',15),(226,'2015-07-14 14:26:12',1,'Noticia','add',16),(227,'2015-07-14 14:27:27',1,'Noticia','add',17),(228,'2015-07-14 14:43:35',1,'Noticia','edit',2),(229,'2015-07-14 14:45:19',1,'Noticia','edit',7),(230,'2015-07-14 14:45:32',1,'Noticia','edit',8),(231,'2015-07-14 14:45:43',1,'Noticia','edit',9),(232,'2015-07-21 15:47:32',1,'Evaluacion','edit',1),(233,'2015-07-21 15:47:45',1,'Evaluacion','edit',1),(234,'2015-07-21 15:48:43',1,'Evaluacion','edit',1),(235,'2015-07-21 15:48:58',1,'Evaluacion','edit',1),(236,'2015-07-21 15:49:12',1,'Evaluacion','edit',1),(237,'2015-07-22 12:03:32',NULL,'AppUser','add',38),(238,'2015-07-22 12:27:59',1,'Right','edit',6),(239,'2015-07-22 12:28:26',1,'Right','edit',6),(240,'2015-07-22 12:33:47',1,'CategoriaArchivoBiblioteca','add',1),(241,'2015-07-22 12:37:50',1,'ArchivoBiblioteca','edit',1),(242,'2015-07-22 12:41:26',1,'ArchivoBiblioteca','edit',1),(243,'2015-07-22 12:46:03',1,'ArchivoBiblioteca','edit',1),(244,'2015-08-10 23:08:23',1,'User','delete',38),(245,'2015-08-10 23:08:26',1,'User','delete',37),(246,'2015-08-10 23:08:30',1,'User','delete',36),(247,'2015-08-10 23:08:34',1,'User','delete',35),(248,'2015-08-10 23:08:37',1,'User','delete',34),(249,'2015-08-10 23:08:40',1,'User','delete',32),(250,'2015-08-10 23:08:42',1,'User','delete',6),(251,'2015-08-10 23:12:12',1,'Right','delete',7),(252,'2015-08-10 23:12:15',1,'Right','delete',8),(253,'2015-08-10 23:12:20',1,'Right','delete',6),(254,'2015-08-10 23:12:23',1,'Right','delete',5),(255,'2015-08-10 23:12:36',1,'Permiso','delete',11),(256,'2015-08-10 23:12:40',1,'Permiso','delete',10),(257,'2015-08-10 23:12:43',1,'Permiso','delete',9),(258,'2015-08-10 23:13:07',1,'Permiso','edit',1),(259,'2015-08-10 23:13:21',1,'Permiso','edit',3),(260,'2015-08-10 23:13:45',1,'Button','delete',2),(261,'2015-08-10 23:13:48',1,'Button','delete',3),(262,'2015-08-10 23:13:51',1,'Button','delete',4),(263,'2015-08-10 23:13:53',1,'Button','delete',5),(264,'2015-08-10 23:13:57',1,'Button','delete',6),(265,'2015-08-10 23:14:00',1,'Button','delete',7),(266,'2015-08-10 23:14:02',1,'Button','delete',8),(267,'2015-08-10 23:14:07',1,'Button','delete',9),(268,'2015-08-10 23:14:12',1,'Button','delete',10),(269,'2015-08-10 23:14:14',1,'Button','delete',11),(270,'2015-08-10 23:14:22',1,'Button','edit',1);
/*!40000 ALTER TABLE `sys_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-10 23:18:17
