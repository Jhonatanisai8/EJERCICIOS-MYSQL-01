-- 1.2.7.2 Subconsultas con ALL y ANY

/*Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. 
Sin hacer uso de MAX, ORDER BY ni LIMIT.*/
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto >= ALL (
    SELECT presupuesto
    FROM departamento
);
/*Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
 Sin hacer uso de MIN, ORDER BY ni LIMIT.*/
SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto <= ALL (
    SELECT presupuesto
    FROM departamento
);
/*Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).*/
SELECT  nombre 
FROM departamento 
WHERE id_departamento =  ANY (
	SELECT id_departamento
    FROM empleado
    WHERE  empleado.id_departamento = departamento.id_departamento
);
-- Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
SELECT  nombre 
FROM departamento 
WHERE id_departamento <>  ALL (
	SELECT id_departamento
    FROM empleado
    WHERE  empleado.id_departamento = departamento.id_departamento
);