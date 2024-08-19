USE empleados_ejercicio;
-- 1.2.4 Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT * FROM empleado
INNER JOIN departamento
ON empleado.id_departamento = departamento.id_departamento;
/*Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, 
en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por los apellidos 
y el nombre de los empleados.*/
SELECT * FROM empleado
INNER JOIN departamento
ON empleado.id_departamento = departamento.id_departamento 
ORDER BY departamento.nombre ASC, empleado.apellido1, empleado.apellido2, empleado.nombre;
-- Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT 
    departamento.id_departamento AS ID_DEPARTAMENTO,
    departamento.nombre AS NOMBRE
FROM departamento
INNER JOIN empleado
ON departamento.id_departamento = empleado.id_departamento
GROUP BY departamento.id_departamento, departamento.nombre;
/*Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone, 
solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando 
al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).*/
SELECT 
departamento.id_departamento AS ID_DEPARTAMENTO,
departamento.nombre AS DEPARTAMENTO,
(departamento.presupuesto-departamento.gastos) AS PRESUPUESTO_ACTUAL
FROM departamento 
INNER JOIN empleado
ON departamento.id_departamento = empleado.id_departamento;
-- Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT departamento.nombre 
FROM departamento 
INNER JOIN empleado 
ON departamento.id_departamento = empleado.id_departamento
WHERE empleado.nif = '38382980M';
-- Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT departamento.nombre 
FROM departamento 
INNER JOIN empleado 
ON departamento.id_departamento = empleado.id_departamento
WHERE empleado.nombre = 'Pepe' AND empleado.apellido1 = 'Ruiz' AND empleado.apellido2 = 'Santana';
-- Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT * FROM empleado
INNER JOIN departamento 
ON empleado.id_departamento = departamento.id_departamento
WHERE departamento.nombre like 'I+D';
/*Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. 
Ordena el resultado alfabéticamente.*/
SELECT * FROM empleado
INNER JOIN departamento 
ON empleado.id_departamento = departamento.id_departamento
WHERE departamento.nombre IN ('Sistemas','Contabilidad','I+D');
/*Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 
100000 y 200000 euros.*/
SELECT empleado.nombre FROM empleado
INNER JOIN departamento 
ON empleado.id_departamento = departamento.id_departamento
WHERE departamento.presupuesto NOT IN (100000,200000 );
/*Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. 
Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.*/
SELECT DISTINCT 
    departamento.nombre AS Nombre_Departamento
FROM departamento
INNER JOIN empleado 
ON departamento.id_departamento = empleado.id_departamento
WHERE empleado.apellido2 IS NULL;
-- DESCRIBE empleado;
SELECT * FROM departamento;
SELECT * FROM empleado;
-- DESCRIBE departamento;
