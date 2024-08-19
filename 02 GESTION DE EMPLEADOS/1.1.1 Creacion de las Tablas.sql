CREATE DATABASE empleados_ejercicio CHARACTER SET utf8mb4;
Use empleados_ejercicio;

CREATE TABLE `empleado` (
	`id_empleado` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	`nif` VARCHAR(9) NOT NULL UNIQUE,
	`nombre` VARCHAR(45) NOT NULL,
	`apellido1` VARCHAR(55) NOT NULL,
	`apellido2` VARCHAR(50),
	`id_departamento` INTEGER UNSIGNED,
	PRIMARY KEY(`id_empleado`)
);


CREATE TABLE `departamento` (
	`id_departamento` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	`nombre` VARCHAR(255) NOT NULL UNIQUE,
	`presupuesto` DOUBLE NOT NULL,
	PRIMARY KEY(`id_departamento`)
);


ALTER TABLE `empleado`
ADD FOREIGN KEY(`id_departamento`) REFERENCES `departamento`(`id_departamento`)
ON UPDATE NO ACTION ON DELETE NO ACTION;

-- DESCRIBIMOS LAS TABLAS
DESCRIBE empleado;
