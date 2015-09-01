/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-09-01 16:32:07
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_culturize
-- ----------------------------
INSERT INTO `ca_culturize` VALUES ('1', 'fecha', 'fecha', 'date', 'fecha', '2015-08-31 14:22:06', null);
INSERT INTO `ca_culturize` VALUES ('2', 'hora', 'hora', 'hour', 'hora', '2015-08-31 14:22:27', null);
INSERT INTO `ca_culturize` VALUES ('3', 'cajero', 'cajero', 'checker', 'cajero', '2015-08-31 14:23:06', null);
INSERT INTO `ca_culturize` VALUES ('4', 'aPagar', 'a pagar', 'to pay', 'a pagar', '2015-08-31 14:24:21', null);
INSERT INTO `ca_culturize` VALUES ('5', 'porPagar', 'por pagar', 'payable', 'por pagar', '2015-08-31 14:24:51', null);
INSERT INTO `ca_culturize` VALUES ('6', 'aDevolver', 'a devolver', 'to return', 'a devolver', '2015-08-31 14:25:13', null);

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
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  `id_application` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ca_parameters_ca_applications_1` (`id_application`),
  CONSTRAINT `fk_ca_parameters_ca_applications_1` FOREIGN KEY (`id_application`) REFERENCES `ca_applications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_parameters
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_bitacora
-- ----------------------------
INSERT INTO `tbl_bitacora` VALUES ('1', 'Detectar puerto', 'Puerto COM3', '2015-08-26 10:59:32', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('2', 'Detectar puerto', 'Puerto COM1', '2015-08-26 10:59:32', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('3', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:01:46', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('4', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:01:47', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('5', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:03:25', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('6', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:03:25', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('7', 'Auto abrir puerto', 'Puerto COM1', '2015-08-26 11:03:25', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('8', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:04:01', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('9', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:04:01', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('10', 'Auto abrir puerto', 'Puerto COM1', '2015-08-26 11:04:02', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('11', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:06:32', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('12', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:06:33', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('13', 'Auto abrir puerto', 'Puerto COM1', '2015-08-26 11:06:33', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('14', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:06:55', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('15', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:06:55', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('16', 'Auto abrir puerto', 'Puerto COM1', '2015-08-26 11:06:55', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('17', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:08:17', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('18', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:08:17', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('19', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:09:04', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('20', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:09:05', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('21', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:19:27', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('22', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:19:27', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('23', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:20:12', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('24', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:20:13', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('25', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:21:16', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('26', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:21:16', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('27', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:21:35', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('28', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:21:35', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('29', 'Auto abrir puerto', 'Puerto COM1', '2015-08-26 11:22:24', '', 'OK', '1');
INSERT INTO `tbl_bitacora` VALUES ('30', 'Auto abrir puerto', 'Puerto VIRTUAL', '2015-08-26 11:22:24', 'No se encontró el puerto disponible', 'ERROR', '1');
INSERT INTO `tbl_bitacora` VALUES ('31', 'Detectar puerto', 'Puerto COM3', '2015-08-26 11:22:39', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('32', 'Detectar puerto', 'Puerto COM1', '2015-08-26 11:22:39', '', 'OK', '2');
INSERT INTO `tbl_bitacora` VALUES ('33', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 14:41:35', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('34', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:01:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('35', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:22:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('36', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:24:46', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('37', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:25:05', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('38', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:25:27', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('39', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:25:55', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('40', 'Auto abrir puerto', 'Puerto COM1_', '2015-08-28 15:26:39', 'Error al intentar conectar [ El puerto \'COM1_\' no existe. ]', 'ERROR', '3');
INSERT INTO `tbl_bitacora` VALUES ('41', 'Auto abrir puerto', 'Puerto COM1_', '2015-08-28 15:27:36', 'Error al intentar conectar [ El puerto \'COM1_\' no existe. ]', 'ERROR', '3');
INSERT INTO `tbl_bitacora` VALUES ('42', 'Auto abrir puerto', 'Puerto COM1_', '2015-08-28 15:33:58', 'Error al intentar conectar [ El puerto \'COM1_\' no existe. ]', 'ERROR', '3');
INSERT INTO `tbl_bitacora` VALUES ('43', 'Auto abrir puerto', 'Puerto COM1_', '2015-08-28 15:35:14', 'Error al intentar conectar [ El puerto \'COM1_\' no existe. ]', 'ERROR', '3');
INSERT INTO `tbl_bitacora` VALUES ('44', 'Auto abrir puerto', 'Puerto COM1_', '2015-08-28 15:35:21', 'Error al intentar conectar [ El puerto \'COM1_\' no existe. ]', 'ERROR', '3');
INSERT INTO `tbl_bitacora` VALUES ('45', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:35:41', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('46', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:36:12', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('47', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:41:28', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('48', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:42:35', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('49', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:44:02', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('50', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:44:46', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('51', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:46:47', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('52', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:47:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('53', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:47:57', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('54', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:48:38', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('55', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:49:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('56', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:50:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('57', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:51:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('58', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:51:33', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('59', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:51:42', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('60', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:52:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('61', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:52:52', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('62', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:53:27', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('63', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:55:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('64', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:57:03', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('65', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:57:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('66', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:58:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('67', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 15:59:32', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('68', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:00:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('69', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:01:15', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('70', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:02:58', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('71', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:03:19', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('72', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:04:07', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('73', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:04:28', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('74', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:04:51', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('75', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:05:32', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('76', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:27:47', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('77', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:30:40', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('78', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:33:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('79', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:34:00', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('80', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:34:24', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('81', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:34:57', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('82', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:36:37', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('83', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:37:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('84', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:38:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('85', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:38:28', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('86', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:38:49', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('87', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:41:27', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('88', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:42:13', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('89', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:44:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('90', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:45:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('91', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:47:05', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('92', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:47:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('93', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:51:27', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('94', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:51:55', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('95', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:52:35', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('96', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:53:07', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('97', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:54:03', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('98', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:55:20', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('99', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:56:21', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('100', 'Auto abrir puerto', 'Puerto COM1', '2015-08-28 16:57:44', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('101', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 09:34:53', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('102', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:04:31', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('103', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:11:43', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('104', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:42:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('105', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:44:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('106', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:45:13', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('107', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:46:28', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('108', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:46:46', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('109', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:47:30', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('110', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:48:00', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('111', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 10:52:32', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('112', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 11:08:52', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('113', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 11:09:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('114', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 11:13:32', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('115', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 11:14:18', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('116', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 11:16:53', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('117', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 11:18:18', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('118', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 11:53:48', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('119', 'Auto abrir puerto', 'Puerto COM1', '2015-08-31 12:19:17', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('120', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 09:10:13', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('121', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 09:12:16', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('122', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 09:18:21', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('123', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 09:22:58', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('124', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 09:23:21', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('125', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:12:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('126', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:12:51', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('127', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:16:57', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('128', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:18:03', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('129', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:18:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('130', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:23:43', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('131', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:25:29', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('132', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:26:41', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('133', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 10:27:03', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('134', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 12:32:16', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('135', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 12:36:05', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('136', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 12:48:20', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('137', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 12:49:08', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('138', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 12:50:05', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('139', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 12:51:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('140', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:01:42', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('141', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:08:52', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('142', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:09:44', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('143', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:17:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('144', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:17:46', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('145', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:23:32', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('146', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:25:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('147', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:26:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('148', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:26:59', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('149', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:27:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('150', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:28:34', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('151', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:29:17', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('152', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:30:13', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('153', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:31:08', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('154', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:35:09', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('155', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:38:00', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('156', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:39:02', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('157', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:39:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('158', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:45:57', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('159', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:47:11', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('160', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:49:04', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('161', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:49:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('162', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:49:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('163', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:50:24', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('164', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:53:12', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('165', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:54:00', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('166', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:54:26', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('167', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:54:47', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('168', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 13:58:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('169', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:01:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('170', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:01:41', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('171', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:02:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('172', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:09:11', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('173', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:09:35', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('174', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:38:54', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('175', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:41:20', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('176', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:48:58', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('177', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:50:31', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('178', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:52:01', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('179', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:53:29', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('180', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:55:01', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('181', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:55:33', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('182', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:56:14', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('183', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 14:57:12', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('184', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:03:30', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('185', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:07:34', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('186', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:11:20', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('187', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:19:56', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('188', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:21:44', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('189', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:23:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('190', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:23:42', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('191', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:24:31', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('192', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:24:47', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('193', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:26:54', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('194', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:29:53', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('195', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:33:08', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('196', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:33:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('197', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:34:58', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('198', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:35:17', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('199', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:36:13', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('200', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:36:51', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('201', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:42:00', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('202', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:42:33', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('203', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:42:57', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('204', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:43:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('205', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:43:50', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('206', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:44:11', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('207', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:45:10', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('208', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:46:11', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('209', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:46:55', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('210', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:47:42', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('211', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:47:55', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('212', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:48:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('213', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:48:46', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('214', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:49:01', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('215', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:49:19', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('216', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:51:37', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('217', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:52:17', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('218', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:54:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('219', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:56:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('220', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 15:57:38', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('221', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:00:23', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('222', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:01:25', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('223', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:02:00', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('224', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:02:26', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('225', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:02:47', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('226', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:03:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('227', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:04:08', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('228', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:04:56', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('229', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:05:22', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('230', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:05:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('231', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:06:15', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('232', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:06:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('233', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:07:07', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('234', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:10:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('235', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:11:20', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('236', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:12:39', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('237', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:12:55', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('238', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:17:06', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('239', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:22:59', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('240', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:25:28', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('241', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:26:36', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('242', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:26:56', '', 'OK', '3');
INSERT INTO `tbl_bitacora` VALUES ('243', 'Auto abrir puerto', 'Puerto COM1', '2015-09-01 16:27:21', '', 'OK', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_logs
-- ----------------------------
INSERT INTO `tbl_logs` VALUES ('1', '3', 'Error', 'Controlado', 'System.Exception: Controlado\r\n   en MainWindow..ctor() en d:\\Proyectos\\mono\\Dashboard\\paySolution\\MainWindow.cs:línea 18', '2015-08-28 13:40:08');
INSERT INTO `tbl_logs` VALUES ('2', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:26:39');
INSERT INTO `tbl_logs` VALUES ('3', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:27:36');
INSERT INTO `tbl_logs` VALUES ('4', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:34:03');
INSERT INTO `tbl_logs` VALUES ('5', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:35:14');
INSERT INTO `tbl_logs` VALUES ('6', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:35:21');
INSERT INTO `tbl_logs` VALUES ('7', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 13:37:24');
INSERT INTO `tbl_logs` VALUES ('8', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 14:16:14');
INSERT INTO `tbl_logs` VALUES ('9', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:13:28');
INSERT INTO `tbl_logs` VALUES ('10', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:14:19');
INSERT INTO `tbl_logs` VALUES ('11', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:15:17');
INSERT INTO `tbl_logs` VALUES ('12', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:25:32');
INSERT INTO `tbl_logs` VALUES ('13', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:25:51');
INSERT INTO `tbl_logs` VALUES ('14', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:26:22');
INSERT INTO `tbl_logs` VALUES ('15', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:26:53');
INSERT INTO `tbl_logs` VALUES ('16', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:27:15');
INSERT INTO `tbl_logs` VALUES ('17', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:27:35');
INSERT INTO `tbl_logs` VALUES ('18', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3,\"1\")\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3,\"1\")\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:53:27');
INSERT INTO `tbl_logs` VALUES ('19', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3,\"2\")\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3,\"2\")\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:53:27');
INSERT INTO `tbl_logs` VALUES ('20', '3', 'Error', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \':\\Proyectos\\mono\\Dashboard\\paySolution\\bin\\Debug\\3)\' at line 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase.CallSp(String sp, String[] parameters) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 78', '2015-08-31 15:53:27');
INSERT INTO `tbl_logs` VALUES ('21', '3', 'Error', 'Incorrect number of arguments for PROCEDURE dashboard.pa_get_Idioms; expected 0, got 1', 'MySql.Data.MySqlClient.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE dashboard.pa_get_Idioms; expected 0, got 1\r\n   en MySql.Data.MySqlClient.MySqlStream.ReadPacket()\r\n   en MySql.Data.MySqlClient.NativeDriver.GetResult(Int32& affectedRow, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.GetResult(Int32 statementId, Int32& affectedRows, Int64& insertedId)\r\n   en MySql.Data.MySqlClient.Driver.NextResult(Int32 statementId, Boolean force)\r\n   en MySql.Data.MySqlClient.MySqlDataReader.NextResult()\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader(CommandBehavior behavior)\r\n   en MySql.Data.MySqlClient.MySqlCommand.ExecuteReader()\r\n   en paySolution.DataBase._CallSp(String sp, String[] parameters, Nullable`1 id_application, Boolean default_id_application) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\DataBase.cs:línea 97', '2015-09-01 12:32:15');

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
