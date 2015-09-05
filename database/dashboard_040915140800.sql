/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-09-04 14:08:50
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
INSERT INTO `ca_culturize` VALUES ('18', 'insertarTicket', 'inserte su ticket', 'insert your ticket', 'inserte su ticket', '2015-09-04 09:12:01', null);
INSERT INTO `ca_culturize` VALUES ('19', 'leyendoTicket', 'leyendo ticket', 'reading ticket', 'leyendo ticket', '2015-09-04 09:15:27', null);
INSERT INTO `ca_culturize` VALUES ('20', 'calculando', 'calculando', 'calculating', 'calculando', '2015-09-04 09:16:12', null);
INSERT INTO `ca_culturize` VALUES ('21', 'importe', 'importe', 'the amount', 'importe', '2015-09-04 09:16:43', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_bitacora
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_logs
-- ----------------------------

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
