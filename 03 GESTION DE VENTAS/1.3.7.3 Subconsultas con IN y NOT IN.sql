USE ventas_ejercicio;
-- 1.3.7.3 Subconsultas con IN y NOT IN

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT nombre,apellido1,apellido2,ciudad
FROM cliente
WHERE id_cliente NOT IN (
    SELECT id_cliente
    FROM pedido
);
-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
DESCRIBE comercial;

SELECT nombre,apellido1,apellido2
FROM comercial
WHERE id_comercial NOT IN (
    SELECT id_comercial
    FROM pedido
);