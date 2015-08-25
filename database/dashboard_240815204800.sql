/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-08-24 20:48:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ca_autoconnectports
-- ----------------------------
DROP TABLE IF EXISTS `ca_autoconnectports`;
CREATE TABLE `ca_autoconnectports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `portname` varchar(100) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `description` varchar(8000) DEFAULT NULL,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `fechahora_inactive` datetime DEFAULT NULL,
  `baudRate` int(11) DEFAULT NULL,
  `parity` varchar(10) DEFAULT NULL,
  `dataBits` int(11) DEFAULT NULL,
  `stopBits` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ca_parameters
-- ----------------------------
DROP TABLE IF EXISTS `ca_parameters`;
CREATE TABLE `ca_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parameter` varchar(100) NOT NULL,
  `value` varchar(8000) NOT NULL,
  `fechahora_ins` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechahora_act` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_bitacora
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bitacora`;
CREATE TABLE `tbl_bitacora` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accion` varchar(100) DEFAULT NULL,
  `mensaje` varchar(500) DEFAULT NULL,
  `fechahora` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `detalle` text,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_logs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_logs`;
CREATE TABLE `tbl_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Application` varchar(100) DEFAULT NULL,
  `Level` varchar(100) DEFAULT NULL,
  `Message` text,
  `Exception` text,
  `DateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for pa_delete_AutoConnectPort
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_delete_AutoConnectPort`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_delete_AutoConnectPort`(IN _id int)
BEGIN
	UPDATE 
		ca_autoconnectports
	SET 
		active=false,
		fechahora_inactive = NOW()
	WHERE id=_id;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_edit_AutoConnectPort
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_edit_AutoConnectPort`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_edit_AutoConnectPort`(IN _id int,IN _alias varchar (100),IN _description varchar (8000))
BEGIN
	UPDATE 
		ca_autoconnectports 
	SET 
		alias=_alias,
		description=_description,
		fechahora_act=NOW()
	WHERE id=_id;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_get_AutoConnectPorts
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_get_AutoConnectPorts`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_get_AutoConnectPorts`()
BEGIN
	SELECT		
		ca_autoconnectports.portname,
		ca_autoconnectports.alias,
		ca_autoconnectports.description,
		ca_autoconnectports.id
	FROM
		ca_autoconnectports
	WHERE
		ca_autoconnectports.active = TRUE ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_insert_AutoConnectPort
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_insert_AutoConnectPort`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insert_AutoConnectPort`(IN portname varchar (100),IN alias varchar (100),IN description varchar (8000))
BEGIN
	INSERT INTO ca_autoconnectports (portname,alias,description) VALUES (portname,alias,description);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pa_insert_tbl_bitacora
-- ----------------------------
DROP PROCEDURE IF EXISTS `pa_insert_tbl_bitacora`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insert_tbl_bitacora`(IN accion varchar(100),
IN mensaje varchar(500),
IN detalle text,
IN estado varchar(100))
BEGIN
  INSERT INTO tbl_bitacora(accion,mensaje,detalle,estado) VALUES (accion,mensaje,detalle,estado);
END
;;
DELIMITER ;
