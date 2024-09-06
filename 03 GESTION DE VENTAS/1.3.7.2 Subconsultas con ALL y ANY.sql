-- 1.3.7.2 Subconsultas con ALL y ANY
USE ventas_ejercicio;
-- Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.

SELECT total, fecha,
id_cliente,id_comercial
FROM pedido
WHERE total >= ALL (
    SELECT total
    FROM pedido
);
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT  nombre,apellido1,apellido2,ciudad
FROM  cliente
WHERE id_cliente <>  ALL (
	SELECT id_cliente
    FROM pedido
    WHERE  cliente.id_cliente = pedido.id_cliente
);
-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT * FROM comercial;
SELECT nombre,apellido1,apellido2,comision 
FROM comercial 
WHERE id_comercial <> ALL (
	SELECT id_comercial
    FROM pedido 
    WHERE comercial.id_comercial = pedido.id_comercial
);