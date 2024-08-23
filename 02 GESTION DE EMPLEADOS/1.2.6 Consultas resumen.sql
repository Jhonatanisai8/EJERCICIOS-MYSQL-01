USE empleados_ejercicio;

-- Calcula la suma del presupuesto de todos los departamentos.
SELECT 
SUM(presupuesto) AS SUMA_PRESUPUESTO
FROM departamento;
-- Calcula la media del presupuesto de todos los departamentos.
SELECT 
TRUNCATE(AVG(presupuesto),2) AS MEDIA_DE_PRESUPUESTO
FROM departamento;
-- Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT 
MIN(presupuesto) AS MINIMO_PRESUPUESTO
FROM departamento;
-- Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto ASC
LIMIT 1;
-- Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT 
MAX(presupuesto) AS MINIMO_PRESUPUESTO
FROM departamento;
-- Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto DESC
LIMIT 1;
-- Calcula el número total de empleados que hay en la tabla empleado.
SELECT 
COUNT(*) AS CANTIDAD_EMPLEADOS
FROM empleado;
-- Calcula el número de empleados que no tienen NULL en su segundo apellido.
SELECT 
COUNT(*) AS CANTIDAD_EMPLEADOS
FROM empleado 
WHERE apellido2 IS NOT NULL;
/*Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas,
 una con el nombre del departamento y otra con el número de empleados que tiene asignados.*/
 SELECT
 COUNT(id_empleado) AS CANTIDAD,
 departamento.nombre AS DEPARTAMENTO
 FROM empleado 
 LEFT JOIN departamento 
 ON empleado.id_departamento = departamento.id_departamento
 GROUP BY departamento.nombre;
 -- esta forma es mas optima
 SELECT
    departamento.nombre AS DEPARTAMENTO,
    COUNT(empleado.id_empleado) AS CANTIDAD
FROM departamento
LEFT JOIN empleado 
ON departamento.id_departamento = empleado.id_departamento
GROUP BY departamento.nombre;
/*Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas,
 una con el nombre del departamento y otra con el número de empleados que tiene asignados.*/
 SELECT
    departamento.nombre AS DEPARTAMENTO,
    COUNT(empleado.id_empleado) AS CANTIDAD
FROM departamento
LEFT JOIN empleado 
ON departamento.id_departamento = empleado.id_departamento
GROUP BY departamento.nombre
HAVING (count(empleado.id_empleado) > 2);
/*Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta 
consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.*/
SELECT
    departamento.nombre AS DEPARTAMENTO,
    COUNT(empleado.id_empleado) AS CANTIDAD
FROM departamento
LEFT JOIN empleado 
ON departamento.id_departamento = empleado.id_departamento
GROUP BY departamento.nombre;
/*Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen 
un presupuesto mayor a 200000 euros.*/
SELECT
    departamento.nombre AS DEPARTAMENTO,
    COUNT(empleado.id_empleado) AS CANTIDAD
FROM departamento
LEFT JOIN empleado 
ON departamento.id_departamento = empleado.id_departamento
GROUP BY departamento.nombre,departamento.presupuesto
HAVING ((departamento.presupuesto) > 200000);
/*Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta 
consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.*/
SELECT
    departamento.nombre AS DEPARTAMENTO,
    COUNT(empleado.id_empleado) AS CANTIDAD
FROM departamento
LEFT JOIN empleado 
ON  departamento.id_departamento = empleado.id_departamento
GROUP BY departamento.nombre;

