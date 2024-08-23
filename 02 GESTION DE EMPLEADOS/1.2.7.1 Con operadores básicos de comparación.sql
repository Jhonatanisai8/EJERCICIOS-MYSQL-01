-- 1.2.7 Subconsultas
-- 1.2.7.1 Con operadores básicos de comparación
-- Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
SELECT * FROM empleado 
WHERE id_departamento = (
	SELECT id_departamento 
    FROM departamento 
    WHERE nombre = 'Sistemas'
);
-- Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT nombre 
FROM departamento 
WHERE presupuesto = (
	SELECT MAX(presupuesto)
    FROM departamento
);
-- Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT nombre,presupuesto 
FROM departamento 
WHERE presupuesto = (
	SELECT MIN(presupuesto)
    FROM departamento
);