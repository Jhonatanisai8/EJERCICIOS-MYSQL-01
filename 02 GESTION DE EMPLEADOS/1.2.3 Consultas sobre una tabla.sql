USE empleados_ejercicio;
#1.2.3 Consultas sobre una tabla
SHOW TABLES;
DESCRIBE departamento;
DESCRIBE empleado;
# Lista el primer apellido de todos los empleados.
SELECT apellido1 FROM empleado;
# Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido1 FROM empleado;
# Lista todas las columnas de la tabla empleado.
SELECT * FROM empleado;
# Lista el nombre y los apellidos de todos los empleados.
SELECT nombre,apellido1,apellido2 FROM empleado;
# Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT id_departamento FROM empleado;
 /*Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, 
 eliminando los identificadores que aparecen repetidos.*/
 SELECT  DISTINCT id_departamento FROM empleado;
# Lista el nombre y apellidos de los empleados en una única columna.
SELECT CONCAT(nombre," ",apellido1," ",apellido2 ) AS NOMBRE_APELLIDO  FROM empleado;
/*Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos 
los caracteres en mayúscula.*/
SELECT  upper(CONCAT(nombre," ",apellido1," ",apellido2) ) AS NOMBRE_APELLIDO  FROM empleado;
/*Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres 
en minúscula.*/
SELECT  lower(CONCAT(nombre," ",apellido1," ",apellido2) ) AS NOMBRE_APELLIDO  FROM empleado;
/*Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, 
una mostrará únicamente los dígitos del nif y la otra la letra.*/
SELECT 
SUBSTRING(nif, 1, 8) AS 'DIGITOS DEL NIF',
SUBSTRING(nif, 9, 1) AS 'LETRAS DEL NIF'
FROM empleado;
/*Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que 
restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). 
Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la 
nueva columna columna que está calculando.*/
SELECT nombre,presupuesto,gastos, (presupuesto-gastos) AS 'PRESUPUESTO ACTUAL' FROM departamento;
-- Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre,(presupuesto-gastos) AS 'PRESUPUESTO ACTUAL' FROM departamento ORDER BY (presupuesto-gastos) ASC ;
-- Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre FROM departamento ORDER BY nombre ASC;
-- Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre FROM departamento ORDER BY nombre DESC;
/*Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar 
sus apellidos y luego su nombre.*/
SELECT apellido1, apellido2, nombre
FROM empleado
ORDER BY apellido1, nombre ASC;
-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre AS DEPARTMENTO, 
presupuesto AS PRESUPUESTO
FROM departamento 
ORDER BY presupuesto DESC 
LIMIT 3;
-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre AS DEPARTMENTO, 
presupuesto AS PRESUPUESTO
FROM departamento 
ORDER BY presupuesto ASC 
LIMIT 3;
-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT nombre AS DEPARTMENTO, 
gasto AS GASTO
FROM departamento 
ORDER BY gasto DESC 
LIMIT 2;
-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
SELECT 
nombre AS 'DEPARTAMENTO',
gastos AS 'GASTOS'
FROM departamento
ORDER BY gastos 
LIMIT 2;
/* Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en 
la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.*/
SELECT * FROM departamento LIMIT 5 OFFSET 2;
/* Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un
 presupuesto mayor o igual a 150000 euros.*/
 SELECT
 nombre,presupuesto
 FROM departamento
 WHERE presupuesto >= 150000;
-- Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT 
nombre,gastos 
FROM departamento
WHERE gastos < 5000;
/*Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un
 presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.*/
 SELECT 
 nombre,presupuesto 
 FROM departamento 
 WHERE presupuesto >  100000 AND presupuesto < 200000;
/*Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
 Sin utilizar el operador BETWEEN.*/
SELECT nombre, presupuesto 
FROM departamento 
WHERE presupuesto <= 100000 OR presupuesto >= 200000;
/*Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. 
Utilizando el operador BETWEEN.*/
SELECT nombre, presupuesto 
FROM departamento 
WHERE presupuesto BETWEEN 100000 AND 200000  ;
/*Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
 Utilizando el operador BETWEEN.*/ 
SELECT nombre, presupuesto 
FROM departamento 
WHERE NOT presupuesto BETWEEN 100000 AND 200000;
/*Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos 
sean mayores que el presupuesto del que disponen.*/
SELECT 
nombre,gastos,presupuesto 
FROM departamento 
WHERE gastos > presupuesto;
/*Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los 
gastos sean menores que el presupuesto del que disponen.*/
SELECT 
nombre,gastos,presupuesto 
FROM departamento 
WHERE gastos < presupuesto;
/*Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean 
iguales al presupuesto del que disponen.*/
SELECT 
nombre,gastos,presupuesto 
FROM departamento 
WHERE gastos = presupuesto;
-- Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT * FROM empleado
WHERE apellido2 IS NULL;
-- Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT * FROM empleado
WHERE apellido2 IS NOT NULL;
-- Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT * FROM empleado 
WHERE apellido2 LIKE 'López';
-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT  * FROM empleado
WHERE apellido2 LIKE '%Díaz%' OR  apellido2 LIKE '%Moreno%';
-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT * FROM empleado
WHERE apellido2 IN ('Díaz','Moreno');
-- Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT 
nombre,apellido1,apellido2 
FROM empleado 
WHERE id_departamento = 3;
-- Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5
SELECT 
nombre,apellido1,apellido2
FROM empleado
WHERE id_departamento IN (2,4,5);
