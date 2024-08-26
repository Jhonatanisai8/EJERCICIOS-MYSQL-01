
-- 1.3.4 Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.
/*Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.*/
SELECT DISTINCT
cliente.id_cliente AS ID_CLIENTE,
cliente.nombre AS NOMBRE,
cliente.apellido1 AS APELLIDO1,
cliente.apellido2 AS APELLIDO2
FROM cliente 
INNER JOIN pedido
ON cliente.id_cliente = pedido.id_cliente
ORDER BY cliente.nombre ASC;
/*Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe 
mostrar los datos de los clientes ordenados alfabéticamente.*/
SELECT 
    cliente.id_cliente AS ID_CLIENTE,
    cliente.nombre AS NOMBRE,
    cliente.apellido1 AS APELLIDO1,
    cliente.apellido2 AS APELLIDO2,
    pedido.id_pedido AS ID_PEDIDO,
    pedido.fecha AS FECHA_PEDIDO,
    pedido.total AS TOTAL
FROM cliente
INNER JOIN pedido
ON cliente.id_cliente = pedido.id_cliente
ORDER BY cliente.nombre ASC, cliente.apellido1 ASC, cliente.apellido2 ASC;
/*Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial.
 El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar 
 los datos de los comerciales ordenados alfabéticamente.*/
SELECT 
    pedido.id_pedido AS ID_PEDIDO,
    pedido.fecha AS FECHA_PEDIDO,
    pedido.total AS TOTAL_PEDIDO,
    comercial.id_comercial AS ID_COMERCIAL,
    comercial.nombre AS NOMBRE_COMERCIAL,
    comercial.apellido1 AS APELLIDO1_COMERCIAL,
    comercial.apellido2 AS APELLIDO2_COMERCIAL
FROM pedido
INNER JOIN comercial
ON pedido.id_comercial = comercial.id_comercial
ORDER BY comercial.nombre ASC, comercial.apellido1 ASC, comercial.apellido2 ASC;
/*Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los 
comerciales asociados a cada pedido.*/
SELECT * FROM pedido;
SELECT * FROM cliente;
-- Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
SELECT *
FROM cliente
INNER JOIN pedido 
ON cliente.id_cliente = pedido.id_cliente
WHERE YEAR (pedido.fecha) = 2017
AND pedido.total BETWEEN 300 AND 1000;
-- Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT *
FROM cliente
INNER JOIN pedido 
ON cliente.id_cliente = pedido.id_cliente
WHERE cliente.nombre LIKE 'María';
-- Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
SELECT 
    cliente.id_cliente AS ID_CLIENTE,
    cliente.nombre AS NOMBRE_CLIENTE,
    cliente.apellido1 AS APELLIDO1_CLIENTE,
    cliente.apellido2 AS APELLIDO2_CLIENTE
FROM cliente 
INNER JOIN pedido 
ON cliente.id_cliente = pedido.id_cliente
INNER JOIN comercial 
ON pedido.id_comercial = comercial.id_comercial
WHERE comercial.nombre = 'Daniel'
AND comercial.apellido1 = 'Sáez'
AND comercial.apellido2 = 'Vega';