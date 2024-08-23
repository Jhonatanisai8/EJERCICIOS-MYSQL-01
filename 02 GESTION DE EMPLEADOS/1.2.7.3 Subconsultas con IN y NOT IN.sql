USE empleados_ejercicio;
-- 1.2.7.3 Subconsultas con IN y NOT IN
-- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT nombre 
FROM departamento
WHERE id_departamento IN (
	SELECT DISTINCT 
    id_departamento 
    FROM empleado   
);
-- Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM departamento
WHERE id_departamento NOT IN (
    SELECT id_departamento
    FROM empleado
);
-- forma mas optima
SELECT d.nombre
FROM departamento d
LEFT JOIN empleado e ON d.id_departamento = e.id_departamento
WHERE e.id_departamento IS NULL;