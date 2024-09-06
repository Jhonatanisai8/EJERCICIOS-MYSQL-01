-- 1.3.7.4 Subconsultas con EXISTS y NOT EXISTS
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT 
nombre,
apellido1,
apellido2
FROM cliente
WHERE NOT EXISTS (
	SELECT 1 id_cliente 
    FROM pedido
    WHERE cliente.id_cliente = pedido.id_cliente
);
-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT 
nombre,
apellido1,
apellido2
FROM comercial
WHERE NOT EXISTS (
	SELECT 1 id_comercial 
    FROM pedido
    WHERE comercial.id_comercial = pedido.id_comercial
);