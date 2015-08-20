/*
MySQL Backup
Source Server Version: 5.5.24
Source Database: dashboard
Date: 20/08/2015 15:08:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `tbl_bitacora`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Procedure definition for `insert_tbl_bitacora`
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