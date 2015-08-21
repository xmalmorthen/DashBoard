/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-08-21 16:17:47
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for insert_tbl_bitacora
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_tbl_bitacora`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tbl_bitacora`(IN accion varchar(100),
IN mensaje varchar(500),
IN detalle text,
IN estado varchar(100))
BEGIN
  INSERT INTO tbl_bitacora(accion,mensaje,detalle,estado) VALUES (accion,mensaje,detalle,estado);
END
;;
DELIMITER ;
