/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-08-28 15:39:51
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_logs
-- ----------------------------
INSERT INTO `tbl_logs` VALUES ('1', '3', 'Error', 'Controlado', 'System.Exception: Controlado\r\n   en MainWindow..ctor() en d:\\Proyectos\\mono\\Dashboard\\paySolution\\MainWindow.cs:línea 18', '2015-08-28 13:40:08');
INSERT INTO `tbl_logs` VALUES ('2', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:26:39');
INSERT INTO `tbl_logs` VALUES ('3', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:27:36');
INSERT INTO `tbl_logs` VALUES ('4', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:34:03');
INSERT INTO `tbl_logs` VALUES ('5', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:35:14');
INSERT INTO `tbl_logs` VALUES ('6', '3', 'Error', 'El puerto \'COM1_\' no existe.', 'System.IO.IOException: El puerto \'COM1_\' no existe.\r\n   en System.IO.Ports.InternalResources.WinIOError(Int32 errorCode, String str)\r\n   en System.IO.Ports.InternalResources.WinIOError(String str)\r\n   en System.IO.Ports.SerialStream..ctor(String portName, Int32 baudRate, Parity parity, Int32 dataBits, StopBits stopBits, Int32 readTimeout, Int32 writeTimeout, Handshake handshake, Boolean dtrEnable, Boolean rtsEnable, Boolean discardNull, Byte parityReplace)\r\n   en System.IO.Ports.SerialPort.Open()\r\n   en paySolution.CnnPort.Open(String& message) en d:\\Proyectos\\mono\\Dashboard\\paySolution\\Classes\\CnnPort.cs:línea 33', '2015-08-28 15:35:21');

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
