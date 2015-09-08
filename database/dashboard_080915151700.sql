/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-09-08 15:17:11
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_bitacora
-- ----------------------------
