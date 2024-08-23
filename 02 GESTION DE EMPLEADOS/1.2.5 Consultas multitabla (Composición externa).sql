USE empleados_ejercicio;
-- 1.2.5 Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
SHOW TABLES;

/*Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
Este listado también debe incluir los empleados que no tienen ningún departamento asociado.*/
SELECT * FROM empleado 
LEFT JOIN departamento 
ON empleado.id_departamento = departamento.id_departamento;

-- para saber los departamentos que no tienen asociado ningun empleado
SELECT * FROM empleado 
RIGHT JOIN departamento 
ON empleado.id_departamento = departamento.id_departamento;
-- Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT * FROM empleado WHERE id_departamento IS NULL;
-- Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
SELECT departamento.*
FROM departamento
LEFT JOIN empleado
ON departamento.id_departamento = empleado.id_departamento
WHERE empleado.id_empleado IS NULL;
SELECT * FROM departamento;
SELECT DISTINCT id_departamento FROM empleado;
/*Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. 
Ordene el listado alfabéticamente por el nombre del departamento.*/
SELECT empleado.id_empleado, empleado.nombre AS nombre_empleado, 
       departamento.id_departamento, departamento.nombre AS nombre_departamento
FROM empleado
LEFT JOIN departamento
ON empleado.id_departamento = departamento.id_departamento
UNION
SELECT empleado.id_empleado, empleado.nombre AS nombre_empleado, 
       departamento.id_departamento, departamento.nombre AS nombre_departamento
FROM departamento
LEFT JOIN empleado
ON departamento.id_departamento = empleado.id_departamento
ORDER BY nombre_departamento;
/*Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que 
no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.*/
SELECT empleado.id_empleado, empleado.nombre AS nombre_empleado, 
       departamento.id_departamento, departamento.nombre AS nombre_departamento
FROM empleado
LEFT JOIN departamento
ON empleado.id_departamento = departamento.id_departamento
WHERE departamento.id_departamento IS NULL
UNION
SELECT empleado.id_empleado, empleado.nombre AS nombre_empleado, 
       departamento.id_departamento, departamento.nombre AS nombre_departamento
FROM departamento
LEFT JOIN empleado
ON departamento.id_departamento = empleado.id_departamento
WHERE empleado.id_empleado IS NULL
ORDER BY nombre_departamento;