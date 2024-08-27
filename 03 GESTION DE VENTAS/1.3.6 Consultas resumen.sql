USE ventas_ejercicio;
-- 1.3.6 Consultas resumen
-- Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT 
truncate(SUM(total),2) AS SUMA_TOTAL_PEDIDOS
FROM pedido;
-- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT 
TRUNCATE(AVG(total) ,2) AS MEDIA_TOTAL
FROM pedido;
-- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT 
    COUNT(DISTINCT p.id_comercial) AS CANTIDAD_COMERCIALES
FROM  pedido p;
-- Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT 
COUNT(*)  AS CANT_CLIENTES
FROM cliente;
-- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT 
MAX(total) AS MAYOR_CANTIDAD
FROM pedido;
-- Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT 
MIN(total) AS MAYOR_CANTIDAD
FROM pedido;
-- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT
MAX(categoria) AS 'VALOR MAXIMO CATEGORIA',
ciudad
FROM cliente
GROUP BY 
ciudad;
-- La consulta te da el número de pedidos asociados a cada comercial.
SELECT 
    COUNT(p.id_comercial) AS CANT,
    c.nombre AS NOMBRE
FROM pedido p
INNER JOIN comercial c
ON  p.id_comercial = c.id_comercial
GROUP BY 
    p.id_comercial, c.nombre;
/*Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
 Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido.
 Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.*/
SELECT
    c.id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    p.fecha,
    MAX(p.total) AS max_valor_pedido
FROM cliente c
INNER JOIN pedido p 
ON c.id_cliente = p.id_cliente
GROUP BY    c.id_cliente, p.fecha
ORDER BY c.id_cliente, p.fecha;
/*Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.*/
SELECT
    c.id_cliente,
    c.nombre,
    c.apellido1,
    c.apellido2,
    p.fecha,
    MAX(p.total) AS max_valor_pedido
FROM cliente c
INNER JOIN pedido p 
ON c.id_cliente = p.id_cliente
WHERE p.total > 2000 
GROUP BY    c.id_cliente, p.fecha;
/*Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17.
 Muestra el identificador del comercial, nombre, apellidos y total.*/
SELECT 
c.id_comercial,
c.nombre,
c.apellido1,
c.apellido2,
MAX(p.total)
FROM comercial c 
INNER JOIN pedido p
ON c.id_comercial = p.id_comercial
WHERE p.fecha = '2016-08-17'
GROUP BY 
c.id_comercial;
/*Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha
 realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. 
 Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.*/
SELECT 
c.id_cliente,
c.nombre,
c.apellido1,
c.apellido2,
COUNT(p.id_cliente) AS TOTAL_PEDIDOS
FROM cliente c
LEFT JOIN pedido p
ON c.id_cliente = p.id_cliente
GROUP BY 
c.id_cliente;
/*Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha
 realizado cada uno de clientes durante el año 2017.*/
SELECT
c.id_cliente AS ID_CLIENTE,
c.nombre AS NOMBRE,
c.apellido1 AS APELLIDO_1,
c.apellido2 AS APELLIDO_2,
COUNT(p.id_cliente) AS TOTAL_PEDIDOS
FROM cliente c
INNER JOIN pedido p
ON c.id_cliente = p.id_cliente
WHERE YEAR (fecha) = 2017
GROUP BY c.id_cliente;
/*Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima
 cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado
 ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.*/
SELECT 
c.id_cliente,
c.nombre,
c.apellido1,
c.apellido2,
COALESCE(MAX(p.total), 0) AS VALOR_MAXIMO
FROM cliente c
LEFT JOIN pedido p
ON c.id_cliente = p.id_cliente
GROUP BY 
c.id_cliente;
-- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT 
MAX(total) AS CANTIDAD,
YEAR (fecha)
FROM pedido
GROUP BY 
YEAR (fecha);
-- Devuelve el número total de pedidos que se han realizado cada año.
SELECT 
COUNT(total) AS CANTIDAD,
YEAR (fecha)
FROM pedido
GROUP BY 
YEAR (fecha);