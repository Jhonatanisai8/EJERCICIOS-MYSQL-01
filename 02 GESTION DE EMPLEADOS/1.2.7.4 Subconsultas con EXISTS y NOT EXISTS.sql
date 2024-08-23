-- 1.2.7.4 Subconsultas con EXISTS y NOT EXISTS
-- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT 
nombre 
FROM departamento
WHERE EXISTS (
	SELECT 1 id_departamento 
    FROM empleado
    WHERE empleado.id_departamento = departamento.id_departamento
);
-- Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT 
nombre 
FROM departamento
WHERE NOT EXISTS (
	SELECT 1 id_departamento 
    FROM empleado
    WHERE empleado.id_departamento = departamento.id_departamento
);