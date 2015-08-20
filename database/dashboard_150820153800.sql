ALTER TABLE `dashboard`.`tbl_bitacora`DROP PRIMARY KEY;
ALTER TABLE `dashboard`.`tbl_logs`DROP PRIMARY KEY;

DROP TABLE `dashboard`.`tbl_bitacora` CASCADE;
DROP TABLE `dashboard`.`tbl_logs` CASCADE;

CREATE TABLE `dashboard`.`tbl_bitacora` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`accion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`mensaje` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`fechahora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
`detalle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`estado` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14;

CREATE TABLE `dashboard`.`tbl_logs` (
`id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
`Application` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`Level` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`Message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`Exception` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`DateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2;

