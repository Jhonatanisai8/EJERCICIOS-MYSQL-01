
USE ventas_ejercicio;
SHOW TABLES;
-- 1.3.5 Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
/*Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
Este listado también debe incluir los clientes que no han realizado ningún pedido. 
El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.*/
SELECT * FROM pedido;
SELECT 
cliente.id_cliente AS ID_CLIENTE,
cliente.nombre AS NOMBRE,
cliente.apellido1 AS APELLIDO1,
cliente.apellido2 AS APELLIDO2,
cliente.ciudad AS CIUDAD,
cliente.categoria AS CATEGORIA,
pedido.id_pedido AS ID_PEDIDO,
pedido.total AS TOTAL,
pedido.fecha AS FECHA,
pedido.id_cliente AS ID_CLIENTE,
pedido.id_comercial AS ID_COMERCIAL
FROM cliente 
LEFT JOIN pedido 
ON cliente.id_cliente = pedido.id_cliente
ORDER BY 
cliente.apellido1,
cliente.apellido2,
cliente.nombre;
/*Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado.
 Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
 El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.*/
 SELECT 
 c.id_comercial,
 c.nombre,
 c.apellido1,
 c.apellido2,
 c.comision,
 p.id_pedido,
 p.total,
 p.fecha,
 p.id_cliente,
 p.id_comercial
 FROM comercial c
 LEFT JOIN pedido p
 ON c.id_comercial = p.id_comercial
 ORDER BY
 c.apellido1,
 c.apellido2,
 c.nombre;
 -- OTRA FORMA
SELECT
    c.id_comercial,
    c.nombre,
    c.apellido1,
    c.apellido2,
    c.comision,
    COUNT(p.id_pedido) AS num_pedidos,
    SUM(p.total) AS total_ventas
FROM
    comercial c
LEFT JOIN pedido p ON c.id_comercial = p.id_comercial
GROUP BY c.id_comercial, c.nombre, c.apellido1, c.apellido2, c.comision
ORDER BY
    c.apellido1,
    c.apellido2,
    c.nombre;
-- Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT
    c.id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    c.ciudad,
    c.categoria
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;
-- Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT 
c.id_comercial,
c.nombre,
c.apellido1,
c.apellido2,
c.comision
FROM comercial c
LEFT JOIN pedido p 
ON c.id_comercial = p.id_comercial
WHERE p.id_comercial IS NULL;
/*Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han 
participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. 
En en listado deberá diferenciar de algún modo los clientes y los comerciales.*/
SELECT
    'Cliente' AS Tipo,
    c.id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2
FROM
    cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE
    p.id_pedido IS NULL
UNION 
SELECT
    'Comercial' AS Tipo,
    c.id_comercial,
    c.nombre,
    c.apellido1,
    c.apellido2
FROM comercial c
LEFT JOIN pedido p ON c.id_comercial = p.id_comercial
WHERE p.id_pedido IS NULL
ORDER BY
    Tipo, apellido1, apellido2, nombre;
    -- ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.
    
-- Las consultas anteriores no se pueden realizar correctamente utilizando NATURAL LEFT JOIN o NATURAL RIGHT JOIN debido 
-- a la naturaleza específica de estos tipos de uniones. 