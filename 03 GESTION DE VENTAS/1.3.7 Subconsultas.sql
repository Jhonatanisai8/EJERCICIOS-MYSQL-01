USE ventas_ejercicio;
-- 1.3.7 Subconsultas
#1.3.7.1 Con operadores básicos de comparación
# Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
SELECT *
	FROM pedido
    WHERE id_cliente = (
		SELECT id_cliente
        FROM cliente
        WHERE 
        nombre = 'Adela'
        AND apellido1 = 'Salas'
        AND apellido2 = 'Díaz'
    );
# Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
SELECT
	COUNT(id_cliente) 
    FROM pedido 
    WHERE id_comercial = (
		SELECT 
        id_comercial
        FROM comercial
        WHERE 
        nombre = 'Daniel'
        AND apellido1 = 'Sáez'
        AND apellido2 = 'Vega'
    );
# Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
SELECT *
FROM cliente
WHERE id_cliente = (
    SELECT id_cliente
    FROM pedido
    WHERE total = (
        SELECT MAX(total)
        FROM pedido
        WHERE YEAR(fecha) = 2019
    )
    AND YEAR(fecha) = 2019
);
 # Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT 
    fecha,
    total
FROM  pedido
WHERE id_cliente = (
        SELECT id_cliente
        FROM cliente
        WHERE nombre = 'Pepe'
        AND apellido1 = 'Ruiz'
        AND apellido2 = 'Santana'
    )
AND total = (
        SELECT MIN(total)
        FROM pedido
        WHERE id_cliente = (
            SELECT id_cliente
            FROM cliente
            WHERE nombre = 'Pepe'
            AND apellido1 = 'Ruiz'
            AND apellido2 = 'Santana'
        )
    );
/*Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido 
durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.*/
SELECT 
    c.id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    p.id_pedido,
    p.fecha,
    p.total
FROM 
    cliente c,
    pedido p
WHERE 
    c.id_cliente = p.id_cliente
    AND YEAR(p.fecha) = 2017
    AND p.total >= (
        SELECT AVG(total)
        FROM pedido
        WHERE YEAR(fecha) = 2017
    );