/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-10-30 16:37:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ca_applications
-- ----------------------------
DROP TABLE IF EXISTS `ca_applications`;
CREATE TABLE `ca_applications` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `application` varchar(100) NOT NULL,
  `description` varchar(8000) DEFAULT NULL,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_applications
-- ----------------------------
INSERT INTO `ca_applications` VALUES ('1', 'inSolution', 'Entrada 1', '2015-08-26 10:41:03', null);
INSERT INTO `ca_applications` VALUES ('2', 'outSolution', 'Salida 1', '2015-08-26 10:41:16', null);
INSERT INTO `ca_applications` VALUES ('3', 'paySolution', 'Pagos Modulo 1', '2015-08-26 10:41:47', null);

-- ----------------------------
-- Table structure for ca_autoconnectports
-- ----------------------------
DROP TABLE IF EXISTS `ca_autoconnectports`;
CREATE TABLE `ca_autoconnectports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `portname` varchar(100) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `description` varchar(8000) DEFAULT NULL,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `fechahora_inactive` datetime DEFAULT NULL,
  `baudRate` int(11) DEFAULT NULL,
  `parity` varchar(10) DEFAULT NULL,
  `dataBits` int(11) DEFAULT NULL,
  `stopBits` varchar(20) DEFAULT NULL,
  `id_application` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ca_autoconnectports_ca_applications_1` (`id_application`),
  CONSTRAINT `fk_ca_autoconnectports_ca_applications_1` FOREIGN KEY (`id_application`) REFERENCES `ca_applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_autoconnectports
-- ----------------------------
INSERT INTO `ca_autoconnectports` VALUES ('3', 'COM1', '', 'Puerto de PC de escritorio', '2015-08-26 10:59:53', null, '\0', '2015-08-26 11:07:05', '9600', 'None', '8', 'One', '1');
INSERT INTO `ca_autoconnectports` VALUES ('4', 'COM1', '', 'Puerto de PC Escritorio', '2015-08-26 11:21:57', null, '', null, '9600', 'None', '8', 'One', '1');
INSERT INTO `ca_autoconnectports` VALUES ('5', 'VIRTUAL', '', 'Puerto virtual no disponible para testeo', '2015-08-26 11:22:11', null, '', null, '9600', 'None', '8', 'One', '1');
INSERT INTO `ca_autoconnectports` VALUES ('6', 'COM1', null, 'Puerto COM', '2015-08-28 14:05:45', null, '', null, '9600', 'None', '8', 'One', '3');

-- ----------------------------
-- Table structure for ca_culturize
-- ----------------------------
DROP TABLE IF EXISTS `ca_culturize`;
CREATE TABLE `ca_culturize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(1000) NOT NULL,
  `esp` text,
  `eng` text,
  `default` text,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_culturize
-- ----------------------------
INSERT INTO `ca_culturize` VALUES ('1', 'fecha', 'fecha', 'date', 'fecha', '2015-08-31 14:22:06', null);
INSERT INTO `ca_culturize` VALUES ('2', 'hora', 'hora', 'hour', 'hora', '2015-08-31 14:22:27', null);
INSERT INTO `ca_culturize` VALUES ('3', 'cajero', 'cajero', 'checker', 'cajero', '2015-08-31 14:23:06', null);
INSERT INTO `ca_culturize` VALUES ('4', 'aPagar', 'a pagar', 'to pay', 'a pagar', '2015-08-31 14:24:21', null);
INSERT INTO `ca_culturize` VALUES ('5', 'porPagar', 'por pagar', 'payable', 'por pagar', '2015-08-31 14:24:51', null);
INSERT INTO `ca_culturize` VALUES ('6', 'aDevolver', 'a devolver', 'to return', 'a devolver', '2015-08-31 14:25:13', null);
INSERT INTO `ca_culturize` VALUES ('7', 'introduzcaMonedas', 'introduzca monedas y/o billetes', 'insert coins and / or banknotes', 'introduzca monedas y/o billetes', '2015-09-02 12:28:34', null);
INSERT INTO `ca_culturize` VALUES ('8', 'pagoCompletado', 'pago completado', 'completed payment', 'pago completado', '2015-09-03 10:18:44', null);
INSERT INTO `ca_culturize` VALUES ('9', 'favorEsperar', 'espere un momento por favor', 'wait a moment please', 'espere un momento por favor', '2015-09-03 10:19:34', null);
INSERT INTO `ca_culturize` VALUES ('10', 'recogerCambio', 'favor de recoger su cambio', 'please pick up your change', 'favor de recoger su cambio', '2015-09-03 10:28:46', null);
INSERT INTO `ca_culturize` VALUES ('11', 'recogerTicket', 'favor de recoger su ticket', 'please pick up your ticket', 'favor de recoger su ticket', '2015-09-03 10:38:17', null);
INSERT INTO `ca_culturize` VALUES ('12', 'botonrecibo', 'favor de pulsar el botón para obtener su recibo', 'please press the button to get your receipt', 'favor de pulsar el botón para obtener su recibo', '2015-09-03 11:18:51', null);
INSERT INTO `ca_culturize` VALUES ('13', 'imprimiendoRecibo', 'imprimiendo recibo', 'receipt printing', 'imprimiendo recibo', '2015-09-03 11:20:28', null);
INSERT INTO `ca_culturize` VALUES ('14', 'gracias', 'gracias', 'thank you', 'gracias', '2015-09-03 13:08:08', null);
INSERT INTO `ca_culturize` VALUES ('15', 'tiempoSalir', 'tiempo para salir', 'time to go', 'tiempo para salir', '2015-09-03 13:08:35', null);
INSERT INTO `ca_culturize` VALUES ('16', 'recogerRecibo', 'favor de recoger su recibo', 'please pick up your receipt', 'favor de recoger su recibo', '2015-09-03 14:50:19', null);
INSERT INTO `ca_culturize` VALUES ('17', 'minutos', 'minutos', 'minutes', 'minutos', '2015-09-03 15:50:35', null);
INSERT INTO `ca_culturize` VALUES ('18', 'insertarTicket', 'inserta tu ticket', 'insert your ticket', 'inserte su ticket', '2015-09-04 09:12:01', null);
INSERT INTO `ca_culturize` VALUES ('19', 'leyendoTicket', 'leyendo ticket', 'reading ticket', 'leyendo ticket', '2015-09-04 09:15:27', null);
INSERT INTO `ca_culturize` VALUES ('20', 'calculando', 'calculando', 'calculating', 'calculando', '2015-09-04 09:16:12', null);
INSERT INTO `ca_culturize` VALUES ('21', 'importe', 'importe', 'the amount', 'importe', '2015-09-04 09:16:43', null);
INSERT INTO `ca_culturize` VALUES ('22', 'errorLecturaTicket', 'error al leer el ticket', 'error reading the ticket', 'error al leer el ticket', '2015-10-30 09:14:18', null);
INSERT INTO `ca_culturize` VALUES ('23', 'errorGeneral', 'ocurrió un problema', 'a problem occurred', 'ocurrió un problema, favor de intentarlo de nuevo', '2015-10-30 10:00:19', null);
INSERT INTO `ca_culturize` VALUES ('24', 'intentardeNuevo', 'favor de intentarlo de nuevo', 'please try again', 'favor de intentarlo de nuevo', '2015-10-30 10:10:05', null);
INSERT INTO `ca_culturize` VALUES ('25', 'aceptar', 'aceptar', 'accept', 'aceptar', '2015-10-30 14:40:24', null);
INSERT INTO `ca_culturize` VALUES ('26', 'cancelar', 'cancelar', 'cancel', 'cancelar', '2015-10-30 14:40:34', null);
INSERT INTO `ca_culturize` VALUES ('27', 'pensionvence', 'su pensión vence', 'your pension expires', 'su pensión vence', '2015-10-30 15:22:12', null);
INSERT INTO `ca_culturize` VALUES ('28', 'renovarmeses', 'renovar por meses', 'renewed for months', 'renovar por meses', '2015-10-30 15:23:08', null);
INSERT INTO `ca_culturize` VALUES ('29', 'totalpensionpagar', 'total a pagar', 'total to pay', 'total a pagar', '2015-10-30 15:24:11', null);
INSERT INTO `ca_culturize` VALUES ('30', 'pensionvencera', 'su pensión vencerá', 'his pension will expire', 'su pensión vencerá', '2015-10-30 15:24:59', null);
INSERT INTO `ca_culturize` VALUES ('31', 'bienvenido', 'bienvenido', 'wellcome', 'bienvenido', '2015-10-30 16:35:24', null);

-- ----------------------------
-- Table structure for ca_idioms_parameters
-- ----------------------------
DROP TABLE IF EXISTS `ca_idioms_parameters`;
CREATE TABLE `ca_idioms_parameters` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `param` varchar(100) NOT NULL,
  `val` varchar(1000) NOT NULL,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  `id_ca_idiom` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ca_idioms_parameters_ca_indioms_1` (`id_ca_idiom`),
  CONSTRAINT `fk_ca_idioms_parameters_ca_indioms_1` FOREIGN KEY (`id_ca_idiom`) REFERENCES `ca_indioms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_idioms_parameters
-- ----------------------------
INSERT INTO `ca_idioms_parameters` VALUES ('2', 'fecha', '{0:dd/MM/yyyy}', '2015-09-02 09:00:23', '0000-00-00 00:00:00', '1');
INSERT INTO `ca_idioms_parameters` VALUES ('3', 'hora', '{0:H:mm:ss}', '2015-09-02 09:00:54', '0000-00-00 00:00:00', '1');
INSERT INTO `ca_idioms_parameters` VALUES ('5', 'fecha', '{0:MM/dd/yyyy}', '2015-09-02 09:02:06', '0000-00-00 00:00:00', '2');
INSERT INTO `ca_idioms_parameters` VALUES ('6', 'hora', '{0:H:mm:ss}', '2015-09-02 09:02:26', '0000-00-00 00:00:00', '2');

-- ----------------------------
-- Table structure for ca_indioms
-- ----------------------------
DROP TABLE IF EXISTS `ca_indioms`;
CREATE TABLE `ca_indioms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `idioma` varchar(50) NOT NULL,
  `siglas` varchar(3) NOT NULL,
  `image_fileName` varchar(50) NOT NULL,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_indioms
-- ----------------------------
INSERT INTO `ca_indioms` VALUES ('1', 'español', 'esp', 'esp.png', '2015-09-01 11:35:54', null, '');
INSERT INTO `ca_indioms` VALUES ('2', 'inglés', 'eng', 'eng.png', '2015-09-01 11:36:00', null, '');
INSERT INTO `ca_indioms` VALUES ('3', 'francés', 'fra', 'fra.png', '2015-09-01 12:48:59', null, '\0');

-- ----------------------------
-- Table structure for ca_parameters
-- ----------------------------
DROP TABLE IF EXISTS `ca_parameters`;
CREATE TABLE `ca_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parameter` varchar(100) NOT NULL,
  `value` varchar(8000) NOT NULL,
  `description` varchar(8000) DEFAULT NULL,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  `id_application` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ca_parameters_ca_applications_1` (`id_application`),
  CONSTRAINT `fk_ca_parameters_ca_applications_1` FOREIGN KEY (`id_application`) REFERENCES `ca_applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_parameters
-- ----------------------------
INSERT INTO `ca_parameters` VALUES ('1', 'defaultLanguaje', 'esp', 'lenguaje por default', '2015-09-02 11:02:08', null, '3');
INSERT INTO `ca_parameters` VALUES ('3', 'tiempoSalida', '10', 'tiempo de salida del estacionamiento que se le dá al cliente y que será mostrado en la ventana de diálogo', '2015-09-03 13:10:50', null, '3');

-- ----------------------------
-- Table structure for tbl_bitacora
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bitacora`;
CREATE TABLE `tbl_bitacora` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accion` varchar(100) DEFAULT NULL,
  `mensaje` varchar(500) DEFAULT NULL,
  `fechahora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `detalle` text,
  `estado` varchar(100) DEFAULT NULL,
  `id_application` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_bitacora_ca_applications_1` (`id_application`),
  CONSTRAINT `fk_tbl_bitacora_ca_applications_1` FOREIGN KEY (`id_application`) REFERENCES `ca_applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_bitacora
-- ----------------------------
INSERT INTO `tbl_bitacora` VALUES ('1', 'Auto abrir puerto', 'Puerto COM1', '2015-09-08 15:29:57', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('2', 'Auto abrir puerto', 'Puerto COM1', '2015-09-08 15:30:31', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('3', 'Auto abrir puerto', 'Puerto COM1', '2015-09-08 15:31:34', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('4', 'Auto abrir puerto', 'Puerto COM1', '2015-09-08 15:34:56', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('5', 'Detectar puerto', 'Puerto COM3', '2015-09-12 14:11:58', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('6', 'Detectar puerto', 'Puerto COM1', '2015-09-12 14:11:59', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('7', 'Auto abrir puerto', 'Puerto COM1', '2015-09-12 14:11:59', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('8', 'Auto abrir puerto', 'Puerto VIRTUAL', '2015-09-12 14:11:59', 'No se encontró el puerto disponible', 'ERROR', '1');
INSERT INTO `tbl_bitacora` VALUES ('9', 'Enviar dato al puerto', 'Puerto COM1', '2015-09-12 14:12:33', 'Dato enviado al puerto [ a ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('10', 'Abrir puerto', 'Puerto COM3', '2015-09-12 14:12:53', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('11', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:13:03', 'Dato enviado al puerto [ a ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('12', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:13:23', 'Dato enviado al puerto [ @ ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('13', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:13:23', 'Dato recibido [ 64 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('14', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:14:13', 'Dato enviado al puerto [ ñ ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('15', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:14:13', 'Dato recibido [ 63 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('16', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:14:20', 'Dato recibido [ 63 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('17', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:14:32', 'Dato enviado al puerto [ j ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('18', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:14:32', 'Dato recibido [ 106 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('19', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:14:46', 'Dato enviado al puerto [ + ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('20', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:14:46', 'Dato recibido [ 43 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('21', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:16:58', 'Dato enviado al puerto [ L ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('22', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:17:18', 'Dato enviado al puerto [ @ ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('23', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:17:26', 'Dato enviado al puerto [ a ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('24', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:17:26', 'Dato recibido [ 97 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('25', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:32:45', 'Dato enviado al puerto [ @@@ ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('26', 'Enviar dato al puerto', 'Puerto COM3', '2015-09-12 14:33:20', 'Dato enviado al puerto [ asdq@ ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('27', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:33:20', 'Dato recibido [ 97 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('28', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:33:20', 'Dato recibido [ 115 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('29', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:33:20', 'Dato recibido [ 100 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('30', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:33:20', 'Dato recibido [ 113 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('31', 'Leer puerto', 'Puerto COM3', '2015-09-12 14:33:20', 'Dato recibido [ 64 ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('32', 'Detectar puerto', 'Puerto COM3', '2015-10-15 09:57:15', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('33', 'Detectar puerto', 'Puerto COM1', '2015-10-15 09:57:16', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('34', 'Auto abrir puerto', 'Puerto COM1', '2015-10-15 09:57:16', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('35', 'Auto abrir puerto', 'Puerto VIRTUAL', '2015-10-15 09:57:16', 'No se encontró el puerto disponible', 'ERROR', '1');
INSERT INTO `tbl_bitacora` VALUES ('36', 'Enviar dato al puerto', 'Puerto COM1', '2015-10-15 09:57:33', 'Dato enviado al puerto [ a ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('37', 'Abrir puerto', 'Puerto COM3', '2015-10-15 09:57:45', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('38', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 09:57:47', 'Dato enviado al puerto [ a ]', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('39', 'Cadena recibida', 'Puerto COM3', '2015-10-15 09:57:48', 'Cadena [ a ] ', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('40', 'Cerrar puerto', 'Puerto COM1', '2015-10-15 09:58:38', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('41', 'Cerrar puerto', 'Puerto COM3', '2015-10-15 09:58:40', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('42', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:01:48', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('43', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:01:48', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('44', 'Auto abrir puerto', 'Puerto COM1', '2015-10-15 10:01:49', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('45', 'Auto abrir puerto', 'Puerto VIRTUAL', '2015-10-15 10:01:49', 'No se encontró el puerto disponible', 'ERROR', '1');
INSERT INTO `tbl_bitacora` VALUES ('46', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:01:59', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('47', 'Cerrar puerto', 'Puerto COM1', '2015-10-15 10:02:02', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('48', 'Cerrar puerto', 'Puerto COM3', '2015-10-15 10:02:04', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('49', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:03:46', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('50', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:03:46', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('51', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:05:01', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('52', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:05:01', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('53', 'Abrir puerto', 'Puerto COM1', '2015-10-15 10:05:03', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('54', 'Enviar dato al puerto', 'Puerto COM1', '2015-10-15 10:05:05', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('55', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:05:10', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('56', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:05:12', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('57', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:05:12', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('58', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:15:22', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('59', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:15:22', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('60', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:15:25', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('61', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:28', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('62', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:29', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('63', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('64', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('65', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:29', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('66', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('67', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('68', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:29', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('69', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('70', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('71', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:29', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('72', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('73', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('74', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:29', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('75', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('76', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('77', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:29', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('78', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('79', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:29', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('80', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('81', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('82', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('83', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('84', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('85', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('86', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('87', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('88', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('89', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('90', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('91', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('92', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('93', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('94', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('95', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('96', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('97', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('98', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('99', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('100', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('101', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('102', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('103', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('104', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:30', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('105', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('106', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:30', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('107', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('108', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('109', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('110', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('111', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('112', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('113', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('114', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('115', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('116', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('117', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('118', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('119', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('120', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('121', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('122', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('123', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('124', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('125', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('126', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('127', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('128', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('129', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('130', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('131', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('132', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('133', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('134', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:31', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('135', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:31', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('136', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('137', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:32', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('138', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('139', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('140', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:32', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('141', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('142', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('143', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:32', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('144', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('145', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('146', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:32', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('147', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('148', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:32', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('149', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:33', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('150', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('151', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('152', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:33', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('153', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('154', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('155', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:33', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('156', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('157', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('158', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:33', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('159', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('160', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:33', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('161', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:33', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('162', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('163', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('164', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:34', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('165', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('166', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('167', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:34', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('168', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('169', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('170', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:34', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('171', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('172', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('173', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:34', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('174', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('175', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('176', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:34', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('177', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('178', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('179', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:34', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('180', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:34', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('181', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('182', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('183', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('184', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('185', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('186', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('187', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('188', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('189', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('190', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('191', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('192', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('193', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('194', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('195', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('196', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('197', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('198', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('199', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('200', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('201', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('202', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('203', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('204', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('205', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:35', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('206', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:35', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('207', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('208', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('209', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('210', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('211', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('212', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('213', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('214', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('215', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('216', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('217', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('218', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('219', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('220', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('221', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('222', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('223', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('224', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('225', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('226', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('227', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('228', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('229', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('230', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('231', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('232', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('233', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:36', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('234', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:36', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('235', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('236', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:37', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('237', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('238', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('239', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:37', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('240', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('241', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('242', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:37', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('243', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('244', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('245', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:37', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('246', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('247', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('248', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:37', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('249', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('250', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('251', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:37', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('252', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('253', 'Leer puerto', 'Puerto COM3', '2015-10-15 10:15:37', 'Dato recibido [ 112 ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('254', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:15:38', 'Cadena [ p ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('255', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:15:38', 'Dato enviado al puerto [ p ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('256', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:15:54', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('257', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:15:54', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('258', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:15:59', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('259', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:16:03', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('260', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:16:04', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('261', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:16:38', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('262', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:16:38', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('263', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:16:40', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('264', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:16:42', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('265', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:16:43', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('266', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:19:19', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('267', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:19:19', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('268', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:19:22', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('269', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:19:24', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('270', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:19:24', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('271', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:20:13', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('272', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:20:14', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('273', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:20:16', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('274', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:20:19', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('275', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:20:19', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('276', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:21:43', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('277', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:21:43', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('278', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:21:45', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('279', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:21:47', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('280', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:21:48', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('281', 'Detectar puerto', 'Puerto COM3', '2015-10-15 10:22:07', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('282', 'Detectar puerto', 'Puerto COM1', '2015-10-15 10:22:07', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('283', 'Abrir puerto', 'Puerto COM3', '2015-10-15 10:22:17', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('284', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:22:19', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('285', 'Cadena recibida', 'Puerto COM3', '2015-10-15 10:22:20', 'Cadena [ a ] ', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('286', 'Enviar dato al puerto', 'Puerto COM1', '2015-10-15 10:22:20', 'El puerto [ COM1 ] no se encuentra abierto o la comunicación ha sido interrumpida. Dato [ COM1 ] no enviado', 'ERROR', '2');
INSERT INTO `tbl_bitacora` VALUES ('287', 'Abrir puerto', 'Puerto COM1', '2015-10-15 10:22:35', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('288', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:22:37', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('289', 'Cerrar puerto', 'Puerto COM1', '2015-10-15 10:22:48', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('290', 'Enviar dato al puerto', 'Puerto COM3', '2015-10-15 10:22:50', 'Dato enviado al puerto [ a ]', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('291', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 13:40:42', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('292', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 13:41:18', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('293', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 13:41:45', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('294', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 13:42:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('295', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:08:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('296', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:08:46', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('297', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:11:09', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('298', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:11:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('299', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:13:10', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('300', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:13:18', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('301', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:13:53', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('302', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:14:30', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('303', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:15:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('304', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:15:33', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('305', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:16:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('306', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:20:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('307', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:21:10', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('308', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:39:17', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('309', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:43:01', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('310', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:43:15', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('311', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:44:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('312', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:45:14', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('313', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:50:24', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('314', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:51:24', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('315', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:54:17', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('316', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:54:45', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('317', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:54:59', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('318', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:56:02', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('319', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 14:58:19', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('320', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:30:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('321', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:35:12', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('322', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:36:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('323', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:37:21', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('324', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:37:42', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('325', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:38:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('326', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:38:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('327', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:38:59', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('328', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:39:43', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('329', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 15:50:28', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('330', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 16:03:00', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('331', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 16:03:26', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('332', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 16:27:49', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('333', 'Auto abrir puerto', 'Puerto COM1', '2015-10-29 16:29:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('334', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:03:43', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('335', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:05:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('336', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:16:21', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('337', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:17:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('338', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:17:29', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('339', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:18:08', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('340', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:23:33', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('341', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:24:02', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('342', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:25:26', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('343', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:26:02', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('344', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:35:52', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('345', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:52:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('346', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:53:09', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('347', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:53:51', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('348', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 09:54:45', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('349', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:09:01', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('350', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:10:40', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('351', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:11:45', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('352', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:12:13', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('353', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:14:35', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('354', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:21:12', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('355', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:21:35', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('356', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:22:17', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('357', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 10:22:49', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('358', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:33:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('359', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:34:41', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('360', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:34:58', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('361', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:37:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('362', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:39:12', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('363', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:39:59', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('364', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:40:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('365', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:45:19', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('366', 'Auto abrir puerto', 'Puerto COM1', '2015-10-30 11:46:30', '', 'OK', '3');

-- ----------------------------
-- Table structure for tbl_logs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_logs`;
CREATE TABLE `tbl_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_application` smallint(5) unsigned NOT NULL,
  `Level` varchar(100) DEFAULT NULL,
  `Message` text,
  `Exception` text,
  `DateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_logs_ca_applications_1` (`id_application`),
  CONSTRAINT `fk_tbl_logs_ca_applications_1` FOREIGN KEY (`id_application`) REFERENCES `ca_applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_logs
-- ----------------------------
INSERT INTO `tbl_logs` VALUES ('1', '3', 'Error', 'Error al leer ticket', 'System.Exception: Error al leer ticket\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 104', '2015-10-30 09:35:57');
INSERT INTO `tbl_logs` VALUES ('2', '3', 'Error', 'Error al leer ticket', 'System.Exception: Error al leer ticket\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 104', '2015-10-30 09:36:21');
INSERT INTO `tbl_logs` VALUES ('3', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 103', '2015-10-30 09:52:40');
INSERT INTO `tbl_logs` VALUES ('4', '3', 'Error', 'Error general controlado', 'System.Exception: Error general controlado\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 97', '2015-10-30 10:09:05');
INSERT INTO `tbl_logs` VALUES ('5', '3', 'Error', 'Error general controlado', 'System.Exception: Error general controlado\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 97', '2015-10-30 10:10:44');
INSERT INTO `tbl_logs` VALUES ('6', '3', 'Error', 'Error general controlado', 'System.Exception: Error general controlado\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 97', '2015-10-30 10:12:19');
INSERT INTO `tbl_logs` VALUES ('7', '3', 'Error', 'Error general controlado', 'System.Exception: Error general controlado\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 97', '2015-10-30 10:23:00');
INSERT INTO `tbl_logs` VALUES ('8', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 159\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 113\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:33:52');
INSERT INTO `tbl_logs` VALUES ('9', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 159\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 113\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:34:01');
INSERT INTO `tbl_logs` VALUES ('10', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 159\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 113\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:34:06');
INSERT INTO `tbl_logs` VALUES ('11', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.set_Status(payStatus value) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 159\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 113\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:34:13');
INSERT INTO `tbl_logs` VALUES ('12', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 114\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:45:22');
INSERT INTO `tbl_logs` VALUES ('13', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 114\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:45:25');
INSERT INTO `tbl_logs` VALUES ('14', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 114\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:45:29');
INSERT INTO `tbl_logs` VALUES ('15', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 114\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:45:33');
INSERT INTO `tbl_logs` VALUES ('16', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 114\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:45:34');
INSERT INTO `tbl_logs` VALUES ('17', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 114\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:45:34');
INSERT INTO `tbl_logs` VALUES ('18', '3', 'Error', 'Error al leer ticket', 'System.FieldAccessException: Error al leer ticket\r\n   en paySolution.payLogic.readTicket(String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 114\r\n   en paySolution.payLogic.LogicFlow(String Port, String dataInput) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Models\\payLogic.cs:línea 84', '2015-10-30 11:45:40');

-- ----------------------------
-- Procedure structure for pa_delete_AutoConnectPort
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_delete_AutoConnectPort`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_delete_AutoConnectPort`(IN _id_application smallint,IN _id int)
BEGIN
	UPDATE 
		ca_autoconnectports
	SET 
		active=false,
		fechahora_inactive = NOW()
	WHERE 
			id_application = _id_application
		AND
			id=_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_edit_AutoConnectPort
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_edit_AutoConnectPort`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_edit_AutoConnectPort`(IN _id_application smallint,IN _id int,IN _alias varchar (100),IN _description varchar (8000),IN _baudRate int,IN _parity varchar(10),IN _dataBits int,IN _stopBits varchar(20))
BEGIN
	UPDATE 
		ca_autoconnectports 
	SET 
		alias=_alias,
		description=_description,
		baudRate = _baudRate,
		parity = _parity,
		dataBits = _dataBits,
		stopBits = _stopBits,
		fechahora_act=NOW()
	WHERE 
			id_application = _id_application
		AND
			id=_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_ApplicationInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_ApplicationInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_ApplicationInfo`(IN `id_application` smallint)
BEGIN
	SELECT
		ca_applications.application,
		ca_applications.description
	FROM
		ca_applications
	WHERE
		ca_applications.id = id_application;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_ApplicationParameter
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_ApplicationParameter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_ApplicationParameter`(IN `id_application` smallint,IN `parameter` varchar (100))
BEGIN
	SELECT
		ca_parameters.`value`
	FROM
		ca_applications
	INNER JOIN 
		ca_parameters ON ca_parameters.id_application = ca_applications.id
	WHERE
		ca_applications.id = id_application
		AND
		ca_parameters.parameter = parameter;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_AutoConnectPorts
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_AutoConnectPorts`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_AutoConnectPorts`(IN _id_application smallint)
BEGIN
	SELECT		
		ca_autoconnectports.portname,
		ca_autoconnectports.alias,
		ca_autoconnectports.description,
		ca_autoconnectports.baudRate,
		ca_autoconnectports.parity,
		ca_autoconnectports.dataBits,
		ca_autoconnectports.stopBits,
		ca_autoconnectports.id
	FROM
		ca_autoconnectports
	WHERE
			id_application = _id_application
		AND
			ca_autoconnectports.active = TRUE ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_BitacoraByIdApplication
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_BitacoraByIdApplication`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_BitacoraByIdApplication`(IN `id_application` smallint)
BEGIN
	SELECT
		tbl_bitacora.id,
		tbl_bitacora.accion,
		tbl_bitacora.mensaje,
		tbl_bitacora.fechahora,
		tbl_bitacora.detalle,
		tbl_bitacora.estado
	FROM
		ca_applications
	INNER JOIN 
		tbl_bitacora ON tbl_bitacora.id_application = ca_applications.id
	WHERE
		ca_applications.id = id_application;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_BitacoraForAllApplications
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_BitacoraForAllApplications`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_BitacoraForAllApplications`()
BEGIN
	SELECT
		tbl_bitacora.id,
		tbl_bitacora.accion,
		tbl_bitacora.mensaje,
		tbl_bitacora.fechahora,
		tbl_bitacora.detalle,
		tbl_bitacora.estado
	FROM
		ca_applications
	INNER JOIN 
		tbl_bitacora ON tbl_bitacora.id_application = ca_applications.id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_culturize
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_culturize`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_culturize`(IN `id` smallint)
BEGIN
	SELECT
		ca_culturize.esp,
		ca_culturize.eng,
		ca_culturize.`default`
	FROM
		ca_culturize
	WHERE
		ca_culturize.id = id;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_culturizeParameter
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_culturizeParameter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_culturizeParameter`(IN `sigla` varchar (3),IN `param` varchar (100))
BEGIN
	SELECT
		ca_idioms_parameters.param,
		ca_idioms_parameters.val,
		ca_indioms.idioma,
		ca_indioms.siglas
	FROM
		ca_indioms
	INNER JOIN 
		ca_idioms_parameters ON ca_idioms_parameters.id_ca_idiom = ca_indioms.id
	WHERE
		ca_indioms.siglas = sigla
	  AND
		ca_idioms_parameters.param = param;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_Idioms
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_Idioms`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_Idioms`()
BEGIN
	SELECT
		ca_indioms.idioma,
		ca_indioms.siglas,
		ca_indioms.image_fileName
	FROM
		ca_indioms
	WHERE
		ca_indioms.activo = true;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_LogsbyIdApplication
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_LogsbyIdApplication`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_LogsbyIdApplication`(IN id_application smallint)
BEGIN
	SELECT
		tbl_logs.id,
		ca_applications.application,
		ca_applications.description,
		tbl_logs.`Level`,
		tbl_logs.Message,
		tbl_logs.Exception,
		tbl_logs.DateTime
	FROM
		ca_applications
	INNER JOIN 
		tbl_logs ON tbl_logs.id_application = ca_applications.id
	WHERE
		ca_applications.id = id_application;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_LogsForAllApplications
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_LogsForAllApplications`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_LogsForAllApplications`()
BEGIN
	SELECT
		tbl_logs.id,
		ca_applications.application,
		ca_applications.description,
		tbl_logs.`Level`,
		tbl_logs.Message,
		tbl_logs.Exception,
		tbl_logs.DateTime
	FROM
		ca_applications
	INNER JOIN 
		tbl_logs ON tbl_logs.id_application = ca_applications.id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_insert_AutoConnectPort
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_insert_AutoConnectPort`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insert_AutoConnectPort`(IN _id_application smallint,IN portname varchar (100),IN alias varchar (100),IN description varchar (8000),IN baudRate int,IN parity varchar(10),IN dataBits int,IN stopBits varchar(20))
BEGIN
	INSERT INTO 
		ca_autoconnectports 
		(
				id_application,
				portname,
				alias,
				description,
				baudRate,
				parity,
				dataBits,
				stopBits
		) 
	VALUES 
		(
				_id_application,
				portname,
				alias,
				description,
				baudRate,
				parity,
				dataBits,
				stopBits
		);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_insert_tbl_bitacora
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_insert_tbl_bitacora`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insert_tbl_bitacora`(IN _id_application smallint,IN accion varchar(100),
IN mensaje varchar(500),
IN detalle text,
IN estado varchar(100))
BEGIN
  INSERT INTO 
		tbl_bitacora
		(
			id_application,
			accion,
			mensaje,
			detalle,
			estado
		) 
	VALUES 
		(
			_id_application,
			accion,
			mensaje,
			detalle,
			estado
		);
END
;;
DELIMITER ;
